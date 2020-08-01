real(8) function db_p3_detector_response(E_true)
    implicit none
    real(8), parameter :: A=0.021290537587412d0
    real(8), parameter :: B=0.951215262805946d0
    real(8) :: E_true

    if(E_true <= 2.0d0) then
        db_p3_detector_response=0.0d0
    else if(E_true <= 2.65d0) then
        db_p3_detector_response= (A*E_true+B)*E_true
    else
        db_p3_detector_response=0.0d0
    end if
    return
end function db_p3_detector_response