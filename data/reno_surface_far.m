# reno_surface
cl_68=load("reno2018_cl68.dat");
cl_95=load("reno2018_cl95.dat");
cl_99=load("reno2018_cl99.dat");

data=load("reno_data_far_approach.dat");
data_min=load("min_param_reno_data_far_approach.dat");

n=200
minimio=min(data(:,3))
data(:,3)=data(:,3)-minimio;
k=1;l=1;m=1;
for i=1:n*n
	if((data(i,3)<=2.3) && (data(i,3)>=2.1))
	  cf_68(k,:)=[data(i,1),data(i,2)];
	  k=k+1;
	elseif((data(i,3)<=6.18) && (data(i,3)>=5.95))
	  cf_95(l,:)=[data(i,1),data(i,2)];
	  l=l+1;
	elseif((data(i,3)<=11.83) && (data(i,3)>=11.7))
	  cf_99(m,:)=[data(i,1),data(i,2)];
	  m=m+1;
	endif
end

cf_68=cf_68'; cf_95=cf_95'; cf_99=cf_99';
 file = fopen('reno_confidence_region_far_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68); fclose(file);
 file = fopen('reno_confidence_region_far_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95); fclose(file);
 file = fopen('reno_confidence_region_far_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99); fclose(file);
 cf_68=load("reno_confidence_region_far_68.dat");
 cf_95=load("reno_confidence_region_far_95.dat");
 cf_99=load("reno_confidence_region_far_99.dat");

plot(cl_68(:,1),cl_68(:,2),'h',"color",[0.0,0.7,0.95],"markersize", 2, "linewidth",3,
     cl_95(:,1),cl_95(:,2),'h',"color",[0.0,0.9,1.0],"markersize", 2,  "linewidth",3,
     cl_99(:,1),cl_99(:,2),'h',"color",[0.0,0.4,0.98],"markersize", 2, "linewidth",3,
     cf_68(:,1),cf_68(:,2),'h',"color",[0.0,0.0,0.0],"markersize", 2 , "linewidth",1,
     cf_95(:,1),cf_95(:,2),'h',"color",[1.0,0.0,0.0],"markersize", 2 , "linewidth",1,
     cf_99(:,1),cf_99(:,2),'h',"color",[0.0,0.7,0.0],"markersize", 2  ,"linewidth",1,
     data_min(1,2),data_min(1,3),'+',"color",[0.0,0.0,0.0],"markersize", 10,"linewidth",3);

axis ([0.0, 0.2, 0.0017, 0.003501]); ylabel('\Deltam^{2}_{ee}   [eV^{2}]');xlabel('sin^2 2\theta_{13}');
set(gca, 'xticklabelmode', 'manual') 
set(gca, 'xtick', 0:0.05:0.2,'ytick', [0.0020,0.0025,0.0030 ,0.0035],'yticklabel',{'2.0x10^{-3}','2.5x10^{-3}','3.0x10^{-3}','3.5x10^{-3}'} );
h = legend ({ "99.7% C.L. from RENO", "95.5% C.L. from RENO", "68.3% C.L. from RENO","99.7% C.L. ", "95.5% C.L. ", "68.3% C.L. ","Best fit"});
legend boxoff
set(h,"fontsize",10);
#print -depsc reno.eps