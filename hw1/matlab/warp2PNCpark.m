% Wei Feng
% Q 4.2
% 2015
function [img_yourname_warped, img_PNCpark_yourname] = warp2PNCpark(img_PNCpark, img_yourname, p1, p2)

H2to1 = computeH(p1,p2) % ... your code here ...
% ... your code here ...
out_size  = size(img_PNCpark);

img_yourname_warped = warpH(img_yourname, H2to1,out_size,0);% ... your code here ...
 
out = img_yourname_warped;
% ... your code here ...
for i = 1:out_size(3)
   for j = 1:out_size(2)
       for k = 1:out_size(1)
           if(out(k,j,i)==0)
               out(k,j,i)= img_PNCpark(k,j,i);
           end
       end
   end
end

img_PNCpark_yourname = out;% ... your code here ...
