#!/bin/bash
echo 'Batch Orca Runner, Rac Mukkamala'
echo $'Please acknowledge use of this script as follows:\n'
echo 'Mukkamala, R (2020) Batch ORCA Script (Version 1.0) [Source code].'
echo 'https://github.com/RackS103/Batch-ORCA-Script'
echo $'\nStarting batch job....\n'
cd $1
Errors=[]

orca_path=$(cat batch_orca_params.txt | head -1 | sed 's/PATH: //')
inp_header=$(cat batch_orca_params.txt | head -2 | tail -1 | sed 's/HEADER: //')

for input in *.inp
do
  filename=$(echo $input | sed 's/\.inp//')
  
  if grep -q "$inp_header" "$filename.inp";
  then
    mkdir "$filename"
    mv "$filename.inp" $filename
    echo "$filename: Correct input parameters, Starting ORCA..."
    "$orca_path" "$filename/$filename.inp" > "$filename/$filename.output" &
    process_id=$!
    wait $process_id

    if grep -q 'ORCA TERMINATED NORMALLY' "$filename/$filename.output";
    then
      echo "$filename: Success! ORCA terminated normally!"
    else
      echo "$filename: ERROR! ORCA had an runtime issue."
      Errors+="$filename"
    fi
    
  else
    echo "$filename: ERROR! Incorrect ORCA input file parameters."
    echo "The proper input header is $inp_header"
    Errors+="$filename"
  fi
  echo $'Moving on to the next file...\n'
done

echo 'Batch ORCA job finished'
echo 'The following files had errors:'
echo ${Errors[*]}
