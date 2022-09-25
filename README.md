 [![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/iris-interoperability-template)
 [![Quality Gate Status](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Firis-interoperability-template&metric=alert_status)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Firis-interoperability-template)
 [![Reliability Rating](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Firis-interoperability-template&metric=reliability_rating)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Firis-interoperability-template)
# iris-ftp-sample
This is a sample how to use FTP Adapter (Inbound and Outbound).

## What The Sample Does

This sample has an interoperability [production](https://github.com/yurimarx/iris-ftp-sample/blob/master/src/dc/irisftpsample/FTPSampleProduction.cls) for:
1 - Receive  CSV data using FTP Inbound Adapter into a [LoadCSVFTPBusinessService Business Service](https://github.com/yurimarx/iris-ftp-sample/blob/master/src/dc/irisftpsample/LoadCSVFTPBusinessService.cls) and send its content to a [LoadCSVFTPBusinessOperation Business Operation](https://github.com/yurimarx/iris-ftp-sample/blob/master/src/dc/irisftpsample/LoadCSVFTPBusinessService.cls) to persist the content in a Persistent class using [csvgen](https://openexchange.intersystems.com/package/csvgen).
2 - Do CDC (Change Data Capture) on Payment table using SQL Inbound Adapter into a PaymentSQLBusinessService Business Operation and send table data (inside a JSON file) to a [SendSQLDataToFTPBusinessOperation Business Operation](https://github.com/yurimarx/iris-ftp-sample/blob/master/src/dc/irisftpsample/SendSQLDataToFTPBusinessOperation.cls) for put the json file into FTP server.

Here you can see this production:
<img  alt="FTP Sample Production" src="https://user-images.githubusercontent.com/2781759/97603605-a6d0af00-1a1d-11eb-99cc-481efadb0ec6.png">

The production has a business process with a rule, which filters on news that mentions cats and dogs. The business process then sends this data to a business operation which either saves data to a source folder /output/Dog.txt or /output/Cat.txt.
<img width="864" alt="Screenshot 2020-10-29 at 19 38 58" src="https://user-images.githubusercontent.com/2781759/97606568-fcf32180-1a20-11eb-90de-4257dd2cf552.png"> 

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation: ZPM

Open IRIS Namespace with Interoperability Enabled.
Open Terminal and call:
USER>zpm "install interoperability-sample"

## Installation: Docker
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/intersystems-community/iris-interoperability-template.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```



## How to Run the Sample

Open the [production](http://localhost:52795/csp/user/EnsPortal.ProductionConfig.zen?PRODUCTION=dc.Demo.Production) and start it.
It will start gathering news from reddit.com/new/ and filter it on cats and dogs into /output/Dog.txt or /output/Cat.txt files.

You can alter the [business rule](http://localhost:52795/csp/user/EnsPortal.RuleEditor.zen?RULE=dc.Demo.FilterPostsRoutingRule) to filter for different words, or to use an email operation to send posts via email.
<img width="1123" alt="Screenshot 2020-10-29 at 20 05 34" src="https://user-images.githubusercontent.com/2781759/97607761-77707100-1a22-11eb-9ce8-0d14d6f6e315.png">

## How to alter the template 
Use the green    "Use this template" button on Github to copy files into a new repository and build a new IRIS interoperability solution using this one as an example.

This repository is ready to code in VSCode with the ObjectScript plugin.
Install [VSCode](https://code.visualstudio.com/), [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) and [ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) plugin and open the folder in VSCode.

Use the handy VSCode menu to access the production and business rule editor and run a terminal:
<img width="656" alt="Screenshot 2020-10-29 at 20 15 56" src="https://user-images.githubusercontent.com/2781759/97608650-aa673480-1a23-11eb-999e-61e889304e59.png">
