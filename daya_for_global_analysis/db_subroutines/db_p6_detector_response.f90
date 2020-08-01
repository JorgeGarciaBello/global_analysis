real(8) function db_p6_detector_response(E_true)
    implicit none
    real(8), parameter :: A=0.00399729020979d0
    real(8), parameter :: B=1.0023179055944d0
    real(8) :: E_true

    if(E_true <= 3.95d0) then
        db_p6_detector_response=0.0d0
    else if(E_true <= 4.6d0) then
        db_p6_detector_response=(A*E_true+B)*E_true
    else
        db_p6_detector_response=0.0d0
    end if
    return
end function db_p6_detector_response