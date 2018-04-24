subroutine eulermethod(y, dxdy, x, h, yout, derivs)
      use nrtype; use nrutil, only : assert_eq
      implicit none
      real(sp), intent(in) :: y, dxdy
      real(sp), intent(in) :: x, h
      real(sp), intent(out) :: yout
      interface
              subroutine derivs(x, y, dxdy)
              use nrtype
              implicit none
              real(sp), intent(in) :: x
              real(sp), intent(in) :: y
              real(sp),  intent(out) :: dxdy
              end subroutine derivs
      end interface

      real(sp) :: dy
      call derivs(x, y, dy)
      yout = dy*h + y 
end subroutine eulermethod
