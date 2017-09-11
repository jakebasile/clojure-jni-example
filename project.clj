(defproject clojure-jni-example "0.1.0-SNAPSHOT"
  :description "An example of calling JNI from Clojure."
  :license {:name "MIT"}
  :dependencies [[org.clojure/clojure "1.8.0"]]
  :java-source-paths ["src-java"]
  :aot [clojure-jni-example.core]
  :jar-name "out.jar"
  :auto-clean false
  :uberjar-name "out-standalone.jar"
  :main clojure-jni-example.core)
