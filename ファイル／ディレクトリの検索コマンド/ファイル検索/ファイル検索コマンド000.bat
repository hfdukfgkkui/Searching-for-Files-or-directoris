@echo off
setlocal enabledelayedexpansion
@REM %1 : �������J�n����f�B���N�g����
@REM %2 : �����������t�@�C����
if "%~1"=="" (
	echo "�������J�n����f�B���N�g����" ������1�Ŏw�肵�ĉ������B
	exit /b 1
)

if "%~2"=="" (
	echo "�����������t�@�C����" ������2�Ŏw�肵�ĉ������B
	exit /b 1
)

echo �f�B���N�g��"%~1" ����ċA�I�ɁA �t�@�C��"%~2" ���������܂��B
where /r "%~1" "%~2"

exit /b %ERRORLEVEL%