FROM maven
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN mvn clean install
CMD "mvn" "exec:java"
Copy that to a file named Dockerfile, then build and run it.
$ docker build . -t java-application
$ docker run -p 8080:8080 java-application
