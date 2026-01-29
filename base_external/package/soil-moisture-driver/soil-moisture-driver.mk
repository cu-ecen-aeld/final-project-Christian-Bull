SOIL_MOISTURE_DRIVER_VERSION = 1cace9d4af498111da0af24cf9ed21fb0cc7f36c
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