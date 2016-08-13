#!/bin/sh

mv controllers/default.go .default.go
rm -f models/* controllers/*
mv .default.go controllers/default.go

bee generate model bookmark -fields="id:auto,user:string,uri:string:255,title:text,description:text,private:bool,comment_cnt:int,hit_cnt:int,pin:bool,ctime:datetime,mtime:datetime"
bee generate model tag -fields="bookmark_id:int64,tag:string:128,ctime:datetime"
bee generate model comment -fields="bookmark_id:int64,body:text,ctime:datetime"
bee generate model feed -fields="id:int64,body:text,ctime:datetime"

bee generate controller bookmark
bee generate controller comment
bee generate controller tag
bee generate controller feed
bee generate controller search
