#!/usr/bin/env bash

input_file='/home/masikol/cager/repos/masikol.github.io/dropbox_zenodo_links.tsv'
search_dir='/home/masikol/cager/repos/masikol.github.io/ttt'

csvtk del-header -tT "${input_file}" \
    | while read -r release_num type dropbox_link zenodo_link; do
    echo "${release_num}"

    if [[ -n $(rg -F "${dropbox_link}" "${search_dir}") ]]; then
        bash /home/masikol/Dropbox/scripts/grep_sed_replace.sh \
            "${dropbox_link}" \
            "${zenodo_link}" \
            "${search_dir}"
    else
        echo 'Error!'
        echo -e "${release_num}\t${type}\t${dropbox_link}\t${zenodo_link}\n"
        exit 1
    fi

done

