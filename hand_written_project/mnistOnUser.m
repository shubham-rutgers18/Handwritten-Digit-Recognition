function[r] = mnistOnUser(processed_image)

train_set = loadMNISTImages('train-images.idx3-ubyte')';
train_label = loadMNISTLabels('train-labels.idx1-ubyte');

% cliassify the user input
train_scale = size(train_set);
input_image = processed_image;
test_point=input_image(:).';
dist = zeros(train_scale(1),1);
for j=1:train_scale(1)
        %calculate the distance between test point i and train point j
    train_point = train_set(j, :);
    tmp = test_point - train_point;
    dist(j) = sqrt(sum(tmp.*tmp));
end
    
% find the 3-nearest neighbor 
dist_tmp = sort(dist);
num = zeros(10, 1);
for k=1:3
    idx = find(dist==dist_tmp(k));
    num(train_label(idx)+1) = num(train_label(idx)+1)+1;
end
    
    % classification
 maxIdx = 0;
 maxNum = -1;
 for k=1:10
   if(num(k)>maxNum)
      maxIdx = k;
      maxNum = num(k);
   end
 end 
 r = maxIdx-1;
end
