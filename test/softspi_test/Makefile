MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
PROJ_NAME=$(CURRENT_DIR)
#-----------------------------------
INCLUDE=-I../../pru/include -I../../pru/lib/softspi
#-----------------------------------
LIB_DIR=../../pru/lib/softspi/

CXX=clang++ # gcc 7.2 seems to break currently on the transfer loop where sizeof(...) is used. 
CFLAGS= -O3 -g  -std=c++11  -DPRU_SUPPORT_OVERRIDE_R30 -DPRU_SUPPORT_OVERRIDE_R31

SOURCES=$(wildcard *.cpp)
#Using .object instead of .obj in order to not conflict with the CCS build process
OBJECTS=$(SOURCES:.cpp=.o)
TARGETS=$(OBJECTS:.o=_test)

test: all

all: printStart $(TARGETS) printEnd

printStart:
	@echo ''
	@echo '************************************************************'
	@echo 'Building project: $(PROJ_NAME)'

printEnd:
	@echo ''
	@echo 'Finished building project: $(PROJ_NAME)'
	@echo '************************************************************'
	@echo ''

# Invokes the archiver to make the .lib file
%_test: %.cpp
	@echo ''
	@echo 'Building target: $@'
	$(CXX) $(INCLUDE) $(CFLAGS) -o $@ $<
	@echo 'Finished building target: $@'
	@echo ''

# Invokes the compiler on all c files in the directory to create the object files
%.o: %.cpp
	@echo ''
	@echo 'Building file: $<'
	@echo 'Invoking: CC Compiler'
	$(CXX) $(INCLUDE) $(CFLAGS) -c -o $@ $<

.PHONY: all clean

# Remove the $(GEN_DIR) directory
clean:
	@echo ''
	@echo '************************************************************'
	@echo 'Cleaning project: $(PROJ_NAME)'
	@echo ''
	@echo 'Removing files in the "$(GEN_DIR)" directory'
	@rm -rf $(OBJECTS) $(TARGETS)
	@echo ''
	@echo 'Finished cleaning project: $(PROJ_NAME)'
	@echo '************************************************************'
	@echo ''

# Includes the dependencies that the compiler creates (-ppd and -ppa flags)
# -include $(OBJECTS:%.object=%.pp)
