subroutine db_create_Vdr_ij_component(n,i,j,Hn,Hf,P,data_near,data_far,e_ij,m)
    use db_data, only: grid_dim=>n,NBIN,results_w,w_6AD_H3_H1,w_6AD_H3_H2,   &
                                      w_8AD_H3_H1,w_8AD_H3_H2,   &
                                      w_7AD_H3_H1,w_7AD_H3_H2
    implicit none
    integer :: m
    integer :: n
    integer :: i, j
    integer :: Hn,Hf,P
    real(8) :: data_near(NBIN,n), data_far(NBIN,n)
    real(8) :: e_ij
    integer :: k
    real(8) :: weight_w(grid_dim**2,NBIN)

    select case(P)
        case(1)
            if((Hf==3).and.(Hn==1)) weight_w=w_6AD_H3_H1
            if((Hf==3).and.(Hn==2)) weight_w=w_6AD_H3_H2
        case(2)
            if((Hf==3).and.(Hn==1)) weight_w=w_8AD_H3_H1
            if((Hf==3).and.(Hn==2)) weight_w=w_8AD_H3_H2
        case(3)
            if((Hf==3).and.(Hn==1)) weight_w=w_7AD_H3_H1
            if((Hf==3).and.(Hn==2)) weight_w=w_7AD_H3_H2
    end select

    e_ij=0.0d0
    do k=1,n
        !e_ij=e_ij + (data_far(i,k)-weight_w(m,i)*data_near(i,k))* &
        !            (data_far(j,k)-weight_w(m,j)*data_near(j,k))        
        !e_ij=e_ij + (data_far(i,k)-(1.0/6.71829824953531d0)*data_near(i,k))* &
        !            (data_far(j,k)-(1.0/6.71829824953531d0)*data_near(j,k))        
        e_ij=e_ij + (data_far(i,k)-data_far(i,1))* &
                    (data_far(j,k)-data_far(j,1))
    enddo
    e_ij=e_ij/n
    return
end subroutine db_create_Vdr_ij_component