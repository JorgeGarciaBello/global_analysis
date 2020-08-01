real(8) function db_p5_detector_response(E_true)
    implicit none
    real(8), parameter :: A=0.006222027972028d0
    real(8), parameter :: B=0.9933559269230771d0
    real(8) :: E_true

    if(E_true <= 3.3d0) then
        db_p5_detector_response=0.0d0
    else if(E_true <= 3.95d0) then
        db_p5_detector_response=(A*E_true+B)*E_true
    else
        db_p5_detector_response=0.0d0
    end if
    return
end function db_p5_detector_response