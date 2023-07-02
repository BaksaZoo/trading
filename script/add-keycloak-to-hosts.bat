@echo off

echo Make sure you have administrator privileges!

echo.>> %SystemRoot%\System32\drivers\etc\hosts
echo.# keycloak>> %SystemRoot%\System32\drivers\etc\hosts
echo.127.0.0.1 keycloak>> %SystemRoot%\System32\drivers\etc\hosts

echo Keycloak added to hosts file.