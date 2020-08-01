real(8) function db_p2_detector_response(x)
    implicit none
    real(8), parameter :: A=0.056274671052632d0
    real(8), parameter :: B=0.884417657894736d0
    real(8) :: x

    if(x <= 1.04d0) then
        db_p2_detector_response=0.0d0
    else if(x <= 2.0d0) then
        db_p2_detector_response= (A*x+B)*x
    else
        db_p2_detector_response=0.0d0
    end if
    return
end function db_p2_detector_response