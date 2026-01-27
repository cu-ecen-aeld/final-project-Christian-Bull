SOIL_MOISTURE_DRIVER_VERSION = 6241c01241980b115d57b22cad114a4b5578dc59
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