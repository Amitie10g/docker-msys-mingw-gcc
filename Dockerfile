ARG WINDOWS_VERSION=latest
FROM amitie10g/msys2:$WINDOWS_VERSION

# Install required packages
ARG ARCH=x86_64
ARG MINGW_VARIANT=64
RUN setx path "C:\msys64\mingw$MINGW_VARIANT\bin;%PATH%" && \
	bash -l -c " \
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
			mingw-w64-$ARCH-toolchain && \
		rm -r /var/cache/pacman/pkg/* \
	"

WORKDIR C:\\msys64
ENV MSYSTEM=MINGW64
CMD ["bash"]