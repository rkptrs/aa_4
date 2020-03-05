function [CDi, M] = getAVLdata(filename_getAVLdata)
%general data
S_ref = 112.5;
v_ref = 187.38;
rho_ref = 0.59;
q_ref = 0.5*rho_ref*v_ref^2;

%data for CDi
content1    = fileread( strcat(filename_getAVLdata,'.ft') ) ;
lineStarts1 = strfind( content1, sprintf('CDind =') ) + 8 ;
block_wing1 = content1(lineStarts1 : (lineStarts1+10)) ;
CDi    = str2double(block_wing1) ;


%data for M
content    = fileread( strcat(filename_getAVLdata,'.fs') ) ;
lineStarts = [strfind( content, sprintf('C.P.x/c') )] + 7 ;
lineStarts = [lineStarts(1), lineStarts(3)];
lineEnds = [strfind( content, sprintf('Surface # 2')), strfind( content, sprintf('Surface # 4'))] - 1 ;
block_wing = content(lineStarts(1) : lineEnds(1)) ;
data_wing     = reshape( str2double( regexp( block_wing, '[\d\.\-]+', 'match' )), 13, [] ).' ;
block_winglet = content(lineStarts(2) : lineEnds(2)) ;
data_winglet     = reshape( str2double( regexp( block_winglet, '[\d\.\-]+', 'match' )), 13, [] ).' ;

Yle_wing = data_wing(:, 2);
Chord_wing = data_wing(:, 3);
Area_wing = data_wing(:, 4);
CCl_wing = data_wing(:, 5);
Cl_wing = data_wing(:, 8);

Yle_winglet = data_winglet(:, 2);
Chord_winglet = data_winglet(:, 3);
Area_winglet = data_winglet(:, 4);
CCl_winglet = data_winglet(:, 5);
Cl_winglet = data_winglet(:, 8);

Yspacing_wing = 15/48;
Yspacing_winglet = (Yle_winglet(end) - Yle_winglet(1))/(length(Yle_winglet(1:end))-1);

L_wing = CCl_wing.*q_ref;
L_winglet = CCl_winglet.*q_ref;
S_wing = L_wing*Yspacing_wing;
S_winglet = L_winglet.*Yspacing_winglet;

M = trapz(Yspacing_wing,S_wing.*Yle_wing) +trapz(Yspacing_winglet,S_winglet.*Yle_winglet);


