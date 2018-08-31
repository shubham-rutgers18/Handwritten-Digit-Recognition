function [fGray, fBinary, fCrop, fResize] = loadUserImage(filename)

f=filename;
fGray=rgb2gray(f);
fBinary=imbinarize(fGray);
[r,c]=size(fBinary);

left=0;
right=c;
top=0;
bottom=r;

for i=1:c
    for j=1:r
        if fBinary(j,i)==0
            left=i;  
        end
    end
    if left>0
        break;
    end
end
for i=1:r
    for j=1:c
        if fBinary(i,j)==0
            top=i;
            break;
        end
    end
    if top>0
        break;
    end
end
for i=1:c
    for j=1:r
        if fBinary(r+1-j,c+1-i)==0
            right=c+1-i;
            break;
        end
    end
    if right<c
        break;
    end
end
for i=1:r
    for j=1:c
        if fBinary(r+1-i,c+1-j)==0
            bottom=r+1-i;
            break;
        end
    end
    if bottom<r
        break;
    end
end
width=right-left;
height=bottom-top;
left=left-c*0.03;
top=top-r*0.03;
width=width+c*0.06;
height=height+c*0.06;
if width>height
    top=top+0.5*height-0.5*width;
    height=width;
end
if height>width
    left=left+0.5*width-0.5*height;
    width=height;
end
fCrop=imcrop(fBinary,[left,top,width,height]);
fResize=imresize(fCrop,[28,28]);
for i=1:28
    for j=1:28
        fResize(i,j)=1-fResize(i,j);
    end
end

end



    
        
    