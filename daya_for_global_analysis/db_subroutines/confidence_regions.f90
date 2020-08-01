!#####################################################
!
!   confidenceRegions: es una subroutina que 
!       genera los archivos de datos para las 
!       crear las regiones de confianza
!
!#####################################################
subroutine confidenceRegions(n,filename)
    implicit none
    integer :: n
    Character(len=*) :: filename
    Character(len=90) :: filenameA,filenameB,filenameC

    real(8) :: min_values(3)
    real(8) :: min_val    
    real(8) :: data(n**2,3)
    integer :: i,j,u
    real(8) :: s13,m_ee,chi_2
    
    print*, 'Making confidence regions . . . '
    ! Leyendo los valores minimios  ( chi_min, sen11t_!2_min, Dm2_ee_min )
    open(newunit=u, file='db_data/db_min_param_'//filename, status='old')
    !open(newunit=u, file='db_data/db_data_min_parameters.dat', status='old')    
        read(u,*) min_values
    close(u)    

    min_val=min_values(1)
    open(newunit=u,file='db_data/'//filename, status='old')
        read(u,*) ( (data(i,j), j=1,3), i=1,n**2 )
    close(u)    

    filenameA='db_cr_'//trim(filename)//'_99_73_2018.dat'
    filenameB='db_cr_'//trim(filename)//'_95_45_2018.dat'
    filenameC='db_cr_'//trim(filename)//'_68_27_2018.dat'    

    !Confidence region 1 - 68.27% - 2.30 - (1-sigma)
    open(41,file='db_data/'//trim(filenameA))
    do i=1,n**2
        s13=data(i,1); m_ee=data(i,2); chi_2=data(i,3)-min_val        
        !if((2.45d0.GE.chi_2).AND.(chi_2.GE.2.15d0)) then
        if(chi_2.LE.2.30d0) then
            write(41,*) s13, m_ee
        endif
    enddo
    close(41)

    !Confidence region 2 - 95.45% - 6.18 - (2-sigma)
    open(42,file='db_data/'//trim(filenameB))
    do i=1,n**2
        s13=data(i,1); m_ee=data(i,2); chi_2=data(i,3)-min_val
        !if((6.33d0.GE.chi_2).AND.(chi_2.GE.6.03d0)) then
            if(chi_2.LE.6.18d0) then
            write(42,*) s13, m_ee
        endif
    enddo
    close(42)

    !Confidence region 3 - 99.73% - 11.83 (3-sigma)
    open(43,file='db_data/'//trim(filenameC))
    do i=1,n**2
        s13=data(i,1); m_ee=data(i,2); chi_2=data(i,3)-min_val
        !if((11.98d0.GE.chi_2).AND.(chi_2.GE.11.68d0)) then
            if(chi_2.LE.11.83d0) then
            write(43,*) s13, m_ee
        endif
    enddo
    close(43)    
    return
end subroutine confidenceRegions