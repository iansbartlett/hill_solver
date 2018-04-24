      subroutine solve_hill_problem(initial_state, dt, num_timesteps, solution, timestamps)
                implicit none
                integer, parameter :: dp = selected_real_kind(15, 307)
                real(kind=dp), dimension(4), intent(in) :: initial_state
                real(kind=dp), dimension(4) :: state
                real(kind=dp), intent(in) :: dt
                integer :: num_timesteps, i
                real(kind=dp), dimension(4,num_timesteps+1), intent(out) :: solution
                real(kind=dp), dimension(num_timesteps+1), intent(out) :: timestamps
                real(kind=dp), dimension(4):: a_coeffs, b_coeffs

                interface
                        function hill_ode_step(state, a_coeffs, b_coeffs, dt)
                                integer, parameter :: dp = selected_real_kind(15, 307)
                                real(kind=dp), dimension(4) :: hill_ode_step
                                real(kind=dp), dimension(4), intent(in) :: state
                                real(kind=dp), dimension(4), intent(in) :: a_coeffs, b_coeffs
                                real(kind=dp), intent(in) :: dt
                        end function hill_ode_step
                end interface

                 a_coeffs = [-1.01308797891717472981, &
                            1.18742957373254270702, &
                            -0.01833585209646059034, &
                            0.34399425728109261313]
                b_coeffs = [0.00016600692650009894, &
                            -0.37962421426377360608, &
                            0.68913741185181063674, &
                            0.38064159097092574080]

                state = initial_state
                solution(:,1) = initial_state
                timestamps(1) = 0
                do i = 1,num_timesteps
                    timestamps(i+1) = i*dt
                    !print*, 'Timestep', i, dt 
                    state(:) = hill_ode_step(state, a_coeffs, b_coeffs, dt)
                    !print*, 'Resulting state', state
                    solution(:,i+1) = state
                end do

        end subroutine solve_hill_problem


        function hill_ode_step(state, a_coeffs, b_coeffs, dt) result(new_state)
                use hill_hamiltonians
                implicit none
                integer, parameter :: dp = selected_real_kind(15, 307)
                real(kind=dp), dimension(4), intent(in) :: state
                real(kind=dp), dimension(4), intent(in) :: a_coeffs
                real(kind=dp), dimension(4), intent(in) :: b_coeffs
                real(kind=dp), intent(in) :: dt
                real(kind=dp), dimension(4) :: new_state
                integer :: i

                new_state = state

                ! Hardcode all the things!
                ! See Eqn. 7 of Verrier, Low Energy Capture of asteroids
                ! onto KAM tori

                new_state = h2_flow(new_state, dt*b_coeffs(1))
                new_state = h1_flow(new_state, dt*a_coeffs(1))
                new_state = h2_flow(new_state, dt*b_coeffs(1))
                new_state = h1_flow(new_state, dt*a_coeffs(2))
                new_state = h2_flow(new_state, dt*b_coeffs(2))
                new_state = h1_flow(new_state, dt*a_coeffs(3))
                new_state = h2_flow(new_state, dt*b_coeffs(3))
                new_state = h1_flow(new_state, dt*a_coeffs(4))
                new_state = h2_flow(new_state, dt*b_coeffs(4))
                new_state = h1_flow(new_state, dt*a_coeffs(4))
                new_state = h2_flow(new_state, dt*b_coeffs(3))
                new_state = h1_flow(new_state, dt*a_coeffs(3))
                new_state = h2_flow(new_state, dt*b_coeffs(2))
                new_state = h1_flow(new_state, dt*a_coeffs(2))
                new_state = h2_flow(new_state, dt*b_coeffs(1))
                new_state = h1_flow(new_state, dt*a_coeffs(1))

                !print*, 'Final update', new_state

        end function hill_ode_step
