SOIL_MOISTURE_DRIVER_VERSION = 1b4d0d45ca7681a51c885162dc05288fa12811cc
SOIL_MOISTURE_DRIVER_SITE = git@github.com:Christian-Bull/soil-moisture-sensor.git
SOIL_MOISTURE_DRIVER_SITE_METHOD = git
SOIL_MOISTURE_DRIVER_GIT_SUBMODULES = YES

SOIL_MOISTURE_DRIVER_MODULE_SUBDIRS = driver

define SOIL_MOISTURE_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/driver/soil-driver_load $(TARGET_DIR)/etc/init.d/S99soildriver
	$(INSTALL) -m 0755 $(@D)/driver/soil-driver_unload $(TARGET_DIR)/etc/init.d/K99soildriver
endef

$(eval $(kernel-module))
$(eval $(generic-package))