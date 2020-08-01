real(8) function db_p7_detector_response(E_true)
    implicit none
    real(8), parameter :: A=0.003265045846069d0
    real(8), parameter :: B=1.00563778345837d0
    real(8) :: E_true

    if(E_true <= 4.6d0) then
        db_p7_detector_response=0.0d0
    else if(E_true <= 5.2d0) then
        db_p7_detector_response=(A*E_true+B)*E_true
    else
        db_p7_detector_response=0.0d0
    end if
    return
end function db_p7_detector_response