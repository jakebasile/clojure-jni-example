# clojure-jni-example

An example project demonstrating how to call a C shared library through JNI in Clojure.

I couldn't find a really complete example of this on the internet, so I decided to put what I made as a proof of concept out for anyone to see.

## Gotchas

1. I couldn't get `System.loadLibrary` to work with my shared library. I am unsure if this is by design or not.
2. You need to manually specify the JVM name for your platform (such as "darwin") in the makefile. There's probably a way around this that I am not aware of.
3. Make sure that `JAVA_HOME` is set, so that the C compiler can find the right header.
4. I have no advice for how to distribute this.

