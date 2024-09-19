#!/bin/bash

# Variables
REPO_NAME="simple-java-app"
DOCKERFILE_CONTENT="FROM openjdk:11-jre-slim
COPY target/simple-java-app.jar /usr/app/simple-java-app.jar
CMD [\"java\", \"-jar\", \"/usr/app/simple-java-app.jar\"]"

# Create project directory
mkdir $REPO_NAME
cd $REPO_NAME

# Create pom.xml file
cat <<EOF > pom.xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>simple-java-app</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>jar</packaging>

    <properties>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
    </properties>

    <dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.13.2</version>
            <scope>test</scope>
        </dependency>
    </dependencies>
</project>
EOF

# Create src directory and main application file
mkdir -p src/main/java/com/example
cat <<EOF > src/main/java/com/example/App.java
package com.example;

public class App {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
EOF

# Create Dockerfile
echo "$DOCKERFILE_CONTENT" > Dockerfile

# Create a .gitignore file
echo "target/" > .gitignore

# Initialize a Git repository
git init
git add .
git commit -m "Initial commit"

echo "Project $REPO_NAME has been set up successfully!"

