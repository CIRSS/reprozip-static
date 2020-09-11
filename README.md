# REPROZIP-STATIC

This repository is a [REPRO](https://github.com/CIRSS/repro-template) that builds a statically-linked Linux executable for [ReproZip](https://www.reprozip.org/).  The single executable file can be copied to and used on 64-bit Linux system 
without installing Python or the ReproZip python package.  

## Instructions
1. Download the latest release of the reprozip static executable from the [*Releases*](https://github.com/CIRSS/reprozip-static/releases) for this repo.
2. Save the executable where it will be found by the OS on your command path.
3. Use according to the instructions at [Using *reprozip*](https://docs.reprozip.org/en/1.0.x/packing.html).

## Software packages that may be included in the ReproZip executable

Building the static executable for ReproZip depends on and may include the software packages below in full or in part.

| Package source code  | Included version     | License |
|------------------|-----------------|---------|
| [altgraph]() | [0.17]() |
| [certifi](https://github.com/certifi/python-certifi) | [2020.6.20](https://pypi.org/project/certifi/2020.6.20/) | Mozilla Public License 2.0 (MPL 2.0) 
| [chardet](https://github.com/chardet/chardet) | [3.0.4](https://pypi.org/project/chardet/3.0.4/) | GNU Library or Lesser General Public License (LGPL) 
| [distro](https://github.com/nir0s/distro) | [1.5.0](https://pypi.org/project/distro/1.5.0/) | Apache Software License (Apache License, Version 2.0)
| [idna](https://github.com/kjd/idna) | [2.10](https://pypi.org/project/idna/2.10/) | BSD License (BSD-like)
| [pip](https://pypi.org/project/pip/18.1/) | [18.1](https://pypi.org/project/pip/18.1/) |  MIT License (MIT)    
| [pyinstaller](https://github.com/pyinstaller/pyinstaller) | [4.0](https://pypi.org/project/pyinstaller/4.0/) | GNU General Public License v2 (GPLv2)
| [pyinstaller-hooks-contrib](https://github.com/pyinstaller/pyinstaller-hooks-contrib) | [2020.7](https://pypi.org/project/pyinstaller-hooks-contrib/2020.7/) | Apache License 2.0, GNU General Public License v2 (GPLv2)
| [Python](https://www.python.org/) | [3.8.2](https://www.python.org/downloads/release/python-382/) | Python Software Foundation License (PSFL)
| [PyYAML](https://github.com/yaml/pyyaml) | [5.3.1](https://pypi.org/project/PyYAML/5.3.1/) | MIT License (MIT)
| [reprozip](https://github.com/ViDA-NYU/reprozip) | [1.0.16](https://pypi.org/project/reprozip/1.0.16/) |  BSD License (BSD-3-Clause)
| [requests](https://github.com/psf/requests) | [2.24.0](https://pypi.org/project/requests/2.24.0/) | Apache Software License (Apache 2.0)
| [rpaths](https://github.com/remram44/rpaths) | [0.13](https://pypi.org/project/rpaths/0.13/) | BSD License (BSD)
| [setuptools](https://github.com/pypa/setuptools) | [40.8.0](https://pypi.org/project/setuptools/40.8.0/) | MIT License
| [urllib3](https://github.com/urllib3/urllib3) | [1.25.10](https://pypi.org/project/urllib3/1.25.10/) | MIT License (MIT)
| [usagestats](https://github.com/remram44/usagestats) | [1.0](https://pypi.org/project/usagestats/1.0/) | Apache Software License (Apache License 2.0) 
