module hill_hamiltonians
      implicit none 

      contains
        function h1_flow(state, dt) result(new_state)
                implicit none
                integer, parameter :: dp = selected_real_kind(15, 307)
                real(kind=dp), dimension(4), intent(in) :: state
                real(kind=dp), intent(in) :: dt
                real(kind=dp), dimension(4) :: new_state
                real(kind=dp) :: X, Y, PX, PY

                X = state(1)
                Y = state(2)
                PX = state(3)
                PY = state(4)

                new_state(1) = X + (dt*PX) + ((dt**2.0)*PY)
                new_state(2) = Y + (dt*(Py - 2.0*X)) - ((dt**2.0)*PX) - ((2.0/3.0)*(dt**3)*PY)
                new_state(3) = PX + 2.0*dt*PY
                new_state(4) = PY
        end function h1_flow

        function h2_flow(state, dt) result(new_state)
                integer, parameter :: dp = selected_real_kind(15, 307)
                real(kind=dp), dimension(4), intent(in) :: state
                real(kind=dp), intent(in) :: dt
                real(kind=dp), dimension(4) :: new_state
                real(kind=dp) :: X, Y, PX, PY
                !print*, 'dt:', dt 

                X = state(1)
                Y = state(2)
                PX = state(3)
                PY = state(4)

                new_state(1) = X
                new_state(2) = Y
                new_state(3) = PX - dt*(X + (X/((X**2.0 + Y**2.0)**(3.0/2.0))))
                new_state(4) = PY - dt*(Y/((X**2.0 + Y**2.0)**(3.0/2.0)))
        end function h2_flow
end module hill_hamiltonians
