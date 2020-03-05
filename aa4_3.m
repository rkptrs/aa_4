close all;
clc;
clear all;

CDilist = [];
philist = [];

for i = 0:10;
    

    b = 30;
    cr = 0.5;
    
    ct = 1.5;
    lw = 0.07*b;
    cwr = 0.75*ct;
    lamw = 0.3;
    Lamw = 30/180*pi;
    ewr = 0;
    ewt = 0;
    phi = i/180*pi;

    xrlet = 5+(ct-cwr);
    yrlet = 0.5*b;
    zrlet = 1;
    crlet = cwr;
    arlet = ewr;
    xtlet = xrlet + sin(Lamw)*sin(phi)*lw;
    ytlet = yrlet + sin(phi)*lw;
    ztlet = zrlet + cos(phi)*lw;
    ctlet = cwr*lamw;
    atlet = ewt;
    sref = 108;
    bref = b;
    cref = 3.6;
    AVL_file(sref,cref,bref,xrlet, yrlet, zrlet, crlet, arlet,xtlet, ytlet, ztlet, ctlet, atlet)

    run_file()
    [status,result] = dos(strcat('C:\Users\rkptrs\Desktop\TUPOLEV34-Stijn-try2\avl.exe',' < ','run_input','.run'));
    % 
    % 
    
    
    [CDi,M , f] = AVL_data('runningavl');
    CDilist(i+1) = CDi;
    philist(i+1) = i;
    %data for M
%     content    = fileread( strcat('runningavl.fs') ) ;
%     lineStarts = [strfind( content, sprintf('C.P.x/c') )] + 7 ;
%     lineStarts = [lineStarts(1), lineStarts(3)];
%     lineEnds = [strfind( content, sprintf('Surface # 2')), strfind( content, sprintf('Surface # 4'))] - 1 ;
%     block_wing = content(lineStarts(1) : lineEnds(1)) ;
%     data_wing     = reshape( str2double( regexp( block_wing, '[\d\.\-]+', 'match' )), 13, [] ).' ;
%     block_winglet = content(lineStarts(2) : lineEnds(2)) ;
%     data_winglet     = reshape( str2double( regexp( block_winglet, '[\d\.\-]+', 'match' )), 13, [] ).' ;
% 
%     Yle_wing = data_wing(:, 2);
%     Chord_wing = data_wing(:, 3);
%     Area_wing = data_wing(:, 4);
%     CCl_wing = data_wing(:, 5);
%     Cl_wing = data_wing(:, 8);
% 
%     Yle_winglet = data_winglet(:, 2);
%     Chord_winglet = data_winglet(:, 3);
%     Area_winglet = data_winglet(:, 4);
%     CCl_winglet = data_winglet(:, 5);
%     Cl_winglet = data_winglet(:, 8);
% 
%     Yspacing_wing = 15/48;
%     Yspacing_winglet = (Yle_winglet(end) - Yle_winglet(1))/(length(Yle_winglet(1:end))-1);
% 
%     L_wing = CCl_wing.*qref;
%     L_winglet = CCl_winglet.*qref;
%     S_wing = L_wing*Yspacing_wing;
%     S_winglet = L_winglet.*Yspacing_winglet;
% 
%     M = trapz(Yspacing_wing,S_wing.*Yle_wing) +trapz(Yspacing_winglet,S_winglet.*Yle_winglet);


end

h = plot(philist,CDilist,'LineWidth',2);

ylabel('\fontsize{16}C_{D_{ind}}[-] ')
xlabel('\fontsize{16}\phi [\circ] ')


axe = ancestor(h, 'axes');
axe.YAxis.Exponent = 0;
