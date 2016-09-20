# "Who's there?": Practical bacterial phylogenetics
Scott Olesen

---

# A brief note about me (in case you're interested in a scientific training)

- 2006-2010: Williams, BA (physics)
- 2010-2012: University of Cambridge, Masters (theoretical physics and computational chemistry)
- 2012-2016: MIT, PhD ([microbiome science](http://almlab.mit.edu/))
- 2016-20XX: Harvard School of Public Health, postdoc (antibiotic resistance)
- Later: maybe analytical public policy, maybe more biology

---

# Microbes are essential to our health, environment, and economy

---

# Maybe microbes have something to do with colon cancer?

> Recent publications have provided mechanistic evidence for the involvement of
> gut bacteria in the development of [colorectal cancer...] Despite this vast
> body of circumstantial evidence, however, no clinical data have thus far been
> available to directly show distinct bacterial colonization patterns in
> [colorectal cancer] patients.

([Marchesi *et al.*](10.1371/journal.pone.0020447), *PLoS ONE* 2011)

---

# Microbial community profiling helps determine the role of microbes

*You can think of microbes as...*

- correlates of disease (i.e., diagnostic, prognostic indicators)
- the cause of disease (i.e., potential for therapies or discovering mechanisms)
- environmental players (e.g., climate change, pollution remediation)

---

# E.g., microbial community profiling non-invasively diagnoses inflammatory bowel disease in children

> Pediatric inflammatory bowel disease (IBD) is challenging to diagnose because
> of the non-specificity of symptoms; an unequivocal diagnosis can only be made
> using colonoscopy, which clinicians are reluctant to recommend for children.
> [...]  We investigated the use of 16S rRNA sequencing of fecal samples and
> new analytical methods to assess differences in the microbiota of children
> with IBD and other gastrointestinal disorders.

([Papa *et al.*](http://dx.doi.org/10.1371/journal.pone.0039242), *PLoS ONE* 2012)

---

# Before DNA sequencing, analysis of microbial communities relied on culturing

1. Swab an interesting community
2. Try to grow that on a plate
3. If bacteria grow, identify them by visual appearance or metabolism

---

# Culturing techniques are arduous and the culturing method introduces bias

<img src="/img/sample-plate.png" width="80%">

.center[Behold the [great plate count anomaly](http://schaechter.asmblog.org/schaechter/2014/12/the-great-plate-count-anomaly-that-is-no-more.html)!]

---

# Next-generation DNA sequencing dramatically changed microbial community profiling

- No waiting for microbes to grow, so it's faster to identify organisms
- No need to pick media, so profiling isn't biased in that way
- Sequencing information is more relevant to phylogeny

---

# Bacterial DNA sequencing is a multi-step art

<img src="/img/sequencing.png" width="80%">

---

class: transition

# How do you turn DNA data into insight?

---

# Metagenomic shotgun sequencing "reads" all the DNA in a microbial community

- [Cut DNA](https://en.wikipedia.org/wiki/DNA_fragmentation) into random, short (50-300 nucleotide) pieces (i.e., the "shot")
- Look for small pieces in database of known genomes (or gene functions)
- Or, reconstruct the genomes from the small pieces

---

# Metagenomic shotgun sequencing faces some challenges

- It "reads" both human and bacterial DNA (~99% of reads from a swab can be human)
- Only ~1% of bacterial genes are useful for identifying taxonomy
- We don't know what >50% of bacterial genes do
- Reconstructing genomes is not straightforward

---

# Amplicon sequencing simplifies bacterial community profiling

- Amplify only a "taxonomic marker" gene common to all bacteria
- Non-bacterial DNA does not get amplified
- Thus, all sequencing reads go toward taxonomic information
- Inferring taxonomy is conceptually and computationally simpler

---

<img src="/img/shotgun-vs-amplicon.png" width="80%">

---

# The 16S rRNA gene is the popular bacterial taxonomic marker gene

- All organisms have ribosomes
- Bacteria (and Archaea) have a different ribosome from eukaryotes
- Bacterial ribosomes have a 16S subunit made up of proteins and ribosomal RNA

(16S structure: [Wimberly *et al.*](http://dx.doi.org/10.1038/35030006), *Nature* 2000)

---

# The 16S gene has "variable" regions that give phylogenetic information

<img src="/img/16s-variability.png" width="80%">

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

The [database](http://greengenes.lbl.gov/cgi-bin/nph-index.cgi)

swo> has non-isolated stuff... but how did it get assigned?

---

# Interlude: What heuristics can mean for your data

swo> amy's data

---

# USEARCH uses three strategies to improve speed

1.  Do pairwise comparisons in order of decreasing sequence similarity heuristic
2.  Make time-saving assumptions when performing the alignment
3.  Stop after finding one hit that reaches acceptable minimum identity

([Edgar](http://dx.doi.org/10.1093/bioinformatics/btq461), *Bioinformatics* 2010;
USEARCH [documentation](http://www.drive5.com/usearch/manual/usearch_algo.html))

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

# What do the "raw" sequencing data actually look like?

They are usually in [FASTQ](https://en.wikipedia.org/wiki/FASTQ_format) format:

```
@HWI-M04407:1:1101:15058:1935#TTGATATTAGAGAGAC/1
TGTGGTGCCAGCCGCCGCGGTAATACGTAGGTGGCAAGCGTTGTCCGGATTTACTGGGTGTAAAG
+
A1A11B11B11>A1AE0EA0EA/D2DAGFC/D1/B0B/E/EE/FGFE?/BEH12D@@/G/E122@
@HWI-M04407:1:1101:15485:1946#TTGATATTAGAGAGAC/1
CACGGTGCCAGCCGCCGCGGTAATACGGAGGATGCGAGCGTTATCCGGATTTATTGGGTTTAAAG
+
AAA1AA1>CF1>AAAEEEE0EA/FAF///A//B1FA//A/EE/GGG>/>EEH1FGEDEFGG1B1B
```

---

# There are multiple steps between raw data and analysis-ready data

1. Demultiplex reads 
2. Trim non-biological primers from reads
3. If using paired-end sequencing, merge reads
4. Remove reads (or sections of reads) with low quality
5. Identify and index unique reads
6. Call OTUs

(This is complex enough that I wrote a [short book](https://leanpub.com/primer16s/) on it!)

---

# These choices can have subtle effects on conclusions

---

class: transition

# Zooming out

---

# Amplicon sequencing can also answer questions in other organisms

- A DNA stretch near the ribosome is a fungal taxonomic barcode
- Bacterial species or genera can be examined (e.g., those that cause cholera, tuberculosis, acne, etc.)

---

# New technologies and methods will continue to change this landscape

- Single-cell sequencing: like metagenomic shotgun sequencing, but better

---

# But there is no clear path around certain bottlenecks

- How do you identify the function of unknown genes?
- What do you do with taxonomies once you have them?
