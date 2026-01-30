SOIL_MOISTURE_SENSOR_VERSION = 54e97305299831c2e53dd2559a5711a20d88050d
SOIL_MOISTURE_SENSOR_SITE = git@github.com:Christian-Bull/soil-moisture-server.git
SOIL_MOISTURE_SENSOR_SITE_METHOD = git
SOIL_MOISTURE_SENSOR_GIT_SUBMODULES = YES

define SOIL_MOISTURE_SENSOR_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/sensor-scraper all

	cd $(@D)/server && \
		$(TARGET_MAKE_ENV) \
		GOOS=linux GOARCH=arm64 CGO_ENABLED=0 \
		$(HOST_DIR)/bin/go build \
			-buildvcs=false \
			-trimpath \
			-ldflags "-s -w" \
			-o $(@D)/sensor-server \
			sensor-server.go
endef

define SOIL_MOISTURE_SENSOR_INSTALL_TARGET_CMDS
	cp -r $(@D)/sensor-scraper/* $(TARGET_DIR)/bin/

	$(INSTALL) -D -m 0755 $(@D)/sensor-server $(TARGET_DIR)/usr/bin/sensor-server

	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/init.d/
	$(INSTALL) -D -m 0755 $(@D)/server/start-server.sh $(TARGET_DIR)/etc/init.d/S87sensorserver
endef

$(eval $(generic-package))