cls
@ECHO OFF
title AdHoc Network
cls
COLOR 0B
echo                           
echo                           Adhoc Network For Windows PC
timeout 4 >nul
echo                                   Please Wait
timeout 4 >nul
:CHOICE
CLS
COLOR 0D 
SET cho=
echo                           
echo Please Enter Your Choice
echo 1:CONNECT TO A WIFI NETWORK
echo 2:DISCONNECT PREVIOUS NETWORK
echo 3:CREATE YOUR OWN WIFI HOTSPOT
echo 4:EXIT
set/p "cho=>"
if %cho%==[%1]==[] goto CHOICE
if %cho%==1 goto CONNECTNETWORK
if %cho%==2 goto CONNECTNETWORK
if %cho%==3 goto HOTSPOT
if %cho%==4 goto END

:invalid
cls
echo Invalid selection: [%cho%]
set cho=
goto CHOICE

:CONNECTNETWORK
CLS
COLOR 0E
SET cho=
echo                           
echo Please Enter Your Choice
echo 1:CONNECT
echo 2:DISCONNECT
echo 3:DELETE
echo 4:SHOW AVAILABLE NETWORKS
echo 5:SHOW PROFILE
echo 6:STEP FOR CREATING A PROFILE
set/p "cho=>"
if %cho%==[%1]==[] goto CHOICE
if %cho%==1 goto SETUP
if %cho%==2 goto DISCONNECT
if %cho%==3 goto CLEANUP 
if %cho%==4 goto SHOWALL
if %cho%==5 goto SHOWP_ROFILE
if %cho%==6 goto HOW_TO_CREATE

:invalid
cls
echo Invalid selection: [%cho%]
set cho=
GOTO CHOICE

:HOW_TO_CREATE
cls
ECHO ## GO TO "NETWORK AND SHARING CENTER"
Echo #
ECHO ## CLICK "SET UP A NEW CONNECTION OR NETWORK"
Echo #
ECHO ## DOUBLE CLICK "MANUALLY CONNECT TO A WIRELESS NETWORK"
Echo #
ECHO ## ENTER THE SSID OF THE AD-HOC NETWORK (AS SHOWN BY "NETSH WLAN SHOW NETWORKS") INTO THE "NETWORK NAME" FIELD
Echo #
ECHO ## CONFIGURE SECURITY SETTINGS ACCORDINGLY
Echo #
ECHO ## UNCHECK "START THIS CONNECTION AUTOMATICALLY" (IMPORTANT)
Echo #
ECHO ##CLICK "NEXT", THEN "CLOSE"
pause
Goto CONNECTNETWORK

:SETUP
cls
echo Please Enter Your AdHoc SSID
set/p "SSID=>"
if %SSID%==[%1]==[] goto SETUP
netsh wlan set profileparameter %SSID% connectiontype=ibss
timeout 3 >nul
cls
goto CONNECT

:CONNECT
netsh wlan connect %SSID%
timeout 4 >nul
cls
goto CONNECTNETWORK

:DISCONNECT
cls
netsh wlan disconnect
timeout 4 >nul
cls
goto CONNECTNETWORK

:CLEANUP
cls
netsh wlan show Profile
echo Please Enter Your SSID Which You Want To Delete
set/p "SSID=>"
if %SSID%==[%1]==[] goto CONNECTNETWORK
netsh wlan delete profile %SSID%
pause
goto CONNECTNETWORK

:SHOWALL
cls
echo Please Wait
timeout 2 >nul
cls
netsh wlan show networks
Pause
goto CONNECTNETWORK

:SHOWP_ROFILE
cls
echo Please Wait
timeout 2 >nul
cls
netsh wlan show Profile
Pause
goto CONNECTNETWORK

:HOTSPOT
cls
COLOR 0C
SET cho=
echo                           
echo Please Enter Your Choice
echo 1:CREATE A HOTSPOT
echo 2:DISCONNECT HOTSPOT
echo 3:SHOW HOTSPOT

set/p "cho=>"
if %cho%==[%1]==[] goto CHOICE
if %cho%==1 goto START
if %cho%==2 goto STOP
if %cho%==3 goto SHOWHOTSPOT


:invalid
cls
echo Invalid selection: [%cho%]
set cho=
goto CHOICE


:START
cls
Echo Please Enter The HotsPot Name
set/p "SSID=>"
if %SSID%==[%1]==[] goto START
cls
echo Please Enter The Password
set/p "PASS=>"
netsh wlan disconnect
cls
netsh wlan set hostednetwork mode=allow ssid=%SSID% key=%PASS%
timeout 4 >nul
netsh wlan start hostednetwork
timeout 4 >nul
GOTO HOTSPOT

:STOP
cls
netsh wlan stop hostednetwork
timeout 5 >nul
GOTO HOTSPOT

:SHOWHOTSPOT
cls
netsh wlan show hostednetwork
timeout 4 >nul
Pause
GOTO HOTSPOT

:END
CLS
Echo                           
ECHO                             Modified by fakerat
echo                                
timeout 10 >nul
