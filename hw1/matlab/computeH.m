% YOUR NAME HERE
% Q 4.1
% 2015

function H2to1 = computeH(p1, p2)

N = size(p1, 2); % the number of points
A = zeros(2*N, 9); % set A to the required size

for i = 1 : N
    %ÿһ���㶼Ҫ��A�ﻭ���� ... your code here ...
     a1 = [ p2(1,i) p2(2,i) 1 0 0 0 -p2(1,i)*p1(1,i) -p2(2,i)*p1(1,i) -p1(1,i)];
     A(2*i-1,:) = a1;
     a2 = [ 0 0 0 p2(1,i) p2(2,i) 1 -p2(1,i)*p1(2,i) -p2(2,i)*p1(2,i),-p1(2,i)];
     A(2*i  ,:) = a2 ;
end

A
% ... your code here ...
M = A'*A;
% �ҵ�M�����е��������Ͷ�Ӧ����������
[EigenVectors, EigenValues] = eig(M);

% ��������д��������ʽ
DiagonalVal = diag(EigenValues)

% ����С������ֵ�Ͷ�Ӧ���±��ҵ�
[MinEigenValue, Index] = min(DiagonalVal)

% �ҵ���С������ֵ��Ӧ����������
MinEigenVector = EigenVectors(:,Index)
% ... eig ...
% ... your code here ...

H = MinEigenVector;% ... your code here ...
H2to1 = reshape(H,3,3)';
