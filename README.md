# intersystems-iris-dev-template
This is a basic template to develop with InterSystems IRIS

## Description
* The template uses InterSystems IRIS Community Edition running in a docker container
* It uses ZPM Package Manager to load InterSystems ObjectScript
* It creates a Namespace IRISAPP without interoperability Enabled
* It is designed to develop with Package First paradigm

## Usage
start a new dev repository with InterSystems IRIS using this one as a template.
Once you clone the new repo on your laptop and open the VSCode with installed InterSystems Pack you'll be able to start development immediately

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation 
Clone/git pull the repo into any local directory
```
$ git clone https://github.com/intersystems-community/intersystems-iris-dev-template.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

## How to Test it

Open IRIS terminal:

```
$ docker-compose exec iris iris session iris
IRISAPP>write ##class(dc.PackageSample.ObjectScript).Test()
```
## How to start coding
This repository is ready to code in VSCode with ObjectScript plugin.
Install [VSCode](https://code.visualstudio.com/), [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) and [ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) plugin and open the folder in VSCode.
Open /src/cls/PackageSample/ObjectScript.cls class and try to make changes - it will be compiled in running IRIS docker container.
![docker_compose](https://user-images.githubusercontent.com/2781759/76656929-0f2e5700-6547-11ea-9cc9-486a5641c51d.gif)

Feel free to delete PackageSample folder and place your ObjectScript classes in a form
/src/Package/Classname.cls
[Read more about folder setup for InterSystems ObjectScript](https://community.intersystems.com/post/simplified-objectscript-source-folder-structure-package-manager)

The script in Installer.cls will import everything you place under /src into IRIS.


## What's inside the repository

### Dockerfile

The simplest dockerfile which starts IRIS and imports code from /src folder into it.
Use the related docker-compose.yml to easily setup additional parametes like port number and where you map keys and host folders.


### src folder
src/iris contains InterSystems IRIS Objectscript code
src/java containers Java code 
src/python - python code, etc.


### .vscode/settings.json

Settings file to let you immedietly code in VSCode with [VSCode ObjectScript plugin](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript))

### .vscode/launch.json
Config file if you want to debug with VSCode ObjectScript

[Read about all the files in this artilce](https://community.intersystems.com/post/dockerfile-and-friends-or-how-run-and-collaborate-objectscript-projects-intersystems-iris)
