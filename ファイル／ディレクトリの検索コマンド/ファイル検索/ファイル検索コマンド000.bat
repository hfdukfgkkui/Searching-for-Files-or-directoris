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

echo ディレクトリ"%~1" から再帰的に、 ファイル"%~2" を検索します。
where /r "%~1" "%~2"

exit /b %ERRORLEVEL%