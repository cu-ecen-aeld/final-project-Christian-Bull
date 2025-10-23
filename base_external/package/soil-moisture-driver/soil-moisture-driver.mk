# AESD_CHAR_DRIVER_VERSION = 3bda09f46571827385d3eef5de413b0c13ab8bc9
# AESD_CHAR_DRIVER_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-Christian-Bull.git
# AESD_CHAR_DRIVER_SITE_METHOD = git
# # AESD_CHAR_DRIVER_GIT_SUBMODULES = YES

# AESD_CHAR_DRIVER_MODULE_SUBDIRS = aesd-char-driver

# define AESD_CHAR_DRIVER_INSTALL_TARGET_CMDS
# 	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/etc/init.d/S99aesdchar
# 	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/etc/init.d/K99aesdchar
# endef

# $(eval $(kernel-module))
# $(eval $(generic-package))