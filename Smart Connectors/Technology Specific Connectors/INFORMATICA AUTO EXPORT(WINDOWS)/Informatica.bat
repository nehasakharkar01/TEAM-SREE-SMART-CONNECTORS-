rem -- Parameter setup
SET PATH=C:\Informatica\9.6.1\server\bin
SET REPOSITORY=Info9.6_rep
SET HOST=DESKTOP-8DDK2R7
SET DOMAIN=Domain_DESKTOP-8DDK2R7
SET PORT=6005
SET USER=Administrator
SET PASSWORD=admin
SET QUERY_MAPPING=QUERY_EON_RS_AC_215_EDV_HUB
SET QUERY_MAPPLET=QUERY_EON_RS_AC_215_EDV_HUB
SET OUTPUT_QUERY=C:\Users\AbdulOdud\Documents\POC\InformaticaBatchFiles\iNFA\query_mapping.txt
SET OUTPUT_FILE=C:\Users\AbdulOdud\Documents\POC\InformaticaBatchFiles\iNFA\

rem -- Execute query and export to individual xml
del %OUTPUT_FILE% /s /f /q
cd %PATH%
pmrep connect -r %REPOSITORY% -d %DOMAIN% -n %USER% -x %PASSWORD%
pmrep executequery -q %QUERY_MAPPING% -u %OUTPUT_QUERY%
FOR /F "tokens=2,3,4,5,6* delims=, " %%i in (%OUTPUT_QUERY%) do pmrep objectexport -n %%j -o %%k -t %%l -f %%i -m -s -b -r  -u %OUTPUT_FILE%%%j.xml
%OUTPUT_FILE%%%j.xml
pause



