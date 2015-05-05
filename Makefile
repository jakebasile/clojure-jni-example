.PHONY: run clean

JAVA_HOME=$(shell update-java-alternatives -l | cut -f 3- -d ' ')
JNI_DIR=target/jni
CLASS_DIR=target/classes
CLASS_NAME=Test
CLASS_FILE=$(CLASS_DIR)/$(CLASS_NAME).class
JAR_FILE=target/clojure-jni-example-standalone.jar
LIB_FILE=$(JNI_DIR)/libtest.so
JAVA_FILE=src-java/Test.java
C_FILE=src-c/Test.c
C_HEADER=$(JNI_DIR)/Test.h
INCLUDE_DIRS=$(shell find $(JAVA_HOME)/include -type d)
INCLUDE_ARGS=$(INCLUDE_DIRS:%=-I%) -I$(JNI_DIR)

run: $(LIB_FILE) $(JAR_FILE)
	java -jar $(JAR_FILE)

jar: $(JAR_FILE)

$(JAR_FILE): $(CLASS_FILE) $(C_HEADER)
	lein uberjar

$(CLASS_FILE): $(JAVA_FILE)
	lein javac

header: $(C_HEADER)

$(C_HEADER): $(CLASS_FILE)
	mkdir -p $(JNI_DIR)
	javah -o $(C_HEADER) -cp $(CLASS_DIR) $(CLASS_NAME)
	@touch $(C_HEADER)

lib: $(LIB_FILE)

$(LIB_FILE): $(C_FILE) $(C_HEADER)
	$(CC) $(INCLUDE_ARGS) -shared $(C_FILE) -o $(LIB_FILE) -fPIC

clean:
	lein clean
	rm -rf $(JNI_DIR)

