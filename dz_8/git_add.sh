#!/bin/bash
now=$(date +'%m-%d-%Y-%s')
echo $now
git config --global user.name "MichelDir"
git config --global user.email "mcherepahin@gmail.com"
cd /tmp/checkout/target
git init
git add *.war
git commit -m "bild $now"
git push --set-upstream https://micheldir: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@github.com/MichelDir/prod.git
rm -rf /tmp/checkout
