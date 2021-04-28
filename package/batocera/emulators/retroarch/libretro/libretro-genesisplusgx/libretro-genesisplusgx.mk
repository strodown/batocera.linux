################################################################################
#
# GENESISPLUSGX
#
################################################################################
# Version.: Commits on Apr 28, 2021
LIBRETRO_GENESISPLUSGX_VERSION = d0f204bf7766aee3379b3ce48f9924a87d81151d
LIBRETRO_GENESISPLUSGX_SITE = $(call github,ekeeke,Genesis-Plus-GX,$(LIBRETRO_GENESISPLUSGX_VERSION))
LIBRETRO_GENESISPLUSGX_LICENSE = Non-commercial

LIBRETRO_GENESISPLUSGX_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X),y)
	LIBRETRO_GENESISPLUSGX_PLATFORM += CortexA73_G12B
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ORANGEPI_PC),y)
	LIBRETRO_GENESISPLUSGX_PLATFORM += rpi2
endif

define LIBRETRO_GENESISPLUSGX_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile.libretro platform="$(LIBRETRO_GENESISPLUSGX_PLATFORM)"
endef

define LIBRETRO_GENESISPLUSGX_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/genesis_plus_gx_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/genesisplusgx_libretro.so
endef

$(eval $(generic-package))
