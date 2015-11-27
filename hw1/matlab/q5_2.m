function [H2to1_q52,panoImg_q52]= q5_2(im1,im2,pts);
p1 = pts(1:2,:);
p2 = pts(3:4,:);

H2to1_q52 = computeH(p1,p2);

rightUp = [1608;1;1];
rightDown = [1608;1068;1];

rightUp_w   = H2to1_q52*rightUp;
rightDown_w = H2to1_q52*rightDown;

%make z = 1
rightUp_w(1,1) = rightUp_w(1,1)/rightUp_w(3,1);
rightUp_w(2,1) = rightUp_w(2,1)/rightUp_w(3,1);

rightDown_w(1,1) = rightDown_w(1,1)/rightDown_w(3,1);
rightDown_w(2,1) = rightDown_w(2,1)/rightDown_w(3,1);

len = ceil(rightDown_w(2,1) - rightUp_w(2,1));
width = ceil(rightDown_w(1,1) - 1); 
out_size(2)=1280;
out_size(1) = ceil(out_size(2)*len/width);
% alfa  = out_size(2)/(size(im2,2));
% beita = out_size(1)/(size(im2,1));
ty = ceil(rightDown_w(2,1)-1068);
alfa = 1280 /width;

%ponit_2 = warpH(ponit, H2to1,out_size,0);


M = [alfa 0 0; 0 alfa ty; 0 0 1];
%M = [0.5 0 0;0 0.5 200;0 0 1];
%M = [0.5 0 0;0 0.5 ty;0 0 1];
out_size = [out_size(1),out_size(2)];

im1to1_1  =  warpH(im1,M,out_size,0);
out = warpH(im2, M*H2to1_q52,out_size,0);

% warp_im1=warpH(im1, M, out_size);
% warp_im2=warpH(im2, M*H2to1, out_size);
out_size(3) = 3;


for k = 1:out_size(3)
   for j = 1:out_size(2)
       for i = 1:out_size(1)
           if(im1to1_1(i,j,k)==0)
               im1to1_1(i,j,k)=out(i,j,k);
           end
       end
   end
end  
imwrite(im1to1_1,'q5_2_pan.jpg');

panoImg_q52 = im1to1_1;
