JAR_NAME=target/clojure-jni-example-standalone.jar
LIB_NAME=jni/libtest.so
# My makefile-fu is lacking. This needs to be correct for your platform.
JNI_PLATFORM=linux 
C_FILES=src-c/Test.c
C_HEADER=src-c/Test.h

run: jni/libtest.so $(JAR_NAME)
	java -jar $(JAR_NAME)

$(JAR_NAME): target/classes/Test.class src-c/Test.h
	lein uberjar

target/classes/Test.class: src-java/Test.java
	lein javac

$(C_HEADER): target/classes/Test.class
	mkdir -p jni
	javah -o $(C_HEADER) -cp target/classes Test
	@touch $(C_HEADER)

$(LIB_NAME): $(C_FILES) $(C_HEADER)
	$(CC) -I $(JAVA_HOME)/include -I $(JAVA_HOME)/include/$(JNI_PLATFORM) -shared $(C_FILES) -o $(LIB_NAME) -fPIC

clean:
	lein clean
	rm -rf jni/
	rm $(C_HEADER)

.PHONY: run clean
