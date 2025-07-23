# snpeffpipeline
Dockerfile and related files for COVID19 ORF variants extract pipeline 

Usage

1. Create a directory ( E.G. SNP2VAR )
2. Put all files to the directory (NC_045512.2.fasta, Dockerfile, PipeLine.sh)
3. Build image with this command "docker build -t snpeffpipeline:v1 . "
4. Place target file for extract ORF changings in the directory (MockInput.fasta)
5. Run command
   "docker run --rm -v $(pwd):/tMp snpeffpipeline:v1 bash -c 'PipeLine.sh  MockInput.fasta NC_045512.2.fasta 2> /dev/null'"
   Results will be printed to standard output.
   
5.1 Output can be redirected to a file (OUTPUT.txt) with this command 
   "docker run --rm -v \$(pwd):/tMp snpeffpipeline:v1 bash -c 'PipeLine.sh  MockInput.fasta NC_045512.2.fasta 2> /dev/null > OUTPUT.txt' "

   Example output (Which we will use as feature in clustering)
   ORF1ab:E148G
   ORF1ab:A1306S
   ORF1ab:P2046L
   ORF1ab:P2287S
   ORF1ab:V2930L
   ORF1ab:T3255I
   ORF1ab:T3646A
   S:T19R
   S:T95I
   S:L452R
   S:T478K
   S:D614G
   S:P681R

ORF1ab:E148G = Changing in ORF1ab gene that leads to changing from aminoacid E at position 148 of the ORF1ab protein to aminoacid G.
