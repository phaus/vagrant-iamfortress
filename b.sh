#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64
export ANT_HOME=./apache-ant
$ANT_HOME/bin/ant $1 $2 $3 $4
