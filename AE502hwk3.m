%% AE 502 Hwk 3

% Aidan Buesing
clc

%% Question 2

mu = 1; % Assumed based on Hamiltonian given
a = 1;
e = 0.5;
inc = 45; %deg
omega = 0;
Omega = 0;
M = 0;

w = .01; % Perturbation
time = 100;
R = zeros(time,3);

for i=1:time
    T = 2*pi*a^(3/2);
    n = (2*pi)/T; %since each delta_t is 1
    L = n*a^3; % Delauney Variable
    M = M + L^(-3); % M = M + Mdot*dt (dt again is 1)
    Omega = Omega + w;
    theta = thetaFromM(M*2*pi/360,e)*360/(2*pi);
    r = a*(1-e^2)/(1+e*cosd(theta)) .* [cosd(theta), sind(theta), 0];

    % Rotation Matricies
    Q1 = [cosd(-omega) -sind(-omega) 0; sind(-omega) cosd(-omega) 0; 0 0 1];
    Q2 = [1 0 0; 0 cosd(-inc) -sind(-inc); 0 sind(-inc) cosd(-inc)];
    Q3 = [cosd(-Omega) -sind(-Omega) 0; sind(-Omega) cosd(-Omega) 0; 0 0 1];

    R(i,:) = r*Q1*Q2*Q3; 

end


plot3(R(:,1),R(:,2),R(:,3))
xlabel('x')
ylabel('y')
zlabel('z')


