@echo off
title Gerador de Executavel Python
cls

echo ==========================================
echo    GERADOR DE .EXE (PyInstaller Automático)
echo ==========================================
echo.

:: Verifica se o Python está instalado
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] O Python nao esta instalado ou nao foi adicionado ao PATH.
    echo Por favor, instale o Python antes de continuar.
    pause
    exit
)

:: Garante que o PyInstaller está instalado
echo [1/3] A verificar/instalar PyInstaller...
pip install --upgrade pip >nul
pip install pyinstaller >nul

:: Compila o script
echo [2/3] A gerar o ficheiro .exe a partir de 'script.py'...
:: --onefile: Junta tudo num unico .exe
:: --noconsole: Esconde a janela preta do CMD (remova se o seu programa for de texto)
pyinstaller --onefile --noconsole script.py

if %errorlevel% equ 0 (
    echo.
    echo ==========================================
    echo [SUCESSO] O seu .exe foi gerado com êxito!
    echo Procure o ficheiro na pasta "dist".
    echo ==========================================
) else (
    echo.
    echo [ERRO] Ocorreu uma falha ao gerar o executavel.
)

echo.
echo [3/3] A limpar ficheiros temporarios...
rmdir /s /q build
del /f /q script.spec
echo Concluido.
pause
