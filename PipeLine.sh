InPutNaMe=$1
NaMeXxXx=$(echo $InPutNaMe | awk -F "/" '{print $NF}')
RefPath=$2
RefFile=$(echo $RefPath | awk -F "/" '{print $NF}')
#DelFlAgS=0
#$DelFlAgS=$3
#echo $NaMeXxXx
#echo $RefPath
#echo $RefFile
#echo $DelFlAgS
cd /tMp
minimap2 -a NC_045512.2.fasta $NaMeXxXx > tmp_"$NaMeXxXx"_.sam
samtools view -b tmp_"$NaMeXxXx"_.sam | samtools sort > tmp_"$NaMeXxXx"_.sorted.bam
bcftools mpileup --min-ireads 0 -f "$RefPath" tmp_"$NaMeXxXx"_.sorted.bam > tmp_"$NaMeXxXx"_.vcf
snpEff ann -nodownload -formatEff -classic -noStats -noLog  -no-upstream -no-downstream  NC_045512.2 -v tmp_"$NaMeXxXx"_.vcf | grep "EFF=NON_SYNONYMOUS_CODING"  | awk -F ";" '{ print $7}' | awk -F "|" '{ print $6":"$4}' 

#if [ "$DelFlAgS" -eq 1 ]; then
    rm -f "tmp_${NaMeXxXx}_"* 
    rm NC_045512.2.fasta.fai
#fi

