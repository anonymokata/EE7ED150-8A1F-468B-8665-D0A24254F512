CC ?= gcc
CFLAGS = -Wall -O3
DEFS =
INCLUDES = -Isrc
TEST_INCLUDES = -Itests
LIBS = -lcheck -lm -pthread -lrt
TARGET = cRomanNumeralCalculator
SRCS =	src/*.c
TEST_SRCS = tests/*.c
TEST_DIR = tests
TEST_TARGET = run_tests


all: application tests


tests: parsing

application: $(SRCS)
	 $(CC) $(SRCS) $(TEST_SRCS) $(CFLAGS) $(DEFS) -DAPPLICATION $(INCLUDES) $(TEST_INCLUDES) $(LIBS) -o $(TARGET)


parsing: $(SRCS)
	 $(CC) $(SRCS) $(TEST_SRCS) $(CFLAGS) $(DEFS) -DPARSING $(INCLUDES) $(TEST_INCLUDES) $(LIBS) -o $(TEST_DIR)/$(TEST_TARGET)


clean:
	rm $(TARGET) $(TEST_DIR)/$(TEST_TARGET)
