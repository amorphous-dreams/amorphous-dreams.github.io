---
title: DreamNet Home
subtitle: "Main navigation map for the Amorphous Dreams noospheric archive."
layout: gruv_default_adapter
body_class: dreamnet-home
---

<section class="ndu-home-map" aria-label="DreamNet map">
  <header class="ndu-home-map__header">
    <p class="ndu-kicker">Pagemap</p>
    <h2>DreamNet Home</h2>
    <p>The DreamNet is modular: vault hubs, book dashboards, and reference rails are separated for clarity.</p>
  </header>

  <div class="ndu-home-map__grid">
    <article class="ndu-node ndu-node--primary">
      <h3><a href="{{ '/vault/' | relative_url }}">Vault</a></h3>
      <p>Dashboard of all vaults. Start here to enter available content systems.</p>
      <p class="ndu-node-meta">Primary route</p>
    </article>

    <article class="ndu-node ndu-node--secondary">
      <h3><a href="{{ '/vault/synthetic-dream-machine/' | relative_url }}">Synthetic Dream Machine Nexus</a></h3>
      <p>Main SDM RPG navigation dashboard with canonical, Amorphous Dreams, and WTF lines.</p>
      <p class="ndu-node-meta">Content route</p>
    </article>
  </div>

  <footer class="ndu-home-map__footer">
    <div class="ndu-node ndu-node--secondary ndu-node--external ndu-home-ref">
      <h3><a href="{{ site.repo | default: 'https://github.com/amorphous-dreams/amorphous-dreams.github.io' }}" target="_blank" rel="noopener">Reference</a></h3>
      <p>Infrastructure source, commits, issues, workflows, and project-level traceability.</p>
      <p class="ndu-node-meta">External route</p>
    </div>
  </footer>
</section>
