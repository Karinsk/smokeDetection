clc;clear;close all;

MP4FileList= dir('**/*.mp4');
MP4Files = extractfield(MP4FileList,'name');

frameJump=10;
for ii=1:size(MP4Files,2)
    
    currentFile= char(MP4Files(ii));
    filePath=strcat(pwd,'\',currentFile);
    vid=VideoReader(filePath);
    numFrames = vid.NumberOfFrames;
    dirName=currentFile(1:length(currentFile)-4);
    if(7==exist(dirName,'dir'))
        continue;
    end
    
    directoryPath=filePath(1:length(filePath)-4);
    mkdir(directoryPath)
    imageName=strcat(dirName,'_','%06d.jpg');
    
    for iFrame = 1:floor(numFrames/frameJump)
        frames = read(vid, 1+frameJump*(iFrame-1));
        imwrite(frames, fullfile(directoryPath, sprintf(imageName, iFrame)));
  
    end 
end