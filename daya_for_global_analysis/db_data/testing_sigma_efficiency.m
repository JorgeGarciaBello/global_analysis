# testing_sigma_efficiency.m
x=load("db_s22t13_grid_data.dat");
y=load("db_dm_grid_data.dat");

z1=load("db_chi_matrix_db_sigma_efficiency_test_percentage_1_all_bin.dat");
z2=load("db_chi_matrix_db_sigma_efficiency_test_percentage_2_all_bin.dat");
z3=load("db_chi_matrix_db_sigma_efficiency_test_percentage_3_all_bin.dat");
z4=load("db_chi_matrix_db_sigma_efficiency_test_percentage_4_all_bin.dat");
z5=load("db_chi_matrix_db_sigma_efficiency_test_percentage_5_all_bin.dat");

xi=linspace(x(1),x(20),100);
yi=linspace(y(1),y(20),100);
for i=1:100
  for j=1:100
     z1i(i,j) = interp2 (x, y, z1, xi(i), yi(j));
     z2i(i,j) = interp2 (x, y, z2, xi(i), yi(j));
     z3i(i,j) = interp2 (x, y, z3, xi(i), yi(j));
     z4i(i,j) = interp2 (x, y, z4, xi(i), yi(j));
     z5i(i,j) = interp2 (x, y, z5, xi(i), yi(j));     
  end
end
k=1;
for i=1:100
  for j=1:100
    data1(k,:)=[xi(i), yi(j), z1i(i,j)];
    data2(k,:)=[xi(i), yi(j), z2i(i,j)];
    data3(k,:)=[xi(i), yi(j), z3i(i,j)];
    data4(k,:)=[xi(i), yi(j), z4i(i,j)];
    data5(k,:)=[xi(i), yi(j), z5i(i,j)];    
    k=k+1;
  end
end
 data1=data1';data2=data2';data3=data3';data4=data4';data5=data5'; 

file1 = fopen('xmgrace_sigma_efficiency_test_percentage_1_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data1);
fclose(file1);
file1 = fopen('xmgrace_sigma_efficiency_test_percentage_2_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data2);
fclose(file1);
file1 = fopen('xmgrace_sigma_efficiency_test_percentage_3_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data3);
fclose(file1);
file1 = fopen('xmgrace_sigma_efficiency_test_percentage_4_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data4);
fclose(file1);
file1 = fopen('xmgrace_sigma_efficiency_test_percentage_5_all_bin.dat', 'w');
fprintf(file1,'%d %d %d \n' ,data5);
fclose(file1);