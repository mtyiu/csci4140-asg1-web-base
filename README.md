# Docker base image for Assignment 1

## Installed packages

- Apache with CGI enabled
- php
- phpMyAdmin
- Python
- MySQLdb

## Environment variables summary

* ``PMA_ARBITRARY`` - when set to 1 connection to the arbitrary server will be allowed
* ``PMA_HOST`` - define address/host name of the MySQL server
* ``PMA_PORT`` - define port of the MySQL server
* ``PMA_HOSTS`` - define comma separated list of address/host names of the MySQL servers
* ``PMA_USER`` and ``PMA_PASSWORD`` - define username to use for config authentication method
* ``PMA_ABSOLUTE_URI`` - define user-facing URI

---

*Prepared by [Matt YIU Man Tung](http://mtyiu.github.io/)*

Dedicated for the course [CSCI 4140](http://www.tywong-mole.com/~csci4140) in Spring 2016

Tutorial resource page: <https://mtyiu.github.io/csci4140-spring16/>
