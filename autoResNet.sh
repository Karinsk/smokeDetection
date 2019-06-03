#!/bin/bash

arch=resnet18
batchSize=(512 256 128 64 32 16 8 4 2 1)
epochs=180
LENGTH=0
mainFolder=/home/pavelnisanov/Downloads/smokeDetection/autoResNetResults/BatchTest/resnet18
lr=0.1

while [ $LENGTH -lt  ${#batchSize[@]} ]; do

	currDate=`date +"%H%M_%d%m%y"`
	folderName="$arch"_epochs_"$epochs"_batchSize_"${batchSize[$LENGTH]}"_"$currDate"
	folderPath=$mainFolder/$folderName

	mkdir $folderPath		
	cd $folderPath

	#debug output
	echo folder path $folderPath
	echo current batch ${batchSize[$LENGTH]}
	echo 
	python /home/pavelnisanov/Downloads/smokeDetection/binaryImageClassifier.py -b ${batchSize[$LENGTH]} --lr $lr --arch $arch --epochs $epochs  /home/pavelnisanov/resizedSmokeDetection> "$arch"_b_"${batchSize[$LENGTH]}"_lr_"$lr".txt	
	let LENGTH=LENGTH+1
done

