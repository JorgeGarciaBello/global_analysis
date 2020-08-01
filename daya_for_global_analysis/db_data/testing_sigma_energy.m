# testing_sigma_energy.m
x=load("db_s22t13_grid_data.dat");
y=load("db_dm_grid_data.dat");
#z1=load("db_chi_matrix_db_sigma_energy_test_percentage_1_all_bin.dat");
#z2=load("db_chi_matrix_db_sigma_energy_test_percentage_2_all_bin.dat");
#z3=load("db_chi_matrix_db_sigma_energy_test_percentage_3_all_bin.dat");
#z4=load("db_chi_matrix_db_sigma_energy_test_percentage_4_all_bin.dat");
#z5=load("db_chi_matrix_db_sigma_energy_test_percentage_5_all_bin.dat");
#z6=load("db_chi_matrix_db_sigma_energy_test_percentage_6_all_bin.dat");
#z7=load("db_chi_matrix_db_sigma_energy_test_percentage_7_all_bin.dat");

z8=load("db_chi_matrix_db_sigma_energy_test_percentage_8_all_bin.dat");
z9=load("db_chi_matrix_db_sigma_energy_test_percentage_9_all_bin.dat");
z10=load("db_chi_matrix_db_sigma_energy_test_percentage_10_all_bin.dat");
z11=load("db_chi_matrix_db_sigma_energy_test_percentage_11_all_bin.dat");
z12=load("db_chi_matrix_db_sigma_energy_test_percentage_12_all_bin.dat");
z13=load("db_chi_matrix_db_sigma_energy_test_percentage_13_all_bin.dat");
z14=load("db_chi_matrix_db_sigma_energy_test_percentage_14_all_bin.dat");
z15=load("db_chi_matrix_db_sigma_energy_test_percentage_15_all_bin.dat");
z16=load("db_chi_matrix_db_sigma_energy_test_percentage_16_all_bin.dat");

xi=linspace(x(1),x(20),100);
yi=linspace(y(1),y(20),100);

for i=1:100
  for j=1:100
     #z1i(i,j) = interp2 (x, y, z1, xi(i), yi(j));
     #z2i(i,j) = interp2 (x, y, z2, xi(i), yi(j));
     #z3i(i,j) = interp2 (x, y, z3, xi(i), yi(j));
     #z4i(i,j) = interp2 (x, y, z4, xi(i), yi(j));
     #z5i(i,j) = interp2 (x, y, z5, xi(i), yi(j));
     #z6i(i,j) = interp2 (x, y, z6, xi(i), yi(j));
     #z7i(i,j) = interp2 (x, y, z7, xi(i), yi(j));

     z8i(i,j) = interp2 (x, y, z8, xi(i), yi(j));
     z9i(i,j) = interp2 (x, y, z9, xi(i), yi(j));
     z10i(i,j) = interp2 (x, y, z10, xi(i), yi(j));
     z11i(i,j) = interp2 (x, y, z11, xi(i), yi(j));
     z12i(i,j) = interp2 (x, y, z12, xi(i), yi(j));
     z13i(i,j) = interp2 (x, y, z13, xi(i), yi(j));
     z14i(i,j) = interp2 (x, y, z14, xi(i), yi(j));
     z15i(i,j) = interp2 (x, y, z15, xi(i), yi(j));
     z16i(i,j) = interp2 (x, y, z16, xi(i), yi(j));
  end
end
k=1;
for i=1:100
  for j=1:100
    #data1(k,:)=[xi(i), yi(j), z1i(i,j)];
    #data2(k,:)=[xi(i), yi(j), z2i(i,j)];
    #data3(k,:)=[xi(i), yi(j), z3i(i,j)];
    #data4(k,:)=[xi(i), yi(j), z4i(i,j)];
    #data5(k,:)=[xi(i), yi(j), z5i(i,j)];
    #data6(k,:)=[xi(i), yi(j), z6i(i,j)];
    #data7(k,:)=[xi(i), yi(j), z7i(i,j)];    

    data8(k,:)=[xi(i), yi(j), z8i(i,j)];    
    data9(k,:)=[xi(i), yi(j), z9i(i,j)];    
    data10(k,:)=[xi(i), yi(j), z10i(i,j)];    
    data11(k,:)=[xi(i), yi(j), z11i(i,j)];    
    data12(k,:)=[xi(i), yi(j), z12i(i,j)];    
    data13(k,:)=[xi(i), yi(j), z13i(i,j)];    
    data14(k,:)=[xi(i), yi(j), z14i(i,j)];    
    data15(k,:)=[xi(i), yi(j), z15i(i,j)];    
    data16(k,:)=[xi(i), yi(j), z16i(i,j)];    
    k=k+1;
  end
end
# data1=data1';data2=data2';data3=data3';data4=data4';data5=data5';data6=data6';data7=data7';
data8=data8';data9=data9';data10=data10';data11=data11';data12=data12';data13=data13';data14=data14';
data15=data15';data16=data16';

#file1 = fopen('xmgrace_sigma_energy_test_percentage_1_all_bin.dat', 'w');
#fprintf(file1,'%d %d %d \n' ,data1);
#fclose(file1);
#file1 = fopen('xmgrace_sigma_energy_test_percentage_2_all_bin.dat', 'w');
#fprintf(file1,'%d %d %d \n' ,data2);
#fclose(file1);
#file1 = fopen('xmgrace_sigma_energy_test_percentage_3_all_bin.dat', 'w');
#fprintf(file1,'%d %d %d \n' ,data3);
#fclose(file1);
#file1 = fopen('xmgrace_sigma_energy_test_percentage_4_all_bin.dat', 'w');
#fprintf(file1,'%d %d %d \n' ,data4);
#fclose(file1);
#file1 = fopen('xmgrace_sigma_energy_test_percentage_5_all_bin.dat', 'w');
#fprintf(file1,'%d %d %d \n' ,data5);
#fclose(file1);
#file1 = fopen('xmgrace_sigma_energy_test_percentage_6_all_bin.dat', 'w');
#fprintf(file1,'%d %d %d \n' ,data6);
#fclose(file1);
#file1 = fopen('xmgrace_sigma_energy_test_percentage_7_all_bin.dat', 'w');
#fprintf(file1,'%d %d %d \n' ,data7);
#fclose(file1);

file1 = fopen('xmgrace_sigma_energy_test_percentage_8_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data8);
fclose(file1);
file1 = fopen('xmgrace_sigma_energy_test_percentage_9_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data9);
fclose(file1);
file1 = fopen('xmgrace_sigma_energy_test_percentage_10_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data10);
fclose(file1);
file1 = fopen('xmgrace_sigma_energy_test_percentage_11_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data11);
fclose(file1);
file1 = fopen('xmgrace_sigma_energy_test_percentage_12_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data12);
fclose(file1);
file1 = fopen('xmgrace_sigma_energy_test_percentage_13_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data13);
fclose(file1);
file1 = fopen('xmgrace_sigma_energy_test_percentage_14_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data14);
fclose(file1);
file1 = fopen('xmgrace_sigma_energy_test_percentage_15_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data15);
fclose(file1);
file1 = fopen('xmgrace_sigma_energy_test_percentage_16_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data16);
fclose(file1);