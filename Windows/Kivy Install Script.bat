
1>2# : ^
'''
:: This section is ignored by python
:: It's just batch commands being executed here

@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit)
echo,
echo                        ^.     ^.
echo                     ^.  ^|\-^^-/^|  ^.    
echo                    /^| } O^.=^.O { ^|\  
echo                   /' \ \_ ~ _/ / '\
echo                 /' ^|  \-/ ~ \-/  ^| '\
echo                 ^|   ^|  /\\ //\  ^|   ^| 
echo                  \^|\^|\/-""-""-\/^|/^|/
echo                          ______/ /
echo                          '------'
echo            _   _        _  ___                         
echo  _ __  ___^| ^|_^| ^|_ _  _^| ^|^|   \ _ _ __ _ __ _ ___ _ _  
echo ^| '  \/ -_)  _^| ' \ ^|^| ^| ^|^| ^|) ^| '_/ _` / _` / _ \ ' \ 
echo ^|_^|_^|_\___^|\__^|_^|^|_\_, ^|_^|^|___/^|_^| \__,_\__, \___/_^|^|_^|
echo                    ^|__/                 ^|___/          
echo -------------------------------------------------------
echo                 github.com/methylDragon
echo,
echo [METHYLDRAGON] Kivy Install Script
echo,
echo This script installs Kivy in your base environment in Anaconda!
echo,
echo Pre-Requisites:
echo - ENSURE ANACONDA IS INSTALLED ON %HOMEDRIVE%
echo - Anaconda
echo - Python 3.5+
echo,
echo Packages installed:
echo - Kivy
echo,
pause

CALL "%HOMEPATH%\Anaconda3\Scripts\activate.bat" 2>nul
CALL "%HOMEPATH%\Anaconda2\Scripts\activate.bat" 2>nul
CALL "%HOMEPATH%\Anaconda\Scripts\activate.bat" 2>nul

CALL "%UserProfile%\Anaconda3\Scripts\activate.bat" 2>nul
CALL "%UserProfile%\Anaconda2\Scripts\activate.bat" 2>nul
CALL "%UserProfile%\Anaconda\Scripts\activate.bat" 2>nul

CALL "%HOMEDRIVE%\Anaconda3\Scripts\activate.bat" 2>nul
CALL "%HOMEDRIVE%\Anaconda2\Scripts\activate.bat" 2>nul
CALL "%HOMEDRIVE%\Anaconda\Scripts\activate.bat" 2>nul

::Optional target environment section
SET ENVNAME=base

:PROMPT
echo,
echo This script will install the packages in the base conda environment

SET /P AREYOUSURE=Would you like to install them somewhere else (Y/[N])? 
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

echo,
echo Which environment? (If it doesn't exist, the script will create it for you.)
echo (Base environment is 'base' without the quotes)

SET /P ENVNAME=Enter desired name here: 
:END

echo,
echo .
echo ..
echo ...
echo # CREATING Environment: %ENVNAME% (If not already created)
echo ----

@CALL conda create -n %ENVNAME% python=3.6 anaconda
CALL conda activate %ENVNAME%

echo ----
echo # %ENVNAME% Environment Initialised!
echo ...
echo ..
echo .
echo,

echo,
echo --- INSTALLING PACKAGES ---

echo,
echo # UPDATING setuptools and wheel
echo,
CALL python -m pip install --upgrade pip wheel setuptools

echo,
echo # INSTALLING Kivy dependencies
echo,
CALL python -m pip install docutils pygments pypiwin32 kivy.deps.sdl2 kivy.deps.glew kivy.deps.angle
CALL python -m pip install kivy.deps.gstreamer

echo,
echo # INSTALLING Kivy
echo,
CALL python -m pip install kivy

echo,
echo # INSTALLING Kivy Examples
echo,
CALL python -m pip install kivy_examples

echo,
echo --- SETUP COMPLETE ---
echo,
echo Time to test the Kivy install status!
echo You should see the respective versions if this worked. Ready when you are!
echo,
pause
echo,
echo --- INITIALISING TESTING SCRIPT ---
echo,

:: Invoke python, skipping the first line
python -x "%~f0" %*
pause

echo,
echo          ^.     ^.
echo       ^.  ^|\-^^-/^|  ^.    
echo      /^| } O^.=^.O { ^|\
echo ------ FINAL NOTES ------
echo,
echo Hopefully that worked!
echo Remember to activate the %ENVNAME% environment if you want to use these packages! (If you installed it anywhere other than base)
echo - Select it from the drop-down in Anaconda Navigator if you want to use it in Spyder
echo - Or if you want to do it from the Anaconda Prompt, use "> conda activate %ENVNAME%"
echo,
call cmd /k
'''
# -*- coding: utf-8 -*-

# Only python commands being run here

# Try-except block is here just in case anything didn't install properly
try:
	import kivy
except:
	pass

# Initialise a counter to report back errors later on
error_count = 0

print()
print("---------------------- TESTING INSTALLATION NOW! ----------------------")

# Test all packages, report back if there's an error

print()
print("Kivy Vesion: ")

try:
	print(kivy.__version__)
except:
	print("ERROR! Kivy did not install correctly")
	error_count += 1

print()

# Sum-up
if error_count == 0:
	print("All packages installed correctly!")
else:
	print("ERROR!", error_count, "package(s) did not install correctly! Do troubleshoot, or try again as administrator!")
print()