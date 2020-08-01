real(8) function db_detector_response(E_true)
    implicit none
    real(8) :: E_true
    real(8) :: db_p1_detector_response,db_p2_detector_response,db_p3_detector_response,db_p4_detector_response
    real(8) :: db_p5_detector_response,db_p6_detector_response,db_p7_detector_response,db_p8_detector_response

    db_detector_response=0.0d0
    if(E_true <= 1.04d0) then
        db_detector_response=db_p1_detector_response(E_true)
    elseif (E_true <= 2.0d0) then
        db_detector_response=db_p2_detector_response(E_true)
    elseif (E_true <= 2.65d0) then
        db_detector_response=db_p3_detector_response(E_true)
    elseif (E_true <= 3.3d0) then
        db_detector_response=db_p4_detector_response(E_true)
    elseif (E_true <= 3.95d0) then
        db_detector_response=db_p5_detector_response(E_true)
    elseif (E_true <= 4.6d0) then
        db_detector_response=db_p6_detector_response(E_true)
    elseif (E_true <= 5.2d0) then
        db_detector_response=db_p7_detector_response(E_true)
    elseif (E_true <= 12.5d0) then
        db_detector_response=db_p8_detector_response(E_true)
    else
        db_detector_response=0.0d0
    end if
    return
end function db_detector_response