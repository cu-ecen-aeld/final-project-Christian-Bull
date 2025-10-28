SOIL_MOISTURE_DRIVER_VERSION = 8ca4a8a055ae30b5db5e4b9ae76fac9dd106e30f
SOIL_MOISTURE_DRIVER_SITE = git@github.com:Christian-Bull/soil-moisture-sensor.git
SOIL_MOISTURE_DRIVER_SITE_METHOD = git

SOIL_MOISTURE_DRIVER_MODULE_SUBDIRS = driver
SOIL_MOISTURE_DRIVER_INSTALL_TARGET = YES

define SOIL_MOISTURE_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/driver/soil-driver_load.sh $(TARGET_DIR)/etc/init.d/S99soildriver
	$(INSTALL) -m 0755 $(@D)/driver/soil-driver_unload.sh $(TARGET_DIR)/etc/init.d/K99soildriver
endef

$(eval $(kernel-module))
$(eval $(generic-package))