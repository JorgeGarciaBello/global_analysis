# testing_sigma_thermal_power_and_energy
x=load("db_s22t13_grid_data.dat");
y=load("db_dm_grid_data.dat");
z11=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_1_E_1.dat");
z12=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_1_E_2.dat");
z13=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_1_E_3.dat");
z14=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_1_E_4.dat");
z15=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_1_E_5.dat");
z16=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_1_E_6.dat");
z17=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_1_E_7.dat");
z18=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_1_E_8.dat");

z21=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_2_E_1.dat");
z22=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_2_E_2.dat");
z23=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_2_E_3.dat");
z24=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_2_E_4.dat");
z25=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_2_E_5.dat");
z26=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_2_E_6.dat");
z27=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_2_E_7.dat");
z28=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_2_E_8.dat");

z31=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_3_E_1.dat");
z32=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_3_E_2.dat");
z33=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_3_E_3.dat");
z34=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_3_E_4.dat");
z35=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_3_E_5.dat");
z36=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_3_E_6.dat");
z37=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_3_E_7.dat");
z38=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_3_E_8.dat");

z41=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_4_E_1.dat");
z42=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_4_E_2.dat");
z43=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_4_E_3.dat");
z44=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_4_E_4.dat");
 z45=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_4_E_5.dat");
 z46=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_4_E_6.dat");
 z47=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_4_E_7.dat");
 z48=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_4_E_8.dat");

 z51=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_5_E_1.dat");
 z52=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_5_E_2.dat");
 z53=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_5_E_3.dat");
 z54=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_5_E_4.dat");
 z55=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_5_E_5.dat");
 z56=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_5_E_6.dat");
 z57=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_5_E_7.dat");
 z58=load("db_chi_matrix_db_sigma_TPWR_energy_test_M_TP_5_E_8.dat");

xi=linspace(x(1),x(20),100);
yi=linspace(y(1),y(20),100);
for i=1:100
  for j=1:100
    z11i(i,j) = interp2 (x, y, z11, xi(i), yi(j));
    z12i(i,j) = interp2 (x, y, z12, xi(i), yi(j));
    z13i(i,j) = interp2 (x, y, z13, xi(i), yi(j));
    z14i(i,j) = interp2 (x, y, z14, xi(i), yi(j));
    z15i(i,j) = interp2 (x, y, z15, xi(i), yi(j));
    z16i(i,j) = interp2 (x, y, z16, xi(i), yi(j));
    z17i(i,j) = interp2 (x, y, z17, xi(i), yi(j));
    z18i(i,j) = interp2 (x, y, z18, xi(i), yi(j));

    z21i(i,j) = interp2 (x, y, z21, xi(i), yi(j));
    z22i(i,j) = interp2 (x, y, z22, xi(i), yi(j));
    z23i(i,j) = interp2 (x, y, z23, xi(i), yi(j));
    z24i(i,j) = interp2 (x, y, z24, xi(i), yi(j));
    z25i(i,j) = interp2 (x, y, z25, xi(i), yi(j));
    z26i(i,j) = interp2 (x, y, z26, xi(i), yi(j));
    z27i(i,j) = interp2 (x, y, z27, xi(i), yi(j));
    z28i(i,j) = interp2 (x, y, z28, xi(i), yi(j));

    z31i(i,j) = interp2 (x, y, z31, xi(i), yi(j));
    z32i(i,j) = interp2 (x, y, z32, xi(i), yi(j));
    z33i(i,j) = interp2 (x, y, z33, xi(i), yi(j));
    z34i(i,j) = interp2 (x, y, z34, xi(i), yi(j));
    z35i(i,j) = interp2 (x, y, z35, xi(i), yi(j));
    z36i(i,j) = interp2 (x, y, z36, xi(i), yi(j));
    z37i(i,j) = interp2 (x, y, z37, xi(i), yi(j));
    z38i(i,j) = interp2 (x, y, z38, xi(i), yi(j));

    z41i(i,j) = interp2 (x, y, z41, xi(i), yi(j));
    z42i(i,j) = interp2 (x, y, z42, xi(i), yi(j));
    z43i(i,j) = interp2 (x, y, z43, xi(i), yi(j));
    z44i(i,j) = interp2 (x, y, z44, xi(i), yi(j));
    z45i(i,j) = interp2 (x, y, z45, xi(i), yi(j));
    z46i(i,j) = interp2 (x, y, z46, xi(i), yi(j));
    z47i(i,j) = interp2 (x, y, z47, xi(i), yi(j));
    z48i(i,j) = interp2 (x, y, z48, xi(i), yi(j));

    z51i(i,j) = interp2 (x, y, z51, xi(i), yi(j));
    z52i(i,j) = interp2 (x, y, z52, xi(i), yi(j));
    z53i(i,j) = interp2 (x, y, z53, xi(i), yi(j));
    z54i(i,j) = interp2 (x, y, z54, xi(i), yi(j));
    z55i(i,j) = interp2 (x, y, z55, xi(i), yi(j));
    z56i(i,j) = interp2 (x, y, z56, xi(i), yi(j));
    z57i(i,j) = interp2 (x, y, z57, xi(i), yi(j));
    z58i(i,j) = interp2 (x, y, z58, xi(i), yi(j));
  end
end
k=1;
for i=1:100
  for j=1:100
    data11(k,:)=[xi(i), yi(j), z11i(i,j)];
		data12(k,:)=[xi(i), yi(j), z12i(i,j)];
		data13(k,:)=[xi(i), yi(j), z13i(i,j)];
		data14(k,:)=[xi(i), yi(j), z14i(i,j)];
		data15(k,:)=[xi(i), yi(j), z15i(i,j)];
		data16(k,:)=[xi(i), yi(j), z16i(i,j)];
		data17(k,:)=[xi(i), yi(j), z17i(i,j)];
		data18(k,:)=[xi(i), yi(j), z18i(i,j)];

		data21(k,:)=[xi(i), yi(j), z21i(i,j)];
		data22(k,:)=[xi(i), yi(j), z22i(i,j)];
		data23(k,:)=[xi(i), yi(j), z23i(i,j)];
		data24(k,:)=[xi(i), yi(j), z24i(i,j)];
		data25(k,:)=[xi(i), yi(j), z25i(i,j)];
		data26(k,:)=[xi(i), yi(j), z26i(i,j)];
		data27(k,:)=[xi(i), yi(j), z27i(i,j)];
		data28(k,:)=[xi(i), yi(j), z28i(i,j)];

		data31(k,:)=[xi(i), yi(j), z31i(i,j)];
		data32(k,:)=[xi(i), yi(j), z32i(i,j)];
		data33(k,:)=[xi(i), yi(j), z33i(i,j)];
		data34(k,:)=[xi(i), yi(j), z34i(i,j)];
		data35(k,:)=[xi(i), yi(j), z35i(i,j)];
		data36(k,:)=[xi(i), yi(j), z36i(i,j)];
		data37(k,:)=[xi(i), yi(j), z37i(i,j)];
		data38(k,:)=[xi(i), yi(j), z38i(i,j)];

		data41(k,:)=[xi(i), yi(j), z41i(i,j)];
		data42(k,:)=[xi(i), yi(j), z42i(i,j)];
		data43(k,:)=[xi(i), yi(j), z43i(i,j)];
		data44(k,:)=[xi(i), yi(j), z44i(i,j)];
		data45(k,:)=[xi(i), yi(j), z45i(i,j)];
		data46(k,:)=[xi(i), yi(j), z46i(i,j)];
		data47(k,:)=[xi(i), yi(j), z47i(i,j)];
		data48(k,:)=[xi(i), yi(j), z48i(i,j)];

		data51(k,:)=[xi(i), yi(j), z51i(i,j)];
		data52(k,:)=[xi(i), yi(j), z52i(i,j)];
		data53(k,:)=[xi(i), yi(j), z53i(i,j)];
		data54(k,:)=[xi(i), yi(j), z54i(i,j)];
		data55(k,:)=[xi(i), yi(j), z55i(i,j)];
		data56(k,:)=[xi(i), yi(j), z56i(i,j)];
		data57(k,:)=[xi(i), yi(j), z57i(i,j)];
		data58(k,:)=[xi(i), yi(j), z58i(i,j)];
    k=k+1;
  end
end
data11(:,3)=data11(:,3)-min(data11(:,3));
data12(:,3)=data12(:,3)-min(data12(:,3));
data13(:,3)=data13(:,3)-min(data13(:,3));
data14(:,3)=data14(:,3)-min(data14(:,3));
data15(:,3)=data15(:,3)-min(data15(:,3));
data16(:,3)=data16(:,3)-min(data16(:,3));
data17(:,3)=data17(:,3)-min(data17(:,3));
data18(:,3)=data18(:,3)-min(data18(:,3));

data21(:,3)=data21(:,3)-min(data21(:,3));
data22(:,3)=data22(:,3)-min(data22(:,3));
data23(:,3)=data23(:,3)-min(data23(:,3));
data24(:,3)=data24(:,3)-min(data24(:,3));
data25(:,3)=data25(:,3)-min(data25(:,3));
data26(:,3)=data26(:,3)-min(data26(:,3));
data27(:,3)=data27(:,3)-min(data27(:,3));
data28(:,3)=data28(:,3)-min(data28(:,3));

data31(:,3)=data31(:,3)-min(data31(:,3));
data32(:,3)=data32(:,3)-min(data32(:,3));
data33(:,3)=data33(:,3)-min(data33(:,3));
data34(:,3)=data34(:,3)-min(data34(:,3));
data35(:,3)=data35(:,3)-min(data35(:,3));
data36(:,3)=data36(:,3)-min(data36(:,3));
data37(:,3)=data37(:,3)-min(data37(:,3));
data38(:,3)=data38(:,3)-min(data38(:,3));

data41(:,3)=data41(:,3)-min(data41(:,3));
data42(:,3)=data42(:,3)-min(data42(:,3));
data43(:,3)=data43(:,3)-min(data43(:,3));
data44(:,3)=data44(:,3)-min(data44(:,3));
 data45(:,3)=data45(:,3)-min(data45(:,3));
 data46(:,3)=data46(:,3)-min(data46(:,3));
 data47(:,3)=data47(:,3)-min(data47(:,3));
 data48(:,3)=data48(:,3)-min(data48(:,3));

 data51(:,3)=data51(:,3)-min(data51(:,3));
 data52(:,3)=data52(:,3)-min(data52(:,3));
 data53(:,3)=data53(:,3)-min(data53(:,3));
 data54(:,3)=data54(:,3)-min(data54(:,3));
 data55(:,3)=data55(:,3)-min(data55(:,3));
 data56(:,3)=data56(:,3)-min(data56(:,3));
 data57(:,3)=data57(:,3)-min(data57(:,3));
 data58(:,3)=data58(:,3)-min(data58(:,3));
k=1;l=1;m=1;
for i=1:10000
	if(data11(i,3)<=2.3)
	  cf_68_11(k,:)=[data11(i,1),data11(i,2)];
	  k=k+1;
	elseif(data11(i,3)<=6.18)
	  cf_95_11(l,:)=[data11(i,1),data11(i,2)];
	  l=l+1;
	elseif(data11(i,3)<=11.83)
	  cf_99_11(m,:)=[data11(i,1),data11(i,2)];
	  m=m+1;
	endif
end

k=1;l=1;m=1;
for i=1:10000
	if(data12(i,3)<=2.3)
	  cf_68_12(k,:)=[data12(i,1),data12(i,2)];
	  k=k+1;
	elseif(data12(i,3)<=6.18)
	  cf_95_12(l,:)=[data12(i,1),data12(i,2)];
	  l=l+1;
	elseif(data12(i,3)<=11.83)
	  cf_99_12(m,:)=[data12(i,1),data12(i,2)];
	  m=m+1;
	endif	
end

k=1;l=1;m=1;
for i=1:10000
	if(data13(i,3)<=2.3)
	  cf_68_13(k,:)=[data13(i,1),data13(i,2)];
	  k=k+1;
	elseif(data13(i,3)<=6.18)
	  cf_95_13(l,:)=[data13(i,1),data13(i,2)];
	  l=l+1;
	elseif(data13(i,3)<=11.83)
	  cf_99_13(m,:)=[data13(i,1),data13(i,2)];
	  m=m+1;
	endif	
end

k=1;l=1;m=1;
for i=1:10000
	if(data14(i,3)<=2.3)
	  cf_68_14(k,:)=[data14(i,1),data14(i,2)];
	  k=k+1;
	elseif(data14(i,3)<=6.18)
	  cf_95_14(l,:)=[data14(i,1),data14(i,2)];
	  l=l+1;
	elseif(data14(i,3)<=11.83)
	  cf_99_14(m,:)=[data14(i,1),data14(i,2)];
	  m=m+1;
	endif	
end

k=1;l=1;m=1;
for i=1:10000
	if(data15(i,3)<=2.3)
	  cf_68_15(k,:)=[data15(i,1),data15(i,2)];
	  k=k+1;
	elseif(data15(i,3)<=6.18)
	  cf_95_15(l,:)=[data15(i,1),data15(i,2)];
	  l=l+1;
	elseif(data15(i,3)<=11.83)
	  cf_99_15(m,:)=[data15(i,1),data15(i,2)];
	  m=m+1;
	endif	
end

k=1;l=1;m=1;
for i=1:10000
	if(data16(i,3)<=2.3)
	  cf_68_16(k,:)=[data16(i,1),data16(i,2)];
	  k=k+1;
	elseif(data16(i,3)<=6.18)
	  cf_95_16(l,:)=[data16(i,1),data16(i,2)];
	  l=l+1;
	elseif(data16(i,3)<=11.83)
	  cf_99_16(m,:)=[data16(i,1),data16(i,2)];
	  m=m+1;
	endif	
end

k=1;l=1;m=1;
for i=1:10000
	if(data17(i,3)<=2.3)
	  cf_68_17(k,:)=[data17(i,1),data17(i,2)];
	  k=k+1;
	elseif(data17(i,3)<=6.18)
	  cf_95_17(l,:)=[data17(i,1),data17(i,2)];
	  l=l+1;
	elseif(data17(i,3)<=11.83)
	  cf_99_17(m,:)=[data17(i,1),data17(i,2)];
	  m=m+1;
	endif	
end

k=1;l=1;m=1;
for i=1:10000
	if(data18(i,3)<=2.3)
	  cf_68_18(k,:)=[data18(i,1),data18(i,2)];
	  k=k+1;
	elseif(data18(i,3)<=6.18)
	  cf_95_18(l,:)=[data18(i,1),data18(i,2)];
	  l=l+1;
	elseif(data18(i,3)<=11.83)
	  cf_99_18(m,:)=[data18(i,1),data18(i,2)];
	  m=m+1;
	endif	
end

k=1;l=1;m=1;
for i=1:10000
  if(data21(i,3)<=2.3)
    cf_68_21(k,:)=[data21(i,1),data21(i,2)];
    k=k+1;
  elseif(data21(i,3)<=6.18)
    cf_95_21(l,:)=[data21(i,1),data21(i,2)];
    l=l+1;
  elseif(data21(i,3)<=11.83)
    cf_99_21(m,:)=[data21(i,1),data21(i,2)];
    m=m+1;
  endif
end

k=1;l=1;m=1;
for i=1:10000
  if(data22(i,3)<=2.3)
    cf_68_22(k,:)=[data22(i,1),data22(i,2)];
    k=k+1;
  elseif(data22(i,3)<=6.18)
    cf_95_22(l,:)=[data22(i,1),data22(i,2)];
    l=l+1;
  elseif(data22(i,3)<=11.83)
    cf_99_22(m,:)=[data22(i,1),data22(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data23(i,3)<=2.3)
    cf_68_23(k,:)=[data23(i,1),data23(i,2)];
    k=k+1;
  elseif(data23(i,3)<=6.18)
    cf_95_23(l,:)=[data23(i,1),data23(i,2)];
    l=l+1;
  elseif(data23(i,3)<=11.83)
    cf_99_23(m,:)=[data23(i,1),data23(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data24(i,3)<=2.3)
    cf_68_24(k,:)=[data24(i,1),data24(i,2)];
    k=k+1;
  elseif(data24(i,3)<=6.18)
    cf_95_24(l,:)=[data24(i,1),data24(i,2)];
    l=l+1;
  elseif(data24(i,3)<=11.83)
    cf_99_24(m,:)=[data24(i,1),data24(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data25(i,3)<=2.3)
    cf_68_25(k,:)=[data25(i,1),data25(i,2)];
    k=k+1;
  elseif(data25(i,3)<=6.18)
    cf_95_25(l,:)=[data25(i,1),data25(i,2)];
    l=l+1;
  elseif(data25(i,3)<=11.83)
    cf_99_25(m,:)=[data25(i,1),data25(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data26(i,3)<=2.3)
    cf_68_26(k,:)=[data26(i,1),data26(i,2)];
    k=k+1;
  elseif(data26(i,3)<=6.18)
    cf_95_26(l,:)=[data26(i,1),data26(i,2)];
    l=l+1;
  elseif(data26(i,3)<=11.83)
    cf_99_26(m,:)=[data26(i,1),data26(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data27(i,3)<=2.3)
    cf_68_27(k,:)=[data27(i,1),data27(i,2)];
    k=k+1;
  elseif(data27(i,3)<=6.18)
    cf_95_27(l,:)=[data27(i,1),data27(i,2)];
    l=l+1;
  elseif(data27(i,3)<=11.83)
    cf_99_27(m,:)=[data27(i,1),data27(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data28(i,3)<=2.3)
    cf_68_28(k,:)=[data28(i,1),data28(i,2)];
    k=k+1;
  elseif(data28(i,3)<=6.18)
    cf_95_28(l,:)=[data28(i,1),data28(i,2)];
    l=l+1;
  elseif(data28(i,3)<=11.83)
    cf_99_28(m,:)=[data28(i,1),data28(i,2)];
    m=m+1;
  endif 
end


k=1;l=1;m=1;
for i=1:10000
  if(data31(i,3)<=2.3)
    cf_68_31(k,:)=[data31(i,1),data31(i,2)];
    k=k+1;
  elseif(data31(i,3)<=6.18)
    cf_95_31(l,:)=[data31(i,1),data31(i,2)];
    l=l+1;
  elseif(data31(i,3)<=11.83)
    cf_99_31(m,:)=[data31(i,1),data31(i,2)];
    m=m+1;
  endif
end

k=1;l=1;m=1;
for i=1:10000
  if(data32(i,3)<=2.3)
    cf_68_32(k,:)=[data32(i,1),data32(i,2)];
    k=k+1;
  elseif(data32(i,3)<=6.18)
    cf_95_32(l,:)=[data32(i,1),data32(i,2)];
    l=l+1;
  elseif(data32(i,3)<=11.83)
    cf_99_32(m,:)=[data32(i,1),data32(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data33(i,3)<=2.3)
    cf_68_33(k,:)=[data33(i,1),data33(i,2)];
    k=k+1;
  elseif(data33(i,3)<=6.18)
    cf_95_33(l,:)=[data33(i,1),data33(i,2)];
    l=l+1;
  elseif(data33(i,3)<=11.83)
    cf_99_33(m,:)=[data33(i,1),data33(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data34(i,3)<=2.3)
    cf_68_34(k,:)=[data34(i,1),data34(i,2)];
    k=k+1;
  elseif(data34(i,3)<=6.18)
    cf_95_34(l,:)=[data34(i,1),data34(i,2)];
    l=l+1;
  elseif(data34(i,3)<=11.83)
    cf_99_34(m,:)=[data34(i,1),data34(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data35(i,3)<=2.3)
    cf_68_35(k,:)=[data35(i,1),data35(i,2)];
    k=k+1;
  elseif(data35(i,3)<=6.18)
    cf_95_35(l,:)=[data35(i,1),data35(i,2)];
    l=l+1;
  elseif(data35(i,3)<=11.83)
    cf_99_35(m,:)=[data35(i,1),data35(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data36(i,3)<=2.3)
    cf_68_36(k,:)=[data36(i,1),data36(i,2)];
    k=k+1;
  elseif(data36(i,3)<=6.18)
    cf_95_36(l,:)=[data36(i,1),data36(i,2)];
    l=l+1;
  elseif(data36(i,3)<=11.83)
    cf_99_36(m,:)=[data36(i,1),data36(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data37(i,3)<=2.3)
    cf_68_37(k,:)=[data37(i,1),data37(i,2)];
    k=k+1;
  elseif(data37(i,3)<=6.18)
    cf_95_37(l,:)=[data37(i,1),data37(i,2)];
    l=l+1;
  elseif(data37(i,3)<=11.83)
    cf_99_37(m,:)=[data37(i,1),data37(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data38(i,3)<=2.3)
    cf_68_38(k,:)=[data38(i,1),data38(i,2)];
    k=k+1;
  elseif(data38(i,3)<=6.18)
    cf_95_38(l,:)=[data38(i,1),data38(i,2)];
    l=l+1;
  elseif(data38(i,3)<=11.83)
    cf_99_38(m,:)=[data38(i,1),data38(i,2)];
    m=m+1;
  endif 
end


k=1;l=1;m=1;
for i=1:10000
  if(data41(i,3)<=2.3)
    cf_68_41(k,:)=[data41(i,1),data41(i,2)];
    k=k+1;
  elseif(data41(i,3)<=6.18)
    cf_95_41(l,:)=[data41(i,1),data41(i,2)];
    l=l+1;
  elseif(data41(i,3)<=11.83)
    cf_99_41(m,:)=[data41(i,1),data41(i,2)];
    m=m+1;
  endif
end

k=1;l=1;m=1;
for i=1:10000
  if(data42(i,3)<=2.3)
    cf_68_42(k,:)=[data42(i,1),data42(i,2)];
    k=k+1;
  elseif(data42(i,3)<=6.18)
    cf_95_42(l,:)=[data42(i,1),data42(i,2)];
    l=l+1;
  elseif(data42(i,3)<=11.83)
    cf_99_42(m,:)=[data42(i,1),data42(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data43(i,3)<=2.3)
    cf_68_43(k,:)=[data43(i,1),data43(i,2)];
    k=k+1;
  elseif(data43(i,3)<=6.18)
    cf_95_43(l,:)=[data43(i,1),data43(i,2)];
    l=l+1;
  elseif(data43(i,3)<=11.83)
    cf_99_43(m,:)=[data43(i,1),data43(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data44(i,3)<=2.3)
    cf_68_44(k,:)=[data44(i,1),data44(i,2)];
    k=k+1;
  elseif(data44(i,3)<=6.18)
    cf_95_44(l,:)=[data44(i,1),data44(i,2)];
    l=l+1;
  elseif(data44(i,3)<=11.83)
    cf_99_44(m,:)=[data44(i,1),data44(i,2)];
    m=m+1;
  endif 
end

 k=1;l=1;m=1;
 for i=1:10000
   if(data45(i,3)<=2.3)
    cf_68_45(k,:)=[data45(i,1),data45(i,2)];
    k=k+1;
  elseif(data45(i,3)<=6.18)
    cf_95_45(l,:)=[data45(i,1),data45(i,2)];
    l=l+1;
  elseif(data45(i,3)<=11.83)
    cf_99_45(m,:)=[data45(i,1),data45(i,2)];
    m=m+1;
  endif 
 end

 k=1;l=1;m=1;
 for i=1:10000
   if(data46(i,3)<=2.3)
     cf_68_46(k,:)=[data46(i,1),data46(i,2)];
     k=k+1;
   elseif(data46(i,3)<=6.18)
     cf_95_46(l,:)=[data46(i,1),data46(i,2)];
     l=l+1;
   elseif(data46(i,3)<=11.83)
     cf_99_46(m,:)=[data46(i,1),data46(i,2)];
     m=m+1;
   endif 
 end

k=1;l=1;m=1;
for i=1:10000
  if(data47(i,3)<=2.3)
    cf_68_47(k,:)=[data47(i,1),data47(i,2)];
    k=k+1;
  elseif(data47(i,3)<=6.18)
    cf_95_47(l,:)=[data47(i,1),data47(i,2)];
    l=l+1;
  elseif(data47(i,3)<=11.83)
    cf_99_47(m,:)=[data47(i,1),data47(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data48(i,3)<=2.3)
    cf_68_48(k,:)=[data48(i,1),data48(i,2)];
    k=k+1;
  elseif(data48(i,3)<=6.18)
    cf_95_48(l,:)=[data48(i,1),data48(i,2)];
    l=l+1;
  elseif(data48(i,3)<=11.83)
    cf_99_48(m,:)=[data48(i,1),data48(i,2)];
    m=m+1;
  endif 
end


k=1;l=1;m=1;
for i=1:10000
  if(data51(i,3)<=2.3)
    cf_68_51(k,:)=[data51(i,1),data51(i,2)];
    k=k+1;
  elseif(data51(i,3)<=6.18)
    cf_95_51(l,:)=[data51(i,1),data51(i,2)];
    l=l+1;
  elseif(data51(i,3)<=11.83)
    cf_99_51(m,:)=[data51(i,1),data51(i,2)];
    m=m+1;
  endif
end

k=1;l=1;m=1;
for i=1:10000
  if(data52(i,3)<=2.3)
    cf_68_52(k,:)=[data52(i,1),data52(i,2)];
    k=k+1;
  elseif(data52(i,3)<=6.18)
    cf_95_52(l,:)=[data52(i,1),data52(i,2)];
    l=l+1;
  elseif(data52(i,3)<=11.83)
    cf_99_52(m,:)=[data52(i,1),data52(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data53(i,3)<=2.3)
    cf_68_53(k,:)=[data53(i,1),data53(i,2)];
    k=k+1;
  elseif(data53(i,3)<=6.18)
    cf_95_53(l,:)=[data53(i,1),data53(i,2)];
    l=l+1;
  elseif(data53(i,3)<=11.83)
    cf_99_53(m,:)=[data53(i,1),data53(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data54(i,3)<=2.3)
    cf_68_54(k,:)=[data54(i,1),data54(i,2)];
    k=k+1;
  elseif(data54(i,3)<=6.18)
    cf_95_54(l,:)=[data54(i,1),data54(i,2)];
    l=l+1;
  elseif(data54(i,3)<=11.83)
    cf_99_54(m,:)=[data54(i,1),data54(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data55(i,3)<=2.3)
    cf_68_55(k,:)=[data55(i,1),data55(i,2)];
    k=k+1;
  elseif(data55(i,3)<=6.18)
    cf_95_55(l,:)=[data55(i,1),data55(i,2)];
    l=l+1;
  elseif(data55(i,3)<=11.83)
    cf_99_55(m,:)=[data55(i,1),data55(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data56(i,3)<=2.3)
    cf_68_56(k,:)=[data56(i,1),data56(i,2)];
    k=k+1;
  elseif(data56(i,3)<=6.18)
    cf_95_56(l,:)=[data56(i,1),data56(i,2)];
    l=l+1;
  elseif(data56(i,3)<=11.83)
    cf_99_56(m,:)=[data56(i,1),data56(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data57(i,3)<=2.3)
    cf_68_57(k,:)=[data57(i,1),data57(i,2)];
    k=k+1;
  elseif(data57(i,3)<=6.18)
    cf_95_57(l,:)=[data57(i,1),data57(i,2)];
    l=l+1;
  elseif(data57(i,3)<=11.83)
    cf_99_57(m,:)=[data57(i,1),data57(i,2)];
    m=m+1;
  endif 
end

k=1;l=1;m=1;
for i=1:10000
  if(data58(i,3)<=2.3)
    cf_68_58(k,:)=[data58(i,1),data58(i,2)];
    k=k+1;
  elseif(data58(i,3)<=6.18)
    cf_95_58(l,:)=[data58(i,1),data58(i,2)];
    l=l+1;
  elseif(data58(i,3)<=11.83)
    cf_99_58(m,:)=[data58(i,1),data58(i,2)];
    m=m+1;
  endif 
end



cf_68_11=cf_68_11';cf_95_11=cf_95_11';cf_99_11=cf_99_11';
cf_68_12=cf_68_12';cf_95_12=cf_95_12';cf_99_12=cf_99_12';
cf_68_13=cf_68_13';cf_95_13=cf_95_13';cf_99_13=cf_99_13';
cf_68_14=cf_68_14';cf_95_14=cf_95_14';cf_99_14=cf_99_14';
cf_68_15=cf_68_15';cf_95_15=cf_95_15';cf_99_15=cf_99_15';
cf_68_16=cf_68_16';cf_95_16=cf_95_16';cf_99_16=cf_99_16';
cf_68_17=cf_68_17';cf_95_17=cf_95_17';cf_99_17=cf_99_17';
cf_68_18=cf_68_18';cf_95_18=cf_95_18';cf_99_18=cf_99_18';

cf_68_21=cf_68_21';cf_95_21=cf_95_21';cf_99_21=cf_99_21';
cf_68_22=cf_68_22';cf_95_22=cf_95_22';cf_99_22=cf_99_22';
cf_68_23=cf_68_23';cf_95_23=cf_95_23';cf_99_23=cf_99_23';
cf_68_24=cf_68_24';cf_95_24=cf_95_24';cf_99_24=cf_99_24';
cf_68_25=cf_68_25';cf_95_25=cf_95_25';cf_99_25=cf_99_25';
cf_68_26=cf_68_26';cf_95_26=cf_95_26';cf_99_26=cf_99_26';
cf_68_27=cf_68_27';cf_95_27=cf_95_27';cf_99_27=cf_99_27';
cf_68_28=cf_68_28';cf_95_28=cf_95_28';cf_99_28=cf_99_28';

cf_68_31=cf_68_31';cf_95_31=cf_95_31';cf_99_31=cf_99_31';
cf_68_32=cf_68_32';cf_95_32=cf_95_32';cf_99_32=cf_99_32';
cf_68_33=cf_68_33';cf_95_33=cf_95_33';cf_99_33=cf_99_33';
cf_68_34=cf_68_34';cf_95_34=cf_95_34';cf_99_34=cf_99_34';
cf_68_35=cf_68_35';cf_95_35=cf_95_35';cf_99_35=cf_99_35';
cf_68_36=cf_68_36';cf_95_36=cf_95_36';cf_99_36=cf_99_36';
cf_68_37=cf_68_37';cf_95_37=cf_95_37';cf_99_37=cf_99_37';
cf_68_38=cf_68_38';cf_95_38=cf_95_38';cf_99_38=cf_99_38';

cf_68_41=cf_68_41';cf_95_41=cf_95_41';cf_99_41=cf_99_41';
cf_68_42=cf_68_42';cf_95_42=cf_95_42';cf_99_42=cf_99_42';
cf_68_43=cf_68_43';cf_95_43=cf_95_43';cf_99_43=cf_99_43';
cf_68_44=cf_68_44';cf_95_44=cf_95_44';cf_99_44=cf_99_44';
cf_68_45=cf_68_45';cf_95_45=cf_95_45';cf_99_45=cf_99_45';
cf_68_46=cf_68_46';cf_95_46=cf_95_46';cf_99_46=cf_99_46';
cf_68_47=cf_68_47';cf_95_47=cf_95_47';cf_99_47=cf_99_47';
cf_68_48=cf_68_48';cf_95_48=cf_95_48';cf_99_48=cf_99_48';

cf_68_51=cf_68_51';cf_95_51=cf_95_51';cf_99_51=cf_99_51';
cf_68_52=cf_68_52';cf_95_52=cf_95_52';cf_99_52=cf_99_52';
cf_68_53=cf_68_53';cf_95_53=cf_95_53';cf_99_53=cf_99_53';
cf_68_54=cf_68_54';cf_95_54=cf_95_54';cf_99_54=cf_99_54';
cf_68_55=cf_68_55';cf_95_55=cf_95_55';cf_99_55=cf_99_55';
cf_68_56=cf_68_56';cf_95_56=cf_95_56';cf_99_56=cf_99_56';
cf_68_57=cf_68_57';cf_95_57=cf_95_57';cf_99_57=cf_99_57';
cf_68_58=cf_68_58';cf_95_58=cf_95_58';cf_99_58=cf_99_58';


file = fopen('octave_sigma_M_TP_1_E_1_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_11); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_1_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_11); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_1_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_11); fclose(file);

file = fopen('octave_sigma_M_TP_1_E_2_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_12); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_2_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_12); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_2_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_12); fclose(file);

file = fopen('octave_sigma_M_TP_1_E_3_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_13); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_3_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_13); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_3_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_13); fclose(file);

file = fopen('octave_sigma_M_TP_1_E_4_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_14); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_4_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_14); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_4_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_14); fclose(file);

file = fopen('octave_sigma_M_TP_1_E_5_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_15); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_5_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_15); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_5_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_15); fclose(file);

file = fopen('octave_sigma_M_TP_1_E_6_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_16); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_6_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_16); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_6_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_16); fclose(file);

file = fopen('octave_sigma_M_TP_1_E_7_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_17); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_7_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_17); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_7_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_17); fclose(file);

file = fopen('octave_sigma_M_TP_1_E_8_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_18); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_8_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_18); fclose(file);
file = fopen('octave_sigma_M_TP_1_E_8_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_18); fclose(file);


file = fopen('octave_sigma_M_TP_2_E_1_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_21); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_1_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_21); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_1_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_21); fclose(file);

file = fopen('octave_sigma_M_TP_2_E_2_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_22); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_2_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_22); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_2_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_22); fclose(file);

file = fopen('octave_sigma_M_TP_2_E_3_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_23); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_3_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_23); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_3_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_23); fclose(file);

file = fopen('octave_sigma_M_TP_2_E_4_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_24); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_4_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_24); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_4_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_24); fclose(file);

file = fopen('octave_sigma_M_TP_2_E_5_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_25); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_5_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_25); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_5_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_25); fclose(file);

file = fopen('octave_sigma_M_TP_2_E_6_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_26); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_6_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_26); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_6_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_26); fclose(file);

file = fopen('octave_sigma_M_TP_2_E_7_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_27); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_7_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_27); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_7_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_27); fclose(file);

file = fopen('octave_sigma_M_TP_2_E_8_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_28); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_8_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_28); fclose(file);
file = fopen('octave_sigma_M_TP_2_E_8_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_28); fclose(file);


file = fopen('octave_sigma_M_TP_3_E_1_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_31); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_1_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_31); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_1_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_31); fclose(file);

file = fopen('octave_sigma_M_TP_3_E_2_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_32); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_2_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_32); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_2_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_32); fclose(file);

file = fopen('octave_sigma_M_TP_3_E_3_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_33); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_3_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_33); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_3_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_33); fclose(file);

file = fopen('octave_sigma_M_TP_3_E_4_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_34); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_4_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_34); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_4_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_34); fclose(file);

file = fopen('octave_sigma_M_TP_3_E_5_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_35); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_5_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_35); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_5_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_35); fclose(file);

file = fopen('octave_sigma_M_TP_3_E_6_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_36); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_6_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_36); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_6_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_36); fclose(file);

file = fopen('octave_sigma_M_TP_3_E_7_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_37); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_7_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_37); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_7_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_37); fclose(file);

file = fopen('octave_sigma_M_TP_3_E_8_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_38); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_8_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_38); fclose(file);
file = fopen('octave_sigma_M_TP_3_E_8_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_38); fclose(file);


file = fopen('octave_sigma_M_TP_4_E_1_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_41); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_1_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_41); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_1_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_41); fclose(file);

file = fopen('octave_sigma_M_TP_4_E_2_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_42); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_2_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_42); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_2_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_42); fclose(file);

file = fopen('octave_sigma_M_TP_4_E_3_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_43); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_3_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_43); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_3_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_43); fclose(file);

file = fopen('octave_sigma_M_TP_4_E_4_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_44); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_4_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_44); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_4_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_44); fclose(file);

file = fopen('octave_sigma_M_TP_4_E_5_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_45); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_5_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_45); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_5_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_45); fclose(file);

file = fopen('octave_sigma_M_TP_4_E_6_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_46); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_6_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_46); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_6_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_46); fclose(file);

file = fopen('octave_sigma_M_TP_4_E_7_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_47); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_7_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_47); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_7_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_47); fclose(file);

file = fopen('octave_sigma_M_TP_4_E_8_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_48); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_8_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_48); fclose(file);
file = fopen('octave_sigma_M_TP_4_E_8_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_48); fclose(file);


file = fopen('octave_sigma_M_TP_5_E_1_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_51); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_1_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_51); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_1_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_51); fclose(file);

file = fopen('octave_sigma_M_TP_5_E_2_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_52); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_2_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_52); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_2_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_52); fclose(file);

file = fopen('octave_sigma_M_TP_5_E_3_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_53); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_3_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_53); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_3_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_53); fclose(file);

file = fopen('octave_sigma_M_TP_5_E_4_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_54); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_4_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_54); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_4_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_54); fclose(file);

file = fopen('octave_sigma_M_TP_5_E_5_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_55); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_5_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_55); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_5_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_55); fclose(file);

file = fopen('octave_sigma_M_TP_5_E_6_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_56); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_6_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_56); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_6_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_56); fclose(file);

file = fopen('octave_sigma_M_TP_5_E_7_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_57); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_7_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_57); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_7_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_57); fclose(file);

file = fopen('octave_sigma_M_TP_5_E_8_68.dat', 'w'); fprintf(file,'%d %d \n' ,cf_68_58); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_8_95.dat', 'w'); fprintf(file,'%d %d \n' ,cf_95_58); fclose(file);
file = fopen('octave_sigma_M_TP_5_E_8_99.dat', 'w'); fprintf(file,'%d %d \n' ,cf_99_58); fclose(file);