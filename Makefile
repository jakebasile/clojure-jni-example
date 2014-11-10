.PHONY: run clean

JAR_NAME=target/clojure-jni-example-standalone.jar
LIB_NAME=jni/libtest.so
C_FILES=src-c/test.c
C_HEADER=src-c/test.h
INCLUDE_DIRS=$(shell find $(JAVA_HOME)/include -type d)
INCLUDE_ARGS=$(INCLUDE_DIRS:%=-I%)

run: jni/libtest.so $(JAR_NAME)
	java -jar $(JAR_NAME)

$(JAR_NAME): target/classes/Test.class src-c/test.h
	lein uberjar

target/classes/Test.class: src-java/Test.java
	lein javac

$(C_HEADER): target/classes/Test.class
	mkdir -p jni
	javah -o $(C_HEADER) -cp target/classes Test
	@touch $(C_HEADER)

$(LIB_NAME): $(C_FILES) $(C_HEADER)
	$(CC) $(INCLUDE_ARGS) -shared $(C_FILES) -o $(LIB_NAME)

clean:
	lein clean
	rm -rf jni/
	rm $(C_HEADER)

