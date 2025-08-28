ETUDIANTS_VERSION = 1.0
ETUDIANTS_SITE = $(TOPDIR)/../etudiants-src
ETUDIANTS_SITE_METHOD = local

define ETUDIANTS_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/etudiants $(@D)/etudiants.c
endef

define ETUDIANTS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/etudiants $(TARGET_DIR)/usr/bin/etudiants
endef

$(eval $(generic-package))
