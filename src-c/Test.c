#include <stdio.h>
#include "Test.h"

JNIEXPORT void JNICALL Java_Test_print(JNIEnv *env, jobject obj) {
  printf("Hello from C!\n");
  return;
}
