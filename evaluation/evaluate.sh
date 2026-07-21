#!/bin/bash

# evaluation of annotations

### lncRNAs means and modes

outFile="/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/lncRNAs_means.txt"
echo "species,mean" > $outFile
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/*/AGAT_v1.4.2/lncRNAs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ { if (seq_len > 0) { sum += seq_len; count++ }; seq_len = 0; next } { seq_len += length($0) } END { if (seq_len > 0) { sum += seq_len; count++ }; if (count > 0) print sum / count; else print 0 }'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/AGAT_v1.4.2/lncRNAs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ { if (seq_len > 0) { sum += seq_len; count++ }; seq_len = 0; next } { seq_len += length($0) } END { if (seq_len > 0) { sum += seq_len; count++ }; if (count > 0) print sum / count; else print 0 }'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/*/*/AGAT_v1.4.2/lncRNAs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ { if (seq_len > 0) { sum += seq_len; count++ }; seq_len = 0; next } { seq_len += length($0) } END { if (seq_len > 0) { sum += seq_len; count++ }; if (count > 0) print sum / count; else print 0 }'); echo $newName","$seqMean >> $outFile; done

outFile="/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/lncRNAs_modes.txt"
echo "species,mode" > $outFile
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/*/AGAT_v1.4.2/lncRNAs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '$0 ~ ">" {if (c) print c; c=0} $0 !~ ">" {c+=length($0)} END {print c}' | sort -n | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/AGAT_v1.4.2/lncRNAs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '$0 ~ ">" {if (c) print c; c=0} $0 !~ ">" {c+=length($0)} END {print c}' | sort -n | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/*/*/AGAT_v1.4.2/lncRNAs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '$0 ~ ">" {if (c) print c; c=0} $0 !~ ">" {c+=length($0)} END {print c}' | sort -n | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done


### lncRNAs per gene means and modes

outFile="/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/lncRNAs_per_gene_means.txt"
echo "species,mean" > $outFile
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/*/AGAT_v1.4.2/lncRNAs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | grep ">" | cut -d" " -f3 | sort | uniq -c | awk '{print $(NF-1)}' | awk '{sum+=$1} END {print sum/NR}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/AGAT_v1.4.2/lncRNAs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | grep ">" | cut -d" " -f3 | sort | uniq -c | awk '{print $(NF-1)}' | awk '{sum+=$1} END {print sum/NR}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/*/*/AGAT_v1.4.2/lncRNAs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | grep ">" | cut -d" " -f3 | sort | uniq -c | awk '{print $(NF-1)}' | awk '{sum+=$1} END {print sum/NR}'); echo $newName","$seqMean >> $outFile; done

outFile="/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/lncRNAs_per_gene_modes.txt"
echo "species,mean" > $outFile
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/*/AGAT_v1.4.2/lncRNAs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | grep ">" | cut -d" " -f3 | sort | uniq -c | awk '{print $(NF-1)}' | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/AGAT_v1.4.2/lncRNAs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | grep ">" | cut -d" " -f3 | sort | uniq -c | awk '{print $(NF-1)}' | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/*/*/AGAT_v1.4.2/lncRNAs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | grep ">" | cut -d" " -f3 | sort | uniq -c | awk '{print $(NF-1)}' | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done


### introns means and modes

outFile="/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/introns_means.txt"
echo "species,mean" > $outFile
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/*/AGAT_v1.4.2/introns.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ {printf("\n%s\n",$0);next;} {printf("%s",$0);}' | grep -A1 "gene_biotype=protein_coding" | sed '/^$/d' | awk '/^>/ { if (seq_len > 0) { sum += seq_len; count++ }; seq_len = 0; next } { seq_len += length($0) } END { if (seq_len > 0) { sum += seq_len; count++ }; if (count > 0) print sum / count; else print 0 }'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/AGAT_v1.4.2/introns.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ {printf("\n%s\n",$0);next;} {printf("%s",$0);}' | grep -A1 "gene_biotype=protein_coding" | sed '/^$/d' | awk '/^>/ { if (seq_len > 0) { sum += seq_len; count++ }; seq_len = 0; next } { seq_len += length($0) } END { if (seq_len > 0) { sum += seq_len; count++ }; if (count > 0) print sum / count; else print 0 }'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/*/*/AGAT_v1.4.2/introns.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ {printf("\n%s\n",$0);next;} {printf("%s",$0);}' | grep -A1 "gene_biotype=protein_coding" | sed '/^$/d' | awk '/^>/ { if (seq_len > 0) { sum += seq_len; count++ }; seq_len = 0; next } { seq_len += length($0) } END { if (seq_len > 0) { sum += seq_len; count++ }; if (count > 0) print sum / count; else print 0 }'); echo $newName","$seqMean >> $outFile; done


outFile="/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/introns_modes.txt"
echo "species,mode" > $outFile
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/*/AGAT_v1.4.2/introns.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ {printf("\n%s\n",$0);next;} {printf("%s",$0);}' | grep -A1 "gene_biotype=protein_coding" | sed '/^$/d' | awk '$0 ~ ">" {if (c) print c; c=0} $0 !~ ">" {c+=length($0)} END {print c}' | sort -n | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/AGAT_v1.4.2/introns.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ {printf("\n%s\n",$0);next;} {printf("%s",$0);}' | grep -A1 "gene_biotype=protein_coding" | sed '/^$/d' | awk '$0 ~ ">" {if (c) print c; c=0} $0 !~ ">" {c+=length($0)} END {print c}' | sort -n | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/*/*/AGAT_v1.4.2/introns.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ {printf("\n%s\n",$0);next;} {printf("%s",$0);}' | grep -A1 "gene_biotype=protein_coding" | sed '/^$/d' | awk '$0 ~ ">" {if (c) print c; c=0} $0 !~ ">" {c+=length($0)} END {print c}' | sort -n | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done


### introns per gene means and modes

outFile="/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/introns_per_gene_means.txt"
echo "species,mean" > $outFile
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/*/AGAT_v1.4.2/introns.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | grep ">" | grep "gene_biotype=protein_coding" | cut -d" " -f3 | sort | uniq -c | awk '{print $(NF-1)}' | awk '{sum+=$1} END {print sum/NR}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/AGAT_v1.4.2/introns.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | grep ">" | grep "gene_biotype=protein_coding" | cut -d" " -f3 | sort | uniq -c | awk '{print $(NF-1)}' | awk '{sum+=$1} END {print sum/NR}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/*/*/AGAT_v1.4.2/introns.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | grep ">" | grep "gene_biotype=protein_coding" | cut -d" " -f3 | sort | uniq -c | awk '{print $(NF-1)}' | awk '{sum+=$1} END {print sum/NR}'); echo $newName","$seqMean >> $outFile; done

outFile="/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/introns_per_gene_modes.txt"
echo "species,mean" > $outFile
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/*/AGAT_v1.4.2/introns.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | grep ">" | grep "gene_biotype=protein_coding" | cut -d" " -f3 | sort | uniq -c | awk '{print $(NF-1)}' | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/AGAT_v1.4.2/introns.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | grep ">" | grep "gene_biotype=protein_coding" | cut -d" " -f3 | sort | uniq -c | awk '{print $(NF-1)}' | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/*/*/AGAT_v1.4.2/introns.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | grep ">" | grep "gene_biotype=protein_coding" | cut -d" " -f3 | sort | uniq -c | awk '{print $(NF-1)}' | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done


### UTRs means and modes

outFile="/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/three_prime_UTR_means.txt"
echo "species,mean" > $outFile
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/*/AGAT_v1.4.2/three_prime_utrs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ { if (seq_len > 0) { sum += seq_len; count++ }; seq_len = 0; next } { seq_len += length($0) } END { if (seq_len > 0) { sum += seq_len; count++ }; if (count > 0) print sum / count; else print 0 }'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/AGAT_v1.4.2/three_prime_utrs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ { if (seq_len > 0) { sum += seq_len; count++ }; seq_len = 0; next } { seq_len += length($0) } END { if (seq_len > 0) { sum += seq_len; count++ }; if (count > 0) print sum / count; else print 0 }'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/*/*/AGAT_v1.4.2/three_prime_utrs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ { if (seq_len > 0) { sum += seq_len; count++ }; seq_len = 0; next } { seq_len += length($0) } END { if (seq_len > 0) { sum += seq_len; count++ }; if (count > 0) print sum / count; else print 0 }'); echo $newName","$seqMean >> $outFile; done

outFile="/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/three_prime_UTR_modes.txt"
echo "species,mean" > $outFile
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/*/AGAT_v1.4.2/three_prime_utrs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '$0 ~ ">" {if (c) print c; c=0} $0 !~ ">" {c+=length($0)} END {print c}' | sort -n | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/AGAT_v1.4.2/three_prime_utrs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '$0 ~ ">" {if (c) print c; c=0} $0 !~ ">" {c+=length($0)} END {print c}' | sort -n | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/*/*/AGAT_v1.4.2/three_prime_utrs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '$0 ~ ">" {if (c) print c; c=0} $0 !~ ">" {c+=length($0)} END {print c}' | sort -n | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done

outFile="/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/five_prime_UTR_means.txt"
echo "species,mean" > $outFile
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/*/AGAT_v1.4.2/five_prime_utrs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ { if (seq_len > 0) { sum += seq_len; count++ }; seq_len = 0; next } { seq_len += length($0) } END { if (seq_len > 0) { sum += seq_len; count++ }; if (count > 0) print sum / count; else print 0 }'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/AGAT_v1.4.2/five_prime_utrs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ { if (seq_len > 0) { sum += seq_len; count++ }; seq_len = 0; next } { seq_len += length($0) } END { if (seq_len > 0) { sum += seq_len; count++ }; if (count > 0) print sum / count; else print 0 }'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/*/*/AGAT_v1.4.2/five_prime_utrs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '/^>/ { if (seq_len > 0) { sum += seq_len; count++ }; seq_len = 0; next } { seq_len += length($0) } END { if (seq_len > 0) { sum += seq_len; count++ }; if (count > 0) print sum / count; else print 0 }'); echo $newName","$seqMean >> $outFile; done

outFile="/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/five_prime_UTR_modes.txt"
echo "species,mean" > $outFile
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/*/AGAT_v1.4.2/five_prime_utrs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '$0 ~ ">" {if (c) print c; c=0} $0 !~ ">" {c+=length($0)} END {print c}' | sort -n | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/*/*/AGAT_v1.4.2/five_prime_utrs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '$0 ~ ">" {if (c) print c; c=0} $0 !~ ">" {c+=length($0)} END {print c}' | sort -n | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/*/*/AGAT_v1.4.2/five_prime_utrs.fa; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); seqMean=$(cat $i | awk '$0 ~ ">" {if (c) print c; c=0} $0 !~ ">" {c+=length($0)} END {print c}' | sort -n | uniq -c | sort -nr | head -n 1 | awk '{print $NF}'); echo $newName","$seqMean >> $outFile; done


### STAR alignment

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/STAR_v2.7.11b
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/*/STAR_v2.7.11b/*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/STAR_v2.7.11b/$newName"_"$baseName; done
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/STAR_v2.7.11b/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/STAR_v2.7.11b -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/STAR_v2.7.11b/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/STAR_v2.7.11b
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/*/STAR_v2.7.11b/*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/STAR_v2.7.11b/$newName"_"$baseName; done
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/STAR_v2.7.11b/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/STAR_v2.7.11b -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/STAR_v2.7.11b/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/STAR_v2.7.11b
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/*/STAR_v2.7.11b/*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/STAR_v2.7.11b/$newName"_"$baseName; done
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/STAR_v2.7.11b/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/STAR_v2.7.11b -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/STAR_v2.7.11b/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/STAR_v2.7.11b
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/*/STAR_v2.7.11b/*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/STAR_v2.7.11b/$newName"_"$baseName; done
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/STAR_v2.7.11b/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/STAR_v2.7.11b -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/STAR_v2.7.11b/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export


### introns

for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/*/AGAT_v1.4.2/introns.gff; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cp $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/AGAT_v1.4.2/introns_annotations/$newName"_"$baseName; done

newName="Artemia_franciscana_JAVRJZ01_NCBI"
baseName="introns.gff"
cp /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/analysis/Artemia_franciscana_JAVRJZ01_NCBI/AGAT_v1.4.2/introns.gff /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/analysis/AGAT_v1.4.2/introns_annotations/$newName"_"$baseName

for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/*/AGAT_v1.4.2/introns_functional_stats/stat_features.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newDir2=$(dirname $newDir); newName=$(basename $newDir2); baseName=$(basename $i); cat $i | grep -A35 "\- lnc_rna \-" | tail -35 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/AGAT_v1.4.2/introns_functional_stats/$newName"_lnc_rna_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/*/AGAT_v1.4.2/introns_functional_stats/stat_features.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newDir2=$(dirname $newDir); newName=$(basename $newDir2); baseName=$(basename $i); cat $i | grep -A111 "\- mrna \-" | tail -111 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/AGAT_v1.4.2/introns_functional_stats/$newName"_mrna_"$baseName; done
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/AGAT_v1.4.2/introns_functional_stats/lnc_rna_stat_features.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/AGAT_v1.4.2/introns_functional_stats/*_lnc_rna_stat_features.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/AGAT_v1.4.2/introns_functional_stats/lnc_rna_stat_features.csv
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/AGAT_v1.4.2/introns_functional_stats/mrna_stat_features.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/AGAT_v1.4.2/introns_functional_stats/*_mrna_stat_features.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/AGAT_v1.4.2/introns_functional_stats/mrna_stat_features.csv

newName="Artemia_franciscana_JAVRJZ01_NCBI"
baseName="stat_features.csv"
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/analysis/Artemia_franciscana_JAVRJZ01_NCBI/AGAT_v1.4.2/introns_functional_stats/stat_features.txt | grep -A35 "\- lncrna \-" | tail -35 | sed "s/lncrna/lnc_rna/g" | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/analysis/AGAT_v1.4.2/introns_functional_stats/$newName"_lnc_rna_"$baseName
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/analysis/Artemia_franciscana_JAVRJZ01_NCBI/AGAT_v1.4.2/introns_functional_stats/stat_features.txt | grep -A111 "\- mrna \-" | tail -111 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/analysis/AGAT_v1.4.2/introns_functional_stats/$newName"_mrna_"$baseName


### multiqc

#### EGAPx v0.5.2

mkdir /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2
for i in /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A35 "\- lncrna \-" | tail -35 | sed "s/lncrna/lnc_rna/g" | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/$newName"_lnc_rna_"$baseName; done
for i in /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A111 "\- mrna \-" | tail -111 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/$newName"_mrna_"$baseName; done
#for i in /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A37 "\- rna \-" | tail -37 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/$newName"_rna_"$baseName; done
for i in /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A35 "\- transcript \-" | tail -35 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/$newName"_transcript_"$baseName; done
echo "species,stat,number" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/lnc_rna_annotation_stats.csv
cat /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/*_lnc_rna_annotation_stats.txt >> /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/lnc_rna_annotation_stats.csv
echo "species,stat,number" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/mrna_annotation_stats.csv
cat /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/*_mrna_annotation_stats.txt >> /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/mrna_annotation_stats.csv
#echo "species,stat,number" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/rna_annotation_stats.csv
#cat /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/*_rna_annotation_stats.txt >> /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/rna_annotation_stats.csv
echo "species,stat,number" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/transcript_annotation_stats.csv
cat /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/*_transcript_annotation_stats.txt >> /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/transcript_annotation_stats.csv

mkdir /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/BUSCO_v6.0.0
for i in /Users/bamflappy/PfrenderLab/multi_genome_project/EGAPx_v0.5.2/*/BUSCO_v6.0.0/genome/short_summary.specific.crustacea_odb12.genome.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /Users/bamflappy/PfrenderLab/multi_genome_project/EGAPx_v0.5.2/*/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/BUSCO_v6.0.0/$newName"_"$baseName; done
echo "species,busco" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv
cat /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.genome.txt >> /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv
echo "species,busco" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv
cat /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.proteins.txt >> /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv

mkdir /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/BUSCO_v6.0.0
for i in /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/*/AGAT_v1.4.2/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); nextNextDir=$(dirname $nextDir); newDir=$(dirname $nextNextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/BUSCO_v6.0.0/$newName"_"$baseName; done
echo "species,busco" > /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv
cat /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.proteins.txt >> /Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv

#### batch 1

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A35 "\- lnc_rna \-" | tail -35 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/$newName"_lnc_rna_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A111 "\- mrna \-" | tail -111 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/$newName"_mrna_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A37 "\- rna \-" | tail -37 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/$newName"_rna_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A35 "\- transcript \-" | tail -35 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/$newName"_transcript_"$baseName; done
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/lnc_rna_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/*_lnc_rna_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/lnc_rna_annotation_stats.csv
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/mrna_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/*_mrna_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/mrna_annotation_stats.csv
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/rna_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/*_rna_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/rna_annotation_stats.csv
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/transcript_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/*_transcript_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/transcript_annotation_stats.csv

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/QUAST_v5.3.0
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/QUAST_v5.3.0/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/*/QUAST_v5.3.0 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/QUAST_v5.3.0/MultiQC_v1.33 -n "multiqc" --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/HISAT2_v2.2.2/
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/*/HISAT2_v2.2.2/*\.stats; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/HISAT2_v2.2.2/$newName"_"$baseName; done
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/HISAT2_v2.2.2/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/HISAT2_v2.2.2 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/HISAT2_v2.2.2/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/FastQC_v0.12.1/
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/*/FastQC_v0.12.1/*_fastqc*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/FastQC_v0.12.1/$newName"_"$baseName; done
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/FastQC_v0.12.1/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/FastQC_v0.12.1 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/FastQC_v0.12.1/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/BUSCO_v6.0.0
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/ZQ/batch_1/*/BUSCO_v6.0.0/genome/short_summary.specific.crustacea_odb12.genome.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/ZQ/batch_1/*/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/BUSCO_v6.0.0/$newName"_"$baseName; done
echo "species,busco" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.genome.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv
echo "species,busco" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.proteins.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/BUSCO_v6.0.0
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/ZQ/batch_1/*/AGAT_v1.4.2/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); nextNextDir=$(dirname $nextDir); newDir=$(dirname $nextNextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/BUSCO_v6.0.0/$newName"_"$baseName; done
echo "species,busco" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.proteins.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv

#### batch 2

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A35 "\- lnc_rna \-" | tail -35 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/$newName"_lnc_rna_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A111 "\- mrna \-" | tail -111 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/$newName"_mrna_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A37 "\- rna \-" | tail -37 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/$newName"_rna_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A35 "\- transcript \-" | tail -35 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/$newName"_transcript_"$baseName; done
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/lnc_rna_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/*_lnc_rna_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/lnc_rna_annotation_stats.csv
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/mrna_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/*_mrna_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/mrna_annotation_stats.csv
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/rna_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/*_rna_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/rna_annotation_stats.csv
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/transcript_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/*_transcript_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/transcript_annotation_stats.csv

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/QUAST_v5.3.0
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/QUAST_v5.3.0/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/*/QUAST_v5.3.0 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/QUAST_v5.3.0/MultiQC_v1.33 -n "multiqc" --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/HISAT2_v2.2.2
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/*/HISAT2_v2.2.2/*\.stats; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/HISAT2_v2.2.2/$newName"_"$baseName; done
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/HISAT2_v2.2.2/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/HISAT2_v2.2.2 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/HISAT2_v2.2.2/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/FastQC_v0.12.1
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/*/FastQC_v0.12.1/*_fastqc*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/FastQC_v0.12.1/$newName"_"$baseName; done
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/FastQC_v0.12.1/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/FastQC_v0.12.1 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/FastQC_v0.12.1/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/BUSCO_v6.0.0
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/ZQ/batch_2/*/BUSCO_v6.0.0/genome/short_summary.specific.crustacea_odb12.genome.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/ZQ/batch_2/*/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/BUSCO_v6.0.0/$newName"_"$baseName; done
echo "species,busco" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.genome.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv
echo "species,busco" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.proteins.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/BUSCO_v6.0.0
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/ZQ/batch_2/*/AGAT_v1.4.2/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); nextNextDir=$(dirname $nextDir); newDir=$(dirname $nextNextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/BUSCO_v6.0.0/$newName"_"$baseName; done
echo "species,busco" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.proteins.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv

#### version 2

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A35 "\- lnc_rna \-" | tail -35 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/$newName"_lnc_rna_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A111 "\- mrna \-" | tail -111 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/$newName"_mrna_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A37 "\- rna \-" | tail -37 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/$newName"_rna_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A35 "\- transcript \-" | tail -35 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/$newName"_transcript_"$baseName; done
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/lnc_rna_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/*_lnc_rna_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/lnc_rna_annotation_stats.csv
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/mrna_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/*_mrna_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/mrna_annotation_stats.csv
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/rna_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/*_rna_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/rna_annotation_stats.csv
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/transcript_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/*_transcript_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/transcript_annotation_stats.csv

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/QUAST_v5.3.0
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/QUAST_v5.3.0/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/*/QUAST_v5.3.0 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/QUAST_v5.3.0/MultiQC_v1.33 -n "multiqc" --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/HISAT2_v2.2.2
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/*/HISAT2_v2.2.2/*\.stats; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/HISAT2_v2.2.2/$newName"_"$baseName; done
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/HISAT2_v2.2.2/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/HISAT2_v2.2.2 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/HISAT2_v2.2.2/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/FastQC_v0.12.1
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/*/FastQC_v0.12.1/*_fastqc*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/FastQC_v0.12.1/$newName"_"$baseName; done
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/FastQC_v0.12.1/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/FastQC_v0.12.1 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/FastQC_v0.12.1/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/BUSCO_v6.0.0
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/ZQ/version_2/*/BUSCO_v6.0.0/genome/short_summary.specific.crustacea_odb12.genome.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/ZQ/version_2/*/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/BUSCO_v6.0.0/$newName"_"$baseName; done
echo "species,busco" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.genome.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv
echo "species,busco" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.proteins.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/BUSCO_v6.0.0
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/ZQ/version_2/*/AGAT_v1.4.2/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); nextNextDir=$(dirname $nextDir); newDir=$(dirname $nextNextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/BUSCO_v6.0.0/$newName"_"$baseName; done
echo "species,busco" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.proteins.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv

#### additional

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A35 "\- lnc_rna \-" | tail -35 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/$newName"_lnc_rna_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A111 "\- mrna \-" | tail -111 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/$newName"_mrna_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A37 "\- rna \-" | tail -37 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/$newName"_rna_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/*/AGAT_v1.4.2/annotation_stats.txt; do echo $i; dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep -A35 "\- transcript \-" | tail -35 | sed "s/^/$newName,/g" | sed "s/(.*)//g" | tr ' ' '_' | tr -s '_' | sed "s/90_/ninety_/g" | sed "s/_[0-9]/,&/" | sed "s/_,/,/g" | tr -s ',' | sed "s/,_/,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/$newName"_transcript_"$baseName; done
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/lnc_rna_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/*_lnc_rna_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/lnc_rna_annotation_stats.csv
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/mrna_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/*_mrna_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/mrna_annotation_stats.csv
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/rna_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/*_rna_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/rna_annotation_stats.csv
echo "species,stat,number" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/transcript_annotation_stats.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/*_transcript_annotation_stats.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/transcript_annotation_stats.csv

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/QUAST_v5.3.0
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/QUAST_v5.3.0/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/*/QUAST_v5.3.0 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/QUAST_v5.3.0/MultiQC_v1.33 -n "multiqc" --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/HISAT2_v2.2.2
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/*/HISAT2_v2.2.2/*\.stats; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/HISAT2_v2.2.2/$newName"_"$baseName; done
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/HISAT2_v2.2.2/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/HISAT2_v2.2.2 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/HISAT2_v2.2.2/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/FastQC_v0.12.1
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/*/FastQC_v0.12.1/*_fastqc*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/FastQC_v0.12.1/$newName"_"$baseName; done
mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/FastQC_v0.12.1/MultiQC_v1.33
multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/FastQC_v0.12.1 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/FastQC_v0.12.1/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/BC/D_magna_LRVO_BC_clean/BUSCO_v6.0.0/genome/short_summary.specific.crustacea_odb12.genome.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/BC/D_magna_LRVO_BC_clean/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/CNGBdb/*/BUSCO_v6.0.0/genome/short_summary.specific.crustacea_odb12.genome.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/CNGBdb/*/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/zenodo/*/BUSCO_v6.0.0/genome/short_summary.specific.crustacea_odb12.genome.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/zenodo/*/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/NCBI/*/BUSCO_v6.0.0/genome/short_summary.specific.crustacea_odb12.genome.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/NCBI/*/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); newDir=$(dirname $nextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/$newName"_"$baseName; done
echo "species,busco" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.genome.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv
echo "species,busco" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.proteins.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv

mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/BUSCO_v6.0.0
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/BC/D_magna_LRVO_BC_clean/AGAT_v1.4.2/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); nextNextDir=$(dirname $nextDir); newDir=$(dirname $nextNextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/CNGBdb/*/AGAT_v1.4.2/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); nextNextDir=$(dirname $nextDir); newDir=$(dirname $nextNextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/zenodo/*/AGAT_v1.4.2/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); nextNextDir=$(dirname $nextDir); newDir=$(dirname $nextNextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/BUSCO_v6.0.0/$newName"_"$baseName; done
for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/NCBI/*/AGAT_v1.4.2/BUSCO_v6.0.0/proteins/short_summary.specific.crustacea_odb12.proteins.txt; do echo $i; dirName=$(dirname $i); nextDir=$(dirname $dirName); nextNextDir=$(dirname $nextDir); newDir=$(dirname $nextNextDir); newName=$(basename $newDir); baseName=$(basename $i); cat $i | grep "C:" | cut -d":" -f2 | sed "s/%\[S//g" | sed "s/^/$newName,/g" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/BUSCO_v6.0.0/$newName"_"$baseName; done
echo "species,busco" > /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv
cat /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/BUSCO_v6.0.0/*_short_summary.specific.crustacea_odb12.proteins.txt >> /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv

#### tree set

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/QUAST_v5.3.0
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/QUAST_v5.3.0/MultiQC_v1.33
#multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/\*/QUAST_v5.3.0 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/QUAST_v5.3.0/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/HISAT2_v2.2.2
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/HISAT2_v2.2.2/MultiQC_v1.33
#multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/\*/HISAT2_v2.2.2 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/HISAT2_v2.2.2/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/FastQC_v0.12.1
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/FastQC_v0.12.1/MultiQC_v1.33
#multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/\*/FastQC_v0.12.1 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/FastQC_v0.12.1/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export


#### all

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA/FastQC_v0.12.1
#for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/*/FastQC_v0.12.1/*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -rv $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA/FastQC_v0.12.1/$newName_$baseName; done

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA/FastQC_v0.12.1
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA/FastQC_v0.12.1/MultiQC_v1.33
#multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA/FastQC_v0.12.1 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA/FastQC_v0.12.1/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export --flat

### multiqc

#### batch 1

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/FastQC_v0.12.1/
#for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/*/FastQC_v0.12.1/*_fastqc*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/FastQC_v0.12.1/$newName"_"$baseName; done

#### batch 2

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/FastQC_v0.12.1/
#for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/*/FastQC_v0.12.1/*_fastqc*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/FastQC_v0.12.1/$newName"_"$baseName; done

#### version 2

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/FastQC_v0.12.1/
#for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/*/FastQC_v0.12.1/*_fastqc*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/FastQC_v0.12.1/$newName"_"$baseName; done

#### additional

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/FastQC_v0.12.1/
#for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/*/FastQC_v0.12.1/*_fastqc*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -v $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/FastQC_v0.12.1/$newName"_"$baseName; done

#### tree set

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/QUAST_v5.3.0
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/QUAST_v5.3.0/MultiQC_v1.33
#multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/\*/QUAST_v5.3.0 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/QUAST_v5.3.0/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/HISAT2_v2.2.2
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/HISAT2_v2.2.2/MultiQC_v1.33
#multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/\*/HISAT2_v2.2.2 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/HISAT2_v2.2.2/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/FastQC_v0.12.1
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/FastQC_v0.12.1/MultiQC_v1.33
#multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/\*/FastQC_v0.12.1 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/FastQC_v0.12.1/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export


#### all

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA/FastQC_v0.12.1
#for i in /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/*/FastQC_v0.12.1/*; do dirName=$(dirname $i); newDir=$(dirname $dirName); newName=$(basename $newDir); baseName=$(basename $i); rsync -rv $i /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA/FastQC_v0.12.1/$newName_$baseName; done

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA/FastQC_v0.12.1
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA/FastQC_v0.12.1/MultiQC_v1.33
#multiqc /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA/FastQC_v0.12.1 -o /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/all_RNA/FastQC_v0.12.1/MultiQC_v1.33 -n "multiqc" --fn_as_s_name --export --flat

### organization

#### new tree set

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Artemia_franciscana
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/D_magna_LRVO
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Diaphanosoma_dubium
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/D_arabica
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Artemia_sinica
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Artemia_tibetiana
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Branchinecta_lindahli
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Branchinecta_lynchi
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Branchinecta_sandiegonensis
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Eulimnadia_texana
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Chydorus_sphaericus
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/D_carinata
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/D_longicephala

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/D_lumholtzi_v2
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/Ceriodaphnia_sp_dubia_v2
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/D_melanica_v2
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/D_galeata_v2
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/D_mendotae_v2

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_magna_MLC
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_mediterranea
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_pulicaria
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_retrocurva
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_salina
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_schodleri
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_similis
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/Latona_sp

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_ambigua
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_arenata
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_catawba
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_dentifera
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_magniceps
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_mitsukuri
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_obtusa
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_pulex_KAP4
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_pulex_BEL2
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_sinensis_WSL
#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/Simocephalus_vetulus

#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.5.2/analysis/Artemia_franciscana_JAVRJZ01_NCBI/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Artemia_franciscana
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_magna_LRVO_BC_clean/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/D_magna_LRVO
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Diaphanosoma_dubium_CNGBdb/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Diaphanosoma_dubium
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_arabica_zenodo_SRA/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/D_arabica
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Artemia_sinica_ME_NCBI/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Artemia_sinica
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Artemia_tibetiana_Qi_NCBI/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Artemia_tibetiana
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Branchinecta_lindahli_BRLI_NCBI/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Branchinecta_lindahli
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Branchinecta_lynchi_BRLY_NCBI/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Branchinecta_lynchi
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Branchinecta_sandiegonensis_CCGP_NCBI/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Branchinecta_sandiegonensis
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Eulimnadia_texana_JT4_NCBI_clean/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Eulimnadia_texana
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Chydorus_sphaericus_JWP1_NCBI/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/Chydorus_sphaericus
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_carinata_CSIRO_NCBI/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/D_carinata
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_longicephala_AUS_NCBI/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/additional/D_longicephala

#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_lumholtzi_2_v2_WW_ZQ_clean/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/D_lumholtzi_v2
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Ceriodaphnia_sp_dubia_v2_ZQ/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/Ceriodaphnia_sp_dubia_v2
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_melanica_CON6_v2_ZQ_MP/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/D_melanica_v2
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_galeata_M5_v2_ZQ_ENA/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/D_galeata_v2
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_mendotae_67B_v2_ZQ_clean/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/version_2/D_mendotae_v2

#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_magna_MLC_001_ZQ/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_magna_MLC
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_mediterranea_CY_ORK_ZQ_clean/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_mediterranea
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_pulicaria_TF22_005_ZQ_clean/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_pulicaria
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_retrocurva_BLK_001_ZQ_clean/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_retrocurva
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_salina_ULW_001_ZQ/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_salina
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_schodleri_Mary_Lake_ZQ/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_schodleri
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_similis_BGL_001_ZQ/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/D_similis
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Latona_sp_BLK_101_BC_clean/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_2/Latona_sp

#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_ambigua_3_WW/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_ambigua
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_arenata_2_WW/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_arenata
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_catawba_3_WW/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_catawba
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_dentifera_3_WW/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_dentifera
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_magniceps_WW/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_magniceps
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_mitsukuri_1_SZH4_WW/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_mitsukuri
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_obtusa_v2_WW/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_obtusa
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_pulex_KAP4_SRA_noAA/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_pulex_KAP4
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_pulex_BEL2_WW/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_pulex_BEL2
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_sinensis_WSL_NCBI_clean_noAA/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/D_sinensis_WSL
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Simocephalus_vetulus_WW/STAR_v2.7.11b /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/new_tree_RNA/batch_1/Simocephalus_vetulus

#### tree set

#mkdir /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA
#cd /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_magna_LRVO_BC_clean/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/D_magna_LRVO
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Diaphanosoma_dubium_CNGBdb/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/Diaphanosoma_dubium
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_arabica_zenodo_SRA/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/D_arabica
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Artemia_sinica_ME_NCBI/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/Artemia_sinica
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Artemia_tibetiana_Qi_NCBI/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/Artemia_tibetiana
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Branchinecta_lindahli_BRLI_NCBI/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/Branchinecta_lindahli
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Branchinecta_lynchi_BRLY_NCBI/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/Branchinecta_lynchi
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Branchinecta_sandiegonensis_CCGP_NCBI/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/Branchinecta_sandiegonensis
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Eulimnadia_texana_JT4_NCBI_clean/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/Eulimnadia_texana
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Chydorus_sphaericus_JWP1_NCBI/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/Chydorus_sphaericus
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_carinata_CSIRO_NCBI/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/D_carinata
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_longicephala_AUS_NCBI/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/additional/D_longicephala

#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_lumholtzi_2_v2_WW_ZQ_clean/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/D_lumholtzi_v2
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Ceriodaphnia_sp_dubia_v2_ZQ/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/Ceriodaphnia_sp_dubia_v2
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_melanica_CON6_v2_ZQ_MP/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/D_melanica_v2
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_galeata_M5_v2_ZQ_ENA/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/D_galeata_v2
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_mendotae_67B_v2_ZQ_clean/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/version_2/D_mendotae_v2

#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_magna_MLC_001_ZQ/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/D_magna_MLC
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_mediterranea_CY_ORK_ZQ_clean/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/D_mediterranea
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_pulicaria_TF22_005_ZQ_clean/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/D_pulicaria
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_retrocurva_BLK_001_ZQ_clean/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/D_retrocurva
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_salina_ULW_001_ZQ/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/D_salina
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_schodleri_Mary_Lake_ZQ/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/D_schodleri
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_similis_BGL_001_ZQ/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/D_similis
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Latona_sp_BLK_101_BC_clean/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/Latona_sp

#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_ambigua_3_WW/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_ambigua
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_arenata_2_WW/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_arenata
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_catawba_3_WW/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_catawba
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_dentifera_3_WW/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_dentifera
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_lumholtzi_2_WW_ZQ_clean_noAA/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_lumholtzi
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_magniceps_WW/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_magniceps
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_mitsukuri_1_SZH4_WW/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_mitsukuri
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_obtusa_v2_WW/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_obtusa
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_parvula_2_WW/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_parvula
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_pulex_KAP4_SRA_noAA/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_pulex_KAP4
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_pulex_BEL2_WW/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_pulex_BEL2
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_sinensis_CHINA_ZQ_NCBI_noAA/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_sinensis_CHINA
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_sinensis_WSL_NCBI_clean_noAA/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_sinensis_WSL
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Simocephalus_vetulus_WW/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/Simocephalus_vetulus

#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/Ceriodaphnia_sp_dubia_ZQ/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/Ceriodaphnia_sp_dubia
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_melanica_CON6_ZQ_MP_noAA/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_melanica
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_galeata_M5_WW_ENA/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_1/D_galeata
#rsync -rv /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/D_mendotae_67B_ZQ_clean/* /temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/analysis/tree_RNA/batch_2/D_mendotae
