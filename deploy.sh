#!/bin/bash

# =========================
# CONFIGURATION
# =========================
PROJECT_DIR=~/Desktop/tomcatprac/flipkartapp
TOMCAT_HOME=/opt/tomcat9
WAR_NAME=flipkartapp.war

echo "🚀 Starting deployment..."

# =========================
# STEP 1: Go to project
# =========================
cd $PROJECT_DIR || { echo "❌ Project not found"; exit 1; }

# =========================
# STEP 2: Build project
# =========================
echo "📦 Building Maven project..."
mvn clean package

if [ $? -ne 0 ]; then
    echo "❌ Build failed"
    exit 1
fi

# =========================
# STEP 3: Stop Tomcat
# =========================
echo "🛑 Stopping Tomcat..."
$TOMCAT_HOME/bin/shutdown.sh

sleep 5

# =========================
# STEP 4: Remove old deployment
# =========================
echo "🧹 Cleaning old deployment..."
rm -rf $TOMCAT_HOME/webapps/flipkartapp*

# =========================
# STEP 5: Copy new WAR
# =========================
echo "📂 Copying WAR file..."
cp target/$WAR_NAME $TOMCAT_HOME/webapps/

# =========================
# STEP 6: Start Tomcat
# =========================
echo "▶️ Starting Tomcat..."
$TOMCAT_HOME/bin/startup.sh

sleep 5

# =========================
# STEP 7: Verify
# =========================
echo "🌐 Deployment done!"
echo "👉 Access: http://localhost:8081/flipkartapp"
