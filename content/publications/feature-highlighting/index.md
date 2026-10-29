---
title: 'Algorithmic Feature Highlighting for Human–AI Decision-Making'
authors:
  - me
  - Jann Spiess
# First public submission, verified at https://arxiv.org/abs/2604.22236.
date: '2026-04-24T00:00:00Z'
publishDate: '2026-04-24T00:00:00Z'
publication_types: ['preprint']
publication: 'Working paper.'
# Conference participation and working-paper status follow CV/Yifan_Guo_CV.tex.
publication_short: '<br>Working paper<br>ESIF 2026'
# Current abstract: HumanAI/MS.tex, September 2026; the arXiv version is earlier.
abstract: |
  Human decision-makers often face choices about complex cases with many potentially relevant features, but have limited bandwidth to inspect and integrate all available information. In such settings, we study algorithms that *highlight* a small subset of case-specific features for human consideration. Because the choice of which features are highlighted carries information, how that choice is interpreted matters: a *sophisticated* decision-maker correctly conditions on why features are highlighted, while a *naive* decision-maker updates only on revealed feature values and treats the selection as exogenous. In a two-feature example, we characterize the tradeoff between the two types and show that optimizing for one can be very costly to the other. Sophisticated design is hard to approximate even when only one feature can be shown, whereas naive design is tractable for fixed bandwidth and NP-hard when bandwidth is part of the input. We develop approximation algorithms for naive design and bound the excess risk of a naive-optimal policy for any mix of the two types. We illustrate our framework in a simulation calibrated to housing sales data. Overall, our results establish the value of contextual feature highlighting as a practical and computationally feasible tool for achieving human–algorithm complementarity.
summary: >-
  How should an algorithm highlight a few features for a human with limited attention? We study how the answer depends on the way people interpret the selection of information.
tags: ['Human–AI collaboration', 'Information design', 'Algorithms']
featured: true
reading_time: false
lastmod: '2026-10-29T00:00:00Z'
hugoblox:
  ids:
    arxiv: '2604.22236'
links:
  - type: pdf
    label: Latest PDF
    url: /papers/feature-highlighting/MS.pdf
---

Presented at the ESIF Conference on Economics and AI+ML, June 2026.

The PDF linked above is the September 2026 manuscript. The arXiv link provides the earlier April 2026 version.
