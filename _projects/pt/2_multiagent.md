---
layout: page
lang: pt
title: Supervisão multiagente e detecção de falhas
description: Agentes de software que monitoram uma planta, detectam anomalias e reconfiguram o controlador.
permalink: /areas/multi-agent-supervision/
importance: 2
---

Esta linha constrói uma camada de supervisão em torno de um controlador em malha fechada. Agentes implementados em JADE/FIPA monitoram um conversor Buck com observador de Luenberger e CUSUM adaptativo, identificam a planta online quando sua dinâmica muda e reconfiguram o controlador (LQR ou H-infinito) por uma troca a quente sem salto.

A planta roda no Simulink e se liga ao supervisor por software-in-the-loop, e a validação em hardware-in-the-loop com FPGA e FPAA faz parte do projeto.

## Publicações relacionadas

<div class="publications">

{% bibliography --group_by none --query @*[key=defarias2026supervision] %}

</div>
