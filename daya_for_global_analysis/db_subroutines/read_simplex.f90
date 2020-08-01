!################################################################
!
!   readSimplex: is the subroutine that read
!                   the initial simplex and 
!                   initialize the NDIM+1 polygon
!################################################################
subroutine readSimplex()
    use db_data, only:NDIM,P
    use neu_osc_parameters
    implicit none    
    integer,parameter :: MP=NDIM+1                    ! MP is the number of points for polygon of ABOEBA
    integer,parameter :: NP=NDIM                      ! NP is the number of pulls
    real(8),dimension(NDIM)  :: PT
    integer :: reason
    integer :: u
             
    real(8) :: FUNC
    integer :: m,k,l,i

    ! Lectura de NDIM+1 puntos con NDIM coordenadas en readSimplex   
    
    ! Leer el array de pulls 
    ! Se leer NDIM+1 vérties
    ! con NDIM coordenadas
    ! del archivo "filename"    
    !open(newunit=u,file="db_data/db_simplex.dat", status="old")    
    !    read(u,*,IOSTAT=reason) ( (P(k,l), l=1,NP), k=1,MP )
    !close(u)

    t13=1.0d0
    dm31=1.0d0
    !DO m=1, NDIM+1
        ! Se carga la i-ésima coordenada del m-ésimo punto al arreglo PT    
   !     do i=1,NDIM
   !         PT(i)=P(m,i)           
   !     enddo        
   !     Y(m)=FUNC(PT)
   ! END DO           
    return
end subroutine readSimplex