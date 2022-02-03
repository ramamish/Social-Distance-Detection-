clc
clear all
clf;
videoReader= vision.VideoFileReader('C:\social distance detector\vtest.avi');
videoPlayer= vision.VideoPlayer('Position',[300 100 1000 500]);
detector = peopleDetectorACF('caltech-50X21');
% writerObj =VideoWriter('Newvision.avi');
% writerObj.FrameRate = 8;
% open(writerObj);

while ~isDone(videoReader)
    frame = step(videoReader);
    I=double(frame);
    [bboxes,scores]= detect(detector,I);
    
    cond=zeros(size(bboxes,1),1);
    
    if ~isempty(bboxes)
        for i=1:(size(bboxes,1)-1)
            for j=(i+1):(size(bboxes,1)-1)
                dis1_v = abs(bboxes(i,1)+ bboxes(i,3)-bboxes(j,1));
                dis2_v = abs(bboxes(j,1)+ bboxes(j,3)-bboxes(i,1));
                dis1_h= abs(bboxes(i,2) - bboxes(j,2));
                dis2_h= abs(bboxes(i,2)+bboxes(i,4)- bboxes(j,2)-bboxes(j,4)); 
                if((dis1_v<75 || dis2_v<75) && (dis1_h<50 || dis2_h<50))
                    cond(i)=cond(i)+1;
                    cond(j)=cond(j)+1;
                else
                    cond(i)=cond(i)+0;
                end
            end
        end
    end
      
                
 I= insertObjectAnnotation(I,'rectangle',bboxes((cond>0),:),'danger','color','r');
 I= insertObjectAnnotation(I,'rectangle',bboxes((cond==0),:),'safe','color','g');
   
    step(videoPlayer,I);
    frame=im2frame(I);
%     writeVideo(writerObj,frame);
end 

release(videoReader);
release(videoPlayer);
%close(writerObj);
