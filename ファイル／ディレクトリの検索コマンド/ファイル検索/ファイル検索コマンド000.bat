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

set DirName=%~1
@REM echo DirName=%DirName%


:Loop1
set DirNameLastChar=%DirName:~-1%
if "%DirNameLastChar%"==" " ( 
	set DirName=!DirName:~-0,-1!
	@REM %V:~-m,-n%  :  ��납��m^(0����J�n����^)�����ڂ���A�Ō��n^(1����J�n����^)������������������ 
	@REM echo DirName=!DirName!
	if Not defined DirName (
		echo "�������J�n����f�B���N�g����" ����ł��B"�������J�n����f�B���N�g����" ����łȂ�������ōĐݒ肵�ĉ������B
		exit /b 1
	) else (
		goto :Loop1
	)
) else if "%DirNameLastChar%"=="�@" ( 
	set DirName=!DirName:~-0,-1!
	@REM %V:~-m,-n%  :  ��납��m^(0����J�n����^)�����ڂ���A�Ō��n^(1����J�n����^)������������������ 
	@REM echo DirName=!DirName!
	if Not defined DirName (
		echo "�������J�n����f�B���N�g����" ����ł��B"�������J�n����f�B���N�g����" ����łȂ�������ōĐݒ肵�ĉ������B
		exit /b 1
	) else (
		goto :Loop1
	)
)
@REM echo �X�y�[�X�폜�� DirName=%DirName%
@REM pause



:Loop2
set DirNameLastChar=%DirName:~-1%
@REM %V:~-m%  :  ��납��m^(1����J�n����^)�����ڂ���A�Ō�܂�
@REM echo DirNameLastChar=%DirNameLastChar%

if "%DirNameLastChar%"=="\" ( 
	set DirName=!DirName:~-0,-1!
	@REM %V:~-m,-n%  :  ��납��m^(0����J�n����^)�����ڂ���A�Ō��n^(1����J�n����^)������������������ 
	@REM echo DirName=!DirName!
	if Not defined DirName (
		echo �f�B���N�g�� \ ����ċA�I�ɁA �t�@�C��"%~2" ���������܂��B
		where /r \ "%~2"
	) else (
		goto :Loop2
	)
) else if "%DirNameLastChar%"==":" ( 
	set DirName=%DirName%\
	echo �f�B���N�g�� !DirName! ����ċA�I�ɁA �t�@�C��"%~2" ���������܂��B
	where /r !DirName! "%~2"
) else (
	echo �f�B���N�g�� "!DirName!" ����ċA�I�ɁA �t�@�C��"%~2" ���������܂��B
	where /r "!DirName!" "%~2"
)
exit /b %ERRORLEVEL%