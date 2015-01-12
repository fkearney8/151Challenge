# 151Challenge

The 151 Challenge Website

This will eventually have the code for a 151 Challenge tracker website.  Our
shoulders will be strong and our livers prepared.

For developers:
This is built in the Scala Play framework. I've found Intellij
14 to have great support for it with the Scala plugin.

Simple development cycle is to use `activator run` to run a test webserver at
http://localhost:9000. Once this is running, you can simply edit any of the
scala.html or scala files and changes will be reflected in your browser on
refresh.

We've got a GitHub issue open to track feature ideas:
https://github.com/fkearney8/151Challenge/issues

# Database

The website uses a postgres database by default.  You will need to install and
setup a postgres database for the application.

Assuming that you are using a linux or linux-like environment and have
installed postgres through a standard binary package, you will need to setup
the user for the application and a database.

If you want to use the default configuration in the application you should have
a database called bacardi that is owned by the user bacardi and has the
password batman.  You also want your postgres server running on the default
5432).

It isn't a good idea to put passwords directly in github, but we are assuming
that you will be running the database server to only accept connections on the
localhost during development.

## Debian

On my Debian install I had to edit the postgresql.conf file to listen only on
localhost and I had to change the port from 5433 to 5432.

I edited this file `/etc/postgresql/9.1/main/postgresql.conf`

And set these configuration values:

```
listen_addresses = 'localhost'
port = 5432
```

In order to setup the database and user, you can connect to psql and create the
role and application database.

Example:

```
bcastill@alonzo:~$ su -c 'psql -U postgres template1' postgres #If you don't have a Liunx password for the postgres user, you can use "sudo -u postgres psql"
Password:
psql (9.1.14)
Type "help" for help.

template1=# create role bacardi with login password 'batman';
CREATE ROLE
template1=# create database bacardi with owner = bacardi;
CREATE DATABASE
template1=#
```

Test a remote connection:

You can test connecting with the application user over tcp using the following
command.

```
bcastill@alonzo:~/projects/151Challenge$ psql -h localhost -p 5432 -U bacardi -W
Password for user bacardi:
psql (9.1.14)
SSL connection (cipher: DHE-RSA-AES256-SHA, bits: 256)
Type "help" for help.

bacardi=> 
```

# JQuery

There's a jquery theme checked into the project and the assets
are retrievable with script tags on any page.  Take a look at
http://localhost:9000/assets/javascripts/jquery-ui-1.11.2.custom/index.html
after starting the activator webserver to see the jquery theme's examples.
