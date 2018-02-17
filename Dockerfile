FROM java:8

# Copy the prepackaged jar
ADD target/sparkjava-os101.jar /app.jar

# Now all we need to do is 
RUN bash -c 'touch /app.jar'
EXPOSE 9999
ENTRYPOINT ["java","-jar","/app.jar"]