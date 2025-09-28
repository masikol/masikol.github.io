#!/usr/bin/env bash

set -eu

input_file='/home/masikol/cager/repos/masikol.github.io/dropbox_zenodo_links.tsv'
search_dir='/home/masikol/cager/repos/masikol.github.io/archive'

csvtk del-header -tT "${input_file}" \
    | while read -r release_num type dropbox_link zenodo_link; do
    echo "${release_num}"

    if [[ -z $(rg -F "${dropbox_link}" "${search_dir}") ]]; then
        echo -e "${release_num}\t${type}\t${dropbox_link}\t${zenodo_link}\n"
    fi

    wget --spider "${zenodo_link}"

done

