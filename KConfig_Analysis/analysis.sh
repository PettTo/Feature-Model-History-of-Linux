#!/bin/bash

#### initiate variables
analysisRoot="../../Evaluation/KConfig_Analysis/"
interFile="../../Evaluation/KConfig_Analysis/interFile.txt"
shaFile="../../Evaluation/KConfig_Analysis/shas.txt"
kconfigReaderRun="../Tools/kconfigreader/run.sh"
dumpConf="../Tools/kconfigreader/binary_4.15/dumpconf"
archKConfig="arch/x86/Kconfig"

sha415="d8a5b80568a9cb66810e75b182018e9edb68e8ff"

#### get the commit sha's from relevant commits
echo "######## reade commits from git log ########"
git reset --hard
git clean -fxd
git checkout $sha415
git log arch/x86/Kconfig > $interFile


echo "######## create sha file ########"
> $shaFile
while IFS='' read -r line || [[ -n "$line" ]]; do
   if [[ $line == commit* ]]
		then 
		split=$(echo $line | tr " " "\n")
		for str in $split
		do
			if ! [[ $str == commit* ]]
			then
				echo $str >> $shaFile
			fi
		done
   fi   
done < "$interFile"
echo "######## sha creation finished ########"

##### analyse all relevant revisions 
echo "######## start analysis ########"
while IFS='' read -r sha || [[ -n "$sha" ]]; do
	echo "### Analyse revsion: $sha ###"
	git reset --hard
	git clean -fxd
	git checkout $sha
	mkdir -p $analysisRoot/$sha
	$kconfigReaderRun de.fosd.typechef.kconfig.KConfigReader --dumpconf $dumpConf --writeDimacs $archKConfig $analysisRoot/$sha/out
done < "$shaFile"
echo "######## analysis finished ########"

# clean up
echo "######## clean up the git ########"
git reset --hard
git clean -fxd
git checkout $sha415

