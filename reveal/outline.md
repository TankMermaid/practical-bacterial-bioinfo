# "Who's there?": Practical bacterial phylogenetics
Scott Olesen (Williams '10; MIT PhD '16)

---

# A brief note about me, in case you're interested in a scientific training

- 2006-2010: Williams, BA (physics)
- 2010-2012: University of Cambridge, Masters (theoretical physics and computational chemistry)
- 2012-2016: MIT, PhD ([microbiome science](http://almlab.mit.edu/))
- 2016-20XX: Harvard School of Public Health, postdoc (antibiotic resistance)
- Later: maybe analytical public policy, maybe more biology

---

# Microbes are essential to our health, environment, and economy

---

# Maybe microbes have something to do with colon cancer?

Recent publications have provided mechanistic evidence for the involvement of
gut bacteria in the development of [colorectal cancer...] Despite this vast
body of circumstantial evidence, however, no clinical data have thus far been
available to directly show distinct bacterial colonization patterns in
[colorectal cancer] patients. ([Marchesi *et al.*](10.1371/journal.pone.0020447), *PLoS ONE* 2011)

---

# Microbial community profiling helps determine the role of microbes

*You can think of microbes as...*

- correlates of disease (i.e., diagnostic, prognostic indicators)
- the cause of disease (i.e., potential for therapies or discovering mechanisms)
- environmental players (e.g., climate change, pollution remediation)

---

# E.g., microbial community profiling non-invasively diagnoses inflammatory bowel disease in children

*You can't diagnose IBD in children the regular way (with an endoscopy), but
you can collect their feces, and microbes in the feces provide as much
information as the endoscopy.*

([Papa *et al.*](http://dx.doi.org/10.1371/journal.pone.0039242), *PLoS ONE* 2012)

---

# Before DNA sequencing, analysis of microbial communities relied on culturing

1. Swab an interesting community
2. Try to grow that on a plate
3. If bacteria grow, identify them by visual appearance or metabolism

---

# Culturing techniques are relatively arduous and biased

<img src="/img/sample-plate.png" width="80%">

*Behold, the great plate count anomaly.*

---

# Next-generation DNA sequencing dramatically changed microbial community profiling

- No waiting for microbes to grow, so it's faster to identify organisms
- No need to pick media, so profiling isn't biased in that way
- Sequencing information is more relevant to phylogeny

---

# Bacterial DNA sequencing is a multi-step art

<img src="/img/sequencing.png" width="80%">

---

*How do you turn DNA data into insight?*

---

# Metagenomic shotgun sequencing "reads" all the DNA in a microbial community

- Cut DNA into random, short (50-300 nucleotide) pieces (i.e., the "shot")
- Look for small pieces in database of known genomes (or gene functions)
- Or, reconstruct the genomes from the small pieces

---

# Metagenomic shotgun sequencing faces some challenges

- It "reads" both human and bacterial DNA
- Only ~1% of bacterial genes are useful for identifying taxonomy
- We don't know what >50% of bacterial genes do
- Reconstructing genomes is not straightforward

---

# Amplicon sequencing simplifies bacterial community profiling

- All bacteria have a common "taxonomic marker" gene
- Non-bacterial DNA does not get amplified
- All sequencing reads go toward taxonomic information
- Inferring taxonomy is conceptually and computationally simpler

---

<img src="/img/shotgun-vs-amplicon.png" width="80%">

---

# The 16S rRNA gene is the common taxonomic marker gene

*Variable region content plus molecular clock yields bacterial phylogeny*

<img src="/img/16s-variability.png" width="60%">

---

# 16S sequencing always targets the same regions of the gene

- Use constant regions as "anchors" (i.e., primer binding sites)
- Variable region is the "content" of the amplicon

<img src="/img/pcr-construct.png" width="60%">

---

# 16S sequences are grouped into operational taxonomic units (OTUs)

- The definition of a bacterial species is highly-debated
- Similarity of 16S genes is a decent, operational stand-in for species
- Clustering sequences into OTUs simplifies data analysis"

---

*Practical bacterial phylogenetics using 16S*

---

# 16S sequences can be made into their own phylogeny

<img src="/img/seq-to-tree.png" width="60%">

*But how do you interpret the leaves?*

---

# 16S sequences can be mapped onto existing taxonomies

<img src="/img/seq-to-tax.png" width="75%">

*Easier to make hypotheses and relate to other studies*

---

# Taxonomy assignment is different from (but related to) operational taxonomic unit (OTU) assignment

- OTU-calling clusters unique sequences into biologically-relevant quasi-species
  - Reference-based OTUs: put each sequence into the database OTU that it matches best
  - *De novo* OTUs: put similar sequences into the same *ad hocs* OTUs
- *De novo* OTUs are assigned taxonomies using a reference database

---

# Taxonomy assignment, Method 1: Exhaustive alignment-based searches (BLAST) are slow but reliable

*Compare all against all*

<img src="/img/all-against-all.png" width="60%">

---

**Pros:**

- Alignments are a good way to match sequences
- Hits are to a cultured organisms with establish species names

**Cons:**

- Very slow
- Poor characterization of uncultured organisms"))

---

# Method 2: Alignment-based search with heuristics (USEARCH) are faster but weirder

**Pros:**

- 10-1,000x faster than BLAST

**Cons:**

- No guarantee that the hit you get is the best hit

---

# Greengenes is the popular database to use with USEARCH

swo> has non-isolated stuff... but how did it get assigned?

---

# Interlude: What heuristics can mean for your data

swo> amy's data

---

# USEARCH uses three strategies to improve speed

1.  Do pairwise comparisons in order of decreasing sequence similarity heuristic
2.  Make time-saving assumptions when performing the alignment
3.  Stop after finding one hit that reaches acceptable minimum identity

---

# USEARCH's sequence similarity heuristic is based on *k*-mers"

---

# Method 3: Use *k*-mer content to assign taxonomy (RDP)"

---

# RDP uses a naive Bayesian classifier"

---

# RDP's approach can feel more stable than alignment-based approaches
             (item "revisit Amy's data"))

(transition-slide "Nuts & bolts")

---

# What do the input data actually look like?

---

# There are multiple steps between raw data and analysis-ready data

---

# These choices can have subtle effects on conclusions

---

*Zooming out*

---

# Amplicon sequencing can also answer questions in other organisms

- A DNA stretch near the ribosome is a fungal taxonomic barcode
- Bacterial species or genera can be examined (e.g., those that cause cholera, tuberculosis, acne, etc.)
