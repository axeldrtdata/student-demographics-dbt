{# SHA-256 hash used to pseudonymise identifiers.
   Snowflake uses SHA2(); DuckDB (local testing) uses SHA256(). #}
{% macro hash_id(expression) %}
  {{ return(adapter.dispatch('hash_id')(expression)) }}
{% endmacro %}

{% macro default__hash_id(expression) %}sha2({{ expression }}){% endmacro %}

{% macro duckdb__hash_id(expression) %}sha256({{ expression }}){% endmacro %}
