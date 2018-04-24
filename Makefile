UFFIX := $(shell python3-config --extension-suffix)
DEPS=hill_hamiltonians.f90

default: hill_solver$(EXT_SUFFIX)

%$(EXT_SUFFIX): %.f90 
	    f2py -c -m $* $< $(DEPS)
