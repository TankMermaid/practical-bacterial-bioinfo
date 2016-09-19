#lang slideshow

(require laterna)

(define-syntax-rule (bitmap/width filename width)
  (let* ([bm (bitmap (read-bitmap filename))]
         [new-scale (/ width (pict-width bm))])
    (scale bm new-scale)))

(define-syntax-rule (thought elt ...)
  (italic (colorize (para #:align 'center elt ...) "gray")))

(title-slide "Who's there? Practical bacterial phylogenetics"
             "Scott Olesen (Williams '10, MIT '16 PhD)")

(slide/title "A quick note about me, in case you're interested in a research training"
             (item "2006-2010: Williams, physics BA")
             (item "2010-2012: University of Cambridge, theoretical physics then computational chemistry")
             (item "2012-2016: MIT, biological engineering PhD, mostly microbiome science")
             (item "2016-20XX: Harvard School of Public Health, postdoc on antibiotic resistance")
             (item "Later: maybe analytical public policy, maybe more biology"))

(slide/title "Microbes are essential to our health, environment, and economy"
             (let ([column-width 300])
               (table 3
                      (append
                       (map (lambda (fn) (bitmap/width fn column-width))
                            '("img/helicobacter.png"
                              "img/chlorophyll.png"
                              "img/digesters.png"))
                       (map (lambda (x) (para #:width column-width #:align 'center x))
                            '("They cause disease and regulate health"
                              "They produce oxygen"
                              "They process our waste")))
                      cc-superimpose cc-superimpose
                      5 5)))

(slide/title "Maybe microbes have something to do with colon cancer?"
             (para "\"Recent publications have provided mechanistic evidence for the involvement of gut bacteria in the development of [colorectal cancer...] Despite this vast body of circumstantial evidence, however, no clinical data have thus far been available to directly show distinct bacterial colonization patterns in [colorectal cancer] patients.\" (Marchesi" (it "et al.") "," (it "PLoS ONE") "[2011])"))

(slide/title "Microbial community profiling helps determine the role of microbes"
             (italic (para "You can think of microbes as..."))
             (item "correlates of disease (i.e., diagnostic, prognostic indicators)")
             (item "the cause of disease (i.e., potential for therapies or discovering mechanisms)")
             (item "environmental players (e.g., climate change, pollution remediation)"))

(slide/title "E.g., microbial community profiling non-invasively diagnoses inflammatory bowel disease in children"
             (italic (para #:align 'center "You can't diagnose IBD in children the regular way (with an endoscopy)."
                           "Microbes provide just as much information as the endoscopy."))
             (blank 20)
             (bitmap/relative-width "img/papa.png" 0.7))

(slide/title "Before DNA sequencing, analysis of microbial communities relied on culturing"
             (enum 1 "Swab an interesting community")
             (enum 2 "Try to grow that on a plate")
             (enum 3 "If bacteria grow, identify them by visual appearance or metabolism"))

(slide/title "Culturing techniques are relatively arduous and biased"
             (comment "the great plate count anomaly")
             (bitmap/relative-width "img/sample-plate.png" 0.8))

(slide/title "Next-generation DNA sequencing dramatically changed microbial community profiling"
             (comment "first-generation DNA sequencing couldn't go metagenomics")
             (item "No waiting for microbes to grow, so it's faster to identify organisms")
             (item "No need to pick media, so profiling isn't biased in that way")
             (item "Sequencing information is more relevant to phylogeny"))

(slide/title "Bacterial DNA sequencing is a multi-step art"
             (bitmap/relative-width "img/sequencing.png" 0.8))

(transition-slide "How do you turn DNA data into insight?")

(slide/title "Metagenomic shotgun sequencing ``reads'' all the DNA in a microbial community"
             (item "Cut DNA into random, short (50-300 nucleotide) pieces (i.e., the \"shot\")")
             (item "Look for small pieces in database of known genomes (or gene functions)")
             (item "Or, reconstruct the genomes from the small pieces"))

(slide/title "Metagenomic shotgun sequencing faces some challenges"
             (item "It \"reads\" both human and bacterial DNA")
             (item "Only ~1% of bacterial genes are useful for identifying taxonomy")
             (item "We don't know what >50% of bacterial genes do")
             (item "Reconstructing genomes is not straightforward"))

(slide/title "Amplicon sequencing simplifies bacterial community profiling"
             (item "All bacteria have a common \"taxonomic marker\" gene")
             (item "Non-bacterial DNA does not get amplified")
             (item "All sequencing reads go toward taxonomic information")
             (item "Inferring taxonomy is conceptually and computationally simpler"))

(slide
 (cc-superimpose
  (full-page)
  (bitmap/relative-width "img/shotgun-vs-amplicon.png" 0.8)))

(slide/title "The 16S rRNA gene is the common taxonomic marker gene"
             (italic (para #:align 'center "Variable region content plus molecular clock yields bacterial phylogeny"))
             (bitmap/relative-width "img/16s-variability.png" 0.6))

(slide/title "16S sequencing always targets the same regions of the gene"
             (item "Use constant regions as \"anchors\" (i.e., primer binding sites)")
             (item "Variable region is the \"content\" of the amplicon")
             (blank 20)
             (bitmap/relative-width "img/pcr-construct.png" 0.6))

(slide/title "16S sequences are grouped into operational taxonomic units (OTUs)"
             (item "The definition of a bacterial species is highly-debated")
             (item "Similarity of 16S genes is a decent, operational stand-in for species")
             (item "Clustering sequences into OTUs simplifies data analysis"))

(transition-slide "Practical bacterial phylogenetics using 16S")

(slide/title "16S sequences can be made into their own phylogeny"
             (bitmap/relative-width "img/seq-to-tree.png" 0.6)
             (blank 10)
             (italic (colorize (para #:align 'center "But how do you interpret the leaves?") "gray")))

(slide/title "16S sequences can be mapped onto existing taxonomies"
             (bitmap/relative-width "img/seq-to-tax.png" 0.75)
             (blank 20)
             (thought "Easier to make hypotheses and relate to other studies"))

(slide/title "Taxonomy assignment is different from (but related to) operational taxonomic unit (OTU) assignment"
             (item "OTU-calling clusters unique sequences into biologically-relevant quasi-species")
             (subitem "Reference-based OTUs: put each sequence into the database OTU that it matches best")
             (subitem (it "De novo") "OTUs: put similar sequences into the same" (it "ad hoc") "OTUs")
             (item (it "De novo") "OTUs are assigned taxonomies using a reference database"))

(slide/title "Taxonomy assignment, Method 1: Exhaustive alignment-based searches (BLAST) are slow but reliable"
             (comment "OTUs are handy for reducing number of comparisons")
             'alts
             (list (list (italic (para #:align 'center "Compare all against all"))
                         (bitmap/relative-width "img/all-against-all.png" 0.6))
                   (list (para (bt "Pros:"))
                         (item "Alignments are a good way to match sequences")
                         (item "Hits are to a cultured organisms with establish species names")
                         (blank 20)
                         (para (bt "Con:"))
                         (item "Very slow")
                         (item "Poor characterization of uncultured organisms"))))

(slide/title "Method 2: Alignment-based search with heuristics (USEARCH) are faster but weirder"
             (para (bt "Pro:"))
             (item "10-1,000x faster than BLAST")
             (para (bt "Con:"))
             (item "No guarantee that the hit you get is the best hit"))

(slide/title "Greengenes is the popular database to use with USEARCH"
             (para "swo> has non-isolated stuff")
             (para "but how did it get assigned?"))

(slide/title "Interlude: What heuristics can mean for your data"
             (para "swo> show Amy's data")
             (comment "different read portions and different identities can lead to different taxonomies"))

(slide/title "USEARCH uses three strategies to improve speed"
             (enum 1 "Do pairwise comparisons in order of decreasing sequence similarity heuristic")
             (enum 2 "Make time-saving assumptions when performing the alignment")
             (enum 3 "Stop after finding one hit that reaches acceptable minimum identity"))

(slide/title "USEARCH's sequence similarity heuristic is based on *k*-mers")

(slide/title "Method 3: Use *k*-mer content to assign taxonomy (RDP)")

(slide/title "RDP uses a naive Bayesian classifier")

(slide/title "RDP's approach can feel more stable than alignment-based approaches"
             (item "revisit Amy's data"))

(transition-slide "Nuts & bolts")

(slide/title "What do the input data actually look like?")

(slide/title "There are multiple steps between raw data and analysis-ready data")

(slide/title "These choices can have subtle effects on conclusions")

(transition-slide "Zooming out")

(slide/title "Amplicon sequencing can also answer questions in other organisms"
             (item "A DNA stretch near the ribosome is a fungal taxonomic barcode")
             (item "Bacterial species or genera can be examined (e.g., those that cause cholera, tuberculosis, acne, etc.)"))

(slide/title "Thanks go to..."
             (rb-superimpose
              (cc-superimpose
               titleless-page
               (vc-append
                (hc-append (t "my co-author on this project")
                           (blank 25)
                           #;(with-ref (bitmap/relative-width "img/gurry1.jpg" 0.5) "Thomas Gurry"))
                (blank 25)
                (blank 35)
                (t "BE!")))
              (small (it "Slideshow made with racket/slideshow"))))
