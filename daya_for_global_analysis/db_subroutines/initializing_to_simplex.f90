subroutine initializing_to_simplex(Y)
    use db_data, only:NDIM,P
    implicit none
    real(8),dimension(NDIM)   :: PT
    real(8),dimension(NDIM+1) :: Y
    real(8) :: FUNC    
    integer :: m,i

    ! Lectura de NDIM+1 puntos con NDIM 
    ! coordenadas en readSimplex    
    ! Leer el array de pulls 
    ! Se leer NDIM+1 vérties
    ! con NDIM coordenadas
    DO m=1, NDIM+1
        ! Se carga la i-ésima coordenada del m-ésimo punto al arreglo PT
        do i=1,NDIM
            PT(i)=P(m,i)
        enddo
        Y(m)=FUNC(PT)
    END DO
    return
end subroutine initializing_to_simplex