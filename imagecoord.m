clear
colored_image = imread('spill.jpg');
target1R = 255; target1G = 0; target1B = 0;
target2R = 0; target2G = 255; target2B = 0;
target3R = 0; target3G = 0; target3B = 0;
R = colored_image(:,:,1);
G = colored_image(:,:,2);
B = colored_image(:,:,3);
matches1 = R == target1R & G == target1G & B == target1B;
matches2 = R == target2R & G == target2G & B == target2B;
matches3 = R == target3R & G == target3G & B == target3B;
figure; image(matches1); colormap(gray(2));
figure; image(matches2); colormap(gray(2));
figure; image(matches3); colormap(gray(2));
[r1, c1] = find(matches1);
[r2, c2] = find(matches2);
[r3, c3] = find(matches3);