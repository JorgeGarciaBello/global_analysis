      SUBROUTINE RFCNF(X,F,N,PAR)
        use reno_data, only: RCTS, ADS
         IMPLICIT REAL*8 (A-H,O-Z)
         REAL*8 X(N),F(N),PAR(1)
         REAL*8 reno_far_partial_derivative_efficiency
         REAL*8 reno_far_partial_derivative_energy_scale
         REAL*8 reno_far_partial_derivative_reactor_flux
         REAL*8 reno_far_partial_derivative_bkg_far

         real(8) :: b_f
         real(8) :: fr(RCTS)
         real(8) :: eps
         real(8) :: eta

         b_f=X(1)
         fr=(/X(2),X(3),X(4),X(5),X(6),X(7)/)
         eps=X(8)
         eta=X(9)


         F(1)=reno_far_partial_derivative_efficiency(b_f,fr,eps,eta)

         F(2)=reno_far_partial_derivative_energy_scale(b_f,fr,eps,eta)

         F(3)=reno_far_partial_derivative_reactor_flux(1,b_f,fr,eps,eta)
         F(4)=reno_far_partial_derivative_reactor_flux(2,b_f,fr,eps,eta)
         F(5)=reno_far_partial_derivative_reactor_flux(3,b_f,fr,eps,eta)
         F(6)=reno_far_partial_derivative_reactor_flux(4,b_f,fr,eps,eta)
         F(7)=reno_far_partial_derivative_reactor_flux(5,b_f,fr,eps,eta)
         F(8)=reno_far_partial_derivative_reactor_flux(6,b_f,fr,eps,eta)

         F(9)=reno_far_partial_derivative_bkg_far(b_f,fr,eps,eta)
         RETURN
      END