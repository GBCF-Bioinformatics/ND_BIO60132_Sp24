# Genome Guided Counts
Workflow setup for automated scripts for raw seq to counts, based on methods developed for MDIBL Environmental Genetics Workshop  

1. Place genome in Reference directory.  You will need a genome in fasta format, a gff of gene locations, and a splice sites file.  Examples for Daphnia are provide for formatting guidance.

2. Go to Scripts and add your email to the SLURM header in 1_hisat_and_samtools.job.blank and 2_htseq-count.job.blank.

3. Follow the instructions in the Scripts README.  Briefly, run:
   bash make_list.sh
   bash make_1.listed.sh #will be generated in first step
   for f in *hisat*.job; do sbatch $f; done
   #wait to complete

   bash make_2.listed.sh
   for f in *htseq*.jobl; do sbatch $f; done
   #wait to complete

4. Counts will be generated in separate files, in the Counts folder.  You can then follow the demo code in the Counts README for notes on naming and merging counts files.

5. Proceed with DE as we do here:https://github.com/NCGAS/de-novo-transcriptome-assembly-pipeline/tree/master/Project_Carbonate_v4/final_assemblies/DE.  Briefly:

    a. annotate your sample design according to trinity's documentation (see: https://github.com/trinityrnaseq/trinityrnaseq/wiki/Trinity-Differential-Expression#identifying-de-features-with-biological-replicates-preferred)

    nano samples_described

    b. run DE, in this case using edgeR or any other acceptable method (see above trinity documentation).  The below code assumes you named your counts matrix "matrix", uses edgeR, and assumes you named your samples files "samples_described":

    /N/soft/rhel7/trinityrnaseq/2.11.0/Analysis/DifferentialExpression/run_DE_analysis.pl --matrix matrix --method edgeR --samples_file samples_described

    c. run DE analyses (in this case using p=.05):

    cd edgeR.*/ 

 trinityrnaseq/2.11.0/Analysis/DifferentialExpression/analyze_diff_expr.pl --matrix ../matrix -P 5e-2 -C 2 --sample ../samples_described
