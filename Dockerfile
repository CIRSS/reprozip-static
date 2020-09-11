FROM ubuntu:20.04

ENV REPRO_NAME  reprozip-static
ENV REPRO_MNT   /mnt/${REPRO_NAME}
ENV REPRO_USER  repro
ENV REPRO_UID   1000
ENV REPRO_GID   1000

RUN echo '***** Update packages *****'                                      \
    && apt-get -y update

RUN echo '***** Install packages required for creating this image *****'    \
    && apt -y install apt-utils wget curl makepasswd gcc make git           \
                                                                            \
    && echo '***** Install command-line utility packages *****'             \
    && apt -y install sudo less file tree

RUN echo '****** Install ReproZip prerequisites *****'                      \
    && apt -y install libssl-dev libffi-dev libsqlite3-dev                  \
    && apt -y install python3 python3-pip python3-venv                      \
    && pip3 install -U pip

RUN echo '***** Add the REPRO user and group *****'                         \
    && groupadd ${REPRO_USER} --gid ${REPRO_GID}                            \
    && useradd ${REPRO_USER} --uid ${REPRO_UID} --gid ${REPRO_GID}          \
        --shell /bin/bash                                                   \
        --create-home                                                       \
        -p `echo repro | makepasswd --crypt-md5 --clearfrom - | cut -b8-`   \
    && echo "${REPRO_USER} ALL=(ALL) NOPASSWD: ALL"                         \
            > /etc/sudoers.d/${REPRO_USER}                                  \
    && chmod 0440 /etc/sudoers.d/repro

ENV HOME /home/${REPRO_USER}
ENV BASHRC ${HOME}/.bashrc
USER  ${REPRO_USER}
WORKDIR $HOME

ENV VENV_DIR ${HOME}/.venv
ENV REPROZIP_VENV ${VENV_DIR}/reprozip
ENV REPROZIP_VENV_PACKAGES ${REPROZIP_VENV}/lib/python3.8/site-packages
ENV REPROZIP_INSTALL ${HOME}/reprozip
ENV RPZ_BIN_DIR ${REPROZIP_INSTALL}/dist/main

RUN echo '***** install reprozip in python virtual environment *****'       \
    && mkdir ${VENV_DIR}                                                    \
    && python3 -m venv ${REPROZIP_VENV}                                     \
    && . ${REPROZIP_VENV}/bin/activate                                      \
    && pip install wheel                                                    \
    && pip install pyinstaller                                              \
    && pip install reprozip reprounzip                                      \
    && reprozip usage_report --disable                                      \
    && mkdir ${REPROZIP_INSTALL}                                            \
    && cd ${REPROZIP_INSTALL}                                               \
    && pyinstaller ${REPROZIP_VENV_PACKAGES}/reprozip/main.py               \
    && mv ${RPZ_BIN_DIR}/main ${RPZ_BIN_DIR}/reprozip.pyi                   \
	&& rm -rf ${REPROZIP_VENV}												\
    && deactivate

RUN echo 'PATH=~/go/bin:/usr/local/go/bin:$PATH' >> ${BASHRC}
RUN echo "export IN_RUNNING_REPRO=${REPRO_NAME}" >> ${BASHRC}
RUN echo "cd ${REPRO_MNT}" >> ${BASHRC}

CMD  /bin/bash -il
