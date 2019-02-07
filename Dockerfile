FROM RHEL
EXPOSE 8181
WORKDIR /app
COPY package.json .
COPY scripts scripts
ARG TURTL_SERVER_PLUGIN_REPO
ARG TURTL_SERVER_PLUGIN_LOCATION
RUN ./scripts/install-plugins.sh
COPY . .
CMD ./scripts/init-db.sh \
	&& node server.js

