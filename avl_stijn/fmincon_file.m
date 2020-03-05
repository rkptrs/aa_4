function J_out = fmincon_file(x)
global data;
x = x.*(data.ub-data.lb)+data.lb;
CDi0 = data.CDi0;
M0 = data.M0;
k = data.k;

l_w = x(1);
phi = x(2);    %degrees
C_w_r = x(3);
lambda_w = x(4); 
LAMBDA_w = x(5);      %degrees
epsilon_w_r = x(6);    %degrees
epsilon_w_t = x(7);    %degrees

filename_getAVLdata = 'runningmatlab';
inputAVLfile(l_w, phi, C_w_r, lambda_w, LAMBDA_w, epsilon_w_r, epsilon_w_t);
runAVL
[CDi, M] = getAVLdata(filename_getAVLdata);
J_out = Jfunction(CDi, M, k, CDi0, M0);
end