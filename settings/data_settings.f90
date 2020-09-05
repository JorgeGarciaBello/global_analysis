module data_settings
    implicit none
    !integer,parameter :: n=1000             ! size of the grid   for RENO only
    integer,parameter :: n=200              ! size of the grid   80
    
    real(8) :: t13_M_data(n,n)
    real(8) :: dm_M_data(n,n)
end module data_settings