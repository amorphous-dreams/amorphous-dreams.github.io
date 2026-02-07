---
title: Synthetic Dream Machine Nexus
subtitle: "Noospheric dashboard for canonical SDM volumes and Amorphous Dreams development tracks."
layout: gruv_vault_index_adapter
header_nav_context: sdm
body_class: archive sdm-nexus-page
---

{% assign sdm_pages = site.pages | sort: "path" %}
{% assign canonical_count = 0 %}
{% assign amorphous_count = 0 %}

{% for p in sdm_pages %}
  {% assign path = p.path | default: "" %}
  {% if path contains "vault/Synthetic-Dream-Machine/" %}
    {% unless path contains "/_agents/" or path contains "/_todo/" or path == "vault/synthetic-dream-machine.md" %}
      {% if path contains "/Elyncia/" or path contains "/Flying_Triremes_and_Laser_Swords/" %}
        {% assign amorphous_count = amorphous_count | plus: 1 %}
      {% else %}
        {% assign canonical_count = canonical_count | plus: 1 %}
      {% endif %}
    {% endunless %}
  {% endif %}
{% endfor %}

<section class="nexus-shell" aria-label="Synthetic Dream Machine Navigation Dashboard">
  <header class="nexus-hero">
    <p class="nexus-kicker">Noospheric Dream UI</p>
    <h2>Synthetic Dream Machine Nexus</h2>
    <p class="nexus-intro">
      Two content lanes: canonical SDM books by Luka Rejec, and Amorphous Dreams campaign development (Elyncia + FTLS).
    </p>
    <div class="nexus-stats">
      <span class="nexus-stat"><strong>{{ canonical_count }}</strong> Canonical SDM texts</span>
      <span class="nexus-stat"><strong>{{ amorphous_count }}</strong> Amorphous Dreams docs</span>
    </div>
    <div class="nexus-jump-links">
      <a href="#synthetic-dream-machine-canon">Canonical SDM</a>
      <a href="#amorphous-dreams">Amorphous Dreams</a>
    </div>
  </header>

  <div class="nexus-columns">
    <section id="synthetic-dream-machine-canon" class="nexus-column nexus-column--canonical" aria-labelledby="canon-heading">
      <header class="nexus-column-head">
        <h3 id="canon-heading">Synthetic Dream Machine (Canonical)</h3>
        <p>Published line and core indexes sourced from SDM canon.</p>
      </header>
      <div class="nexus-grid">
      {% for p in sdm_pages %}
        {% assign path = p.path | default: "" %}
        {% if path contains "vault/Synthetic-Dream-Machine/" %}
          {% unless path contains "/_agents/" or path contains "/_todo/" or path == "vault/synthetic-dream-machine.md" %}
            {% unless path contains "/Elyncia/" or path contains "/Flying_Triremes_and_Laser_Swords/" %}
              {% assign display_title = p.title | default: p.name | replace: ".md", "" | replace: "_", " " %}
              {% assign relative = path | remove_first: "vault/Synthetic-Dream-Machine/" %}
              {% assign folder = relative | split: "/" | first | replace: "_", " " %}
              {% unless relative contains "/" %}
                {% assign folder = "Core" %}
              {% endunless %}
              <article class="nexus-card nexus-card--canonical">
                <h4><a href="{{ p.url | relative_url }}">{{ display_title }}</a></h4>
                {% if p.subtitle %}<p class="nexus-subtitle">{{ p.subtitle }}</p>{% endif %}
                <p class="nexus-meta">
                  <span class="nexus-chip">{{ folder }}</span>
                  {% if p.series %}<span class="nexus-chip">{{ p.series }}</span>{% endif %}
                  {% if p.volume %}<span class="nexus-chip">Vol {{ p.volume }}</span>{% endif %}
                  {% if p.date %}<span class="nexus-chip">{{ p.date | date: "%Y-%m-%d" }}</span>{% endif %}
                </p>
              </article>
            {% endunless %}
          {% endunless %}
        {% endif %}
      {% endfor %}
      </div>
    </section>

    <section id="amorphous-dreams" class="nexus-column nexus-column--amorphous" aria-labelledby="amorphous-heading">
      <header class="nexus-column-head">
        <h3 id="amorphous-heading">Amorphous Dreams</h3>
        <p>Elyncia + Flying Triremes and Laser Swords in-development material.</p>
      </header>

      <h4 class="nexus-lane-title">Elyncia</h4>
      <div class="nexus-grid nexus-grid--lane">
      {% for p in sdm_pages %}
        {% assign path = p.path | default: "" %}
        {% if path contains "vault/Synthetic-Dream-Machine/Elyncia/" %}
          {% unless path contains "/_agents/" or path contains "/_todo/" %}
            {% assign display_title = p.title | default: p.name | replace: ".md", "" | replace: "_", " " %}
            {% assign relative = path | remove_first: "vault/Synthetic-Dream-Machine/Elyncia/" %}
            {% assign folder = relative | split: "/" | first | replace: "_", " " %}
            <article class="nexus-card nexus-card--amorphous">
              <h4><a href="{{ p.url | relative_url }}">{{ display_title }}</a></h4>
              <p class="nexus-meta"><span class="nexus-chip nexus-chip--amorphous">Elyncia</span>{% if folder != display_title %}<span class="nexus-chip">{{ folder }}</span>{% endif %}</p>
            </article>
          {% endunless %}
        {% endif %}
      {% endfor %}
      </div>

      <h4 class="nexus-lane-title">Flying Triremes And Laser Swords</h4>
      <div class="nexus-grid nexus-grid--lane">
      {% for p in sdm_pages %}
        {% assign path = p.path | default: "" %}
        {% if path contains "vault/Synthetic-Dream-Machine/Flying_Triremes_and_Laser_Swords/" %}
          {% unless path contains "/_agents/" or path contains "/_todo/" %}
            {% assign display_title = p.title | default: p.name | replace: ".md", "" | replace: "_", " " %}
            {% assign chapter_code = "" %}
            {% assign filename = p.name | default: "" %}
            {% if filename contains "_01_" %}{% assign chapter_code = "01" %}{% endif %}
            {% if filename contains "_02_" %}{% assign chapter_code = "02" %}{% endif %}
            {% if filename contains "_03_" %}{% assign chapter_code = "03" %}{% endif %}
            {% if filename contains "_04_" %}{% assign chapter_code = "04" %}{% endif %}
            {% if filename contains "_05_" %}{% assign chapter_code = "05" %}{% endif %}
            {% if filename contains "_06_" %}{% assign chapter_code = "06" %}{% endif %}
            {% if filename contains "_07_" %}{% assign chapter_code = "07" %}{% endif %}
            {% if filename contains "_08_" %}{% assign chapter_code = "08" %}{% endif %}
            {% if filename contains "_09_" %}{% assign chapter_code = "09" %}{% endif %}
            {% if filename contains "_10_" %}{% assign chapter_code = "10" %}{% endif %}
            <article class="nexus-card nexus-card--amorphous">
              <h4><a href="{{ p.url | relative_url }}">{{ display_title }}</a></h4>
              <p class="nexus-meta">
                <span class="nexus-chip nexus-chip--amorphous">FTLS</span>
                {% if chapter_code != "" %}<span class="nexus-chip">Chapter {{ chapter_code }}</span>{% endif %}
              </p>
            </article>
          {% endunless %}
        {% endif %}
      {% endfor %}
      </div>
    </section>
  </div>
</section>
