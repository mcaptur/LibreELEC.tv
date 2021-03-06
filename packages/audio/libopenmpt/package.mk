################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="libopenmpt"
PKG_VERSION="0.2.7386-beta20.3"
PKG_SHA256="a6a7e6da1ae66e1cf46985ee92c182e50652d71b96135e9fa6048e132d844753"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="http://lib.openmpt.org/libopenmpt/"
PKG_URL="http://lib.openmpt.org/files/libopenmpt/src/${PKG_NAME}-${PKG_VERSION}-autotools.tar.gz"
PKG_SOURCE_DIR="${PKG_NAME}-${PKG_VERSION//-beta*/}-autotools"
PKG_DEPENDS_TARGET="toolchain libogg libvorbis"
PKG_SECTION="audio"
PKG_SHORTDESC="libopenmpt: renders mod music files as raw audio data, for playing or conversion."
PKG_LONGDESC="libopenmpt renders mod music files as raw audio data, for playing or conversion."
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--enable-static \
                           --disable-shared \
                           --without-mpg123 \
                           --with-vorbis \
                           --with-vorbisfile \
                           --without-pulseaudio \
                           --without-portaudio \
                           --without-portaudiocpp \
                           --without-sdl \
                           --without-sdl2 \
                           --without-sndfile \
                           --without-flac"
