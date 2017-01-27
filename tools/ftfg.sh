#!/bin/sh

find . -type f -print | xargs grep $1

