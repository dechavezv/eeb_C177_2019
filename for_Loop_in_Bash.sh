################

for file in *.fasta; do (echo $file && $(printf $file \
perl -pe 's/.fasta/.fas/g');done

####################
