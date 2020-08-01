subroutine db_read_grid()
    use db_data, only: n, grid_data_points,t13_M_data,dm_M_data
    implicit none    
    integer :: i,j
    integer :: u
    
    call db_read_matrix(0.,0.,n,t13_M_data,'db_grid_t13_M.dat')
    call db_read_matrix(0.,0.,n,dm_M_data,'db_grid_dm_M.dat')
    return
end subroutine db_read_grid