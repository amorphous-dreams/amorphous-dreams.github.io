---
title: Ars Magica Nexus
subtitle: "Open Ars corpus browser, pilot imports, and errata layer."
layout: gruv_default_adapter
permalink: /vault/Ars-Magica/
body_class: ars-magica-hub
---

{% assign pages = site.pages | sort: "title" %}

<section class="sdm-hub-shell" aria-label="Ars Magica vault dashboard">
  <header class="sdm-hub-hero">
    <p class="ndu-kicker">Open Ars Vault</p>
    <h2>Ars Magica Nexus</h2>
    <p>Canonical route for the Ars Magica open-text vault, with pilot book imports, separate errata pages, and local-PDF ingestion scaffolding.</p>
  </header>

  <section class="sdm-hub-section" id="ars-magica-intro">
    <h3>License and Source Model</h3>
    <div class="sdm-hub-grid">
      <article class="sdm-hub-card sdm-hub-card--priority">
        <h5><a href="{{ '/vault/Ars-Magica/legal/open-license/' | relative_url }}">Open License Notes</a></h5>
        <p>CC BY-SA attribution, trademark notes, and asset exclusions for this vault.</p>
      </article>
    </div>
    <p>This vault is built from owned PDFs stored outside git at <code>~/Ars-Magica/_books/</code>. Rendered text and corrections stay separate: book and chapter pages present the normalized corpus, while errata live on dedicated pages.</p>
  </section>

  <section class="sdm-hub-section" id="core-rulebooks">
    <h3>Core Rulebooks</h3>
    <div class="sdm-hub-grid">
      {% for p in pages %}
        {% assign path = p.path | default: "" %}
        {% if p.ars_category == "core_rulebooks" and path contains "vault/Ars-Magica/books/" and path contains "/book.md" %}
          <article class="sdm-hub-card sdm-hub-card--priority">
            <h5><a href="{{ p.url | relative_url }}">{{ p.ars_book_title | default: p.title }}</a></h5>
            <p>{{ p.ars_edition | default: "5th Edition" }}{% if p.ars_has_errata %} · Errata available{% endif %}</p>
          </article>
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <section class="sdm-hub-section" id="realms-of-power">
    <h3>Realms of Power</h3>
    <div class="sdm-hub-grid">
      {% for p in pages %}
        {% assign path = p.path | default: "" %}
        {% if p.ars_category == "realms_of_power" and path contains "vault/Ars-Magica/books/" and path contains "/book.md" %}
          <article class="sdm-hub-card">
            <h5><a href="{{ p.url | relative_url }}">{{ p.ars_book_title | default: p.title }}</a></h5>
            <p>{{ p.ars_edition | default: "5th Edition" }}{% if p.ars_has_errata %} · Errata available{% endif %}</p>
          </article>
        {% endif %}
      {% endfor %}
    </div>
  </section>

  <section class="sdm-hub-section" id="errata">
    <h3>Errata Layer</h3>
    <div class="sdm-hub-grid">
      {% for p in pages %}
        {% assign path = p.path | default: "" %}
        {% if p.ars_category == "errata" and path contains "vault/Ars-Magica/errata/" %}
          <article class="sdm-hub-card sdm-hub-card--dev-alt">
            <h5><a href="{{ p.url | relative_url }}">{{ p.title }}</a></h5>
          </article>
        {% endif %}
      {% endfor %}
    </div>
  </section>
</section>
