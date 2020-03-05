function [CDi, M, wingletlines] = AVL_data(filename)
%general data
%filename = 'runningavl';
S = 108;
v = 187.38;
rho = 0.59;
q = 0.5*rho*v^2;

%data for CDi
f1    = fileread( strcat(filename,'.ft') ) ;
lstartcd = strfind( f1, sprintf('CDind =') ) + 8 ;
cdblock = f1(lstartcd : (lstartcd+10)) ;
CDi    = str2double(cdblock) ;


%data for M
f    = fileread( strcat(filename,'.fs') ) ;
lstartm = [strfind( f, sprintf('C.P.x/c') )] + 7 ;
lstartm = [lstartm(1), lstartm(3)];
lendm = [strfind( f, sprintf('Surface # 2')), strfind( f, sprintf('Surface # 4'))] - 1 ;
winglines = f(lstartm(1) : lendm(1)) ;
wingdata     = reshape( str2double( regexp( winglines, '[\d\.\-]+', 'match' )), 13, [] ).' ;
wingletlines = f(lstartm(2) : lendm(2)) ;
ylelet = [];
chordlet = [];
arealet = [];
ccllet = [];
cllet = [];
if length(wingletlines)== 624;
    wingletdata     = reshape( str2double( regexp( wingletlines, '[\d\.\-]+', 'match' )), z, [] ).' ;
    ylelet = wingletdata(:, 2);
    chordlet = wingletdata(:, 3);
    arealet = wingletdata(:, 4);
    ccllet = wingletdata(:, 5);
    cllet = wingletdata(:, 8);
else
    for j = 97:144;
        k = find(wingletlines == j);
        ylelet = [ylelet wingletlines(j+1)];
        chordlet =  [chordlet wingletlines(j+2)];
        arealet = [arealet wingletlines(j+3)];
        ccllet = [ccllet wingletlines(j+4)];
        cllet = [cllet wingletlines(j+7)];
       
    end
end

ylewing = wingdata(:, 2);
chordwing = wingdata(:, 3);
areawing = wingdata(:, 4);
cclwing = wingdata(:, 5);
clwing = wingdata(:, 8);



yspace_wing = 15/48;
yspace_winglet = (ylelet(end) - ylelet(1))/(length(ylelet(1:end))-1);

L_wing = cclwing.*q;
L_winglet = ccllet.*q;
S_wing = L_wing*yspace_wing;
S_winglet = L_winglet.*yspace_winglet;

M = trapz(yspace_wing,S_wing.*ylewing) +trapz(yspace_winglet,S_winglet.*ylelet);
