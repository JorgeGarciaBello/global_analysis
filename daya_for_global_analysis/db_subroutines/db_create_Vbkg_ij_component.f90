subroutine db_create_Vbkg_ij_component(n,i,j,data,values,e_ij)
        use db_data, only: NBIN
        implicit none
        integer :: n, i, j
        real(8) :: data(NBIN,n)
        real(8) :: values(NBIN)
        real(8) :: e_ij
        integer :: k

        e_ij=0.d0
        do k=1,n
            e_ij=e_ij+(values(i)-data(i,k))*(values(j)-data(j,k))
        enddo
        e_ij=e_ij/n
        return
    end subroutine db_create_Vbkg_ij_component