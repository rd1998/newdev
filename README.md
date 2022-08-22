# Welcome to Vaadin Project 

## Workflow

To compile the entire project, run "mvn install" in the project root.

Other basic workflow steps:

- getting started
- compiling the whole project
  - run `mvn install` in project root
- developing the application
  - edit code in src/main
  - run `mvn`
  - open http://localhost:8080/
- creating a production mode war
  - run `mvn package -Pproduction` 
- running in production mode
  - run `mvn jetty:run -Pproduction`
  - open http://localhost:8080/
