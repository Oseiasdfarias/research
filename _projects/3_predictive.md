---
layout: page
lang: en
title: Predictive control and online identification
description: Finite control set predictive control with models identified online.
permalink: /areas/predictive-control/
importance: 3
---

Conventional FCS-MPC depends on a fixed physical model, which loses accuracy when plant parameters drift. At UFPA, I study replacing that model with an ARX model identified online by recursive least squares, applied to active and reactive power regulation in grid-connected three-phase inverters.

## Related publications

<div class="publications">

{% bibliography --group_by none --query @*[key=farias2026fcsmpc] %}

</div>
