#!/bin/bash
#this is a comment-the first line sets bash as the shell script
#su admin
#sudo su     #einloggen als Root, geht nur als Admin User


	
cd /Users/sspaeti/.Trash/
ls -ltr
cd /Volumes/Mac\ HDD/.Trashes/
ls -ltr
cd /Volumes/Mac\ SSD/.Trashes/
ls -ltr
cd /Volumes/LACIE/.Trashes/
ls -ltr
cd /Volumes/Work\ exFAT/.Trashes/
ls -ltr
cd /Volumes/MAC/.Trashes/
ls -ltr
cd /Volumes/Time\ Machine-Backups/.Trashes/
ls -ltr
cd /Volumes/Time\ Machine-Backups\ 1/.Trashes
ls -ltr






##Jetzt kann gelöscht werden:
rm -rf /Users/sspaeti/.Trash/*
rm -rf /Volumes/Mac\ HDD/.Trashes/*
rm -rf /Volumes/Mac\ SSD/.Trashes/*
rm -rf /Volumes/LACIE/.Trashes/*
rm -rf /Volumes/Work\ exFAT/.Trashes/*
rm -rf /Volumes/Time\ Machine-Backups/.Trashes/*
rm -rf /Volumes/Time\ Machine-Backups\ 1/.Trashes/*