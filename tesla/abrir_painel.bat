@echo off
title carOS Launcher
color 0b
echo A iniciar o painel carOS em modo nativo Tesla...
set "targetUrl=file:///%cd:\=/%/tesla.html"
start "" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --app=%targetUrl% --start-maximized
exit