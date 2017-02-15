clear all;
close all;
clc
% sparse signal
x0=zeros(100,1);
prompt='Enter the sparsity:';
k=input(prompt);
t=randperm(100);               %randomly generating the numbers at 100 positions using randperm
x0(t(1:k))=randn(k,1);         %through this we are some putting random values in vector "x0"
A=rand(60,100);                %Base matrix
y=A*x0;
[x,O]=omp_run(y,A,k);
stem(x0),hold on,stem(x,'r+'); %hold on is used to keep the first stem plot