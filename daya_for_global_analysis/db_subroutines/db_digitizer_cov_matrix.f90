subroutine db_digitizer_cov_matrix()
    implicit none
    real(8) :: cov_bines(104,2)
    real(8) :: cov_m_values(187464,3)
    real(8) :: my_matrix(104,104)
    real(8) :: val
    integer :: n,i,j,k,u

    open(newunit=u, file='db_data/db_cov_bines.dat',status='old')
        read(u,*) ((cov_bines(i,j), j=1,2), i=1,104)
    close(u)
    open(newunit=u, file='db_data/cov_matrix_total_z.dat',status='old')
        read(u,*) ((cov_m_values(i,j), j=1,3), i=1,187464)
    close(u)
    do j=1,104
        do i=1,104
            val=0.0d0
            n=0
            do k=1,187464
                if( (cov_bines(j,1).le.cov_m_values(k,1)).and.(cov_m_values(k,1).le.cov_bines(j,2)) ) then
                    if( (cov_bines(i,1).le.cov_m_values(k,2)).and.(cov_m_values(k,2).le.cov_bines(i,2)) ) then
                        val = val + cov_m_values(k,3)
                        n=n+1                        
                    end if
                end if
            enddo
            val=val/n
            my_matrix(j,i) = val
        enddo
    enddo
    open(newunit=u, file='db_data/db_my_average_cov_metrix.dat')
        do i=1,104
            do j=1,104
            write(u,*) i, j, my_matrix(i,j)
            enddo
            write(u,*) ' '
        enddo
    close(u)
    open(newunit=u, file='db_data/db_my_average_cov_metrix_for_analysis.dat')
        do i=1,104
            write(u,*) my_matrix(i,:)            
        enddo
    close(u)    
    return
end subroutine db_digitizer_cov_matrix



subroutine db_cov_m_digitizer()
    implicit none
    real(8) :: values0(15308,2), values0_05(15159,2), values0_10(15092,2), values0_15(16227,2), values0_20(9471,2)
    real(8) :: values0_25(7322,2), values0_30(5506,2), values0_35(4054,2), values0_40(3186,2), values0_45(2594,2)
    real(8) :: values0_50(2521,2), values0_55(2271,2), values0_60(1812,2), values0_65(868,2), values0_70(549,2)
    real(8) :: values0_75(225,2), values0_80(74,2), values0_85(1,2), values0_90(189,2), values0_95(182,2)
    real(8) :: values1_00(176,2), values_m_05(15952,2), values_m_10(16109,2), values_m_15(15919,2),values_m_20(13873,2)
    real(8) :: values_m_25(8181,2), values_m_30(6026,2), values_m_35(3628,2), values_m_40(2715,2), values_m_45(2274,2)
    integer :: i,j,k,u
    
    open(newunit=u, file='db_data/cov_matrix_0_00.dat',status='old')
        read(u,*) ((values0(i,j), j=1,2), i=1,15308)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_05.dat',status='old')
        read(u,*) ((values0_05(i,j), j=1,2), i=1,15159)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_10.dat',status='old')
        read(u,*) ((values0_10(i,j), j=1,2), i=1,15092)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_15.dat',status='old')
        read(u,*) ((values0_15(i,j), j=1,2), i=1,16227)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_20.dat',status='old')
        read(u,*) ((values0_20(i,j), j=1,2), i=1,9471)
    close(u)



    open(newunit=u, file='db_data/cov_matrix_0_25.dat',status='old')
        read(u,*) ((values0_25(i,j), j=1,2), i=1,7322)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_30.dat',status='old')
        read(u,*) ((values0_30(i,j), j=1,2), i=1,5506)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_35.dat',status='old')
        read(u,*) ((values0_35(i,j), j=1,2), i=1,4054)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_40.dat',status='old')
        read(u,*) ((values0_40(i,j), j=1,2), i=1,3186)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_45.dat',status='old')
        read(u,*) ((values0_45(i,j), j=1,2), i=1,2594)
    close(u)




    open(newunit=u, file='db_data/cov_matrix_0_50.dat',status='old')
        read(u,*) ((values0_50(i,j), j=1,2), i=1,2521)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_55.dat',status='old')
        read(u,*) ((values0_55(i,j), j=1,2), i=1,2271)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_60.dat',status='old')
        read(u,*) ((values0_60(i,j), j=1,2), i=1,1812)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_65.dat',status='old')
        read(u,*) ((values0_65(i,j), j=1,2), i=1,868)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_70.dat',status='old')
        read(u,*) ((values0_70(i,j), j=1,2), i=1,549)
    close(u)



    open(newunit=u, file='db_data/cov_matrix_0_75.dat',status='old')
        read(u,*) ((values0_75(i,j), j=1,2), i=1,225)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_80.dat',status='old')
        read(u,*) ((values0_80(i,j), j=1,2), i=1,74)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_85.dat',status='old')
        read(u,*) ((values0_85(i,j), j=1,2), i=1,1)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_90.dat',status='old')
        read(u,*) ((values0_90(i,j), j=1,2), i=1,189)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_95.dat',status='old')
        read(u,*) ((values0_95(i,j), j=1,2), i=1,182)
    close(u)




    open(newunit=u, file='db_data/cov_matrix_1_00.dat',status='old')
        read(u,*) ((values1_00(i,j), j=1,2), i=1,176)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_05.dat',status='old')
        read(u,*) ((values_m_05(i,j), j=1,2), i=1,15952)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_10.dat',status='old')
        read(u,*) ((values_m_10(i,j), j=1,2), i=1,16109)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_15.dat',status='old')
        read(u,*) ((values_m_15(i,j), j=1,2), i=1,15919)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_20.dat',status='old')
        read(u,*) ((values_m_20(i,j), j=1,2), i=1,13873)
    close(u)



    open(newunit=u, file='db_data/cov_matrix_minus_0_25.dat',status='old')
        read(u,*) ((values_m_25(i,j), j=1,2), i=1,8181)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_30.dat',status='old')
        read(u,*) ((values_m_30(i,j), j=1,2), i=1,6026)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_35.dat',status='old')
        read(u,*) ((values_m_35(i,j), j=1,2), i=1,3628)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_40.dat',status='old')
        read(u,*) ((values_m_40(i,j), j=1,2), i=1,2715)
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_45.dat',status='old')
        read(u,*) ((values_m_45(i,j), j=1,2), i=1,2274)
    close(u)

    !**************************************************************
    !
    !   Writing information
    !
    !**************************************************************
    open(newunit=u, file='db_data/cov_matrix_0_00_z.dat')
        do i=1, 15308
            write(u,*) values0(i,1),values0(i,2),0.00d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_05_z.dat')
        do i=1, 15159
            write(u,*) values0_05(i,1),values0_05(i,2),0.05d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_10_z.dat')
        do i=1, 15092
            write(u,*) values0_10(i,1),values0_10(i,2),0.10d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_15_z.dat')
        do i=1, 16227
            write(u,*) values0_15(i,1),values0_15(i,2),0.15d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_20_z.dat')
        do i=1, 9471
            write(u,*) values0_20(i,1),values0_20(i,2),0.20d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_25_z.dat')
        do i=1, 7322
            write(u,*) values0_25(i,1),values0_25(i,2),0.25d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_30_z.dat')
        do i=1, 5506
            write(u,*) values0_30(i,1),values0_30(i,2),0.30d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_35_z.dat')
        do i=1, 4054
            write(u,*) values0_35(i,1),values0_35(i,2),0.35d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_40_z.dat')
        do i=1, 3186
            write(u,*) values0_40(i,1),values0_40(i,2),0.40d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_45_z.dat')
        do i=1, 2594
            write(u,*) values0_45(i,1),values0_45(i,2),0.45d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_50_z.dat')
        do i=1, 2521
            write(u,*) values0_50(i,1),values0_50(i,2),0.50d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_55_z.dat')
        do i=1, 2271
            write(u,*) values0_55(i,1),values0_55(i,2),0.55d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_60_z.dat')
        do i=1, 1812
            write(u,*) values0_60(i,1),values0_60(i,2),0.60d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_65_z.dat')
        do i=1, 868
            write(u,*) values0_65(i,1),values0_65(i,2),0.65d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_70_z.dat')
        do i=1, 549
            write(u,*) values0_70(i,1),values0_70(i,2),0.70d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_75_z.dat')
        do i=1, 225
            write(u,*) values0_75(i,1),values0_75(i,2),0.75d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_80_z.dat')
        do i=1, 74
            write(u,*) values0_80(i,1),values0_80(i,2),0.80d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_85_z.dat')
        do i=1, 1
            write(u,*) values0_85(i,1),values0_85(i,2),0.85d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_90_z.dat')
        do i=1,189
            write(u,*) values0_90(i,1),values0_90(i,2),0.90d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_0_95_z.dat')
        do i=1, 182
            write(u,*) values0_95(i,1),values0_95(i,2),0.95d0
        enddo
    close(u)

    
    open(newunit=u, file='db_data/cov_matrix_1_00.dat',status='old')
        do i=1,176
            write(u,*) values1_00(i,1),values1_00(i,2),1.00d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_05.dat',status='old')
        do i=1,15952
            write(u,*) values_m_05(i,1),values_m_05(i,2),-0.05d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_10.dat',status='old')
        do i=1,16109
            write(u,*) values_m_10(i,1),values_m_10(i,2),-0.10d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_15.dat',status='old')
        do i=1,15919
            write(u,*) values_m_15(i,1),values_m_15(i,2),-0.15d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_20.dat',status='old')
        do i=1,13873
            write(u,*) values_m_20(i,1),values_m_20(i,2),-0.20d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_25.dat',status='old')
        do i=1,8181
            write(u,*) values_m_25(i,1),values_m_25(i,2),-0.25d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_30.dat',status='old')
        do i=1,6026
            write(u,*) values_m_30(i,1),values_m_30(i,2),-0.30d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_35.dat',status='old')
        do i=1,3628
            write(u,*) values_m_35(i,1),values_m_35(i,2),-0.35d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_40.dat',status='old')
        do i=1,2715
            write(u,*) values_m_40(i,1),values_m_40(i,2),-0.40d0
        enddo
    close(u)

    open(newunit=u, file='db_data/cov_matrix_minus_0_45.dat',status='old')
        do i=1,2274
            write(u,*) values_m_45(i,1),values_m_45(i,2),-0.45d0
        enddo
    close(u)

    !#########################################
    !
    !   Writing the total matriix
    !
    !#########################################
        open(newunit=u, file='db_data/cov_matrix_total_z.dat')
            do i=1, 15308
                write(u,*) values0(i,1),values0(i,2),0.00d0
            enddo
            do i=1, 15159
                write(u,*) values0_05(i,1),values0_05(i,2),0.05d0
            enddo
            do i=1, 15092
                write(u,*) values0_10(i,1),values0_10(i,2),0.10d0
            enddo
            do i=1, 16227
                write(u,*) values0_15(i,1),values0_15(i,2),0.15d0
            enddo
            do i=1, 9471
                write(u,*) values0_20(i,1),values0_20(i,2),0.20d0
            enddo
            do i=1, 7322
                write(u,*) values0_25(i,1),values0_25(i,2),0.25d0
            enddo
            do i=1, 5506
                write(u,*) values0_30(i,1),values0_30(i,2),0.30d0
            enddo
            do i=1, 4054
                write(u,*) values0_35(i,1),values0_35(i,2),0.35d0
            enddo
            do i=1, 3186
                write(u,*) values0_40(i,1),values0_40(i,2),0.40d0
            enddo
            do i=1, 2594
                write(u,*) values0_45(i,1),values0_45(i,2),0.45d0
            enddo
            do i=1, 2521
                write(u,*) values0_50(i,1),values0_50(i,2),0.50d0
            enddo
            do i=1, 2271
                write(u,*) values0_55(i,1),values0_55(i,2),0.55d0
            enddo
            do i=1, 1812
                write(u,*) values0_60(i,1),values0_60(i,2),0.60d0
            enddo
            do i=1, 868
                write(u,*) values0_65(i,1),values0_65(i,2),0.65d0
            enddo
            do i=1, 549
                write(u,*) values0_70(i,1),values0_70(i,2),0.70d0
            enddo
            do i=1, 225
                write(u,*) values0_75(i,1),values0_75(i,2),0.75d0
            enddo
            do i=1, 74
                write(u,*) values0_80(i,1),values0_80(i,2),0.80d0
            enddo
            do i=1, 1
                write(u,*) values0_85(i,1),values0_85(i,2),0.85d0
            enddo
            do i=1, 189
                write(u,*) values0_90(i,1),values0_90(i,2),0.90d0
            enddo
            do i=1, 182
                write(u,*) values0_95(i,1),values0_95(i,2),0.95d0
            enddo
        
            do i=1,176
                write(u,*) values1_00(i,1),values1_00(i,2),1.00d0
            enddo
            do i=1,15952
                write(u,*) values_m_05(i,1),values_m_05(i,2),-0.05d0
            enddo
            do i=1,16109
                write(u,*) values_m_10(i,1),values_m_10(i,2),-0.10d0
            enddo
            do i=1,15919
                write(u,*) values_m_15(i,1),values_m_15(i,2),-0.15d0
            enddo
            do i=1,13873
                write(u,*) values_m_20(i,1),values_m_20(i,2),-0.20d0
            enddo
            do i=1,8181
                write(u,*) values_m_25(i,1),values_m_25(i,2),-0.25d0
            enddo
            do i=1,6026
                write(u,*) values_m_30(i,1),values_m_30(i,2),-0.30d0
            enddo
            do i=1,3628
                write(u,*) values_m_35(i,1),values_m_35(i,2),-0.35d0
            enddo
            do i=1,2715
                write(u,*) values_m_40(i,1),values_m_40(i,2),-0.40d0
            enddo
            do i=1,2274
                write(u,*) values_m_45(i,1),values_m_45(i,2),-0.45d0
            enddo
        close(u)
    return
end subroutine db_cov_m_digitizer