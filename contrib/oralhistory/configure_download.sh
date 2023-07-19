#!/bin/bash
(return 0 2>/dev/null) && sourced=1 || sourced=0
if [ $sourced -eq 0 ]; then
    echo "this script should not be run directly but through configure.sh in the kaldi_nl root directory">&2
fi

if [ ! -e models/Lang_OH ]; then
    wget https://cdn-146.anonfiles.com/x8ufQ920zd/e12b3a4f-1689755630/oral_history_models.tar.gz || fatalerror "Unable to download oral history models from source!"

    rm oral_history_models.tar.gz

    #correct absolute paths
    find -name "*.conf" | xargs sed -i "s|/vol/customopt/kaldi/egs/Kaldi_NL/Models|$modelpack|g"
    find -name "*.conf" | xargs sed -i "s|/vol/customopt/kaldi/egs/Kaldi_NL|$root|g" #probably redundant
fi
