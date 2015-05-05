(defproject clojure-jni-example "0.1.0-SNAPSHOT"
  :description "An example of calling JNI from Clojure."
  :license {:name "BSD"
            :url "http://opensource.org/licenses/BSD-2-Clause"}
  :dependencies [[org.clojure/clojure "1.5.1"]]
  :java-source-paths ["src-java"]
  :aot [clojure-jni-example.core]
  :jar-name "clojure-jni-example.jar"
  :auto-clean false
  :uberjar-name "clojure-jni-example-standalone.jar"
  :main clojure-jni-example.core)
