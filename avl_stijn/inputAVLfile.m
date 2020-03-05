function [] = inputAVLfile(l_w, phi, C_w_r, lambda_w, LAMBDA_w, epsilon_w_r, epsilon_w_t)
%general data
S_ref = 112.5;
C_ref = 3.75;
B_ref = 30;
v_ref = 187.38;
C_w_t = C_w_r*lambda_w;

x_end_wing = 6.5;
y_end_wing = 15;
z_end_wing = 1;

%calculate winglet geometry
x_winglet1 = x_end_wing - C_w_r;
y_winglet1 = y_end_wing;
z_winglet1 = z_end_wing;

x_winglet2 = x_winglet1 + l_w*tand(LAMBDA_w);
y_winglet2 = y_winglet1 + l_w*cosd(90-phi);
z_winglet2 = z_winglet1 + l_w*sind(90-phi);

%write inputfile for AVL
fid = fopen('test2.avl', 'wt');
    fprintf(fid,'%s\n', 'Assignment 4');
    fprintf(fid,'%s\n', '#Mach number');
    fprintf(fid,'%g\n', 0.6);
    fprintf(fid,'%s\n', '#IYsym   IZsym   Zsym');
    fprintf(fid,'%g %g %g\n', 0.0, 0.0, 0.0);
    fprintf(fid,'%s\n', '#Sref    Cref    Bref');
    fprintf(fid,'%g %g %g\n',  S_ref, C_ref, B_ref);
    fprintf(fid,'%s\n', '#Xref    Yref    Zref');
    fprintf(fid,'%g %g %g\n',  0.0, 0.0, 0.0);
    fprintf(fid,'%s\n', '#-------------------------');
    fprintf(fid,'%s\n', 'SURFACE');
    fprintf(fid,'%s\n', 'Wing');
    fprintf(fid,'%s\n', '#Nchordwise  Cspace   Nspanwise   Sspace');
    fprintf(fid,'%g %g %g %g\n',  8, 1.0, 48, 3.0);
    fprintf(fid,'%s\n', 'YDUPLICATE');
    fprintf(fid,'%g\n',  0.0);
    fprintf(fid,'%s\n', 'ANGLE');
    fprintf(fid,'%g\n',  0.0);
    fprintf(fid,'%s\n', '#-------------------------');
    fprintf(fid,'%s\n', 'SECTION');
    fprintf(fid,'%s\n', '#Xle    Yle    Zle     Chord   Ainc');
    fprintf(fid,'%g %g %g %g %g\n',  0.0  ,    0.0,     0.0 ,    6.0  ,   0.0);
    fprintf(fid,'%s\n', 'NACA');
    fprintf(fid,'%g\n',  2414);
    fprintf(fid,'%s\n', '#-------------------------');
    fprintf(fid,'%s\n', 'SECTION');
    fprintf(fid,'%s\n', '#Xle    Yle    Zle     Chord   Ainc');
    fprintf(fid,'%g %g %g %g %g\n',  5.0,     15.0,    1.0,     1.5,     0.0);
    fprintf(fid,'%s\n', 'NACA');
    fprintf(fid,'%g\n',  2414);
    
    fprintf(fid,'%s\n', 'SURFACE');
    fprintf(fid,'%s\n', 'Winglet');
    fprintf(fid,'%s\n', '#Nchordwise  Cspace   Nspanwise   Sspace');
    fprintf(fid,'%g %g %g %g\n',  8, 1.0, 12, 3.0);
    fprintf(fid,'%s\n', 'YDUPLICATE');
    fprintf(fid,'%g\n',  0.0);
    fprintf(fid,'%s\n', 'ANGLE');
    fprintf(fid,'%g\n',  0.0);
    fprintf(fid,'%s\n', '#-------------------------');
    fprintf(fid,'%s\n', 'SECTION');
    fprintf(fid,'%s\n', '#Xle    Yle    Zle     Chord   Ainc');
    fprintf(fid,'%g %g %g %g %g\n',  x_winglet1  ,    y_winglet1,     z_winglet1 ,    C_w_r  ,   epsilon_w_r);
    fprintf(fid,'%s\n', 'NACA');
    fprintf(fid,'%g\n',  2414);
    fprintf(fid,'%s\n', '#-------------------------');
    fprintf(fid,'%s\n', 'SECTION');
    fprintf(fid,'%s\n', '#Xle    Yle    Zle     Chord   Ainc');
    fprintf(fid,'%g %g %g %g %g\n',  x_winglet2  ,    y_winglet2,     z_winglet2 ,    C_w_t  ,   epsilon_w_t);
    fprintf(fid,'%s\n', 'NACA');
    fprintf(fid,'%g\n',  2414);

fclose(fid);
end