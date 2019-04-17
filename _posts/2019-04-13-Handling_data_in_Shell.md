---
layout: post
title: " Week 3- Handling Big data in the SHELL "
description: "Guide to undertand how to Handling data"
category: articles
tags: [github, Git]
comments: false
---
Goals:
- Understand the benetifs of Unix tools to format data.     
- Understand the things that shell can do with Big data.  
- Understand the benetifs of the Unix tool AWK.  
- Manupulate real data from biological experiments.  

There are many times when analysing large datasets when one 
might want to remove many rows from the table because the contents 
do not match what you want. Or you want to count all of the line with 
specific values, like all the occurrences of a specific gene in the table. 
When I first started doing computational biology, I tried lots of ways to 
do it with excel or pages. But this lead to have dozens of complications and 
when I staterted to handle big data excel would not even open.  

Just by using simple commands you can merge, 
sort and edit files for downstream analysis.   
 
## Exercise 1: Working With Files  
Login into Hoffman. Then, copy the directory `Genes_example/` located at `classdata/Labs/Lab3/` 
into your HOME directory   
**Hint**: `cp` by itself wont do the task.    

The folder `Example_cat/` have individual files with important 
information about some genes that Charles sent for DNA sequencing.  

~~~
[c177-t0@login2 ~]$ ls Example_cat/
~~~
{:  .language-bash}

~~~
Gene_1f3Seql14530.txt   Gene_1f3Seql14531.txt   Gene_1f3Seql14532.txt
Gene_1f3Seql145310.txt  Gene_1f3Seql145320.txt  Gene_1f3Seql145330.txt
Gene_1f3Seql145311.txt  Gene_1f3Seql145321.txt  Gene_1f3Seql145331.txt
Gene_1f3Seql145312.txt  Gene_1f3Seql145322.txt  Gene_1f3Seql14533.txt
Gene_1f3Seql145313.txt  Gene_1f3Seql145323.txt  Gene_1f3Seql14534.txt
Gene_1f3Seql145314.txt  Gene_1f3Seql145324.txt  Gene_1f3Seql14535.txt
Gene_1f3Seql145315.txt  Gene_1f3Seql145325.txt  Gene_1f3Seql14536.txt
Gene_1f3Seql145316.txt  Gene_1f3Seql145326.txt  Gene_1f3Seql14537.txt
Gene_1f3Seql145317.txt  Gene_1f3Seql145327.txt  Gene_1f3Seql14538.txt
Gene_1f3Seql145318.txt  Gene_1f3Seql145328.txt  Gene_1f3Seql14539.txt
Gene_1f3Seql145319.txt  Gene_1f3Seql145329.txt
~~~
{:  .output}

Charles is working with the African wild dog DNA and just realized 
that the gene sequenced on **March 15th** was contaminated with 
human DNA. He needs to find out the 
name of this gene to repeat the DNA extraction and send it again for 
sequencing. Lest's look at one of the files.  
~~~
[c177-t0@login2 ~]$ less Gene_1f3Seql145310.txt
~~~
{:  .language-bash}

~~~
GeneID10DCH..sequenced..CA@19.##0#3##.10%UCLA..replicateA
GeneID10DCH..sequenced..CA@19.##0#3##.10%UCLA..replicateB
~~~
{:  .output}

Although the day each gene was 
sequenced is somewhere in the text above, 
is dificult to understand its content.  

In the following exercise we will help Charles to fixed 
the information of the files and then find the gene that 
needs to be resequence.  

The first thing we need to do is merge all files and save them 
as a single document called `All_genes.txt`.   
~~~
[c177-t0@login2 Lab3]$ cat * > All_genes.txt
~~~
{:  .language-bash}

Now if you do `ls` the file `All_genes.txt` should be there. However, 
is hard to see things with so many documents in the directory. 
Create a directory called `Individual_genes`  
then with the exception of `All_genes.txt` 
move all the files to the directory you just created.    
**HINT**: You may want to use `mv` with a wildcard.        
You should see something like this:  
~~~
[c177-t0@login2 ~]$ ls
~~~
{:  .language-bash}

~~~
All_Genes.txt  Individual_genes/
~~~
Also, very that individual files are located 
within directory `Individual_genes`.  

~~~
[c177-t0@login2 ~]$ ls Individual_genes/
~~~
{:  .language-bash}

~~~
Gene_1f3Seql14530.txt   Gene_1f3Seql14531.txt   Gene_1f3Seql14532.txt
Gene_1f3Seql145310.txt  Gene_1f3Seql145320.txt  Gene_1f3Seql145330.txt
Gene_1f3Seql145311.txt  Gene_1f3Seql145321.txt  Gene_1f3Seql145331.txt
Gene_1f3Seql145312.txt  Gene_1f3Seql145322.txt  Gene_1f3Seql14533.txt
Gene_1f3Seql145313.txt  Gene_1f3Seql145323.txt  Gene_1f3Seql14534.txt
Gene_1f3Seql145314.txt  Gene_1f3Seql145324.txt  Gene_1f3Seql14535.txt
Gene_1f3Seql145315.txt  Gene_1f3Seql145325.txt  Gene_1f3Seql14536.txt
Gene_1f3Seql145316.txt  Gene_1f3Seql145326.txt  Gene_1f3Seql14537.txt
Gene_1f3Seql145317.txt  Gene_1f3Seql145327.txt  Gene_1f3Seql14538.txt
Gene_1f3Seql145318.txt  Gene_1f3Seql145328.txt  Gene_1f3Seql14539.txt
Gene_1f3Seql145319.txt  Gene_1f3Seql145329.txt
~~~
  
Let's look inside `All_Genes.txt`   
~~~
[c177-t0@login2 ~]$ less -F All_Genes.txt 
~~~
{:  .language-bash}

~~~
GeneID10DCH..sequenced..CA@19.##0#3##.10%UCLA..replicateB
GeneID11DCH..sequenced..CA@19.##0#3##.11%UCLA..replicateA
GeneID11DCH..sequenced..CA@19.##0#3##.11%UCLA..replicateB
GeneID12DCH..sequenced..CA@19.##0#3##.12%UCLA..replicateA
GeneID12DCH..sequenced..CA@19.##0#3##.12%UCLA..replicateB
GeneID13DCH..sequenced..CA@19.##0#3##.13%UCLA..replicateA
GeneID13DCH..sequenced..CA@19.##0#3##.13%UCLA..replicateB
GeneID14DCH..sequenced..CA@19.##0#3##.14%UCLA..replicateA
~~~
The infomation above is really messy and difficult to undertand. To find the 
information that Charles needs we need to fixed this file and sort the 
information. One really simple and useful tool that can do the job is `sed`.  

## SED

`sed` command in UNIX is stands for stream editor and it 
can perform lot’s of function on file like, searching, find 
and replace, insertion or deletion. Though most common use of 
`sed` command in UNIX is for substitution or for find and replace.  

`sed` use the following order of commands:  
~~~
[c177-t0@login2 ~]$ sed 's/old_word/new_word/' [file-to-edit]
~~~
{:  .language-bash}

Let's create a file and replace information with `sed`  
~~~
[c177-t0@login2 ~]$ echo "To bee, or not to bee" > file_sed.txt
[c177-t0@login2 ~]$ cat file_sed.txt
~~~
{:  .language-bash}

~~~
To bee, or not to bee
~~~

We can replace infromation in the document with `sed`    
~~~
[c177-t0@login2 ~]$ sed 's/bee/be/' file_sed.txt
~~~
{:  .language-bash}

~~~
To be, or not to bee
~~~

Normally, substitutions apply to only the first match in the string.
sed. To apply the substitution to all matches in the string use `g`
options.  
~~~
[c177-t0@login2 ~]$ sed 's/bee/be/g' file_sed.txt
~~~
{:  .language-bash}

~~~
To be, or not to be
~~~

If we look into the file nothing was changed  
~~~
[c177-t0@login2 ~]$ less file_sed.txt
~~~ 
{:  .language-bash}

~~~
To bee, or not to bee
~~~

If you want to change the originall file you do `sed -i`  

~~~
[c177-t0@login2 ~]$ sed -i 's/bee/be/g' file_sed.txt
[c177-t0@login2 ~]$ less file_sed.txt
~~~
{:  .language-bash}

~~~
To be, or not to be
~~~

`sed` is ideal to create and edit tables. Usually we used it to 
replace especial characters with tabs (`\t`).

~~~
[c177-t0@login2 ~]$ echo "1st_column%2nd_column%3rd_column..4th_column" > Table_sed.txt
[c177-t0@login2 ~]$ sed 's/%/\t/g' Table_sed.txt 
~~~
{:  .language-bash}

~~~
1st_column	2nd_column	3rd_column..4th_column
~~~
Notice that `sed` did not separate the 3rd and 4th column. Lest replace `..` with a tab and add this 
new replacment with a pipe.  Remember that The vertical line `|` is 
called a pipe. It connects the command on the left of the pipe with the command on the right. 
This tells the output generated by the command at the left to become the input of the command on the right.  

~~~
[c177-t0@login2 ~]$ sed 's/%/\t/g' Table_sed.txt | sed 's/../\t/g'  
~~~
{:  .language-bash}
~~~

~~~
What happened ??? everything got lost!! To be more precise, everything was replace with tabs. The reason is that 
`.` is a wildcard that indicates any character if you want to replace an actual dot (`.`), you 
write `"\."`  

~~~
[c177-t0@login2 Lab3]$ sed 's/%/\t/g' Table_sed.txt | sed 's/\.\./\t/g'
~~~
{:  .language-bash}

~~~
1st_column	2nd_column	3rd_column	4th_column
~~~

We can also use a combination of other simple commands to sort and chop tables. Create a file with `nano` 
called `Table_sed_sort_chop.txt`. Paste the folling information into the empty buffer provided by `nano`.    

~~~
Ensmebl_ID%Gene_Symbol%Statistic..Pvalue
ENSCAF70%PHLPP1%14.962838..0.000109649
ENSCAF59%CAMK2D%14.77195..0.000121327
ENSCAF31%B4GALT7%14.093764..0.000173919
ENSCAF70%PHLPP1%14.962838..0.000109649
ENSCAF59%CAMK2D%14.77195..0.000121327
ENSCAF31%B4GALT7%14.093764..0.000173919
~~~ 


As you now, the following will format the file to create a tab-delimited table.    
~~~
[c177-t0@login2 ~]$ sed 's/%/\t/g' Table_sed_sort_chop.txt | sed 's/\.\./\t/g'
~~~
{:  .language-bash}

~~~
Ensmebl_ID	Gene_Symbol	Statistic	Pvalue
ENSCAF70	PHLPP1	14.962838	0.000109649
ENSCAF59	CAMK2D	14.77195	0.000121327
ENSCAF31	B4GALT7	14.093764	0.000173919
ENSCAF70	PHLPP1	14.962838	0.000109649
ENSCAF59	CAMK2D	14.77195	0.000121327
ENSCAF31	B4GALT7	14.093764	0.000173919
~~~

Now we can add another command called `sort` to order the table acording to the Pvalues. 
Notice that the table below has been sorted acording to values of the column `Pvalue`.    

~~~
[c177-t0@login2 ~]$ sed 's/%/\t/g' Table_sed_sort_chop.txt | sed 's/\.\./\t/g' | sort -n -k4  
~~~
{:  .language-bash}

~~~
Ensmebl_ID	Gene_Symbol	Statistic	Pvalue
ENSCAF70	PHLPP1	14.962838	0.000109649
ENSCAF70	PHLPP1	14.962838	0.000109649
ENSCAF59	CAMK2D	14.77195	0.000121327
ENSCAF59	CAMK2D	14.77195	0.000121327
ENSCAF31	B4GALT7	14.093764	0.000173919
ENSCAF31	B4GALT7	14.093764	0.000173919
~~~
**Note**: `-n` means that you want to sort numbers and `-k` means that you want to based your 
arrangement on values of the 4th column.  

You can delete duplicated files on your table with `uniq`.  

~~~
[c177-t0@login2 ~]$ sed 's/%/\t/g' Table_sed_sort_chop.txt | sed 's/\.\./\t/g' | sort -n -k4 | uniq
~~~
{:  .language-bash}

~~~
Ensmebl_ID	Gene_Symbol	Statistic	Pvalue
ENSCAF70	PHLPP1	14.962838	0.000109649
ENSCAF59	CAMK2D	14.77195	0.000121327
ENSCAF31	B4GALT7	14.093764	0.000173919
~~~

Finally if you are interested only in hte column with information about genes and their pvalues 
you can ignore other columns with `cut`  

~~~
[c177-t0@login2 ~]$ sed 's/%/\t/g' Table_sed_sort_chop.txt | sed 's/\.\./\t/g' | sort -n -k4  | cut -f 2,4
~~~
{:  .language-bash}
~~~
Gene_Symbol	Pvalue
PHLPP1	0.000109649
CAMK2D	0.000121327
B4GALT7	0.000173919
~~~
 
Now that you have learn about sed you are ready to to the first challenge  

### First challenge  
You will work with the file `All_Genes.txt` that you created at the beginning of the lab. 
The information contained in the file look's something like this: `GeneID10DCH..sequenced..CA@19.##0#3##.10%UCLA..replicateB`.  
In this challenge you will have fixed the information of `All_Genes.txt` and make the file tab-delimited. Then,
you will have to sort the file and delete duplicate fields. Originally, the file had **8 columns** that were tab_delimited with the following infromation:  
- 1st_column: Gene_ID.    
- 2nd_column: Sequencing_status.  
- 3rd_column: State where the sample was sequenced.  
- 4th_column: Year when the sample was sequenced.  
- 5th_column: Month when the sample was sequenced.  
- 6th_column: Day when the sample was sequenced.  
- 7th_column: Institution where the sample was sequenced.  
- 8th_column: Replication_ID.  

Here is the list of steps that you have to do for this challenge:  

1. Change especial symbols `.`, `%`, `..`, `@`, `##` to tabs.
2. Replace `#` with nothing. In other words, delete `#`.      
3. Sort the file acording to values of the 6th column (Day of sequencing).  
3. Save only the 1st and 6th column into a file called `Sort_All_Genes_<your_initials>.txt`. **Delete duplicate genes**.  
**Note**: replace `<your_initials>` with your actual initials of your name.      
4. Look inside the file and answer the following question:  

Charles was working with African wild dog DNA and just realized that the gene he sequenced 
on **March 15** was contaminated with
human DNA. He needs to find out the name of this gene to repeat the DNA extraction and send it again for
sequencing. **What is the gene that Charles need to resequence?***  

5. Add the answer to the file `Sort_All_Genes_<YOUR_NAME>.txt`. Then `cp` the file to 
`classdata/Labs/Lab3/First_challlenge`.  
**Note**: replace `<your_initials>` with your actual initials of your name.  

## AWK  

No I will show you a few of the cool things that the Unix tool `awk` can do with tabular data. 
We will focus on extracting useful information from a transcriptome—because 
bioinformatics is cool—, but AWK can do its wonders with any kind of text file.  

First navigate to you HOME directory and copy the folder `Transcriptomes` 
that is loaced at `~/classdata/Labs/Lab3`. Let’s look at the folder we just copied.    

~~~
[c177-t0@login2 ~]$ ls Transcriptomes
~~~
{:  .language-bash}
~~~
transcriptome0.gtf   transcriptome40.gtf  transcriptome71.gtf
transcriptome10.gtf  transcriptome41.gtf  transcriptome72.gtf
transcriptome11.gtf  transcriptome42.gtf  transcriptome73.gtf
transcriptome12.gtf  transcriptome43.gtf  transcriptome74.gtf
transcriptome13.gtf  transcriptome44.gtf  transcriptome75.gtf
transcriptome14.gtf  transcriptome45.gtf  transcriptome76.gtf
transcriptome15.gtf  transcriptome46.gtf  transcriptome77.gtf
transcriptome16.gtf  transcriptome47.gtf  transcriptome78.gtf
transcriptome17.gtf  transcriptome48.gtf  transcriptome79.gtf
transcriptome18.gtf  transcriptome49.gtf  transcriptome7.gtf
transcriptome19.gtf  transcriptome4.gtf   transcriptome80.gtf
~~~

~~~
[c177-t0@login2 ~]$ less -S transcriptome0.gtf 
~~~
{:  .language-bash}
~~~
##description: evidence-based annotation of the human genome (GRCh37); version 18 (Ense
##provider: GENCODE
##contact: gencode@sanger.ac.uk
##format: gtf
##date: 2013-09-02
chr1,HAVANA,exon,173753,173862,.,-,.%gene_id "ENSG00000241860.2"; transcript_id "ENST00
chr1,HAVANA,transcript,1246986,1250550,.,-,.%gene_id "ENSG00000127054.14"; transcript_i
chr1,HAVANA,CDS,1461841,1461911,.,+,0%gene_id "ENSG00000197785.9"; transcript_id "ENST0
~~~

## Mini-challenge  
The file above contains Gencode’s human transcriptome. It will seem less intimidating 
if we merge the files into a single file that is tab-delimitated. Go ahead and merge all files in order and replace the `,` and `%` 
for tabs. You may want to use `sed`.  
Save the file as `transcriptome<your_initials>.gtf` and cp the file to `classdata/Labs/Lab3/First_challlenge`.    
**Note**:replace ```your_initials``` with your actual initials of your name.    
Remember that to merge files in order you use a wildcard like this ```cat <Some_named>{0..99}*```.    
You should get something like this.   

~~~
[c177-t0@login2 ~]$ less -F transcriptome.gtf
~~~
{:  .language-bash}

~~~
##description: evidence-based annotation of the human genome (GRCh37); version 18 (Ense
##provider: GENCODE
##contact: gencode@sanger.ac.uk
##format: gtf
##date: 2013-09-02
chr1    HAVANA,exon,173753,173862,.,-,. gene_id "ENSG00000241860.2"; transcript_id "ENS
chr1    HAVANA,transcript,1246986,1250550,.,-,. gene_id "ENSG00000127054.14"; transcrip
chr1    HAVANA,CDS,1461841,1461911,.,+,0        gene_id "ENSG00000197785.9"; transcript
~~~

**Imagine you wanted to get the list of all the protein-coding genes 
that only have one exon. How would you do it?**

Rules go between single quotes. Numbers after the dollar sign 
specify a column, so `$3` refers to column 3. The only exception is `$0`
, which specifies the entire line.  

The double equals sign `==` is how computer people write equality, it drives the math people crazy.  

Character strings, like the word `gene`, must be surrounded by double quotes.  
~~~
[c177-t0@login2 ~]$ awk '$3 == "gene"' transcriptome.gtf | head | less -S
~~~
{:  .language-bash}
~~~
chr1    HAVANA  gene    11869   14412   .   +   .   gene_id "ENSG00000223972.4"; transcript_id "ENSG00000223972.4"; gene_type "pseudogene"; gene_status "KNOWN"; gene_name "DDX11L1"; transcript_type "pseudogene"; transcript_status "KNOWN"; transcript_name "DDX11L1"; level 2; havana_gene "OTTHUMG00000000961.2";
chr1    HAVANA  gene    14363   29806   .   -   .   gene_id "ENSG00000227232.4"; transcript_id "ENSG00000227232.4"; gene_type "pseudogene"; gene_status "KNOWN"; gene_name "WASH7P"; transcript_type "pseudogene"; transcript_status "KNOWN"; transcript_name "WASH7P"; level 2; havana_gene "OTTHUMG00000000958.1";
chr1    HAVANA  gene    29554   31109   .   +   .   gene_id "ENSG00000243485.2"; transcript_id "ENSG00000243485.2"; gene_type "lincRNA"; gene_status "NOVEL"; gene_name "MIR1302-11"; transcript_type "lincRNA"; transcript_status "NOVEL"; transcript_name "MIR1302-11"; level 2; havana_gene "OTTHUMG00000000959.2";
chr1    HAVANA  gene    34554   36081   .   -   .   gene_id "ENSG00000237613.2"; transcript_id "ENSG00000237613.2"; gene_type "lincRNA"; gene_status "KNOWN"; gene_name "FAM138A"; transcript_type "lincRNA"; transcript_status "KNOWN"; transcript_name "FAM138A"; level 2; havana_gene "OTTHUMG00000000960.1";
chr1    HAVANA  gene    52473   54936   .   +   .   gene_id "ENSG00000268020.2"; transcript_id "ENSG00000268020.2"; gene_type "pseudogene"; gene_status "KNOWN"; gene_name "OR4G4P"; transcript_type "pseudogene"; transcript_status "KNOWN"; transcript_name "OR4G4P"; level 2; havana_gene "OTTHUMG00000185779.1";
chr1    HAVANA  gene    62948   63887   .   +   .   gene_id "ENSG00000240361.1"; transcript_id "ENSG00000240361.1"; gene_type "pseudogene"; gene_status "KNOWN"; gene_name "OR4G11P"; transcript_type "pseudogene"; transcript_status "KNOWN"; transcript_name "OR4G11P"; level 2; havana_gene "OTTHUMG00000001095.2";
chr1    HAVANA  gene    69091   70008   .   +   .   gene_id "ENSG00000186092.4"; transcript_id "ENSG00000186092.4"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "OR4F5"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "OR4F5"; level 2; havana_gene "OTTHUMG00000001094.1";
chr1    HAVANA  gene    89295   133566  .   -   .   gene_id "ENSG00000238009.2"; transcript_id "ENSG00000238009.2"; gene_type "lincRNA"; gene_status "NOVEL"; gene_name "RP11-34P13.7"; transcript_type "lincRNA"; transcript_status "NOVEL"; transcript_name "RP11-34P13.7"; level 2; havana_gene "OTTHUMG00000001096.2";
chr1    HAVANA  gene    89551   91105   .   -   .   gene_id "ENSG00000239945.1"; transcript_id "ENSG00000239945.1"; gene_type "lincRNA"; gene_status "NOVEL"; gene_name "RP11-34P13.8"; transcript_type "lincRNA"; transcript_status "NOVEL"; transcript_name "RP11-34P13.8"; level 2; havana_gene "OTTHUMG00000001097.2";
chr1    HAVANA  gene    131025  134836  .   +   .   gene_id "ENSG00000233750.3"; transcript_id "ENSG00000233750.3"; gene_type "pseudogene"; gene_status "KNOWN"; gene_name "CICP27"; transcript_type "pseudogene"; transcript_status "KNOWN"; transcript_name "CICP27"; level 1; tag "pseudo_consens"; havana_gene "OTTHUMG00000001257.3";
~~~

Now that we have used column 3 to filter, we 
don’t really care about any of the information 
in columns 1 through 8, so we can get rid of it by only printing column 9.  

~~~
[c177-t0@login2 ~]$ awk '$3 == "gene" { print $9 }' transcriptome.gtf | head | less -S
~~~
{:  .language-bash}

~~~
gene_id
gene_id
gene_id
gene_id
gene_id
gene_id
gene_id
gene_id
gene_id
gene_id
~~~

It worked, sort of. We used the stuff that comes before the braces to select the lines 
that we care about, and the stuff that goes inside the braces `{ }` to tell AWK what we want it to 
do with that line—in this case, `print column 9`, but only gene_id showed up. What happened to the rest?  

### How does `awk` recognize colums ???

By default, AWK uses whitespace as the delimiter between 
columns but there are two types of whitespace: spaces and tabs. 
Look at the following:  

~~~
[c177-t0@login2 ~]$ echo "a b c" | awk '{ print $2 }'
[c177-t0@login2 ~]$ echo "a\tb\tc" | awk '{ print $2 }'
~~~
{:  .language-bash}
Both commands return a b. We are using echo to send AWK a line of text 
(instead of reading from a file), and telling AWK to print the second column. 
In the second example we are separating the columns by tabs (`\t` is the special character for tabs) 
instead of spaces. We can tell AWK to treat spaces and tabs differently by using the -F option 
followed by a space and a character in double quotes.  

Pay close attention to the following examples:  

Separate by commas, returns b  
~~~
[c177-t0@login2 ~]$ echo "a,b,c" | awk -F "," '{ print $2 }'
~~~
{:  .language-bash}

Separate by tabs, returns nothing.    
~~~
[c177-t0@login2 ~]$ echo "a b c" | awk -F "\t" '{ print $2 }'
~~~
{:  .language-bash}
**IMPORTANT**: AWK didn’t return anything back in the example above because it didn’t find any tabs, 
so it only saw one column, which means that there was no second column to print.  

separate by tabs, returns b  
~~~
[c177-t0@login2 ~]$ echo "a\tb\tc" | awk -F "\t" '{ print $2 }'
~~~
{:  .language-bash}

You can go to the manual in the terminal for more information about `awk`    
~~~
[c177-t0@login2 ~]$ man awk
~~~
{:  .language-bash}

This takes you to the manual page on AWK, which behaves in a similar way as less. You can use the arrows to 
move around and you can search for words using the slash `/` followed by whatever you are looking for. 
Type `/-F` and press Enter. The screen will advance to the usage line:  

~~~
Use fs for the input field separator (the value of the FS prede-
              fined variable).
~~~

which contains -F, to move to the next occurrence, press n:

~~~
 -F option is “t”, then FS is set to  the  tab  character.   Note
       that  typing  gawk  -F\t ...  simply causes the shell to quote the “t,”
       and does not pass “\t” to the -F option.
~~~

You can go back to the previous occurrence by pressing `shift n`. Press `q` to leave.

Now that we undestand how to specify the field separator let's go back to the genes.  

~~~
[c177-t0@login2 ~]$ awk -F "\t" '$3 == "gene" { print $9 }' transcriptome.gtf | head | less -S
~~~
{:  .language-bash}

~~~
gene_id "ENSG00000223972.4"; transcript_id "ENSG00000223972.4"; gene_type "pseudogene"; gene_status "KNOWN"; gene_name "DDX11L1"; transcript_type "pseudogene"; transcript_status "KNOWN"; transcript_name "DDX11L1"; level 2; havana_gene "OTTHUMG00000000961.2";
gene_id "ENSG00000227232.4"; transcript_id "ENSG00000227232.4"; gene_type "pseudogene"; gene_status "KNOWN"; gene_name "WASH7P"; transcript_type "pseudogene"; transcript_status "KNOWN"; transcript_name "WASH7P"; level 2; havana_gene "OTTHUMG00000000958.1";
gene_id "ENSG00000243485.2"; transcript_id "ENSG00000243485.2"; gene_type "lincRNA"; gene_status "NOVEL"; gene_name "MIR1302-11"; transcript_type "lincRNA"; transcript_status "NOVEL"; transcript_name "MIR1302-11"; level 2; havana_gene "OTTHUMG00000000959.2";
gene_id "ENSG00000237613.2"; transcript_id "ENSG00000237613.2"; gene_type "lincRNA"; gene_status "KNOWN"; gene_name "FAM138A"; transcript_type "lincRNA"; transcript_status "KNOWN"; transcript_name "FAM138A"; level 2; havana_gene "OTTHUMG00000000960.1";
gene_id "ENSG00000268020.2"; transcript_id "ENSG00000268020.2"; gene_type "pseudogene"; gene_status "KNOWN"; gene_name "OR4G4P"; transcript_type "pseudogene"; transcript_status "KNOWN"; transcript_name "OR4G4P"; level 2; havana_gene "OTTHUMG00000185779.1";
gene_id "ENSG00000240361.1"; transcript_id "ENSG00000240361.1"; gene_type "pseudogene"; gene_status "KNOWN"; gene_name "OR4G11P"; transcript_type "pseudogene"; transcript_status "KNOWN"; transcript_name "OR4G11P"; level 2; havana_gene "OTTHUMG00000001095.2";
gene_id "ENSG00000186092.4"; transcript_id "ENSG00000186092.4"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "OR4F5"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "OR4F5"; level 2; havana_gene "OTTHUMG00000001094.1";
gene_id "ENSG00000238009.2"; transcript_id "ENSG00000238009.2"; gene_type "lincRNA"; gene_status "NOVEL"; gene_name "RP11-34P13.7"; transcript_type "lincRNA"; transcript_status "NOVEL"; transcript_name "RP11-34P13.7"; level 2; havana_gene "OTTHUMG00000001096.2";
gene_id "ENSG00000239945.1"; transcript_id "ENSG00000239945.1"; gene_type "lincRNA"; gene_status "NOVEL"; gene_name "RP11-34P13.8"; transcript_type "lincRNA"; transcript_status "NOVEL"; transcript_name "RP11-34P13.8"; level 2; havana_gene "OTTHUMG00000001097.2";
gene_id "ENSG00000233750.3"; transcript_id "ENSG00000233750.3"; gene_type "pseudogene"; gene_status "KNOWN"; gene_name "CICP27"; transcript_type "pseudogene"; transcript_status "KNOWN"; transcript_name "CICP27"; level 1; tag "pseudo_consens"; havana_gene "OTTHUMG00000001257.3";
~~~

Now we have all the genes, but how do we filter for protein-coding genes?  

You will notice above that diferent features above are now separated by space and a semicolon. Therfore, 
this time we will use a space and a semicolon as the delimiter to define what a column is:  

~~~
[c177-t0@login2 ~]$ awk -F "\t" '$3 == "gene" { print $9 }' transcriptome.gtf | awk -F "; " '{ print $3 }' | head | less -S
~~~
{:  .language-bash}

~~~
gene_type "pseudogene"
gene_type "pseudogene"
gene_type "lincRNA"
gene_type "lincRNA"
gene_type "pseudogene"
gene_type "pseudogene"
gene_type "protein_coding"
gene_type "lincRNA"
gene_type "lincRNA"
gene_type "pseudogene"
~~~

Now that we see what the third column looks like, we can filter for protein-coding genes.  

~~~
[c177-t0@login2 ~]$ awk -F "\t" '$3 == "gene" { print $9 }' transcriptome.gtf | \
awk -F "; " '$3 == "gene_type \"protein_coding\""' | \
head | less -S
~~~
{:  .language-bash}

~~~
gene_id "ENSG00000186092.4"; transcript_id "ENSG00000186092.4"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "OR4F5"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "OR4F5"; level 2; havana_gene "OTTHUMG00000001094.1";
gene_id "ENSG00000237683.5"; transcript_id "ENSG00000237683.5"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "AL627309.1"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "AL627309.1"; level 3;
gene_id "ENSG00000235249.1"; transcript_id "ENSG00000235249.1"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "OR4F29"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "OR4F29"; level 2; havana_gene "OTTHUMG00000002860.1";
gene_id "ENSG00000185097.2"; transcript_id "ENSG00000185097.2"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "OR4F16"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "OR4F16"; level 2; havana_gene "OTTHUMG00000002581.1";
gene_id "ENSG00000269831.1"; transcript_id "ENSG00000269831.1"; gene_type "protein_coding"; gene_status "NOVEL"; gene_name "AL669831.1"; transcript_type "protein_coding"; transcript_status "NOVEL"; transcript_name "AL669831.1"; level 3;
gene_id "ENSG00000269308.1"; transcript_id "ENSG00000269308.1"; gene_type "protein_coding"; gene_status "NOVEL"; gene_name "AL645608.2"; transcript_type "protein_coding"; transcript_status "NOVEL"; transcript_name "AL645608.2"; level 3;
gene_id "ENSG00000187634.6"; transcript_id "ENSG00000187634.6"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "SAMD11"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "SAMD11"; level 2; havana_gene "OTTHUMG00000040719.8";
gene_id "ENSG00000268179.1"; transcript_id "ENSG00000268179.1"; gene_type "protein_coding"; gene_status "NOVEL"; gene_name "AL645608.1"; transcript_type "protein_coding"; transcript_status "NOVEL"; transcript_name "AL645608.1"; level 3;
gene_id "ENSG00000188976.6"; transcript_id "ENSG00000188976.6"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "NOC2L"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "NOC2L"; level 2; havana_gene "OTTHUMG00000040720.1";
gene_id "ENSG00000187961.9"; transcript_id "ENSG00000187961.9"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "KLHL17"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "KLHL17"; level 2; havana_gene "OTTHUMG00000040721.6";
~~~

I added a space and a backslash \ (not to be confused with the regular slash /) after the first and second pipes to split the code into two lines; this makes it easier to read and it highlights that we are taking two separate steps.  

The double quotes around protein_coding are escaped (also with a backslash \") because they are already contained inside double quotes. To avoid the backslashing drama we can use the partial matching operator ~ instead of the total equality operator ==.  

~~~
[c177-t0@login2 ~]$ awk -F "\t" '$3 == "gene" { print $9 }' transcriptome.gtf | \
awk -F "; " '$3 ~ "protein_coding"' | \
head | less -S
~~~
{:  .language-bash}

The output is the same as before: those lines that contain 
a protein_coding somewhere in their third column make 
the partial matching rule true, and they get printed 
(which is the default behavior when there are no curly braces).  

Now we have all the protein-coding genes, but how do we get 
to the genes that only have one exon? 
Well, we have to revisit our initial AWK call: 
we selected lines that corresponded to genes, 
but we actually want lines that correspond to exons. 
That’s an easy fix, we just change the word “gene” 
for the word “exon”. Everything else stays the same.  

~~~
[c177-t0@login2 ~]$ awk -F "\t" '$3 == "exon" { print $9 }' transcriptome.gtf | \
awk -F "; " '$3 ~ "protein_coding"' | \
head | less -S
~~~
{:  .language-bash}

~~~
gene_id "ENSG00000186092.4"; transcript_id "ENST00000335137.3"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "OR4F5"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "OR4F5-001"; exon_number 1;  exon_id "ENSE00002319515.1";  level 2; tag "basic"; tag "CCDS"; ccdsid "CCDS30547.1"; havana_gene "OTTHUMG00000001094.1"; havana_transcript "OTTHUMT00000003223.1";
gene_id "ENSG00000237683.5"; transcript_id "ENST00000423372.3"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "AL627309.1"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "AL627309.1-201"; exon_number 1;  exon_id "ENSE00002221580.1";  level 3; tag "basic";
gene_id "ENSG00000237683.5"; transcript_id "ENST00000423372.3"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "AL627309.1"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "AL627309.1-201"; exon_number 2;  exon_id "ENSE00002314092.1";  level 3; tag "basic";
gene_id "ENSG00000235249.1"; transcript_id "ENST00000426406.1"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "OR4F29"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "OR4F29-001"; exon_number 1;  exon_id "ENSE00002316283.1";  level 2; tag "basic"; tag "CCDS"; ccdsid "CCDS41220.1"; havana_gene "OTTHUMG00000002860.1"; havana_transcript "OTTHUMT00000007999.1";
gene_id "ENSG00000185097.2"; transcript_id "ENST00000332831.2"; gene_type "protein_coding"; gene_status "KNOWN"; gene_name "OR4F16"; transcript_type "protein_coding"; transcript_status "KNOWN"; transcript_name "OR4F16-001"; exon_number 1;  exon_id "ENSE00002324228.1";  level 2; tag "basic"; tag "CCDS"; ccdsid "CCDS41221.1"; havana_gene "OTTHUMG00000002581.1"; havana_transcript "OTTHUMT00000007334.1";
gene_id "ENSG00000269831.1"; transcript_id "ENST00000599533.1"; gene_type "protein_coding"; gene_status "NOVEL"; gene_name "AL669831.1"; transcript_type "protein_coding"; transcript_status "NOVEL"; transcript_name "AL669831.1-201"; exon_number 1;  exon_id "ENSE00003063549.1";  level 3; tag "basic";
gene_id "ENSG00000269831.1"; transcript_id "ENST00000599533.1"; gene_type "protein_coding"; gene_status "NOVEL"; gene_name "AL669831.1"; transcript_type "protein_coding"; transcript_status "NOVEL"; transcript_name "AL669831.1-201"; exon_number 2;  exon_id "ENSE00003084653.1";  level 3; tag "basic";
gene_id "ENSG00000269831.1"; transcript_id "ENST00000599533.1"; gene_type "protein_coding"; gene_status "NOVEL"; gene_name "AL669831.1"; transcript_type "protein_coding"; transcript_status "NOVEL"; transcript_name "AL669831.1-201"; exon_number 3;  exon_id "ENSE00003138540.1";  level 3; tag "basic";
gene_id "ENSG00000269308.1"; transcript_id "ENST00000594233.1"; gene_type "protein_coding"; gene_status "NOVEL"; gene_name "AL645608.2"; transcript_type "protein_coding"; transcript_status "NOVEL"; transcript_name "AL645608.2-201"; exon_number 1;  exon_id "ENSE00003079649.1";  level 3; tag "basic";
gene_id "ENSG00000269308.1"; transcript_id "ENST00000594233.1"; gene_type "protein_coding"; gene_status "NOVEL"; gene_name "AL645608.2"; transcript_type "protein_coding"; transcript_status "NOVEL"; transcript_name "AL645608.2-201"; exon_number 2;  exon_id "ENSE00003048391.1";  level 3; tag "basic";
~~~


What if we only want to get the gene names (which are in column 5).  

~~~
[c177-t0@login2 ~]$ awk -F "\t" '$3 == "exon" { print $9 }' transcriptome.gtf | \
awk -F "; " '$3 ~ "protein_coding" {print $5}' | \
head
~~~
{:  .language-bash}

~~~
gene_name "OR4F5"
gene_name "AL627309.1"
gene_name "AL627309.1"
gene_name "OR4F29"
gene_name "OR4F16"
gene_name "AL669831.1"
gene_name "AL669831.1"
gene_name "AL669831.1"
gene_name "AL645608.2"
gene_name "AL645608.2"
~~~

This is sort of what we want. But we delete the gene_name, the space and double quotes?  
We can use tr -d command, which deletes whatever characters appear in double quotes. For example, to remove every vowel 
from a sentence:  

~~~
[c177-t0@login2 ~]$ echo "This unix thing is cool" | tr -d "aeiou" 
Ths nx thng s cl
~~~
{:  .language-bash}
Let’s try deleting all the semicolons and quotes before the second AWK call:

~~~
[c177-t0@login2 ~]$awk -F "\t" '$3 == "exon" { print $9 }' transcriptome.gtf | \
tr -d ";\"" | \
awk -F " " '$6 == "protein_coding" {print $10}' | \
head
~~~
{:  .language-bash}

~~~
OR4F5
AL627309.1
AL627309.1
OR4F29
OR4F16
AL669831.1
AL669831.1
AL669831.1
AL645608.2
AL645608.2
~~~

Run `awk -F "\t" '$3 == "exon" { print $9 }' transcriptome.gtf | tr -d ";\"" | head` to understand what the input to the second AWK call looks like. 
It’s just words separated by spaces; the sixth word 
corresponds to the gene type, and the tenth word to the gene name.  

### Now lets count genes  

There is one more concept we need to introduce before we start counting. 
AWK uses a special rule called END, which is only true once the input is over. See an example:  

~~~
[c177-t0@login2 ~]$ echo -e "a\na\nb\nb\nb\nc" | \
awk '
    { print $1 }

END { print "Done with letters!" }
'

a
a
b
b
b
c
Done with letters!
~~~
{:  .language-bash}
The `-e` option tells echo to convert each `\n` into a new line, which is a convenient 
way of printing multiple lines from a single character string.  

In `awk`, any amount of whitespace is allowed between the initial and the final quote 
`'`. I separated the first rule from the `END` rule to make them easier to read.  

Now we are ready for counting.  

~~~
[c177-t0@login2 ~]$ echo -e "a\na\nb\nb\nb\nc" | \
awk '
    { counter[$1] += 1 }

END {
    for (letter in counter){
        print letter, counter[letter]
    }
}
'

a 2
b 3
c 1
~~~
{:  .language-bash}
Instead of printing each letter, we manipulate a variable that we 
called counter. This variable is special because it is followed by 
brackets `[ ]`, which makes it an associative array, 
a fancy way of calling a variable that stores key-value pairs.  

In this case we chose the values of the first column `$1` to 
be the keys of the counter variable, which means there 
are 3 keys (“a”, “b” and “c”). The values are initialized to `0`. 
For every line in the input, we add a `1` to the value in the array whose 
key is equal to `$1`. We use the addition operator `+=`, a shortcut for 
`counter[$1] = counter[$1] + 1`.  

When all the lines are read, the `END` rule becomes true, and the code between the 
curly braces `{ }` is executed. The structure `for (key in associate_array) { some_code }` is called a for 
loop, and it executes `some_code` as many times as there are keys in the array. 
letter is the name that we chose for the variable that cycles through 
all the keys in counter, and `counter[letter]` gives the value stored 
in counter for each letter (which we we calculated in the previous curly brace chunk).  

Now we can apply this to the real example:  

~~~
awk -F "\t" '$3 == "exon" { print $9 }' transcriptome.gtf | \
tr -d ";\"" | \
awk -F " " '
$6 == "protein_coding" {
    gene_counter[$10] += 1
}

END {
    for (gene_name in gene_counter){
        print gene_name, gene_counter[gene_name]
    }
}' > number_of_exons_by_gene.txt

head number_of_exons_by_gene.txt
~~~
{:  .language-bash}
~~~
AC090427.1 8
BMP1 480
BMP2 6
ELANE 22
NKX2-8 4
RP1-139D8.6 4
BMP3 6
ASPM 78
BMP4 52
EDARADD 20
~~~

In real life it takes less than a minute to count up one million exons. Pretty impressive.  

We saved the output to a file, so now we can use AWK to see how many genes are made up of a single exon.  

~~~
[c177-t0@login2 ~]$ awk '$2 == 1' number_of_exons_by_gene.txt | wc -l # 167
~~~
{:  .language-bash}

## BONUS Challenge

Copy the file `Example.bed` from `~/classdata/Labs/Lab3/Second_challenge`. This is a BED file with **31,558 lines** !!! Good luck trying excel. A BED file (.bed) is a tab-delimited text file that defines a feature track. It can have any file extension, but .bed is recommended. 
In this challenge you will manipulate this file to obtain relevant iformation. 

This file has the following information:  
~~~
[c177-t0@login2 ~]$ less -F Example.bed
~~~
{:  .language-bash}

~~~
chr01   254628  ENSCAFT00000000001      ENPP1
chr01   256329  ENSCAFT00000000001      ENPP1
chr01   257242  ENSCAFT00000000001      ENPP1
chr01   261963  ENSCAFT00000000001      ENPP1
chr01   263678  ENSCAFT00000000001      ENPP1
chr01   265629  ENSCAFT00000000001      ENPP1
chr01   266628  ENSCAFT00000000001      ENPP1
chr01   268338  ENSCAFT00000000001      ENPP1
chr01   269135  ENSCAFT00000000001      ENPP1
~~~

- The 1st_column: what chromosome the genes is located.  
- The 2nd column: the postion of the gene in the chromosome.    
- The 3rd column: the unique ID of the transcripts; A single gene can 
produce multiple different transcripts depending on what exons were used.  
- The 4th column: the name of the gene.  

For the second challenge you must do the following:  

1. Create a new file containing chromosomes (1st_column), name of genes (2nd_column) and 
transcript (3rd column). Save the file with the name `Only_genes_<your_initials>.txt` 
at the location  `classdata/Labs/Lab3/Second_challenge`.  There should **NOT BE** duplicated names.  
**Note**:replace `<your_initials>` with your actual name.  
2. What is the number of transcripts for the gene 'FGFR3'.  
3. Number of genes present in chr01.  
4. Include the answer at the top of the file `Only_genes_<YOURNAME>.txt`.



This manual is based on orignal work made by DAniel Chavez. The example about sed were based on this [site1](https://github.com/QCB-Collaboratory/W1.UNIX.command.line). Information
about AWK was based on this [site2](http://reasoniamhere.com/2013/09/17/awk-gtf-how-to-analyze-a-transcriptome-like-a-pro-part-2/).  
