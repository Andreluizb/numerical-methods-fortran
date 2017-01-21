!-----------------------------------------------------------------------
! Program to plot The Lotka-Volterra equations example
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------


program plot_ode_fun1
use module_edo, only: rk4
use lotka_volterra_function, only: lvf1
implicit none

real :: y0(2), a = 0.0, b = 140.0
real, allocatable :: x(:)
integer :: i, N = 2000
real, allocatable :: y(:,:)
integer :: IER, PGBEG

allocate(x(N))

IER = PGBEG(0,'?',1,1)
if (IER.NE.1) stop

y0(:) = [10.0, 5.0]

y = rk4(lvf1, a, b, N, y0)

do i=1,N
    x(i) = a + (b-a)/(N-1)*(i-1)
end do

call PGENV(a, b, 0.0, 40.0, 0, 1)
call PGLAB('(t)', '(y)', 'Lotka-Volterra equation')
CALL PGSCI(2)
call PGLINE(N,x,y(1,:))
CALL PGSCI(3)
call PGLINE(N,x,y(2,:))

call PGEND
END
