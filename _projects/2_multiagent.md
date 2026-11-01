---
layout: page
lang: en
title: Multi-agent supervision and fault detection
description: Software agents that monitor a plant, detect anomalies and reconfigure its controller.
permalink: /areas/multi-agent-supervision/
importance: 2
---

This line of work builds a supervisory layer around a closed-loop controller. Agents implemented in JADE/FIPA monitor a Buck converter with a Luenberger observer and adaptive CUSUM, identify the plant online when its dynamics change, and reconfigure the controller (LQR or H-infinity) through a bumpless hot swap.

The plant runs in Simulink and connects to the supervisor by software-in-the-loop, with hardware-in-the-loop validation on FPGA and FPAA as part of the project.

## Related publications

<div class="publications">

{% bibliography --group_by none --query @*[key=defarias2026supervision] %}

</div>
