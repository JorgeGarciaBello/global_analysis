subroutine db_covariance_matrix_calibration()    
    implicit none
    integer,parameter :: NDIM=8         ! NDIM is the number of pull parameters
    integer,parameter :: MP=9                ! MP is the number of points for polygon of ABOEBA
    integer,parameter :: NP=8                  ! NP is the number of pulls                   
    real(8),dimension(NP)   :: PT
    real(8) :: FUNC
    real(8) :: P(MP,NP), Y(MP)          ! Array con el que se construye AMOEBA    
    real(8) :: FTOL=1.D-5               ! Required tolerance
    integer :: ITER                     ! Número de iteraciones realizadas por AMOEBA    
    integer :: reason
    integer :: i,K,l,m,u    
    
    ! Lectura de NDIM+1 puntos con NDIM coordenadas en readSimplex       
    ! Leer el array de pulls 
    ! Se leer NDIM+1 vérties
    ! con NDIM coordenadas
    ! del archivo "filename"    
    open(newunit=u,file="db_data/db_simplex_cov.dat", status="old")    
        read(u,*,IOSTAT=reason) ( (P(k,l), l=1,NP), k=1,MP )
    close(u)
    print*,'Lectura realizada'

    DO m=1, MP
        ! Se carga la i-ésima coordenada del m-ésimo punto al arreglo PT    
        do i=1,NP
            PT(i)=P(m,i)           
        enddo        
        Y(m)=FUNC(PT)
    END DO

    CALL AMOEBA(P,Y,MP,NP,NDIM,FTOL,ITER)

    print*,Y(1)
    print*,P(1,:)

    return
end subroutine db_covariance_matrix_calibration