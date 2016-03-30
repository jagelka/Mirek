function [] = mandel_mask(x,y,d,N)
%mask form of mandelbrot set calculation
%x, y = central position of picture
%d = halfsize of picture (x is from [x-d,x+d], y alternatively)
%N = number of pixels in each direction
tic   %starting point of time
[X,Y] = meshgrid(x-d:2*d/N:x+d,y-d:2*d/N:y+d);   %matrices of points with x and y coordinates
C = X+i*Y;
Z = C; map = ones(size(C));
for q = 1:100
    positions = find(abs(Z)<2);
    Z(positions) = Z(positions).^2+C(positions);
    map(positions) = q;
end
map = map+q*(map==0);
mesh(X,Y,map)   % 3D mesh plot
campos([x,y,200])   %view position 
axis equal   %equidistant scale of axes
toc   %time evaluation
end

