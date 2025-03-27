executables := math_ops string_ops data_ops all_ops

math_src := src/mathop/main_math.c src/mathop/mathop.c
string_src := src/stringop/main_string.c src/stringop/stringop.c
data_src := src/dataop/dataop.c src/dataop/main_data.c

math_depends := $(math_src) include/mathop.h
string_depends := $(string_src) include/stringop.h
data_depends := $(data_src) include/dataop.h

all_src := src/mathop/mathop.c src/stringop/stringop.c src/dataop/dataop.c src/main.c
all_depends := src/main.c src/mathop/mathop.c src/stringop/stringop.c src/dataop/dataop.c include/dataop.h include/stringop.h include/mathop.h

DEBUG_FLAG := -O2

ifeq ($(DEBUG),1)
	DEBUG_FLAG := -g -DDEBUG
else 
	DEBUG_FLAG := -O2
endif

all: $(executables)

$(executables): %.o 
	@echo $^

%.o:
	echo ""
