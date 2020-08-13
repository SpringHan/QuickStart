:Start
	@echo off
	title QuickStart

	REM %1 �� Batch �������д��ݵĲ���.
	REM ��� %1 Ϊ������ʾ�������, ����ʼִ������.
	if "%1" == "" (
		set Message_Title=��Ϣ
		set Message_Content=�÷�REM open [����]
		set Message_Content_NL=ʾ��REM open qq
		goto ShowMessage
	) else (
		goto ExecuteCommand
	)

:ExecuteCommand
	REM ������ǰ Batch ����Ŀ¼�� files �ļ����µ������ļ�, �����ļ���(����չ��)��ֵ�� %%i.
	REM ȡ��ǰ����Ŀ¼ʹ���� %~dp0 ����.
	for %%i in (%~dp0files\*) do (
		REM ʹ�ÿո���һ���ļ��Ĳ�ͬ����, �������Ÿ�ֵ�� %%j.
		REM ʹ�� %%~ni ���Ի�ȡ %%i �ļ��Ĳ�����չ�����ļ��� (��� for �������)
		for %%j in (%%~ni) do (
			REM ��������������д��ݵĲ���һ��, ��Ҫ���е��ļ��ľ���·����ֵ�� %open%.
			REM ʹ�� %%~fi ���Ի�ȡ %%i �ļ��ľ���·��, ʹ�� /i �Ժ��Դ�Сд. (��� for �������)
			if /i %%j == %1 (
				set open="%%~fi"
			)
		)
	)

	REM �����ѭ��������, ��� %open% ����ֵ(�ҵ���ָ���ļ�), ��� %open% ָ����ļ�, ������ʾ������Ϣ.
	if defined open (
		start "" %open%
	) else (
		set Message_Title=����
		set Message_Content=δ֪���ļ����� "%1".
		goto ShowMessage
	)
	exit

:ShowMessage
	REM �������ڴ�С����ɫ, Ȼ����ʾ��Ϣ.
	color f0
	mode con lines=8 cols=50
	cls
	echo.
	echo.   (!) %Message_Title%
	echo.
	echo.       %Message_Content% 
	echo.       %Message_Content_NL%
	echo.
	echo._________________________________________________
	pause