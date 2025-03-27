# Store the names of all the executable binaries to build.
executables := math_ops string_ops data_ops all_ops

# Store the names of all the target object files which will be used to build the binaries.
math_objs := src/mathop/main_math.o src/mathop/mathop.o
string_objs := src/stringop/main_string.o src/stringop/stringop.o
data_objs := src/dataop/main_data.o src/dataop/dataop.o
all_objs := src/main.o src/mathop/mathop.o src/stringop/stringop.o src/dataop/dataop.o 

# Uses pattern matching to change all the .o files to .d files, in order to track header dependencies.
dependencies := $(math_objs:%.o=%.d) $(string_objs:%.o=%.d) $(data_objs:%.o=%.d) $(all_objs:%.o=%.d)

# Defining the variables to use during compile time.
CC := gcc
DEBUG_FLAG := -O2
CFLAGS := -Iinclude

# Conditional statement which checks if DEBUG is 1 (set by adding DEBUG=1 while executing make).
ifeq ($(DEBUG),1)
	DEBUG_FLAG := -g -DDEBUG
else 
	DEBUG_FLAG := -O2
endif

# Builds all the executables.
all: $(executables)

# Build the string operations executable.
string_ops: $(string_objs)
	$(CC) $^ -o $@ $(CFLAGS) $(DEBUG_FLAG)

# Build the math operations executable.
math_ops: $(math_objs)
	$(CC) $^ -o $@ $(CFLAGS) $(DEBUG_FLAG)

# Build the data operations executable.
data_ops: $(data_objs)
	$(CC) $^ -o $@ $(CFLAGS) $(DEBUG_FLAG)

# Build the executable for all_ops.
all_ops: $(all_objs)
	$(CC) $^ -o $@ $(CFLAGS) $(DEBUG_FLAG)

# Uses pattern matching for all .o targets whose prerequisites are their respective .c files.
%.o: %.c 
	$(CC) -c $< -o $@ $(CFLAGS) $(DEBUG_FLAG) -MMD -MP
# Above statement also creates a .d file which stores the header dependency.

# Target to run math_ops.
run_math: math_ops
	./math_ops

# Target to run string_ops.
run_string: string_ops
	./string_ops

# Target to run data_ops.
run_data: data_ops
	./data_ops

# Target to run all_ops.
run_all_ops: all_ops
	./all_ops

# This line includes all the dependency files to track the dependencies.
-include $(dependencies)

# Cleans up all the files which were created.
clean:
	rm -f $(math_objs) $(string_objs) $(data_objs) $(all_objs) $(executables) $(dependencies)