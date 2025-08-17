%% Week 10
clear all
%% Question 1
k = 0.61;
L = 7.5;
dx = 2.5;
dt = 0.1;
x = 0:dx:L;
t = 0:dt:0.2;
m = length(x);
n = length(t);

T0 = x.^2 - 16.1667*x + 90;
% Define parameters
k = 0.61;         % Thermal diffusivity (cm^2/s)
L = 7.5;          % Length of the rod (cm)
dx = 2.5;         % Spatial step size (cm)
dt = 0.1;         % Time step size (s)
x = 0:dx:L;       % Spatial grid
t = 0:dt:0.2;     % Time grid
m = length(x);    % Number of spatial points
n = length(t);    % Number of time steps

% Initial condition
T0 = x.^2 - 16.1667 * x + 90;

% Boundary conditions
T(1,:) = 90;      % T(0,t) = 90°C
T(m,:) = 25;      % T(L,t) = 25°C

% Initialize temperature matrix
T = zeros(m, n);
T(:,1) = T0;

% Implicit finite difference method
r = k * dt / (dx^2); % Stability factor

% Tridiagonal matrix for implicit method
A = zeros(m, m);
for i = 2:m-1
    A(i,i-1) = -r;
    A(i,i) = 1 + 2*r;
    A(i,i+1) = -r;
end
A(1,1) = 1;       % Boundary condition at x = 0
A(m,m) = 1;       % Boundary condition at x = L

% Solve for each time step
for j = 2:n
    b = T(:,j-1);  % Right-hand side
    b(1) = 90;     % Enforce boundary condition at x = 0
    b(m) = 25;     % Enforce boundary condition at x = L
    T(:,j) = A \ b; % Solve the system
end

% Round up to 4 decimal places
T = round(T, 4);

% Display the table using fprintf
fprintf('Temperature T(x,t) at different points and times:\n');
fprintf('--------------------------------------------\n');
fprintf('     | x=0cm  | x=2.5cm | x=5.0cm | x=7.5cm\n');
fprintf('--------------------------------------------\n');
for i = 1:n
    fprintf('t=%.1fs | %.4f | %.4f | %.4f | %.4f\n', t(i), T(1,i), T(2,i), T(3,i), T(4,i));
end
fprintf('--------------------------------------------\n');
