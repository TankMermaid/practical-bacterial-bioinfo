# "Who's there?": Practical bacterial phylogenetics
Scott Olesen

---

# My goals for today

- Be interesting/entertaining/give microbiome science a good rap
- Give a flavor of how bioinformatics/statistics matters to field you probably don't know
- Show you real tools that are used by scientists (like me) right now
- Introduce the idea of *heuristics* in computation
- Be a positive model for you if you're interested in following a path similar to mine

---

# A brief note about me (in case you're interested in a scientific training)

- 2006-2010: Williams, BA (physics)
- 2010-2012: University of Cambridge, Masters (theoretical physics and computational chemistry)
- 2012-2016: MIT, PhD ([microbiome science](http://almlab.mit.edu/))
- 2016-20XX: Harvard School of Public Health, postdoc (antibiotic resistance)
- Later: maybe analytical public policy, maybe more biology

---

# Outline of our hour together

- Motivate microbiome science
- Show how taxonomy assignment matters
- Show how taxonomy assignment is done
- Tell how the devil is in the details

---

# Microbes are essential to our health, environment, and economy

<table style="width:100%">
<tr>
  <td style="width:33%"><img src="/img/helicobacter.png" width="100%"></td>
  <td style="width:33%"><img src="/img/chlorophyll.png" width="100%"></td>
  <td style="width:33%"><img src="/img/digesters.png" width="100%"></td>
</tr>
<tr>
  <td style="text-align:center">They cause disease and regulate health</td>
  <td style="text-align:center">They produce oxygen</td>
  <td style="text-align:center">They process our waste</td>
</tr>
</table>

---

# The human body is home to a large and complex community

- Each human has hundreds or thousands of bacterial species living on/in her
- Bacterial cells are similar in number to human cells
- Bacterial genes on/in the human body outnumber human genes by 100-1,000 fold

---

# Maybe microbes have something to do with colon cancer?

> Recent publications have provided mechanistic evidence for the involvement of
> gut bacteria in the development of [colorectal cancer...] Despite this vast
> body of circumstantial evidence, however, no clinical data have thus far been
> available to directly show distinct bacterial colonization patterns in
> [colorectal cancer] patients.

([Marchesi *et al.*](10.1371/journal.pone.0020447), *PLoS ONE* 2011)

---

# 2 minute activity

*How would you design a study to determine if there are "distinct bacterial
colonization patterns" in colorectal cancer patients?*

- Work with one partner
- Take 2 minutes to come up with the skeleton of 1 study idea
- Assume you have unlimited resources
- Hint: What things are you going to compare? How are you going to measure them?

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

# E.g., asserting that the microbiome causes obesity

> The gut microbiome has been proposed to play a causal role in obesity. Here,
> we review the historical context for this hypothesis, highlight recent key
> findings, and critically discuss [...]
> the central epistemological problem for the field: how to
> define causality in the relationship between microbiota and obesity
> phenotypes.

([Harley and Karp](http://dx.doi.org/10.1016/j.molmet.2012.07.002), *Molec Metab* 2012)

---

# Asking "who's there?" is key to many of these studies

- We know a lot about cultured organisms, which we identify by "name" (i.e., *taxonomy*)
- Those names roughly correlate with organisms' functions
- You need names to talk about how things interact with one another

.center[Unfortunately, many organisms don't have clear names.]

---

# Before DNA sequencing, analysis of microbial communities relied on culturing

1. Swab an interesting community
2. Try to grow those bacteria on a plate
3. If bacteria grow, [identify them](https://en.wikipedia.org/wiki/Bergey%27s_Manual_of_Systematic_Bacteriology) by visual appearance or metabolism

---

# Culturing techniques are arduous, and the particular culturing method introduces bias

<img src="/img/sample-plate.png" width="80%">

.center[Only [about 1%](http://schaechter.asmblog.org/schaechter/2014/12/the-great-plate-count-anomaly-that-is-no-more.html) of species can be cultured!]

---

# Next-generation DNA sequencing dramatically changed microbial community profiling

- No waiting for microbes to grow, so it's faster to identify organisms
- No need to pick media, so profiling isn't biased in that way
- Sequencing information is more relevant to phylogeny (and thus taxonomy)

---

# Bacterial DNA sequencing is a multi-step art

<img src="/img/sequencing.png" width="80%">

---

class: transition

# How do you turn DNA data into insight?

---

# 2 minute activity

*How would you get "information" from a pile of bacterial DNA?*

- Work with one partner
- Take 2 minutes to come up with the skeleton of 1 methodology/workflow
- Assume you have unlimited (but plausible) resources
- Hint: What kinds of "information" might you want? What will you sequence? What will you do with the sequences?

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

<img src="/img/16s-variability.png" width="75%">

.center[Information from these regions [re-drew](http://dx.doi.org/10.1073/pnas.87.12.4576) the tree of life.]

---

# 16S sequencing always targets the same regions of the gene

- Polymerase chain reaction (PCR) creates many copies of a sequence bounded by "anchors" (i.e., primer binding sites)
- Use constant regions as "anchors"
- Variable region is the "content" of the amplicon

---

# 16S sequences are grouped into operational taxonomic units (OTUs)

- Environments often have many 16S sequences that are similar to one another
- Similarity of 16S genes is a decent, operational stand-in for species
- Clustering sequences into OTUs simplifies data analysis
- OTUs are often labeled by percentages: 97% OTUs are (roughly) clusters of 97% similar sequences

.center[But the definition of a bacterial species is [highly debated](http://dx.doi.org/10.1098/rstb.2006.1920).]

---

# 16S sequences can be made into their own phylogeny

<img src="/img/seq-to-tree.png" width="60%">

.center[But how do you interpret the leaves without "names"?]

---

# 16S sequences can be mapped onto existing taxonomies

<img src="/img/seq-to-tax.png" width="75%">

.center["Names" makes it easier to study a system and discuss results.]

---

# Caveat: Taxonomy assignment is different from operational taxonomic unit (OTU) assignment

- OTU-calling clusters unique sequences into biologically-relevant quasi-species
- Reference-based OTUs: put each sequence into the database OTU that it matches best
- *De novo* OTUs: put similar sequences into the same *ad hoc* OTUs

.center[OTU calling is a [highly-debated](https://figshare.com/articles/2015_Poster_on_OTU_robustness_reproducibility_amp_ecological_consistency/1437744) topic.]

---

# Taxonomy assignment can replace or follow OTU assignment

- You can call OTUs by saying OTU 1 is all sequences that classify as *E. coli*, etc.
- *De novo* OTUs are assigned taxonomies using a reference database

---

class: transition

# How do you assign taxonomies to 16S sequences?

---

# 2 minute activity

*How can you assign a "name" to a 16S sequence?*

- Work with one partner
- Take 2 minutes to come up with the skeleton of 1 methodology/workflow
- Assume you have unlimited (but plausible) resources
- Hint: What are ways to compare a query sequence with a database of sequences?

---

# Method 1: Exhaustive alignment-based searches ([BLAST](http://blast.ncbi.nlm.nih.gov)) are slow but reliable

Compare all your sequences against everything in the [GenBank](http://www.ncbi.nlm.nih.gov/genbank), EMBL, DDBJ, and PDB databases:

<img src="/img/all-against-all.png" width="60%">

---

# BLAST is reliable if your query is in the database

**Pros:**
- Alignments are a good way to match sequences
- Some hits are to a cultured organism with established species names

**Cons:**
- Very slow
- Poor characterization of uncultured organisms (e.g., `Uncultured bacterium partial 16S rRNA gene, clone A17C11`)

---

# Get around the "Uncultured bacterium" wall by designing a custom database

- In 2006, about half of 16S sequences in GenBank were "environmental sample" or "unclassified"
- [Curators built](http://dx.doi.org/10.1128/AEM.03006-05) trees from sequences and applied a consistent taxonomic scheme
- The result is a database of reference OTUs (99%, 97%, etc.), trees, and taxonomies called [Greengenes](http://greengenes.lbl.gov/cgi-bin/nph-index.cgi)

---

# Heuristics improve a workflow's speed at the cost of accuracy

- A *heuristic* is an easy-to-compute method (or value) that approximates something difficult-to-compute
- E.g., computing sequence similarity by alignment is difficult, but determining if two sequences have the same number of `A`'s is easy
- Heuristics give *a* solution, not necessarily the best one

---

# The popular heuristic search algorithm is [USEARCH](http://www.drive5.com/usearch/manual/usearch_algo.html): faster than BLAST, but weirder

**Pros:**
- 10-1,000x faster than BLAST

**Cons:**
- No guarantee that the hit you get is the database sequence most similar to the query

---

# Interlude: What heuristics can mean for your data

- Similar sequences might not be mapped to the same database entry
- Mappings might depend on parameters that don't seem relevant
- A good match might not be found

---

# USEARCH uses three heuristics to improve speed

1. Do pairwise comparisons in order of decreasing sequence-similarity heuristic
2. Make time-saving assumptions when performing the alignment
3. Stop after finding one hit that reaches acceptable minimum identity (or after suffering many failures)

([Edgar](http://dx.doi.org/10.1093/bioinformatics/btq461), *Bioinformatics* 2010;
USEARCH [documentation](http://www.drive5.com/usearch/manual/usearch_algo.html))

---

# USEARCH's sequence-similarity heuristic is based on *k*-mers

- A sequence's *k*-mers are all subsequences of length *k*
- E.g., `AAACCCGGG` has 4-mers `AAAC`, `AACC`, `ACCC`, etc.
- USEARCH guesses sequence-similarity using appearance of certain *k*-mers

---

# You can filter spam by recognizing discriminating email words

- The words "mortgage", "Viagra", "singles" appear mostly in my spam
- The words "data", "Greek", "dinner" appear most in real mail
- Assume an email is a "bag of words" and classify it based on appearance of words

---

# A naive Bayesian classifier of *k*-mers ([RDP](https://rdp.cme.msu.edu/classifier/classifier.jsp)) can assign taxonomy

- Assume a sequence is a "bag of *k*-mers" and classify it
- Technically, it's a [naive Bayesian classifier](https://en.wikipedia.org/wiki/Naive_Bayes_classifier)

([Wang *et al.*](http://dx.doi.org/10.1128/AEM.00062-07), *Appl Environ Microbiol* 2007)

---

# RDP's approach can feel more stable than alignment-based approaches

**Pros:**
- Assigns confidences to classification levels (rather than just hitting a sequence)
- Fast
- Stable (assigns similar sequences to similar things)

**Cons:**
- Can't discriminate below the genus level

---

class: transition

# Nuts & bolts

---

# There are multiple steps between raw data and analysis-ready data

1. Demultiplex reads
2. Trim non-biological primers from reads
3. If using paired-end sequencing, merge reads
4. Remove reads (or sections of reads) with low quality
5. Call OTUs

(This is complex enough that I wrote a [short book](https://leanpub.com/primer16s/) on it!)

---

# What do the "raw" sequencing data actually look like?

They are usually in [FASTQ](https://en.wikipedia.org/wiki/FASTQ_format) format:

```
@HWI-M04407:1:1101:15058:1935#TTGATATTAGAGAGAC/1
TGTGGTGCCAGCCGCCGCGGTAATACGTAGGTGGCAAGCGTTGTCCGGATTTACTGGGTGTAAAG ...
+
A1A11B11B11>A1AE0EA0EA/D2DAGFC/D1/B0B/E/EE/FGFE?/BEH12D@@/G/E122@ ...
@HWI-M04407:1:1101:15485:1946#TTGATATTAGAGAGAC/1
CACGGTGCCAGCCGCCGCGGTAATACGGAGGATGCGAGCGTTATCCGGATTTATTGGGTTTAAAG ...
+
AAA1AA1>CF1>AAAEEEE0EA/FAF///A//B1FA//A/EE/GGG>/>EEH1FGEDEFGG1B1B ...
```

---

# What do the "databases" look like?

Greengenes `97_otus.fasta` is a [FASTA](https://en.wikipedia.org/wiki/FASTA_format) file:

```
>1111883
GCTGGCGGCGTGCCTAACACATGTAAGTCGAACGGGACTG
TGAGCAACTTGTCCGACGGCGGGGGATAGCCGGCCCAACG
... [1428 nucleotides]
>1111882
AGAGTTTGATCATGGCTCAGGATGAACGCTAGCGGCAGGC
GAGACCGGCGCACGGGTGCGTAACGCGTATGCAATCTGCC
TTATAGTATATAGATGTGGCATCACATTTCTATTAAAGAT
... [1479 nucleotides]
```

---

# What do "taxonomy lists" look like?

Greengenes `97_otu_taxonomy.txt` is a plain text file:

```
367523  k__Bacteria; p__Bacteroidetes; c__Flavobacteriia; o__Flavobacteriales; f__Flavobacteriaceae; g__Flavobacterium; s__

187144  k__Bacteria; p__Firmicutes; c__Clostridia; o__Clostridiales; f__; g__; s__
```

RDP output is a "fixrank" file:

```
seq00001;  Bacteria  domain  1.0  "Bacteroidetes"  phylum  1.0  "Bacteroidia"  class  1.0  "Bacteroidales"  order  1.0  "Porphyromonadaceae"  family  1.0  Parabacteroides  genus  1.0
```

---

# What does a USEARCH command look like?

```
usearch -usearch_global query.fasta -db gg_13_5_otus/rep_set/97_otus.fasta -id 0.97 -blast6out results.b6 -strand plus
```

gives output like

```
seq00003  548699    97.6  253  6  0  1  253  1  1352  *  *
seq00002  1136443  100.0  253  0  0  1  253  1  1471  *  *
seq00004  324882    99.2  253  2  0  1  253  1  1410  *  *
```

---

# There are "industry-standard" pipelines that can simplify these intermediate steps...

- The most popular, [QIIME](http://qiime.org/), relies on the closed-source `usearch` (which implements USEARCH)
- The other popular one, [mothur](http://www.mothur.org/), relies on a [clone](https://github.com/torognes/vsearch) of `usearch`

([Caporaso *et al.*](http://dx.doi.org/10.1038/nmeth.f.303), *Nat Meth* 2010,
[Schloss *et al.*](http://dx.doi.org/10.1128/AEM.01541-09), *Appl Environ Microbiol* 2009)

---

# ... but these intermediate processing steps can have subtle effects on conclusions

<img src="/img/taxa-plot.png" width="100%">

---

class: transition

# Zooming out

---

# Amplicon sequencing can also answer questions in other organisms

- Particular bacterial species or genera can be examined (e.g., those that cause cholera, tuberculosis, acne, etc.)
- A DNA stretch near the ribosome is a fungal taxonomic barcode
- The eukaryotic ribosome is a good target for studying protists

---

# New technologies and methods will continue to change this landscape

- Cheaper, easier, and more accurate sequencing
- Single-cell sequencing: like metagenomic shotgun sequencing, but better
- Improving databases and sequence homology detection

---

# But there is no clear path around certain bottlenecks

- How do you identify the function of unknown genes?
- How do you identify the function of unknown bacteria?
- How do you work with the 99% of the bacterial genome that is not easily comparable?
- What do you do with taxonomies once you have them?
