@echo off
setlocal enabledelayedexpansion
@REM %1 : 検索を開始するディレクトリ名
@REM %2 : 検索したいファイル名
if "%~1"=="" (
	echo "検索を開始するディレクトリ名" を引数1で指定して下さい。
	exit /b 1
)

if "%~2"=="" (
	echo "検索したいファイル名" を引数2で指定して下さい。
	exit /b 1
)

set DirName=%~1
@REM echo DirName=%DirName%


:Loop1
set DirNameLastChar=%DirName:~-1%
if "%DirNameLastChar%"==" " ( 
	set DirName=!DirName:~-0,-1!
	@REM %V:~-m,-n%  :  後ろからm^(0から開始する^)文字目から、最後のn^(1から開始する^)文字分を除いたもの 
	@REM echo DirName=!DirName!
	if Not defined DirName (
		echo "検索を開始するディレクトリ名" が空です。"検索を開始するディレクトリ名" を空でない文字列で再設定して下さい。
		exit /b 1
	) else (
		goto :Loop1
	)
) else if "%DirNameLastChar%"=="　" ( 
	set DirName=!DirName:~-0,-1!
	@REM %V:~-m,-n%  :  後ろからm^(0から開始する^)文字目から、最後のn^(1から開始する^)文字分を除いたもの 
	@REM echo DirName=!DirName!
	if Not defined DirName (
		echo "検索を開始するディレクトリ名" が空です。"検索を開始するディレクトリ名" を空でない文字列で再設定して下さい。
		exit /b 1
	) else (
		goto :Loop1
	)
)
@REM echo スペース削除後 DirName=%DirName%
@REM pause



:Loop2
set DirNameLastChar=%DirName:~-1%
@REM %V:~-m%  :  後ろからm^(1から開始する^)文字目から、最後まで
@REM echo DirNameLastChar=%DirNameLastChar%

if "%DirNameLastChar%"=="\" ( 
	set DirName=!DirName:~-0,-1!
	@REM %V:~-m,-n%  :  後ろからm^(0から開始する^)文字目から、最後のn^(1から開始する^)文字分を除いたもの 
	@REM echo DirName=!DirName!
	if Not defined DirName (
		echo ディレクトリ \ から再帰的に、 ファイル"%~2" を検索します。
		where /r \ "%~2"
	) else (
		goto :Loop2
	)
) else if "%DirNameLastChar%"==":" ( 
	set DirName=%DirName%\
	echo ディレクトリ !DirName! から再帰的に、 ファイル"%~2" を検索します。
	where /r !DirName! "%~2"
) else (
	echo ディレクトリ "!DirName!" から再帰的に、 ファイル"%~2" を検索します。
	where /r "!DirName!" "%~2"
)
exit /b %ERRORLEVEL%