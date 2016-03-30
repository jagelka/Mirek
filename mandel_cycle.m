function [] = mandel_cycle(x,y,d,N)
%"for-cycle" interpretation of mandelbrot set
%x, y = central position of picture
%d = halfsize of picture (x is from [x-d,x+d], y alternatively)
%N = number of pixels in each direction
tic   %starting point of time
map = zeros(N,N);   ix = 1;
for z_re = x-d:2*d/N:x+d
    iy = 1;
    for z_im = y-d:2*d/N:y+d
        z = 0;   cycle = 0;
        while abs(z) < 2 & cycle < 100
            z = z*z+z_re+i*z_im;
            cycle = cycle+1;
        end
        map(ix,iy) = cycle;
        iy = iy+1;
    end
    ix = ix+1;
end
[X,Y] = meshgrid(x-d:2*d/N:x+d,y-d:2*d/N:y+d);   %matrices of points with x and y coordinates
mesh(X,Y,map)   % 3D mesh plot
campos([x,y,200])   %view position 
axis equal   %equidistant scale of axes
toc   %time evaluation
end

