ARG NODE_IMAGE

FROM ${NODE_IMAGE:-'node:12-alpine'} as node_base
RUN apk update && apk add git
ENV BUILD_DIR=./BUILD

RUN mkdir ${BUILD_DIR}
COPY . ${BUILD_DIR}
COPY . .

WORKDIR ${BUILD_DIR}

ARG PACKAGE_NAME
RUN rm -f ${PACKAGE_NAME:-admin-webapp.tgz}

RUN npm install
RUN npx au build --env prod

RUN tar -zcvf ${PACKAGE_NAME:-admin-webapp.tgz} index.html scripts

FROM scratch AS export-stage
ARG PACKAGE_NAME
COPY --from=node_base /BUILD/${PACKAGE_NAME:-admin-webapp.tgz} /
