real(8) function db_p1_detector_response(x)
    implicit none
    real(8), parameter :: A=-0.14600d0
    real(8), parameter :: B=1.093898d0
    real(8) :: x

    if(x < 1.02d0) then
        db_p1_detector_response=0.0d0
    else if(x.le.1.04d0) then
        db_p1_detector_response= (A*x+B)*x
    else
        db_p1_detector_response=0.0d0
    end if
    return
end function db_p1_detector_response