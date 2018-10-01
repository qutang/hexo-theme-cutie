{% set tracker = site.data.cutie.global.site_tracker %}

{% if tracker === 'google' %}
    {% set track_id = site.data.cutie.google_analytics.track_id %}
    {% if track_id %}
        {{ partial('_tracker/_google_analytics/script', {track_id: track_id}) }}
    {% else %}
        {{ logger('warn', 'Google Analytics is not properly set up, because google_analytics.track_id is not properly set in cutie.yml') }}
    {% endif %}
{% endif %}