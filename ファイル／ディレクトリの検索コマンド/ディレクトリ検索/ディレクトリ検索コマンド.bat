@echo off
setlocal enabledelayedexpansion
@REM %1 : �������J�n����f�B���N�g����
@REM %2 : �����������f�B���N�g����
@REM 1. cd�R�}���h�� "�������J�n����f�B���N�g����" �ֈړ�����B
if "%~1"=="" (
	echo "�������J�n����f�B���N�g����" ������1�Ŏw�肵�ĉ������B
	exit /b 1
)

if "%~2"=="" (
	echo "�����������f�B���N�g����" ������2�Ŏw�肵�ĉ������B
	exit /b 1
)

@REM echo �ړ���f�B���N�g��:"%~1"
cd "%~1">nul

for /f "usebackq delims=" %%A in (`cd`) do set CURDIR=%%A
echo �f�B���N�g��"%CURDIR%" ����ċA�I�� �f�B���N�g��"%~2" ���������܂��B
@REM 2.���̃R�}���h�� "�����������f�B���N�g����" ����������
dir /b /s /ad "%~2"
@REM cd

exit /b %ERRORLEVEL%
