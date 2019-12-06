# ----- Make Macros -----

CXX     = CC
CXXFLAGS = -std=c++11 -march=native -O3 -fopenmp -Wall -Wextra -Wstrict-aliasing -Wshadow -Wpedantic -Wno-unused-result -ffast-math

LD_FLAGS = -lgomp  $(CRAY_CUDATOOLKIT_POST_LINK_OPTS) -InvToolsExt

TARGETS = mom
OBJECTS = mom.o setup_mlfma.o integrate.o setup_born.o solve.o bicgs.o

# ----- Make Rules -----
all:    $(TARGETS)

%.o : %.cpp
	${CXX} ${CXXFLAGS} $^ -c -o $@

mom: $(OBJECTS)
	$(CXX) -o $@ $(OBJECTS) $(LD_FLAGS)

clean:
	rm -f $(TARGETS) *.o *.txt *.bin core
