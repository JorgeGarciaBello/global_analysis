subroutine db_test()
    use db_data
    implicit none
    integer :: i,d,u
    real(8) :: spectrum
    real(8) :: expectedNumberOfNeutrinosByDetectorBin

    print*, 'Daya Bay Test'

    ! Number of detector
    d=8
    open(newunit=u,file='db_expectedNumberOfNeutrinosByDetectorBin_sin_calibration.dat')
    do i=1,NBIN
        spectrum=expectedNumberOfNeutrinosByDetectorBin(d,i)
        write(u,*) i, spectrum
    enddo
    close(u)
    return
end subroutine db_test