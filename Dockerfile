FROM openjdk:8
COPY . /var/www/java
WORKDIR /var/www/java
RUN javac Main.java
CMD [ "java", "Main"]
