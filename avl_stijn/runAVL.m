
%% INPUT variables
filename = '.\test2';
filename2 = '.\test';
velocity = 10;%m/s
%Define a base file name to save 
basename = '.\runningmatlab';
%Location of avl 
avlLocation = '.\avl.exe';

% %% Directory Preparation
% %Purge Directory of interfering files
% if ispc
% %     [status,result] =dos(strcat('del ',basename,'.st'));
% %     [status,result] =dos(strcat('del ',basename,'.sb'));
% %     [status,result] =dos(strcat('del ',basename,'.run'));
% %     [status,result] =dos(strcat('del ',basename,'.eig'));
% end

%% Create run file
%Open the file with write permission
fid = fopen([basename,'.run'], 'w');

%Load the AVL definition of the aircraft
fprintf(fid, 'LOAD %s\n', strcat(filename,'.avl'));

%Open the OPER menu
fprintf(fid, '%s\n',   'OPER');   

%Define the run case
fprintf(fid, '%s\n',   'F'); 
fprintf(fid, '%s\n', strcat(filename2,'.run'));
fprintf(fid, '%s\n',   'x'); 
fprintf(fid, '%s\n',   'c1');
fprintf(fid, '%s\n',   'c');
fprintf(fid, '%g\n',   0.5);
fprintf(fid, '\n');

%Run the Case
fprintf(fid, '%s\n',   'x'); 

%Save the fs data
fprintf(fid, '%s\n',   'fs'); 
fprintf(fid, '%s%s\n',basename,'.fs');   
fprintf(fid, '%s\n',   'o'); 

%Save the fs data
fprintf(fid, '%s\n',   'ft'); 
fprintf(fid, '%s%s\n',basename,'.ft');   
fprintf(fid, '%s\n',   'o');

%Drop out of OPER menu
fprintf(fid, '%s\n',   '');

%Quit Program
fprintf(fid, 'Quit\n'); 

%Close File
fclose(fid);

%% Execute Run
%Run AVL using 
if ispc
    [status,result] = dos(strcat(avlLocation,' < ',basename,'.run'));
else
    
end