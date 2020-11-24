C
C     The Chebyquad test problem (Fletcher, 1965) for N = 2,4,6 and 8,
C     with NPT = 2N+1.
C
C      IMPLICIT REAL*8 (A-H,O-Z)
C      DIMENSION X(10),W(10000)
C      IPRINT=2
C      MAXFUN=5000
C      RHOEND=1.0D-6
C      DO 30 N=2,8,2
C      NPT=2*N+1
C      DO 10 I=1,N
C   10 X(I)=DFLOAT(I)/DFLOAT(N+1)
C      RHOBEG=0.2D0*X(1)
C      PRINT 20, N,NPT
C   20 FORMAT (//4X,'Results with N =',I2,' and NPT =',I3)
C      CALL NEWUOA (N,NPT,X,RHOBEG,RHOEND,IPRINT,MAXFUN,W)
C   30 CONTINUE
C      STOP
C      END

