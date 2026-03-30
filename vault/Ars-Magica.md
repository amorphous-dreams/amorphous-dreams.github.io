---
title: Ars Magica Nexus
subtitle: "Open Ars corpus browser, pilot imports, and errata layer."
layout: gruv_default_adapter
permalink: /vault/Ars-Magica/
body_class: ars-magica-hub
---

{% assign pages = site.pages | sort: "title" %}
{% assign ars_nexus = site.data.nav.vault_nexus.ars_magica %}

<section class="sdm-hub-shell" aria-label="Ars Magica vault dashboard">
  <header class="sdm-hub-hero">
    <p class="ndu-kicker">Open Ars Vault</p>
    <h2>Ars Magica Nexus</h2>
    <p>Canonical route for the Ars Magica open-text vault, with pilot book imports, separate errata pages, and local-PDF ingestion scaffolding.</p>
  </header>

  <section class="sdm-hub-section" id="ars-magica-model">
    <h3>Vault Model</h3>
    <p>This vault is built from owned PDFs stored outside git at <code>~/Ars-Magica/_books/</code>. Book and chapter pages present the normalized corpus, while errata and license notes remain separate operational layers.</p>
  </section>

  {% for group_key in ars_nexus.operator_nav.group_order %}
    {% assign group = ars_nexus.operator_nav.groups[group_key] %}
    {% if group and group_key != "other" %}
      {% assign rendered_count = 0 %}
      {% capture section_cards %}
          {% for p in pages %}
            {% assign path = p.path | default: "" %}
            {% assign include_page = false %}

            {% if group_key == "errata" %}
              {% if path contains "vault/Ars-Magica/errata/" %}
                {% assign include_page = true %}
              {% endif %}
            {% elsif group_key == "legal" %}
              {% if path contains "vault/Ars-Magica/legal/" %}
                {% assign include_page = true %}
              {% endif %}
            {% elsif path contains "vault/Ars-Magica/books/" and path contains "/book.md" %}
              {% for match_path in group.match_paths %}
                {% if path contains match_path %}
                  {% assign include_page = true %}
                  {% break %}
                {% endif %}
              {% endfor %}
            {% endif %}

            {% if include_page %}
              {% assign rendered_count = rendered_count | plus: 1 %}
              {% assign card_class = "sdm-hub-card" %}
              {% if group_key == "core_rulebooks" %}
                {% assign card_class = "sdm-hub-card sdm-hub-card--priority" %}
              {% elsif group_key == "errata" or group_key == "legal" %}
                {% assign card_class = "sdm-hub-card sdm-hub-card--dev-alt" %}
              {% endif %}
              <article class="{{ card_class }}">
                <h5><a href="{{ p.url | relative_url }}">{{ p.ars_book_title | default: p.title }}</a></h5>
                {% if path contains "vault/Ars-Magica/books/" %}
                  <p>{{ p.ars_edition | default: "5th Edition" }}{% if p.ars_has_errata %} · Errata available{% endif %}</p>
                {% elsif group_key == "errata" %}
                  <p>Canonical corrections for {{ p.ars_book_title | default: p.title | replace: " Errata", "" }}.</p>
                {% elsif group_key == "legal" %}
                  <p>CC BY-SA attribution, trademark notes, and asset exclusions for this vault.</p>
                {% endif %}
              </article>
            {% endif %}
          {% endfor %}
      {% endcapture %}
      {% if rendered_count > 0 %}
        <section class="sdm-hub-section" id="{{ group_key | replace: '_', '-' }}">
          <h3>{{ group.label }}</h3>
          <div class="sdm-hub-grid">
            {{ section_cards }}
          </div>
        </section>
      {% endif %}
    {% endif %}
  {% endfor %}
</section>
