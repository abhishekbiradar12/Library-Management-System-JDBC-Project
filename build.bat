\
        @echo off
        if not exist lib\mysql-connector-java.jar (
          echo ERROR: Place mysql-connector-java.jar into the lib\\ folder and rename it to mysql-connector-java.jar
          pause
          exit /b 1
        )

        if exist out rmdir /s /q out
        mkdir out

        echo Compiling...
        javac -cp lib\mysql-connector-java.jar -d out src\com\library\*.java
        if errorlevel 1 (
          echo Compilation failed.
          pause
          exit /b 1
        )

        if exist dist rmdir /s /q dist
        mkdir dist

        echo Creating jar...
        jar cfe dist\LibraryJDBCProject.jar com.library.Main -C out .

        echo Build complete. Run: java -cp "dist\LibraryJDBCProject.jar;lib\mysql-connector-java.jar" com.library.Main
        pause
