clear all;clc;

img=imread('Lena.tif');                     %reading the image from source
grey=rgb2gray(img);
grey=double(grey);
[u,s,v]=svd(grey);
A=u*s*v';
B=diag(s);
C=size(grey);
eigen_images=[5,10,50,100,150,200];



for i=1:eigen_images
    [z,MSE]=fun(eigen_images(i),grey,u,s,v,C);
    fh2=uint8(z);
    
    imshow(fh2);              % Display reconstructed 
    
    plot(MSE);                % Plot Mean Square Error
    xlabel('Number of Singular Values');    % Label 
    ylabel('Mean Square Error');      % Label 

    grid on;
end
function [z,MSE] = fun(N,grey,u,s,v,C)
    for M=1:N
        z=zeros(size(grey));
        for i=1:M
            z=z+u(:,i)*s(i,i)*v(:,i)';
        end
        MSE(M)=sum(sum(grey-z).^2)/(C(1)*C(2));
    end
end
