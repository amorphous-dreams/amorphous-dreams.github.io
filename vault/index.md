---
title: Vault
subtitle: "Dashboard for all vault systems."
layout: gruv_vault_index_adapter
body_class: vault-hub
disable_auto_vault_nodes: true
---

<section class="ndu-vault-hub" aria-label="Vault dashboard">
  <header class="ndu-vault-hub__header">
    <p class="ndu-kicker">Vault Hub</p>
    <h2>Vault Dashboard</h2>
    <p>Each vault is a modular content node. Synthetic Dream Machine and Ars Magica now run as sibling vaults with independent content repos.</p>
  </header>

  <div class="ndu-vault-grid">
    {% assign vault_items = site.data.nav.vault_nodes %}
    {% for item in vault_items %}
      <article class="ndu-vault-card {% if forloop.first %}ndu-vault-card--active{% endif %}">
        <h3><a href="{{ item.href | relative_url }}">{{ item.label }}</a></h3>
        {% if item.summary %}<p>{{ item.summary }}</p>{% endif %}
        <p class="ndu-node-meta">{% if forloop.first %}Active vault{% else %}Secondary route{% endif %}</p>
      </article>
    {% endfor %}
  </div>
</section>
