# Batch ORCA Script, by Rac Mukkamala

## Description
A Bash script to submit batch jobs and batch OpenMPI jobs to the ab initio ORCA software. Automatically checks for syntax errors in input files, and can also identify ORCA runtime crashes. Provides a list of failed ORCA jobs at the end for easy troubleshooting. Organizes ORCA files into individual directories. Created by Rac Mukkamala

## Params
The `batch_orca_params.txt` file specifies the full path to ORCA as well as the preferred ORCA input header for input file syntax checking. The format of this params file is shown below:
```
PATH: /bin/the/path/to/orca
HEADER: ! B3LYP OPT def2-SVP NormalPrint Grid4 *NormalSCF PAL4
```
- If your ORCA is added to the `$PATH` environment variable and if you are not using OpenMPI, then for the `PATH: ` row in `batch_orca_params` you can just write `orca`. Otherwise, make sure you write out the full path to ORCA. OpenMPI will only run if you write out the full ORCA path! 
- Enter the entire desired ORCA header into the `HEADER: ` row. If you are running a geometry optimization with DFT, B3LYP functional, and OpenMPI parallel processing, you can just copypaste the example header into the `batch_orca_params.txt` file.
- Do not change the file name for the `batch_orca_params.txt` file! Additionally, make sure that the `batch_orca_params.txt` is at the same directory level as the bash script.

## Recommended File Structure
```
[root directory]
      orcabatch.sh
      batch_orca_params.txt
      [input file directory]
          file1.inp
          file2.inp
          file3.inp
          [...].inp
```

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
