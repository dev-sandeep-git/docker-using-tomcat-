# Use official Tomcat base image
FROM tomcat:latest

# Remove default webapps (optional, keeps image clean)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file built by Maven into Tomcat's webapps folder
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat default port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]

