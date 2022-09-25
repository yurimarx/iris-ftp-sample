 [![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/iris-interoperability-template)
 [![Quality Gate Status](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Firis-interoperability-template&metric=alert_status)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Firis-interoperability-template)
 [![Reliability Rating](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Firis-interoperability-template&metric=reliability_rating)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Firis-interoperability-template)
# iris-ftp-sample
This is a sample how to use FTP Adapter (Inbound and Outbound).

## What The Sample Does

This sample has an interoperability [production](https://github.com/yurimarx/iris-ftp-sample/blob/master/src/dc/irisftpsample/FTPSampleProduction.cls) for:
1. Receive  CSV data using FTP Inbound Adapter into a [LoadCSVFTPBusinessService Business Service](https://github.com/yurimarx/iris-ftp-sample/blob/master/src/dc/irisftpsample/LoadCSVFTPBusinessService.cls) and send its content to a [LoadCSVFTPBusinessOperation Business Operation](https://github.com/yurimarx/iris-ftp-sample/blob/master/src/dc/irisftpsample/LoadCSVFTPBusinessService.cls) to persist the content in a Persistent class using [csvgen](https://openexchange.intersystems.com/package/csvgen).
2. Do CDC (Change Data Capture) on Payment table using SQL Inbound Adapter into a PaymentSQLBusinessService Business Operation and send table data (inside a JSON file) to a [SendSQLDataToFTPBusinessOperation Business Operation](https://github.com/yurimarx/iris-ftp-sample/blob/master/src/dc/irisftpsample/SendSQLDataToFTPBusinessOperation.cls) for put the json file into FTP server.

Here you can see this production:
<img  alt="FTP Sample Production" src="https://github.com/yurimarx/iris-ftp-sample/raw/master/ftpproduction.jpg">


## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation: ZPM

Open IRIS Namespace with Interoperability Enabled.
Open Terminal and call:
USER>zpm "install iris-ftp-sample"

## Installation: Docker
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/iris-ftp-sample.git
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

1. Create the credentials to access the FTP server (Go to Interoperability > Configure > Credentials):
    - ID: FTPCredentials
    - User Name: irisuser
    - Password: sys

    - Here is likes look it:
<img alt="Credentials for acessing the FTP server" src="https://github.com/yurimarx/iris-ftp-sample/raw/master/credentials.jpg">

2. Open the [production](http://localhost:52795/csp/user/EnsPortal.ProductionConfig.zen?PRODUCTION=dc.irisftpsample.FTPSampleProduction) and start it. It is the production:

<img alt="Credentials for acessing the FTP server" src="https://github.com/yurimarx/iris-ftp-sample/raw/master/ftpproduction.jpg">

3. Open a FTP client (I'm using [Filezilla](https://filezilla-project.org/)) and put the input/countries.csv file into the root FTP folder:
    - Host: localhost
    - User name: irisuser
    - Password: sys
    - Image showing how to put the file on FTP server root folder:
<img alt="FTP Client" src="https://github.com/yurimarx/iris-ftp-sample/raw/master/ftpclient.jpg">

4. Go to the System Explorer > SQL and type `SELECT country, latitude, longitude, name FROM dc_irisftpsample.Country`. See here likes look the csv data loaded into the sql table:
<img alt="Select csv results" src="https://github.com/yurimarx/iris-ftp-sample/raw/master/select.jpg">

5. Go to the System Explorer > SQL and type `insert into dc_irisftpsample.Payment(amount payer, receiver, transactiondate) values(100.0,'Yuri','Fabiana', CURRENT_TIMESTAMP)`. See here likes look the JSON file into the FTP server with the data inserted:
<img alt="Select csv results" src="https://github.com/yurimarx/iris-ftp-sample/raw/master/json.jpg">

## How to work with this sample 

This repository is ready to code in VSCode with the ObjectScript plugin.
Install [VSCode](https://code.visualstudio.com/), [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) and [ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) plugin and open the folder in VSCode.

Use the handy VSCode menu to access the production and business rule editor and run a terminal:
<img width="656" alt="Screenshot 2020-10-29 at 20 15 56" src="https://user-images.githubusercontent.com/2781759/97608650-aa673480-1a23-11eb-999e-61e889304e59.png">
