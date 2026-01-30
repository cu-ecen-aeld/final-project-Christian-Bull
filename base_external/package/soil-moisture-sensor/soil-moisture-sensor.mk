SOIL_MOISTURE_SENSOR_VERSION = e0150065b53de3b0ea49d1edc4a4565608661f31
SOIL_MOISTURE_SENSOR_SITE = git@github.com:Christian-Bull/soil-moisture-server.git
SOIL_MOISTURE_SENSOR_SITE_METHOD = git
SOIL_MOISTURE_SENSOR_GIT_SUBMODULES = YES

define SOIL_MOISTURE_SENSOR_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/sensor-scraper all

	cd $(@D)/server && \
		$(TARGET_MAKE_ENV) \
		GOOS=linux \
		GOARCH=arm64 \
		CGO_ENABLED=0 \
		$(HOST_DIR)/bin/go build \
			-buildvcs=false \
			-trimpath \
			-ldflags "-s -w" \
			-o $(@D)/sensor-server \
			.
endef

define SOIL_MOISTURE_SENSOR_INSTALL_TARGET_CMDS
	cp -r $(@D)/sensor-scraper/* $(TARGET_DIR)/bin/

	$(INSTALL) -D -m 0755 $(@D)/sensor-server $(TARGET_DIR)/usr/bin/sensor-server
endef

$(eval $(generic-package))