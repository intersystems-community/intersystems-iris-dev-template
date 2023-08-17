 [![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/intersystems-iris-dev-template)
 [![Quality Gate Status](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Fintersystems-iris-dev-template&metric=alert_status)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Fintersystems-iris-dev-template)
 [![Reliability Rating](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Fintersystems-iris-dev-template&metric=reliability_rating)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Fintersystems-iris-dev-template)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat&logo=AdGuard)](LICENSE)
# intersystems-iris-dev-template
This is a basic template for a development environment to work with ObjectScript in InterSystems IRIS. It helps you edit, compile, commit/push, debug and test your ObjectScript code. It also aids in packaging your application as a module installable with IPM.
The template is embedded python compatible.

## Description
This repository provides a ready-to-go development environment for coding productively with InterSystems ObjectScript. This template:
* Runs InterSystems IRIS Community Edition in a docker container
* Creates a new namespace and database IRISAPP
* Loads the ObjectScript code into IRISAPP database using Package Manager
* Promotes development with the 'Package First' paradigm. [Watch the video](https://www.youtube.com/watch?v=havPyPbUj1I)
* Provides a unit testing environment: sample unit tests, tests module enablement
* Ready for embedded python development: ENV varialbes are set up, CallIn service is On, all modules in requirements.txt will be installed during docker build.

## Usage
Start a new dev repository with InterSystems IRIS using this one as a template.
Once you clone the new repo to your laptop and open VSCode (with the [InterSystems ObjectScript Extension Pack](https://marketplace.visualstudio.com/items?itemName=intersystems-community.objectscript-pack) installed) you'll be able to start development immediately.

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation

Clone/git pull the repo into any local directory

```
$ git clone https://github.com/intersystems-community/intersystems-iris-dev-template.git
```

Open the terminal in this directory and call the command to build and run InterSystems IRIS in container:
*Note: Users running containers on a Linux CLI, should use "docker compose" instead of "docker-compose"*
*See [Install the Compose plugin](https://docs.docker.com/compose/install/linux/)*



```
$ docker-compose up -d
```

To open IRIS Terminal do:

```
$ docker-compose exec iris iris session iris -U IRISAPP
IRISAPP>
```

To exit the terminal, do any of the following:

```
Enter HALT or H (not case-sensitive)
```

## What does it do
THe sample repository contains two simplest examples of ObjectScript classes: ObjectScript method that returns value and method that creates a persistent record.

1. Open IRIS terminal and run the ObjectScript Test() method to see if runs the script and returns values from IRIS:

```
$ docker-compose exec iris iris session iris -U IRISAPP
IRISAPP>write ##class(dc.sample.ObjectScript).Test()
It works!
42
```



2. Class `dc.sample.PersistentClass` contains a method `CreateRecord` that creates an object with one property, `Test`, and returns its id.

Open IRIS terminal and run:

```
IRISAPP>write ##class(dc.sample.PersistentClass).CreateRecord(.id)
1
IRISAPP>write id
1
```

In your case the value of id could be different. And it will be different with every call of the method.

You can check whether the record exists and try to right the property of the object by its id.

```
IRISAPP>write ##class(dc.sample.PersistentClass).ReadProperty(id)
Test string
```

## How to start the development

This repository is ready to code in VSCode with the ObjectScript plugin.

Install [VSCode](https://code.visualstudio.com/), [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) and the [InterSystems ObjectScript Extension Pack](https://marketplace.visualstudio.com/items?itemName=intersystems-community.objectscript-pack) plugin and open the folder in VSCode.

Open the `/src/cls/PackageSample/ObjectScript.cls` class and make changes - it will be compiled in the running IRIS docker container.

![docker_compose](https://user-images.githubusercontent.com/2781759/76656929-0f2e5700-6547-11ea-9cc9-486a5641c51d.gif)

Feel free to delete the PackageSample folder and place your ObjectScript classes in the form
`/src/organisation/package/Classname.cls`

[Read more about folder setup for InterSystems ObjectScript](https://community.intersystems.com/post/simplified-objectscript-source-folder-structure-package-manager) and here on the [naming convention](https://community.intersystems.com/post/naming-convention-objectscript-packages-classes-and-package-manager-modules-names)

## Running unit tests

The template contains two test classes: `TestObjectScript.cls` and `TestPersistentClass.cls `

To run the unit tests we can use the Package Manager environment.

```
IRISAPP>zpm

=============================================================================
|| Welcome to the Package Manager Shell (ZPM).                             ||
|| Enter q/quit to exit the shell. Enter ?/help to view available commands ||
=============================================================================
zpm:IRISAPP>load /home/irisowner/dev

[IRISAPP|dc-sample]     Reload START (/home/irisowner/dev/)
[IRISAPP|dc-sample]     requirements.txt START
[IRISAPP|dc-sample]     requirements.txt SUCCESS
[IRISAPP|dc-sample]     Reload SUCCESS
[dc-sample]     Module object refreshed.
[IRISAPP|dc-sample]     Validate START
[IRISAPP|dc-sample]     Validate SUCCESS
[IRISAPP|dc-sample]     Compile START
[IRISAPP|dc-sample]     Compile SUCCESS
[IRISAPP|dc-sample]     Activate START
[IRISAPP|dc-sample]     Configure START
[IRISAPP|dc-sample]     Configure SUCCESS
[IRISAPP|dc-sample]     Activate SUCCESS
zpm:IRISAPP>test dc-sample

[IRISAPP|dc-sample]     Reload START (/home/irisowner/dev/)
[IRISAPP|dc-sample]     Reload SUCCESS
[dc-sample]     Module object refreshed.
[IRISAPP|dc-sample]     Validate START
[IRISAPP|dc-sample]     Validate SUCCESS
[IRISAPP|dc-sample]     Compile START
[IRISAPP|dc-sample]     Compile SUCCESS
[IRISAPP|dc-sample]     Activate START
[IRISAPP|dc-sample]     Configure START
[IRISAPP|dc-sample]     Configure SUCCESS
[IRISAPP|dc-sample]     Activate SUCCESS
[IRISAPP|dc-sample]     Test STARTHello World!
This is InterSystems IRIS with version IRIS for UNIX (Ubuntu Server LTS for ARM64 Containers) 2023.2 (Build 221U) Fri Jul 21 2023 15:12:42 EDT
Current time is: 16 Aug 2023 14:32:10
Use the following URL to view the result:
http://172.31.0.2:52773/csp/sys/%25UnitTest.Portal.Indices.cls?Index=2&$NAMESPACE=IRISAPP
All PASSED

[IRISAPP|dc-sample]     Test SUCCESS
zpm:IRISAPP>
```

In case of test errors, you can find more details back in the UnitTest portal, which can be easily opened via ObjectScript menu in VSCode:

![vscvode unittest](https://user-images.githubusercontent.com/2781759/152678943-7d9d9696-e26a-449f-b1d7-f924528c8e3a.png)

If you have installed the [_InterSystems Testing Manager for VS Code_ extension](https://openexchange.intersystems.com/package/InterSystems-Testing-Manager-for-VS-Code)
you can also run unit tests directly from VSCode :
![vscvode unittest](https://raw.githubusercontent.com/intersystems-community/intersystems-testingmanager/main/images/README/Overview-Client.gif)

## What else is inside the repository

### .github folder

Contains two GitHub actions workflows:
1. `github-registry.yml`
    Once changes pushed to the repo, the action builds the docker image on Github side and pushes the image to Github registry that can be very convenient to further cloud deployement, e.g. kubernetes.
2. `objectscript-qaulity.yml`
    with every push to master or main branch the workflow launches the repo test on objectscript issues with Objectscript Quality tool, [see the examples](https://community.objectscriptquality.com/projects?sort=-analysis_date). This works if the repo is open-source only.

Both workflows are repo agnostic: so they work with any repository where they exist.

### .vscode folder
Contains two files to setup vscode environment:

#### .vscode/settings.json

Settings file to let you immediately code in VSCode with [VSCode ObjectScript plugin](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript))

#### .vscode/launch.json

Config file if you want to debug with VSCode ObjectScript

### src folder

Contains source files.
src/iris contains InterSystems IRIS Objectscript code

### tests folder
Contains unit tests for the ObjectScript classes

### dev.md

Contains a set of useful commands that will help during the development

### docker-compose.yml

A docker engine helper file to manage images building and rule ports mapping an the host to container folders(volumes) mapping

### Dockerfile

The simplest dockerfile which starts IRIS and imports code from /src folder into it.
Use the related docker-compose.yml to easily setup additional parametes like port number and where you map keys and host folders.


### iris.script

Contains objectscript commands that are feeded to iris during the image building

### module.xml

IPM Module's description of the code in the repository.
It describes what is loaded with the method, how it is being tested and what apps neeed to be created, what files need to be copied.

[Read about all the files in this artilce](https://community.intersystems.com/post/dockerfile-and-friends-or-how-run-and-collaborate-objectscript-projects-intersystems-iris)



## Troubleshooting

If you have issues with docker image building here are some recipes that could help.

1. You are out of free space in docker. You can expand the amount of space or clean up maually via docker desktop. Or you can call the following line to clean up:
```
docker system prune -f
```

2. We use multi-stage image building which in some cases doesn't work. Switch the target to [builder](https://github.com/intersystems-community/intersystems-iris-dev-template/blob/6ab6791983e5783118efce1777a7671046652e4c/docker-compose.yml#L7) from final in the docker compose and try again.

