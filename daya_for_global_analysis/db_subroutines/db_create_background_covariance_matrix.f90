subroutine db_create_background_covariance_matrix(t13,dmee,source,type1,type2,Vbkg)
    use db_data, only: NBIN, PD
    implicit none    
    integer, parameter :: num_experiments=1000
    real(8) :: t13,dmee
    character(len=*) :: source,type1,type2
    real(8) :: Vbkg(NBIN*2*PD,NBIN*2*PD)

    real(8) :: values1(NBIN)
    real(8) :: values2(NBIN,5)    
    real(8) :: random_data_bkg(NBIN,num_experiments)
    integer :: u, i, j

!    if("Nacc"==source) then
!        if("correlated"==type2) then
!            if("sigma2"==type1) then
!                call db_create_bkg_cov_matrix_from_sigam2(Vbkg,values)
!            else if("values"==type1) then

!            endif                
!        else if("uncorrelated"==type2) then
!            if("sigma2"==type1) then
                
!            else if("values"==type1) then

!            endif
!        endif
!    else if("Nalphan"==source ) then
!        if("correlated"==type2) then
!            if("sigma2"==type1) then
                
!            else if("values"==type1) then

!            endif
!        else if("uncorrelated"==type2) then
!            if("sigma2"==type1) then
                
!            else if("values"==type1) then

!            endif
!        endif
!    else if("Namc"==source) then
!        if("correlated"==type2) then
!            if("sigma2"==type1) then
!                
!            else if("values"==type1) then

!            endif
!        else if("uncorrelated"==type2) then
!            if("sigma2"==type1) then
                
!            else if("values"==type1) then

!            endif
!        endif
!    else if("Nlihe"==source) then
!        if("correlated"==type2) then
!            if("sigma2"==type1) then
                
!            else if("values"==type1) then

!            endif
!        else if("uncorrelated"==type2) then
!            if("sigma2"==type1) then
                
!            else if("values"==type1) then

!            endif
!        endif
!    else if("Nfastn"=source) then
!        if("correlated"==type2) then
!            if("sigma2"==type1) then
                
!            else if("values"==type1) then

!            endif
!        else if("uncorrelated"==type2) then
!            if("sigma2"==type1) then
                
!            else if("values"==type1) then

!            endif
!        endif
!    end if

!    if(type=="sigma2") then
!        call db_create_bkg_cov_matrix_from_sigam2(Vbkg,values2)
!    else if(type=="values") then
!        call db_creta_Vbkg_data(num_experiments,random_data_bkg,values1)
!        call db_background_covariance_matrix(num_experiments,random_data_bkg,values1,Vbkg)    
!    end if
    return
end subroutine db_create_background_covariance_matrix