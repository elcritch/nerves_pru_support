MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
PROJ_NAME=$(CURRENT_DIR)
#-----------------------------------
INCLUDE=-I../../pru/include -I../../pru/lib/softspi
#-----------------------------------
GEN_DIR=gen
LIB_DIR=../../pru/lib/softspi/

CFLAGS= -O1 -g  -std=c++11  -DPRU_SUPPORT_OVERRIDE_R30 -DPRU_SUPPORT_OVERRIDE_R31

TARGET=$(GEN_DIR)/$(PROJ_NAME)
SOURCES=$(wildcard *.cpp)
#Using .object instead of .obj in order to not conflict with the CCS build process
OBJECTS=$(patsubst %,$(GEN_DIR)/%,$(SOURCES:.cpp=.o))

test: all

all: printStart $(TARGET) printEnd

printStart:
	@echo ''
	@echo '************************************************************'
	@echo 'Building project: $(PROJ_NAME)'
	@mkdir -p $(GEN_DIR)

printEnd:
	@echo ''
	@echo 'Finished building project: $(PROJ_NAME)'
	@echo '************************************************************'
	@echo ''

# Invokes the archiver to make the .lib file
$(TARGET): $(OBJECTS)
	@echo ''
	@echo 'Building target: $@'
	@echo 'Invoking: PRU Archiver'
	$(CXX) $(CFLAGS) -o $(TARGET) $(OBJECTS)
	@echo 'Finished building target: $@'
	@echo ''
	@echo 'Output files can be found in the "$(GEN_DIR)" directory'

# Invokes the compiler on all c files in the directory to create the object files
$(GEN_DIR)/%.o: %.cpp
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
	@rm -rf $(GEN_DIR)
	@echo ''
	@echo 'Finished cleaning project: $(PROJ_NAME)'
	@echo '************************************************************'
	@echo ''

# Includes the dependencies that the compiler creates (-ppd and -ppa flags)
# -include $(OBJECTS:%.object=%.pp)
