clear
im = imread('1.PNG');
im = im2bw(im,0.9);

% result = cut_element_vertical(imbinary);

% for i = 1:size(result,2);
%     figure(i);
%     imshow(result{i});
% end
image{1} = im;
[result, coordinate] = rough_cut(image, [1 1]);

% sum_col = sum(imbinary, 1);
% sum_row = sum(imbinary, 2);
% 
% indices_col = find(sum_col ~= size(imbinary,1));
% indices_row = find(sum_row ~= size(imbinary,2));
% 
% 
% im = imbinary(indices_row(1):indices_row(size(indices_row,1)), indices_col(1):indices_col(size(indices_col,2)));
% i = 1;
% while 1
%     [result, im, whetherFinish] = cut_element_vertical(im);
%     vertical_element{i} = result;
%     figure(i)
%     imshow(vertical_element{i});
%     if whetherFinish
%         break;
%     end
%     i = i+1;
% end



