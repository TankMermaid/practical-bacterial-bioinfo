# "Who's there?": Practical bacterial phylogenetics
Scott Olesen (Williams '10; MIT PhD '16)

---

# Motivate microbial community profiling
- Maybe you think microbes have something to do with cancer
- http://journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0020447

---

# Old school of profiling
- Plate, culture, and identify
- DGGE "fingerprint", like the things we use for DNA paternity testing

# Sequencing to the rescue

## Metagenomics
- Easiest way to think about figuring out communities
- How do you do it? Nextera (tagmentation, PCR, sequencing)
- Disadvantages
  - expensive
  - off-target (in target genome)
  - lots of human stuff
  - bioinformatically challenging (repeated sequences)

## Amplicon
- Easier to just ask "who's there?" from which you can infer "what are they doing?"
- Naming bacteria makes it relatable to existing knowledge about a species, function

## 16S gene
- Present in all bacteria (and archaea)
- Has a nice conserved structure: end areas and variable regions
- Variable regions make a molecular clock
- Early investigations have continued: we now have a tree of life in terms of this gene

### OTU calling
- Typically, people combined these individual, unique sequences into OTUs.
- This was originally because people were interested in diversity and there was a lot of sequencing error.
- The rules about bacterial "species" got extended here, so 97% identity became common.
- There's a difference between OTU calling, which can be de novo, and lineage assignment. They get conflated though: you can make OTUs that are just all those sequences that classified to the same lineage.

## Amplicon sequencing

Relate the gene to phylogenetic trees
# Talk about methods for relating sequences with taxonomy
## BLAST: advantages and disadvantages
A quick note about the difference between OTU calling and taxonomy classification. Why did people always used to call OTUs? How are OTUs made now?
## Heuristic alignments (i.e., USEARCH)
Increased speed
Possible weirdnesses due to heuristics
## Interlude
A data set I'm working on with a collaborator that shows how using different taxonomy assignment methods (and using different parts of the sequence data) lead to apparently different compositions (e.g., a set of sequences might be called Helicobacter, Flexispira, just Helicobacteraceae, or nothing at all)
## Alignment-free methods (i.e., RDP's naive Bayesian classifier)
High-level description of the algorithm by comparison with a spam filter's bag-of-words assumption
Similar speed, less potential for weirdnesses
Why do people USEARCH?
# Interlude: a note on the ins-and-outs of 16S data processing
- What do the input data actually look like?
- What things need to be done to the data to make it usable for taxonomy-calling?
- Why do these choices matter?

# It's not just about 16S
You can apply the same kind of thought to a host of other loci:

- Fungal ITS
- hsp60 for Vibrio
- IS6110 for M. tuberculosis

# Looking forward: What kinds of questions do people answer with microbial profiling?
- Microbiomes as correlate of disease (i.e., diagnostics, prognostics)
- Microbiomes as cause of disease (i.e., potential for therapies or discovering mechanisms)
- Microbes as environmental players: looking at climate change, pollution remediation, etc.

# Remember to:
- Point out what things are industry-standard/cutting-edge (i.e., that real grown-up scientists are using them right now)
- Point out what things that I have used or done in my graduate work (i.e., that real people are doing and studying these things)
- Show pictures of the actual command-line commands and the actual files that get input and output from these programs, but don't actually run anything in a terminal
