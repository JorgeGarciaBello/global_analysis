subroutine DC_double_chooz(YY,dc_ji_min)
    use types
    use DC_settings, only: NDIM
    implicit none
    real(dp) :: YY(12),dc_ji_min
    real(dp) :: t13,dmee
    real(dp) :: P(NDIM+1,NDIM), Y(NDIM)          ! Array con es que se construye AMOEBA

    t13 = YY(2)
    dmee= YY(11)
    call DC_minimization(t13,dmee,P,Y)
    dc_ji_min=Y(1)
    return
end subroutine DC_double_chooz