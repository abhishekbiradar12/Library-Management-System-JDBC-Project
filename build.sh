#!/bin/bash
if [ ! -f lib/mysql-connector-java.jar ]; then
  echo "ERROR: Place mysql-connector-java.jar into the lib/ folder"
  exit 1
fi

rm -rf out
mkdir -p out

echo "Compiling..."
javac -cp lib/mysql-connector-java.jar -d out src/com/library/*.java
if [ $? -ne 0 ]; then
  echo "Compilation failed."
  exit 1
fi

rm -rf dist
mkdir -p dist

echo "Creating jar..."
jar cfe dist/LibraryJDBCProject.jar com.library.Main -C out .

echo "Build complete. Run:"
echo "java -cp "dist/LibraryJDBCProject.jar:lib/mysql-connector-java.jar" com.library.Main"
