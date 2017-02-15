function [x,lambda]=omp_run(y,A,k)
lambda=[];
x_init=zeros(size(A,2),1);
r=y;                               %residual is nithing but our answer(y=Ax), smaller r is better(answer)
for i=1:k                          %instead of iterating more number of times we'll iterate over k times
   C=abs(A'*r);
   [v,IX]=max(C);
   lambda=[lambda IX];             %union
   x1=A(:,lambda)\y;
   r=y-A(:,lambda)*x1;             %final answer on which x0 matrix has non zero value
end
x=x_init;
x(lambda')=x1;
end