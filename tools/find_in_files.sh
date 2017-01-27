#!/bin/sh

find . -type f -print | \
	grep -v "/.git" | \
	grep -v "/bin" | \
	grep -v "/db/member" | \
	grep -v "/db/roster" | \
	grep -v "/db/.*csv" | \
	grep -v "/db/.*log" | \
	grep -v "/db/.*txt" | \
	grep -v "/downloads" | \
	grep -v "/config/data" | \
	grep -v "/images" | \
	grep -v "/jquery.js$" | \
	grep -v "/log/" | \
 	grep -v "./old/" | \
 	grep -v "/public/assets" | \
 	grep -v "/public/doc" | \
 	grep -v "/public/exports" | \
 	grep -v "/public/javascripts" | \
 	grep -v "/public/static_assets" | \
 	grep -v "/public/stylesheets" | \
 	grep -v "/rails.log" | \
 	grep -v "/rails.err" | \
 	grep -v "/results" | \
 	grep -v "/tmp" | \
	grep -v ".gif$" | \
	grep -v ".jpg$" | \
	grep -v ".min.css$" | \
	grep -v ".pdf$" | \
	grep -v ".png$" | \
	grep -v ".out$" | \
	grep -v ".swp$" | \
	xargs grep "$1"

