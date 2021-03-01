# MSYS2 MinGW toolchain Docker image under Windows
This is an attemp to bring Mingw w64 toolchain ([i686](https://packages.msys2.org/group/mingw-w64-i686-toolchain) and [X86-64](https://packages.msys2.org/group/mingw-w64-x86_64-toolchain)) under Microsoft Windows Server Docker image, intended to be used in my own projects.

This comes with the two toolchains: ``x86_64`` and ``i686```.

Currently, only [Server Core](https://hub.docker.com/_/microsoft-windows-servercore) is supported, as MSYS executables are unable to run under [Nano Server](https://hub.docker.com/_/microsoft-windows-nanoserver).

## Tags
The tags belong to the Windows version. Available tags are:

* ``20H2``	
* ``2004`` (``latest``)
* ``1909``
* ``1903``
* ``ltsc2019``

* ``20H2-i686``
* ``20H2-i686``
* ``2004-i686`` (``i686``)
* ``1909-i686``
* ``1903-i686``
* ``ltsc2019-i686``

## Usage
MSYS Bash interactive shell (default)
```
docker run -it --volume=host-src:container-dest --workdir="container-dest" amitie10g/mingw-w64-toolchain
```

x86_64 toolchain using ``make install``
```
docker run -e MSYSTEM=MINGW64 --volume=host-src:container-dest --workdir="container-dest" amitie10g/mingw-w64-toolchain make install
```

i686 toolchain using ``make install``
```
docker run -e MSYSTEM=MINGW32 -e --volume=host-src:container-dest --workdir="container-dest" amitie10g/mingw-w64-toolchain make install
```

Windows CMD interactive shell
```
docker run -it --volume=host-src:container-dest --workdir="container-dest" amitie10g/mingw-w64-toolchain cmd
```

Windows Powershell interactive shell
```
docker run -it --volume=host-src:container-dest --workdir="container-dest" amitie10g/mingw-w64-toolchain powershell
```

If you want to use the MinGW32 environment, you must append ``C:\msys64\mingw32\bin``(under CMD shell) to the PATH environment at runtime, or set in an Entrypoint script.

The default workdir is ``C:\msys64``. Set another workdir is recommended only for runing non-interactive building process like ``make``.

## Using this base image
### Dockerfile
```
ARG VERSION=latest
FROM amitie10g/mingw-w64-toolchain:$VERSION

<your code>
```

### Command line

x86_64 toolchain
```
docker build --build-arg -t <your tag> .
```

i686 toolchain
```
docker build --build-arg VERSION=i686 -t <your tag> .
```

## Packages and dependencies
This image depends on the [MSYS2 base image](https://hub.docker.com/repository/docker/amitie10g/msys2) ([Dockerfile](https://github.com/Amitie10g/docker-msys2/blob/servercore/Dockerfile)), where the following packages are installed:

* mingw-w64-i686-toolchain
* mingw-w64-x86_64-toolchain
* autoconf
* automake
* bison
* diffutils
* flex
* gperf
* intltool
* libtool
* make
* texinfo

## Licensing
* The **Dockerfile** has been released into the **public domain** (the Unlicense)
* The Docker image usages are subjected to the **[Microsoft EULA](https://docs.microsoft.com/en-us/virtualization/windowscontainers/images-eula)**