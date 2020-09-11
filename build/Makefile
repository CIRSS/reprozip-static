
PYTHON_PACKAGES_DIR=/usr/local/lib/python3.8/dist-packages
REPROZIP_MAIN_SCRIPT=${PYTHON_PACKAGES_DIR}/reprozip/main.py
PYINSTALLER_BUILD_DIR=/tmp/pyinstaller/build
RPZ_DYNAMIC_BINARY=./main
RPZ_STATIC_BINARY=./rpz

build: ${RPZ_STATIC_BINARY}

${RPZ_DYNAMIC_BINARY}:
	pyinstaller -F 										\
				--workpath=${PYINSTALLER_BUILD_DIR}   	\
				--distpath=. 							\
				${REPROZIP_MAIN_SCRIPT}

${RPZ_STATIC_BINARY}: ${RPZ_DYNAMIC_BINARY}
	staticx ${RPZ_DYNAMIC_BINARY} ${RPZ_STATIC_BINARY}

clean:
	rm -rf 	${RPZ_DYNAMIC_BINARY} 						\
			${RPZ_STATIC_BINARY} 						\
			main.spec ${PYINSTALLER_BUILD_DIR}

