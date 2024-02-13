#!/bin/bash

#!/bin/bash

if [ ! $(command -v singularity) ]; then
        module load singularity
fi


singularity pull docker://trinityrnaseq/trinityrnaseq:2.11.0
mv -v *.sif singularity-Trinity-2.11.0.sif
