# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

##System dependencies

### Linux packages dependencies 

  * ImageMagick

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

### Enviroment variables
  - You need to set follow variables
    AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY
    AWS_REGION
    AWS_BUCKET


  * You can set envirnment variables on .env file, for docker-compose 
#### Nginx

If you installed Nginx through the Debian or Ubuntu packages, then you can define environment variables in /etc/default/nginx. This is a shell script so you must use the export FOO=bar syntax.

Otherwise, environment variables are best set through the script which starts Nginx. For example, if you installed Nginx from source and you used the Nginx init script described here then you should edit that script to define the environment variables. Those init scripts are regular shell scripts, so use the export FOO=bar syntax. Just make sure your set your environment variables before the script starts Nginx.

### Apache

On Debian and Ubuntu, with an Apache installed through apt, Apache environment variables are defined in the file /etc/apache2/envvars. This is a shell script so environment variables must be specified with the shell syntax.

On Red Hat, Fedora, CentOS and ScientificLinux, with an Apache installed through YUM, Apache environment variables are defined in /etc/sysconfig/httpd.

On macOS they are defined in /usr/sbin/envvars and /System/Library/LaunchDaemons/org.apache.httpd.plist, as explained here on Stack Overflow. As of macOS 10.11 you must temporarily disable SIP to edit these files as explained here on Stack Overflow.

On other systems, or if you did not install Apache through the system's package manager, the configuration file for environment variables is specific to the vendor that supplied Apache. There may not even be such a configuration file. You should contact the vendor for support.

* ...
