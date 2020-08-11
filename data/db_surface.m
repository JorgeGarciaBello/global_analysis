# surface
x=load("grid_data_s22t13_.dat");
y=load("grid_data_dmee.dat");
z=load("chi_matrix_db_data.dat");
minimo=load("min_param_db_data.dat")

xi=linspace(x(1),x(15),200);
yi=linspace(y(1),y(15),200);

#surf(x,y,z);
# minimo=min(min(z)) perito bonito
# [i,j]=find(z==minimo);

for i=1:200
  for j=1:200
     zi(i,j) = interp2 (x, y, z, xi(i), yi(j));
  end
end

#surf(xi,yi,zi);

k=1;
for i=1:200
  for j=1:200
    data(k,:)=[xi(i), yi(j), zi(i,j)];
    k=k+1;
  end
end

data(:,3)=data(:,3)-min(data(:,3));
k=1;l=1;m=1;
for i=1:40000
	if(data(i,3)<=2.3)
	  cf_68(k,:)=[data(i,1),data(i,2)];
	  k=k+1;
	elseif(data(i,3)<=6.18)
	  cf_95(l,:)=[data(i,1),data(i,2)];
	  l=l+1;
	elseif(data(i,3)<=11.83)
	  cf_99(m,:)=[data(i,1),data(i,2)];
	  m=m+1;
	endif
end


cf_68=cf_68';
cf_95=cf_95';
cf_99=cf_99';

file = fopen('db_octave_confidence_region_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68); fclose(file);
file = fopen('db_octave_confidence_region_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95); fclose(file);
file = fopen('db_octave_confidence_region_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99); fclose(file);

cl_68=load("../daya_for_global_analysis/db_data/db2018_cl68.dat");
cl_95=load("../daya_for_global_analysis/db_data/db2018_cl95.dat");
cl_99=load("../daya_for_global_analysis/db_data/db2018_cl99.dat");
cf_68=load("db_octave_confidence_region_68.dat");
cf_95=load("db_octave_confidence_region_95.dat");
cf_99=load("db_octave_confidence_region_99.dat");

plot(cl_68(:,1),cl_68(:,2),'h',"markersize", 10,"linewidth",10,
     cl_95(:,1),cl_95(:,2),'h',"markersize", 10,"linewidth",10,
     cl_99(:,1),cl_99(:,2),'h',"markersize", 10,"linewidth",10,
     cf_68(:,1),cf_68(:,2),'h',"markersize", 10,"linewidth",10,
     cf_95(:,1),cf_95(:,2),'h',"markersize", 10,"linewidth",10,
     cf_99(:,1),cf_99(:,2),'h',"markersize", 10,"linewidth",10)
axis ([0.065, 0.105, 0.0022, 0.002801]); ylabel('\Deltam^{2}_{ee}');xlabel('sin^2 2\theta_{13}');

#file1 = fopen('xmgrace_data_origin.dat', 'w');
#fprintf(file1,'%d %d %d \n' ,data);
#fclose(file1);