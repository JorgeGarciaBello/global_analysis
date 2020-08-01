subroutine db_create_background_covariance_matrix_by_period_and_hall(VP1B31,VP1B32,VP2B31,VP2B32,VP3B31,VP3B32)
    use db_data, only: NBIN, Bkg_sigma2_6AD_H1, Bkg_sigma2_6AD_H2, Bkg_sigma2_6AD_H3, &
                             Bkg_sigma2_8AD_H1, Bkg_sigma2_8AD_H2, Bkg_sigma2_8AD_H3, &
                             Bkg_sigma2_7AD_H1, Bkg_sigma2_7AD_H2, Bkg_sigma2_7AD_H3
    implicit none
    real(8) :: VP1B31(NBIN,NBIN),VP1B32(NBIN,NBIN)
    real(8) :: VP2B31(NBIN,NBIN),VP2B32(NBIN,NBIN)
    real(8) :: VP3B31(NBIN,NBIN),VP3B32(NBIN,NBIN)

    call db_create_background_covariance_matrix(VP1B31,0,Bkg_sigma2_6AD_H1,"sigma2")
    call db_write_matrix(NBIN,VP1B31,'background_covariance_matrix_H1_6AD')
    call db_create_background_covariance_matrix(VP1B32,0,Bkg_sigma2_6AD_H2,"sigma2")
    call db_write_matrix(NBIN,VP1B32,'background_covariance_matrix_H2_6AD')
    

    !call db_create_background_covariance_matrix(VP2B31,Bkg_sigma2_8AD_H1)
    !call db_write_matrix(NBIN,VP2B31,'background_covariance_matrix_H1_8AD')
    !call db_create_background_covariance_matrix(VP2B32,Bkg_sigma2_8AD_H2)
    !call db_write_matrix(NBIN,VP2B32,'background_covariance_matrix_H2_8AD')
    

    !call db_create_background_covariance_matrix(VP3B31,Bkg_sigma2_7AD_H1)
    !call db_write_matrix(NBIN,VP3B31,'background_covariance_matrix_H1_7AD')
    !call db_create_background_covariance_matrix(VP3B32,Bkg_sigma2_7AD_H2)
    !call db_write_matrix(NBIN,VP3B32,'background_covariance_matrix_H2_7AD')

    return
end subroutine db_create_background_covariance_matrix_by_period_and_hall