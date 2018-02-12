# About

A ChatBot with functions of FAQ for that the users can to access the list of questions and answers.

## Purpose

This project has with purpose the learning new skills. The project was developed following the lessons of bootcamp in the [OneBitCode](onebitcode.com), with exception of some features that was developed for to conclude the challenges proposed. Follow the features developed for me (challenges):  
* aggregator of links (inclusion of the struct for save the links)

## Prerequisites

* Docker
* Docker Compose

## Getting started

The steps below will help you in the building this project in the development and test environment:

### 1. Clone the Project
```
git clone git@github.com:rivelinojunior/bootcampSFS-onebitbot.git
```

### 2. Building the project with docker/docker-compose
```
  docker-compose up --build
```

### 3. Access the application in your browser
> localhost:9292/sinatra

## Running the test
```
docker-compose run --rm app bundle exec rspec
```

## Building with the technologies
* Sinatra
* Postgresql
* Docker / Docker Compose
* Rspec

## Credits
* Rivelino Junior - [@rivelinojunior](http://github.com/rivelinojunior)
* Onebitcode - [blog](http://www.onebitcode.com)