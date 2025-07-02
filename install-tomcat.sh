#!/bin/bash

# Set your actual Tomcat path
TOMCAT_DIR=/opt/tomcat
# or whatever the real version is
WAR_NAME=myapp.war

# Stop Tomcat
$TOMCAT_DIR/bin/shutdown.sh

# Wait a few seconds
sleep 5

# Remove old app
rm -rf $TOMCAT_DIR/webapps/${WAR_NAME%.*}*
rm -f $TOMCAT_DIR/webapps/$WAR_NAME

# Copy new WAR file from Jenkins workspace
cp $WAR_NAME $TOMCAT_DIR/webapps/

# Start Tomcat
$TOMCAT_DIR/bin/startup.sh

