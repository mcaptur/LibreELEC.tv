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

PKG_NAME="mediacenter"
PKG_VERSION=""
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain $MEDIACENTER"
PKG_SECTION="virtual"
PKG_SHORTDESC="Mediacenter: Metapackage"
PKG_LONGDESC="Mediacenter: Metapackage"
PKG_AUTORECONF="no"

_add_binary_addon() {
  [ -f $ROOT/$PACKAGES/mediacenter/kodi-binary-addons/$1/package.mk ] && PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $1" || true
}

if [ "$MEDIACENTER" = "kodi" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $MEDIACENTER-theme-$SKIN_DEFAULT"

  for i in $SKINS; do
    PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $MEDIACENTER-theme-$i"
  done

# some python stuff needed for various addons
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET Pillow \
                                          simplejson \
                                          pycryptodome"
# other packages
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET LibreELEC-settings \
                                          xmlstarlet"
  

  _ADDONS_PVR=yes
  _ADDONS_ADSP=no
#  _ADDONS_GAME=no
  _ADDONS_OTHER=yes

  # various PVR clients
    if [ "${_ADDONS_PVR}" = "yes" ]; then
#    _add_binary_addon "pvr.argustv"
#    _add_binary_addon "pvr.demo"
#    _add_binary_addon "pvr.dvblink"
#    _add_binary_addon "pvr.dvbviewer"
#    _add_binary_addon "pvr.filmon"
    _add_binary_addon "pvr.hts"
#    _add_binary_addon "pvr.hdhomerun"
    _add_binary_addon "pvr.iptvsimple"
#    _add_binary_addon "pvr.mediaportal.tvserver"
#    _add_binary_addon "pvr.mythtv"
#    _add_binary_addon "pvr.nextpvr"
#    _add_binary_addon "pvr.njoy"
#    _add_binary_addon "pvr.octonet"
#    _add_binary_addon "pvr.pctv"
#    _add_binary_addon "pvr.stalker"
#    _add_binary_addon "pvr.teleboy"
#    _add_binary_addon "pvr.vbox"
    _add_binary_addon "pvr.vdr.vnsi"
#    _add_binary_addon "pvr.vuplus"
#    _add_binary_addon "pvr.wmc"
#    _add_binary_addon "pvr.zattoo"
  fi
 
  if [ "$JOYSTICK_SUPPORT" = "yes" ]; then
    PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET peripheral.joystick"
  fi

  if [ "${_ADDONS_OTHER}" = "yes" ]; then
    _add_binary_addon "inputstream.adaptive"
    _add_binary_addon "inputstream.smoothstream"
    _add_binary_addon "inputstream.rtmp"
    _add_binary_addon "imagedecoder.raw"
    _add_binary_addon "vfs.rar"
  fi
fi
