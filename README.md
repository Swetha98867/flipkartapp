# 🚀 FlipkartApp - Maven + Tomcat Deployment

## 📌 Project Overview

This is a simple Java web application built using **Maven** and deployed on **Apache Tomcat**.
It demonstrates how to:

* Build a WAR file using Maven
* Deploy the application manually and via Maven plugin
* Automate deployment using shell scripts

---

## 🛠️ Technologies Used

* Java
* Maven
* Apache Tomcat
* JSP

---

## 📂 Project Structure

```
flipkartapp/
 ├── src/
 │   └── main/
 │       └── webapp/
 │           └── index.jsp
 ├── pom.xml
 ├── deploy.sh
 └── target/
```

---

## ⚙️ Build the Project

```bash
mvn clean package
```

👉 Generates:

```
target/flipkartapp.war
```

---

## 🚀 Manual Deployment (Tomcat)

```bash
cp target/flipkartapp.war /opt/tomcat9/webapps/
```

Start Tomcat:

```bash
sh /opt/tomcat9/bin/startup.sh
```

Access:

```
http://localhost:8081/flipkartapp
```

---

## ⚡ Maven Plugin Deployment

Configure plugin in `pom.xml`:

```xml
<plugin>
    <groupId>org.apache.tomcat.maven</groupId>
    <artifactId>tomcat7-maven-plugin</artifactId>
    <version>2.2</version>
</plugin>
```

Deploy:

```bash
mvn tomcat7:deploy
```

---

## 🤖 Automated Deployment Script

Run:

```bash
./deploy.sh
```

This script:

* Builds the project
* Deploys WAR to Tomcat
* Automates the process

---

## 🔐 Tomcat Manager Setup

Edit:

```
/opt/tomcat9/conf/tomcat-users.xml
```

Add:

```xml
<role rolename="manager-script"/>
<user username="admin" password="admin123" roles="manager-script"/>
```

---

## ❗ Common Issues

* **401 Unauthorized** → Check roles in `tomcat-users.xml`
* **Build Failure** → Ensure `pom.xml` is correct
* **App not loading** → Verify Tomcat is running

---

## 🎯 Learning Outcome

* Maven project structure
* WAR packaging
* Tomcat deployment
* Automation using shell scripting
* CI/CD basics

---

## 👤 Author

Swetha

---
