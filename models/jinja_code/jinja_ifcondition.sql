

{% set the_temperature=100 %}
{% if the_temperature < 95 %}
 It is time for hot brew coffee
 {% elif the_temperature < 100 %}
 It is time for water
 {% else %}
 It is time for cold brew
 {% endif %}