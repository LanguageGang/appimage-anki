.PHONY: all

all:
	rm -rf build/
	mkdir -p build/Anki.AppDir
	cd build/Anki.AppDir \
	&& curl -o - https://apps.ankiweb.net/downloads/archive/anki-2.1.49-linux.tar.bz2 \
	  | tar --extract --bzip2 --strip-components=1 --file -
	curl --location -o build/Anki.AppDir/AppRun https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
	chmod +x build/Anki.AppDir/AppRun
	# AppRun expects this directory to exist.
	mkdir build/Anki.AppDir/usr
	echo "[Desktop Entry]
Name=Anki
Comment=An intelligent spaced-repetition memory training program
GenericName=Flashcards
Exec=Anki %f
TryExec=Anki
Icon=Anki
Categories=Education;Languages;KDE;Qt;
Terminal=false
Type=Application
Version=1.0
MimeType=application/x-apkg;application/x-anki;application/x-ankiaddon;
" >> ./build/Anki.AppDir/Anki.desktop
