clear all;
clc;
close all;

%general inputs
b = 30;
C_t = 1.5;
CDi0 = 0.009799;
M0 = 571443.44564;

%set value of k
k = 0.5;

%start point and bounds
x0 = [0.03*b, 20, 0.75*C_t, 0.47, 30, 0.15, -0.15]';
lb = [0.02*b,  10,  0.4*C_t,  0.4,   0,  -6,  -6]';
ub = [0.10*b,  90,  1.0*C_t,  1.0,   45,  6,  6]';

%normalise
x0n = (x0-lb)./(ub-lb);
lbn = 0.*lb;
ubn = ub./ub;

global data;
data.x0 = x0;
data.lb = lb;
data.ub = ub;
data.CDi0 = CDi0;
data.M0 = M0;
data.k = k;

% options.OutputFcn = {@constraints};
options = optimoptions('fmincon');
options.Display = 'iter-detailed';
options.DiffMinChange = 0.01;
% options.DiffMaxChange = 0.4;
% options.TolFun = 0.000001;
% options.TolX = 0.00000001;
% options.StepTolerance = 1.000000e-08;
options.PlotFcns = {@optimplotfval};
[x, fval, exitflag, output] = fmincon(@(x) fmincon_file(x), x0n, [], [], [], [], lbn, ubn, [], options); 

%print outcome
x = x.*(data.ub-data.lb)+data.lb
fval
