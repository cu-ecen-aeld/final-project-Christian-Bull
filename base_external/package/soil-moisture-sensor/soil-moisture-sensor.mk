SOIL_MOISTURE_SENSOR_VERSION = b8a388598b100ba7db2e8bf22b6a750ff4c1cfb5
SOIL_MOISTURE_SENSOR_SITE = git@github.com:Christian-Bull/soil-moisture-server.git
SOIL_MOISTURE_SENSOR_SITE_METHOD = git
SOIL_MOISTURE_SENSOR_GIT_SUBMODULES = YES

define SOIL_MOISTURE_SENSOR_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/sensor-scraper all
endef

define SOIL_MOISTURE_SENSOR_INSTALL_TARGET_CMDS
	cp -r $(@D)/sensor-scraper/* $(TARGET_DIR)/bin/
endef

$(eval $(generic-package))