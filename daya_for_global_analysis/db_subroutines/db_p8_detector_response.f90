real(8) function db_p8_detector_response(E_true)
    implicit none
    real(8), parameter :: A=0.001675839849542d0
    real(8), parameter :: B=1.01483292750646d0
    real(8) :: E_true

    if(E_true <= 5.20d0) then
        db_p8_detector_response=0.0d0
    else if(E_true <= 12.5d0) then
        db_p8_detector_response=(A*E_true+B)*E_true
    else
        db_p8_detector_response=0.0d0
    end if
    return
end function db_p8_detector_response