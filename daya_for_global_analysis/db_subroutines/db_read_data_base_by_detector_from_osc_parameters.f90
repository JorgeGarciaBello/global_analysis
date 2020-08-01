subroutine db_read_data_base_by_detector_from_osc_parameters()
    use db_data, only: n,grid_events_data_points
    implicit none
    integer :: u,i,j

    open(newunit=u,file='data_base_by_detector_from_osc_parameters.dat')
        read(u,*) ((grid_events_data_points(i,j),j=1,10), i=1,n**2)
    close(u)
    return
end subroutine db_read_data_base_by_detector_from_osc_parameters