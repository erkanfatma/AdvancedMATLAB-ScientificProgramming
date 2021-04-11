function  [X,Y,R,P,V1,V2] = get_all_quantities(nx,ny,xlim,ylim)
% X, Y         - nx x ny matrices defining grid (output of meshgrid)
% R, P, V1, V2 - nx x ny matrices defining results (density, pressure,
%                velocity_x, velocity_y) over grid X, Y

% Defaults
if nargin < 1, nx   = 256; end;
if nargin < 2, ny   = 256; end;
if nargin < 3, xlim = [-2,1]; end;
if nargin < 4, ylim = [-0.6,0.6]; end;

% Read topology
tmp = dlmread('topo.txt');
top = tmp(:,2:3); top(:,1) = top(:,1);

% Read result files
rho =dlmread('dens.txt');
p   =dlmread('pres.txt');
disp=dlmread('disp.txt');
vel =dlmread('vel.txt');

% Grid
x = linspace(xlim(1),xlim(2),nx);
y = linspace(ylim(1),ylim(2),ny);
[X,Y] = meshgrid(x,y);

% Interpolate results on unstructured grid (top) to structured grid (X,Y)
F = TriScatteredInterp(top+disp(:,1:2),rho);
R = F(X,Y); % Density

F = TriScatteredInterp(top+disp(:,1:2),p);
P = F(X,Y); % Pressure

F = TriScatteredInterp(top+disp(:,1:2),vel(:,1));
V1 = F(X,Y); % Velocity_x

F = TriScatteredInterp(top+disp(:,1:2),vel(:,2));
V2 = F(X,Y); % Velocity_y

end