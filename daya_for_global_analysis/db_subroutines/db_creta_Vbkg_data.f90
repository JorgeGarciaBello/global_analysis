subroutine db_creta_Vbkg_data(n,random_data_bkg,data)
    use db_data, only: NBIN
    implicit none    
    integer :: n
    real(8) :: random_data_bkg(NBIN,n)
    real(8) :: data(NBIN)
    real(8) :: ra(n)
    integer :: u, i

    do i=1,NBIN
        call random_array_from_one_sigma_error(n,data(i),ra)
        random_data_bkg(i,:)=ra
    enddo    
    return
end subroutine db_creta_Vbkg_data