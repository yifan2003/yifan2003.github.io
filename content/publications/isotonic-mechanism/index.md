---
title: 'An Isotonic Mechanism for Overlapping Ownership'
authors:
  - me
  - Weijie Su
  - Jibang Wu
  - Haifeng Xu
# Current public revision: arXiv v4, August 19, 2026; original posting retained in publishDate.
date: '2026-08-19T00:00:00Z'
publishDate: '2023-06-19T00:00:00Z'
publication_types: ['preprint']
publication: 'Working paper.'
# Review status follows CV/Yifan_Guo_CV.tex; this is not a published journal article.
publication_short: '<br>Working paper<br>Major revision, Operations Research'
# Abstract source: MD/arxiv/abstract.tex.
abstract: |
  Motivated by the problem of improving peer review at large scientific conferences, this paper studies how to elicit self-evaluations to improve review scores in a natural many-to-many owner-item (e.g., author-paper) setting with overlapping ownership. We design a simple, efficient, and truthful mechanism to elicit self-evaluations from item owners and calibrate noisy review scores in the existing evaluation process (e.g., papers' review scores from peers).

  Our approach starts by partitioning the owner-item relation structure into disjoint blocks, each sharing a common set of co-owners. We then elicit the ranking of items from each owner and employ isotonic regression to produce adjusted item scores, aligning with both the reported rankings and raw item review scores. We prove that truth-telling by all owners is a payoff-dominant Nash equilibrium for any valid partition of the overlapping ownership sets under natural conditions. Moreover, truthfulness depends on eliciting rankings independently within each block, making block-partition optimization crucial for improving statistical efficiency. Despite the computational intractability of the general optimization problem, we develop a nearly linear-time greedy algorithm that finds a high-quality block partition with robust approximation guarantees. Experiments on both synthetic data and real-world conference review data demonstrate the effectiveness of our mechanism in a pressing real-world problem.
summary: >-
  We study how owners' rankings can improve noisy evaluations when items have overlapping owners. An isotonic-regression mechanism combines incentive guarantees with efficient algorithms for partitioning items.
tags: ['Mechanism design', 'Peer review', 'Algorithms']
featured: true
reading_time: false
lastmod: '2026-10-29T00:00:00Z'
hugoblox:
  ids:
    arxiv: '2306.11154'
links:
  - type: pdf
    url: https://arxiv.org/pdf/2306.11154
---

Major revision at *Operations Research*.
