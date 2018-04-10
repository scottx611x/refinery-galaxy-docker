FROM bgruening/galaxy-stable:17.05

MAINTAINER Scott Ouellette, scottx611x@gmail.com
ENV GALAXY_CONFIG_BRAND="Refinery Local"

WORKDIR /galaxy-central

ENV ENABLE_TTS_INSTALL=True
RUN add-tool-shed --url 'http://testtoolshed.g2.bx.psu.edu/' --name 'Test Tool Shed'

# Add test tools to the Docker image
ADD tool_list.yml $GALAXY_ROOT/tool_list.yml
RUN install-tools $GALAXY_ROOT/tool_list.yml

RUN startup_lite && \
    galaxy-wait && \
    workflow-install \
    --workflow_path /shed_tools/testtoolshed.g2.bx.psu.edu/repos/refinery-platform/refinery_test_workflows/*/refinery_test_workflows \
	-g http://localhost:8080 \
	-u $GALAXY_DEFAULT_ADMIN_USER \
	-p $GALAXY_DEFAULT_ADMIN_PASSWORD

# Expose port 80 (webserver), 21 (FTP server), 8800 (Proxy)
EXPOSE :80
EXPOSE :21
EXPOSE :8800

# Autostart script that is invoked during container start
CMD ["/usr/bin/startup"]