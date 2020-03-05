function [] = run_file()

% EMWET 
fid = fopen('run_input.run', 'wt');
fprintf(fid, 'LOAD %s\n', strcat('AVL_input','.avl'));
fprintf(fid, '%s\n',   'OPER');   

%Define the run case


fprintf(fid, '%s\n',   'x'); 
fprintf(fid, '%s\n',   'c1');
fprintf(fid, '%s\n',   'c');
fprintf(fid, '%g\n',   0.5);
fprintf(fid, '\n');
fprintf(fid, '%s\n',   'm');
fprintf(fid, '%s\n',   'mn');
fprintf(fid, '%g\n',   0.6);
fprintf(fid, '%s\n',   'v');
fprintf(fid, '%g\n',   187.37);
fprintf(fid, '%s\n',   'd');
fprintf(fid, '%g\n',   0.59);
fprintf(fid, '\n');



%Run the Case
fprintf(fid, '%s\n',   'x'); 

%Save the fs data
fprintf(fid, '%s\n',   'fs'); 
fprintf(fid, '%s%s\n','runningavl','.fs');   
fprintf(fid, '%s\n',   'o'); 

%Save the fs data
fprintf(fid, '%s\n',   'ft'); 
fprintf(fid, '%s%s\n','runningavl','.ft');   
fprintf(fid, '%s\n',   'o');

%Drop out of OPER menu
fprintf(fid, '%s\n',   '');
fprintf(fid, '%s\n',   '');
fprintf(fid, '%s\n',   '');
%Quit Program
fprintf(fid, 'Quit\n'); 


    
fclose(fid);
end