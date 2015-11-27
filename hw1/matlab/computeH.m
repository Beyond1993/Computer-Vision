% YOUR NAME HERE
% Q 4.1
% 2015

function H2to1 = computeH(p1, p2)

N = size(p1, 2); % the number of points
A = zeros(2*N, 9); % set A to the required size

for i = 1 : N
    %每一个点都要在A里画出来 ... your code here ...
     a1 = [ p2(1,i) p2(2,i) 1 0 0 0 -p2(1,i)*p1(1,i) -p2(2,i)*p1(1,i) -p1(1,i)];
     A(2*i-1,:) = a1;
     a2 = [ 0 0 0 p2(1,i) p2(2,i) 1 -p2(1,i)*p1(2,i) -p2(2,i)*p1(2,i),-p1(2,i)];
     A(2*i  ,:) = a2 ;
end

A
% ... your code here ...
M = A'*A;
% 找到M的所有的特征根和对应的特征向量
[EigenVectors, EigenValues] = eig(M);

% 把特征根写成向量形式
DiagonalVal = diag(EigenValues)

% 把最小的特征值和对应的下标找到
[MinEigenValue, Index] = min(DiagonalVal)

% 找到最小的特征值对应的特征向量
MinEigenVector = EigenVectors(:,Index)
% ... eig ...
% ... your code here ...

H = MinEigenVector;% ... your code here ...
H2to1 = reshape(H,3,3)';
