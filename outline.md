# Motivate microbial community profiling
- Maybe you think microbes have something to do with cancer
- http://journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0020447
- Ask: are there different microbes? (DGGE)
- Clearly we need a more sophisticated way to do this

# Sequencing to the rescue

## Metagenomics
- Easiest way to think about figuring out communities
- How do you do it? Nextera, random primers
- Disadvantages: expensive, off-target, lots of useless information, bioinformatically challenging

## Amplicon
- Easier to just ask "who's there?" from which you can infer "what are they doing?"
- Naming bacteria makes it relatable to existing knowledge about a species, function

## 16S gene
- Present in all bacteria (and archaea)
- Has a nice conserved structure: end areas and variable regions
- Variable regions make a molecular clock
- Early investigations have continued: we now have a tree of life in terms of this gene

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

# Looking forward: What kinds of questions do people answer with microbial profiling?
- Microbiomes as correlate of disease (i.e., diagnostics, prognostics)
- Microbiomes as cause of disease (i.e., potential for therapies or discovering mechanisms)
- Microbes as environmental players: looking at climate change, pollution remediation, etc.
