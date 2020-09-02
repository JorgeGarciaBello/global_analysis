# reno_surface_far
cl_68=load("reno2018_cl68.dat");
cl_95=load("reno2018_cl95.dat");
cl_99=load("reno2018_cl99.dat");
data=load("reno_data_far_approach.dat");
min_data=load("min_param_reno_data_far_approach.dat");

n=1000
minimio=min(data(:,3))
data(:,3)=data(:,3)-minimio;
k=1;l=1;m=1;
for i=1:n*n
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

cf_68=cf_68'; cf_95=cf_95'; cf_99=cf_99';
file = fopen('reno_confidence_region_far_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68); fclose(file);
file = fopen('reno_confidence_region_far_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95); fclose(file);
file = fopen('reno_confidence_region_far_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99); fclose(file);
cf_68_far=load("reno_confidence_region_far_68.dat");
cf_95_far=load("reno_confidence_region_far_95.dat");
cf_99_far=load("reno_confidence_region_far_99.dat");

graphics_toolkit("gnuplot");
plot(cf_68_far(:,1),cf_68_far(:,2),'h',"markersize", 1,"linewidth",2,
     cf_95_far(:,1),cf_95_far(:,2),'h',"markersize", 1,"linewidth",2,
     cf_99_far(:,1),cf_99_far(:,2),'h',"markersize", 1,"linewidth",2,
     cl_68(:,1),cl_68(:,2),'h',"markersize", 1,"linewidth",2,
     cl_95(:,1),cl_95(:,2),'h',"markersize", 1,"linewidth",2,
     cl_99(:,1),cl_99(:,2),'h',"markersize", 1,"linewidth",2,
     min_data(2),min_data(3),'+',"color",[0.0,0.0,0.0],"markersize", 10,"linewidth",3);

axis ([0.0, 0.2, 0.0017, 0.003501]); ylabel('\Deltam^{2}_{ee}');xlabel('sin^2 2\theta_{13}');