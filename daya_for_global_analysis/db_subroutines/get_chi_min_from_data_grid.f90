SUBROUTINE get_chi_min_from_data_grid(m,filename)
    implicit none
    integer :: m
    Character(len=*) :: filename
    integer :: n
    real(8) :: data(m**2,3)

    real(8) :: ARRAY(m**2),RESULT(3)
    integer :: i,j

    n=m**2   

    open(50,file='db_data/'//filename,status='old')
        read(50,*) ((data(i,j),j=1,3),i=1,n)
    close(50)

    ARRAY=data(:,3)
    RESULT(1) = MINVAL(ARRAY)

    do i=1,n
        if (data(i,3).eq.RESULT(1)) then
            RESULT(2)=data(i,1)
            RESULT(3)=data(i,2)
        end if
    enddo
    open(51,file='db_data/db_min_param_'//filename)
        write(51,*) RESULT
    close(51)

    return
end SUBROUTINE get_chi_min_from_data_grid