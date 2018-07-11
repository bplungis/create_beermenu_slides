@echo off

:: Make sure filename is set, if not print usage and die
IF [%1]==[] goto usage

:: Set filename variable from user input
set filename=%1

:: list used to name files 
set list=a b c

:: loop through 1-8
FOR /L %%i IN (1,1,8) DO (
   :: loop through a,b,c
   FOR %%j IN (a b c) DO (
      :: copy file and rename "1a Beers.jpg","1b Beers.jpg",etc
      COPY %filename% "%%i%%j Beers.jpg"
   )
)

:: Delete original file
:: DEL %filename%
EXIT /B

:: Usage statement
:usage
   echo Copies given file to "1a Beers.jpg","1b Beers.jpg","1c Beers.jpg",
   echo    "2a Beers.jpg",...,"8c Beers.jpg"
   echo.
   echo %0 [filename]
   echo.
   echo Example:
   echo    %0 "Beer Menu new.pptx.jpg"
goto:EOF