@echo off
setlocal enabledelayedexpansion
@REM %1 : 検索を開始するディレクトリ名
@REM %2 : 検索したいディレクトリ名
@REM 1. cdコマンドで "検索を開始するディレクトリ名" へ移動する。
if "%~1"=="" (
	echo "検索を開始するディレクトリ名" を引数1で指定して下さい。
	exit /b 1
)

if "%~2"=="" (
	echo "検索したいディレクトリ名" を引数2で指定して下さい。
	exit /b 1
)

@REM echo 移動先ディレクトリ:"%~1"
cd "%~1">nul

for /f "usebackq delims=" %%A in (`cd`) do set CURDIR=%%A
echo ディレクトリ"%CURDIR%" から再帰的に ディレクトリ"%~2" を検索します。
@REM 2.次のコマンドで "検索したいディレクトリ名" を検索する
dir /b /s /ad "%~2"
@REM cd

exit /b %ERRORLEVEL%
