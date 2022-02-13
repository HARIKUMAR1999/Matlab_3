clear all; clc;
Img = imread('Lena.tif');
Noise_induced_img = imnoise(Img,'salt & pepper');
Kernal_size = 4;
K = 8;
[Knnfilter] = knn(Noise_induced_img,Kernal_size,K);
function [Image,Kernal,K] = knn(Image,Kernal,K)
    layer = round(Kernal/2);
    I = (rgb2gray(Image));
    Output = zeros(size(I)+layer);

    [c,d] = size(Output);
    for i = layer:c-layer
        for j = layer:d-layer
            Output(i,j) = I(i-1,j-1);
        end
    end
    result = zeros(size(Output));
    [a,b] = size(result);
    for k = layer : a-(layer)
        for j = layer : b-(layer)
            x = k;
            y = j;
            el_1=Output(x-1,y+1);
            el_2=Output(x,y-1);
            el_3=Output(x,y+1);
            el_4=Output(x-1,y);  
            el_5=Output(x+1,y);
            el_6=Output(x-1,y-1);
            el_7=Output(x+1,y-1);
            el_8=Output(x+1,y+1);
            avg = (el_8 + el_7 + el_5 + el_6 + el_4 + el_3 + el_2 + el_1)/8;
            result(x,y) = avg;

        end
    end
    figure
    imshow(uint8(Output))
    figure
    imshow(uint8(result))
end