#!/bin/bash
printf 'current directory: %s\n' "${PWD##*/}"
printf 'Path to the file for which the checksum will be generated md5:'
read FILE
#!/bin/bash
printf 'current directory: %s\n' "${PWD##*/}"
printf 'Path to the file for which the checksum will be generated md5:'
read FILE
if [[ -f "$FILE" ]]; then
    MD5=($(md5sum ${FILE})) || ( echo "an error occurred, exit" && exit 1)
    printf 'Path to the file to save md5:'
    read FILE2
    if [[ -s "$FILE2" ]]
        then
            echo "The file contains information, overwrite? y/n"
            read answ
            if [ "$answ" = "y" ]
                then
                    printf "$MD5" > "$FILE2"
                    echo "successfully"
                    exit 1
            fi
            if [ "$answ" = "n" ]
                then
                    echo "canceled "
                    exit 1
            fi
        else
            ((touch "$FILE2") && (printf "$MD5" > "$FILE2") && (echo "successfully")) || (echo "an error occurred, exit" && exit 1)
    fi
else
    echo "$FILE not found"
    exit 1
fi