subroutine db_read_weight_w_period_hall()
    use db_data, only: n,NBIN,                                               &
                       w_6AD_H3_H1, w_6AD_H2_H1, w_6AD_H3_H2, w_6AD_H1_H2,   &
                       w_8AD_H3_H1, w_8AD_H2_H1, w_8AD_H3_H2, w_8AD_H1_H2,   &
                       w_7AD_H3_H1, w_7AD_H2_H1, w_7AD_H3_H2, w_7AD_H1_H2
    implicit none   
    integer :: i,j,u

    open(newunit=u,file='db_data/db_weight_w_6AD_H3_H1.dat')
            read(u,*) ((w_6AD_H3_H1(i,j),j=1,NBIN), i=1,n**2)
    close(u)
    !open(newunit=u,file='db_data/db_weight_w_6AD_H2_H1.dat')
    !        read(u,*) ((w_6AD_H2_H1(i,j),j=1,NBIN), i=1,n**2)
    !close(u)
    open(newunit=u,file='db_data/db_weight_w_6AD_H3_H2.dat')
            read(u,*) ((w_6AD_H3_H2(i,j),j=1,NBIN), i=1,n**2)
    close(u)
    !open(newunit=u,file='db_data/db_weight_w_6AD_H1_H2.dat')
    !        read(u,*) ((w_6AD_H1_H2(i,j),j=1,NBIN), i=1,n**2)
    !close(u)



    open(newunit=u,file='db_data/db_weight_w_8AD_H3_H1.dat')
            read(u,*) ((w_8AD_H3_H1(i,j),j=1,NBIN), i=1,n**2)
    close(u)
    !open(newunit=u,file='db_data/db_weight_w_8AD_H2_H1.dat')
    !        read(u,*) ((w_8AD_H2_H1(i,j),j=1,NBIN), i=1,n**2)
    !close(u)
    open(newunit=u,file='db_data/db_weight_w_8AD_H3_H2.dat')
            read(u,*) ((w_8AD_H3_H2(i,j),j=1,NBIN), i=1,n**2)
    close(u)
    !open(newunit=u,file='db_data/db_weight_w_8AD_H1_H2.dat')
    !        read(u,*) ((w_8AD_H1_H2(i,j),j=1,NBIN), i=1,n**2)
    !close(u)



    open(newunit=u,file='db_data/db_weight_w_7AD_H3_H1.dat')
            read(u,*) ((w_7AD_H3_H1(i,j),j=1,NBIN), i=1,n**2)
    close(u)
   ! open(newunit=u,file='db_data/db_weight_w_7AD_H2_H1.dat')
   !        read(u,*) ((w_7AD_H2_H1(i,j),j=1,NBIN), i=1,n**2)
   ! close(u)
    open(newunit=u,file='db_data/db_weight_w_7AD_H3_H2.dat')
            read(u,*) ((w_7AD_H3_H2(i,j),j=1,NBIN), i=1,n**2)
    close(u)
    !open(newunit=u,file='db_data/db_weight_w_7AD_H1_H2.dat')
    !        read(u,*) ((w_7AD_H1_H2(i,j),j=1,NBIN), i=1,n**2)
    !close(u)

    return
end subroutine db_read_weight_w_period_hall
