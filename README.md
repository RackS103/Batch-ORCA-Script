# Batch ORCA Script, by Rac Mukkamala

## Description
A Bash script to submit batch jobs to the ab initio ORCA software. Automatically checks for syntax errors in input files and ORCA runtime crashes. Organizes ORCA files into individual directories. Created by Rac Mukkamala

## Details


## Params


## Running the script
1. Set up the file structure outlined above
2. Provide execution privileges to the script by typing the command `chmod +x orcabatch.sh`
3. **Recommended: If running using nohup:** It is recommended that you run the script using nohup as follows:
  `nohup bash orcabatch.sh [directory with input files] > [log.out] &`
4. **For conventional use**: The script can also be run without nohup as follows. The only caveat is that all the script's messages will be sent to stdout and may be lost:
  `./orcabatch.sh [directory with input files] &`

## Citation
**Please acknowledge use of this script in any paper/report as follows:**

"Mukkamala, R (2020) Batch ORCA Script (Version 1.0) [Source code].https://github.com/RackS103/Batch-ORCA-Script"
