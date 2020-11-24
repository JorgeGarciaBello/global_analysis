      SUBROUTINE CALFUN (N,X,F)
      use types
      use neu_osc_parameters
      implicit none
      integer :: N            ! Dimension of the pull array
      real(dp) :: X(N)        ! Vector of pull's
      real(dp) :: F
      real(dp) :: DC_FUNC
      real(dp) :: dmee

      dmee=dm31
      F=DC_FUNC(t13,dmee,X)
      RETURN
      END

