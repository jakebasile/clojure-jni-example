public class Test {
    static {
        System.out.println("Loading C library from Java!");
        // I could not get System.loadLibrary to work correctly with a .so file.
        // The downside to this is that you need to have the full, rooted path to the shared library.
        // Suggestions or tips are welcome!
        System.load(System.getProperty("user.dir") + "/jni/libtest.so");
    }

    public static native void print();
}
