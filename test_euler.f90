program test_euler

      implicit none

      real :: y, x, h, yout, dxdy
      integer :: num_timesteps, i
      real, dimension(:),  allocatable :: output

      y = 0
      x = 0
      h = 1

      num_timesteps = 100
      allocate(output(num_timesteps))

      do i = 1, num_timesteps
              call linearDeriv(x, y, dxdy)
              call eulermethod(y, dxdy, x, h, yout, linearderiv)
      end do


end program test_euler

subroutine linearDeriv(x, y, dxdy)
     dxdy = 2
end subroutine linearDeriv

