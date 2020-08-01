subroutine db_other_test()
    use db_data, only: N_obs_f,num_experiments
    implicit none
    real(8) :: t13, dmee
    real(8) :: rand_W_k(156)
    real(8) :: rand_w_i(156,num_experiments)
    real(8) :: db_N_f_exp_i
    real(8) :: expectedNumberNeutrinoByHallPeriodBin
    real(8) :: db_detector_response_model_function
    real(8) :: db_inverse_detector_response_model_function
    real(8) :: U(156)
    real(8) :: Nbar_i(156,num_experiments)
    real(8) :: x
    integer :: i,j,H,P
    real(8) :: db_p1_detector_response,db_p2_detector_response,db_p3_detector_response,db_p4_detector_response
    real(8) :: db_inv_p1_detector_response,db_inv_p2_detector_response,db_inv_p3_detector_response,db_inv_p4_detector_response
    real(8) :: db_p5_detector_response,db_p6_detector_response,db_p7_detector_response,db_p8_detector_response
    real(8) :: db_inv_p5_detector_response,db_inv_p6_detector_response,db_inv_p7_detector_response,db_inv_p8_detector_response
    real(8) :: db_inv_detector_response

    !do i=1,100
    !     x=0.8d0+i*(12.5/100.d0)
    !    print*, x, (db_inv_detector_response(x))
    !enddo
    
       
       ! x =5.2d0
       ! print*, x, db_p8_detector_response(x)
       ! x = 8.0d0
       ! print*, x, db_p8_detector_response(x)
       ! x = 12.5d0
       ! print*, x, db_p8_detector_response(x)

       ! print*,' '
       ! x = 5.2d0
       ! print*, x, db_p7_detector_response(x)
    
    !stop
    !do i=1,100
    !    x=1+i*(11.5/100.d0)
    !    print*, x, db_detector_response_model_function(x)
    !enddo

    !do i=1,100
    !    x=0.9d0+i*(11.5/100.d0)
    !    print*, x, db_p8_detector_response(x)
    !enddo
    
    !stop


    !t13=0.5d0
    !dmee=2.5d-3   

    !call db_generate_weight_w_systematic_array(t13,dmee,rand_w_i)
    !call db_generate_vectors_U(t13,dmee,rand_w_i,Nbar_i,U)
    
    !do i=1,156
    !    print*, U(i)
    !enddo
    !stop

    !t13 =asin(sqrt(9.0493832754652892E-002))/(2.0d0)
    !dmee=2.3799999999999997E-003

    !call db_generate_weight_w_array(t13,dmee,rand_W_k)
    !do i=1,156
    !    print*, i, N_obs_f(i), db_N_f_exp_i(i,rand_W_k,t13,dmee)
    !enddo
    !stop
    t13=0.0d0
    dmee=0.0d0
    
    P=1
    H=1
    
    print*, 'P,H', P, H
    do j=1,26
        print*, j, expectedNumberNeutrinoByHallPeriodBin(H,P,j,t13,dmee)
    enddo

    H=2
    print*, 'P,H', P, H
    do j=1,26
        print*, j, expectedNumberNeutrinoByHallPeriodBin(H,P,j,t13,dmee)
    enddo
    
    H=3
    print*, 'P,H', P, H
    do j=1,26
        print*, j, expectedNumberNeutrinoByHallPeriodBin(H,P,j,t13,dmee)
    enddo


    
    P=2
    H=1
    print*, 'P,H', P, H
    do j=1,26
        print*, j, expectedNumberNeutrinoByHallPeriodBin(H,P,j,t13,dmee)
    enddo

    H=2    
    print*, 'P,H', P, H
    do j=1,26
        print*, j, expectedNumberNeutrinoByHallPeriodBin(H,P,j,t13,dmee)
    enddo

    H=3
    print*, 'P,H', P, H
    do j=1,26
        print*, j, expectedNumberNeutrinoByHallPeriodBin(H,P,j,t13,dmee)
    enddo


    
    P=3
    H=1
    print*, 'P,H', P, H    
    do j=1,26
        print*, j, expectedNumberNeutrinoByHallPeriodBin(H,P,j,t13,dmee)
    enddo
    
    H=2
    print*, 'P,H', P, H
    do j=1,26
        print*, j, expectedNumberNeutrinoByHallPeriodBin(H,P,j,t13,dmee)
    enddo
    
    H=3
    print*, 'P,H', P, H
    do j=1,26
        print*, j, expectedNumberNeutrinoByHallPeriodBin(H,P,j,t13,dmee)
    enddo
    return
end subroutine db_other_test