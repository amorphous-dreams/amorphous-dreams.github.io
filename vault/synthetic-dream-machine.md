---
title: Synthetic Dream Machine Nexus
subtitle: "Main navigation dashboard for SDM, Amorphous Dreams, and Wizard Thief Fighter lines."
layout: gruv_default_adapter
body_class: sdm-hub
---

{% assign pages = site.pages | sort: "path" %}

<section class="sdm-hub-shell" aria-label="Synthetic Dream Machine main dashboard">
  <header class="sdm-hub-hero">
    <p class="ndu-kicker">Noospheric Dream UI</p>
    <h2>SDM Nexus</h2>
    <p>Structured navigation for the SDM RPG corpus and development branches.</p>
  </header>

  <section class="sdm-hub-section" id="sdm-core">
    <h3>Synthetic Dream Machine</h3>
    <h4>SDM System Reference Documents</h4>
    <div class="sdm-hub-grid">
      {% for p in pages %}
        {% assign path = p.path | default: "" %}
        {% if path contains "vault/Synthetic-Dream-Machine/Synthetic_Dream_Machine_" %}
          {% unless path contains "_agents" or path contains "_todo" %}
            {% assign title = p.title | default: p.name | replace: ".md", "" | replace: "_", " " %}
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
            <article class="sdm-hub-card">
              <h5><a href="{{ p.url | relative_url }}">{% if chapter_code != "" %}[{{ chapter_code }}] {% endif %}{{ title }}</a></h5>
            </article>
          {% endunless %}
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <section class="sdm-hub-section" id="amorphous-dreams">
    <h3>Amorphous Dreams</h3>

    <h4>Flying Triremes and Laser Swords</h4>
    <div class="sdm-hub-grid">
      {% for p in pages %}
        {% assign path = p.path | default: "" %}
        {% if path contains "vault/Synthetic-Dream-Machine/Flying_Triremes_and_Laser_Swords/Flying_Triremes_and_Laser_Swords_" %}
          {% assign title = p.title | default: p.name | replace: ".md", "" | replace: "_", " " %}
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
          <article class="sdm-hub-card sdm-hub-card--dev">
            <h5><a href="{{ p.url | relative_url }}">{% if chapter_code != "" %}[{{ chapter_code }}] {% endif %}{{ title }}</a></h5>
          </article>
        {% endif %}
      {% endfor %}
    </div>

    <h4>Elyncia Chapters</h4>
    <div class="sdm-hub-grid">
      {% for p in pages %}
        {% assign path = p.path | default: "" %}
        {% if path contains "vault/Synthetic-Dream-Machine/Elyncia/Elyncia_" %}
          {% assign title = p.title | default: p.name | replace: ".md", "" | replace: "_", " " %}
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
          <article class="sdm-hub-card sdm-hub-card--dev">
            <h5><a href="{{ p.url | relative_url }}">{% if chapter_code != "" %}[{{ chapter_code }}] {% endif %}{{ title }}</a></h5>
          </article>
        {% endif %}
      {% endfor %}
    </div>

    <h4>Additional Elyncia files</h4>
    <div class="sdm-hub-grid">
      {% for p in pages %}
        {% assign path = p.path | default: "" %}
        {% if path contains "vault/Synthetic-Dream-Machine/Elyncia/" %}
          {% unless path contains "vault/Synthetic-Dream-Machine/Elyncia/Elyncia_" %}
            {% assign title = p.title | default: p.name | replace: ".md", "" | replace: "_", " " %}
            <article class="sdm-hub-card sdm-hub-card--dev-alt">
              <h5><a href="{{ p.url | relative_url }}">{{ title }}</a></h5>
            </article>
          {% endunless %}
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <section class="sdm-hub-section" id="wizard-thief-fighter">
    <h3>Wizard Thief Fighter</h3>
    <h4>Core Synthetic Dream Machine</h4>

    <div class="sdm-hub-grid sdm-hub-grid--priority">
      <article class="sdm-hub-card sdm-hub-card--priority"><h5><a href="{{ '/vault/Synthetic-Dream-Machine/Our_Golden_Age/Our_Golden_Age/' | relative_url }}">Our Golden Age</a></h5></article>
      <article class="sdm-hub-card sdm-hub-card--priority"><h5><a href="{{ '/vault/Synthetic-Dream-Machine/Vastlands_Guidebook/Vastlands_Guidebook/' | relative_url }}">Vastlands Guidebook</a></h5></article>
      <article class="sdm-hub-card sdm-hub-card--priority"><h5><a href="{{ '/vault/Synthetic-Dream-Machine/Ultraviolet_Grasslands_and_the_Black_City_2e/Ultraviolet_Grasslands_and_the_Black_City_2e/' | relative_url }}">Ultraviolet Grasslands and the Black City 2e</a></h5></article>
    </div>

    <h4>SDM Supplemental Materials</h4>
    <div class="sdm-hub-grid">
      <article class="sdm-hub-card"><h5><a href="{{ '/vault/Synthetic-Dream-Machine/Eternal_Return_Key/Eternal_Return_Key/' | relative_url }}">Eternal Return Key</a></h5></article>
      <article class="sdm-hub-card"><h5><a href="{{ '/vault/Synthetic-Dream-Machine/Magitecnica/Magitecnica_01_Codex_1_The_Use_and_Misuse_of_Powers_Great_and_Small/' | relative_url }}">[01] Magitecnica 01 Codex 1</a></h5></article>
      <article class="sdm-hub-card"><h5><a href="{{ '/vault/Synthetic-Dream-Machine/Magitecnica/Magitecnica_02_Codex_2_The_Flesh_Source_Protocols/' | relative_url }}">[02] Magitecnica 02 Codex 2</a></h5></article>
      <article class="sdm-hub-card"><h5><a href="{{ '/vault/Synthetic-Dream-Machine/There_A_Red_Door/There_A_Red_Door/' | relative_url }}">There A Red Door</a></h5></article>
    </div>
  </section>
</section>
