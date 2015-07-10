VSCodeTemp=VSCode-linux-x64.zip

.PHONY: VSCode

VSCode: Download_VSCode Install_VSCode

Download_VSCode:
	test -e $(VSCodeTemp) || curl -s -L -o $(VSCodeTemp) 'http://go.microsoft.com/fwlink/?LinkID=534108'

Install_VSCode:
	test -e $(VSCodeTemp) \
		&& fpm -s zip -t rpm -n "VisualStudioCode" --prefix=/opt/VisualStudioCode $(VSCodeTemp) \
		&& rm $(VSCodeTemp)
