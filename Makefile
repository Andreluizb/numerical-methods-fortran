compile_modules:
	gfortran -c ./functions/whatever_function.f90 ./modules/module_linear_equations.f90  ./modules/module_no_linear_equations.f90 ./modules/module_edo.f90

test_rk4:
	gfortran -o ./rk4.exe ./test/rk4_test.f90 whatever_function.o module_edo.o

test_newton1D:
	gfortran -o ./newton1D.exe ./test/newton_test1D.f90 whatever_function.o module_linear_equations.o  module_no_linear_equations.o

test_newton3D:
	gfortran -o ./newton3D.exe ./test/newton_test3D.f90 whatever_function.o module_linear_equations.o module_no_linear_equations.o

test_lu:
	gfortran -o ./lu.exe ./test/linear_sys_lu.f90 whatever_function.f90 module_linear_equations.o

test_euler_explicit:
	gfortran -o ./euler_explicit.exe ./test/euler_explicit.f90 whatever_function.o module_edo.o

test_fix_point:
	gfortran -o ./fix_point3D.exe ./test/fix_point3D.f90 whatever_function.o module_no_linear_equations.o module_linear_equations.o 

clean:
	rm *.mod *.o *.exe
