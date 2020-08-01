real(8) function db_inverse_detector_response_model_function(E_rec)
    implicit none
    real(8), parameter :: A=0.992288616103d0
    real(8), parameter :: B=0.0189518503428d0
    real(8), parameter :: C=1.01444475577d0
    real(8), parameter :: D=1.00942150338d0
    real(8) :: E_rec            ! E_rec => It is the reconstructed energy

    db_inverse_detector_response_model_function=( D + exp( (E_rec-A)/B ) )/C
    return
end function db_inverse_detector_response_model_function