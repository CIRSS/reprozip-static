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

RUN echo '****** Install StaticX prerequisites *****'                       \
    && apt -y install patchelf

RUN echo '***** install reprozip, PyInstaller, and StaticX *****'           \
    && pip3 install wheel                                                   \
    && pip3 install reprozip                                                \
    && pip3 install pyinstaller                                             \
    && pip3 install staticx
 
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

RUN echo "export IN_RUNNING_REPRO=${REPRO_NAME}" >> ${BASHRC}
RUN echo "cd ${REPRO_MNT}" >> ${BASHRC}

CMD  /bin/bash -il
