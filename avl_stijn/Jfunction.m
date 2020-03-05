function J = Jfunction(CDi, M, k, CDi0, M0)
%objective function
J = k*CDi/CDi0 + (1-k)*M/M0;
end