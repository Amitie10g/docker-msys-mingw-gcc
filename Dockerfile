ARG WINDOWS_VERSION=latest
FROM amitie10g/msys2:$WINDOWS_VERSION

# Install required packages
RUN bash -l -c " \
		pacman -S --needed --noconfirm --noprogressbar \
			make \
			texinfo \
			diffutils \
			bison \
			flex \
			gperf \
			automake \
			autoconf\
			intltool \
			libtool \
			mingw-w64-i686-toolchain \
			mingw-w64-x86_64-toolchain && \
		rm -r /var/cache/pacman/pkg/* \
	"

WORKDIR C:\\msys64
RUN setx path "C:\msys64\mingw64\bin;%PATH%"
CMD ["bash", "-l"]