#include <stdio.h>
#include "Test.h"

JNIEXPORT jstring JNICALL Java_Test_print(JNIEnv *env, jobject obj, jstring name) {
  const char* cname = (*env)->GetStringUTFChars(env, name, 0);
  printf("Hello from C, %s!\n", cname);
  (*env)->ReleaseStringUTFChars(env, name, cname);
  return (*env)->NewStringUTF(env, "Hello from C!");
}
