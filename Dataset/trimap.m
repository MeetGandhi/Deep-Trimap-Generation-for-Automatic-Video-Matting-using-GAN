srcFiles = dir('D:\project\alpha\*.jpg');  % the folder in which ur alpha images exists

for i = 1 : 5
    filename = strcat('D:\project\alpha\',srcFiles(i).name);% the folder in which ur alpha images exists
    I = imread(filename);

    my_image = I(:,:,1);
    % perform thresholding by logical indexing
    image_thresholded = I;
    image_thresholded(my_image>3) = 256;
    image_thresholded(my_image<0.5) = 0;
    sd = strel('disk',22);
    se = strel('disk',10);
    %lined = strel('line', 10, 45);
    %linee = strel('line', 5, 60);
    D = imdilate(image_thresholded,sd);
    E = imerode(image_thresholded,se);  
    %R = spones(D);
    T = D - E;
    u = T(:,:,1);
    u_thresholded = u;
    
    u_thresholded(u>3) = 120;
    Z = imadd(u_thresholded,E);
    outputFileName = fullfile('D:\project\trimap\', srcFiles(i).name);% destination folder
    imwrite(Z, outputFileName);
    
    figure, imshow(Z);
    
end