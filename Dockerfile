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
	"

RUN setx path "C:\msys64\mingw64\bin;%PATH%" && \
	bash -l -c " \
		pacman -S --needed --noconfirm --noprogressbar \
			mingw-w64-x86_64-toolchain && \
		rm -r /var/cache/pacman/pkg/* \
	"

WORKDIR C:\\msys64
ENV MSYSTEM=MINGW64
CMD ["bash"]