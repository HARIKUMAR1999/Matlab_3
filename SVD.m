clear all;clc;

disp("Reconstruction of A")
U=[0.3651 -0.4472 -0.8165;0.1826 0.8944 -4082;0.9129 0 0.4082];
S=[2.4495 0;0 1;0 0];
V=[0.4472 0.8944;0.8944 -0.4472];
A=U*S*transpose(V);
disp(A);

Matrix_A=[0 1;1 0;1 2];

disp("Using In built function")
[A,B,C]=svd(Matrix_A);
disp(A);
disp(B);
disp(C);

disp("Without using inbuilt svd function")
Tranform_1=[0 0 -1;0 -1 0 ;1 0 0];
Tranform_2=[0 -1; 1 0];
Tranform_3=[0 1; 1 0];
[V,D]=eig(Matrix_A*Matrix_A');
[VV,DD]=eig(Matrix_A'*Matrix_A);


disp((V*Tranform_1))
disp(sqrt(flip(DD*Tranform_3)))
disp((VV*Tranform_2))