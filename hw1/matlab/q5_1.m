

function [H2to1_q51,warped_q51,panoImg_q51]= q5_1(im1,im2,pts)
p1 = pts(1:2,:);
p2 = pts(3:4,:);
H2to1_q51 = computeH(p1,p2);
save('q5_1.mat','H2to1_q51');
p2(3,:)= 1;
p2_w = H2to1_q51*p2;
save('q5_1_warpedFeatures.mat','p2_w');

for i = 1:1048
    p2_w(1,i) = p2_w(1,i)/p2_w(3,i);
    p2_w(2,i) = p2_w(2,i)/p2_w(3,i);
end

temp = 0;
for j = 1:1048
    distance =( p1(1,j)-p2_w(1,j) )^2+ ( p1(2,j)-p2_w(2,j) )^2;
    temp = temp+distance;
end
   average = temp / 1048 ;
    
   RMS  =   sqrt(average);


out_size = [size(im1,1),3000];
warped_q51 = warpH(im2, H2to1_q51,out_size,0);
imwrite(warped_q51,'q5_1.jpg');

out_size(3) = 3;

%Use unit martix I to enlarge the im1 to out_size
I  = [1 0 0 ;0 1 0; 0 0 1];
panoImg_q51 = warpH(im1,I,out_size,0);
%imshow(im1to1);
%we have to use im1 to become the original picture ,and use im2' points to
%fill the black points 
for k = 1:out_size(3)
   for j = 1:out_size(2)
       for i = 1:out_size(1)
           if(panoImg_q51(i,j,k)==0)
               panoImg_q51(i,j,k)=warped_q51(i,j,k);
           end
       end
   end
end
imwrite(panoImg_q51,'q5_1_pan.jpg');

   




