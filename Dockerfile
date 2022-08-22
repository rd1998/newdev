FROM maven:3.6.0-jdk-11-slim
COPY ./ /app
WORKDIR /app
ENTRYPOINT [ "mvn" ]
CMD ["mvn install"]
CMD ["mvn package -Pproduction"]
CMD ["npm cache clean --force"]
CMD ["jetty:run","-Djetty.port=8888"]
