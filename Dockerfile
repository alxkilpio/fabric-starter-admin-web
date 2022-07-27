ARG NODE_IMAGE

FROM ${NODE_IMAGE:-'node:12-alpine'} as node_base
RUN apk update && apk add git
#ENV BUILD_DIR=./BUILD
#RUN mkdir ${BUILD_DIR}
#COPY . ${BUILD_DIR}
COPY . .
#WORKDIR ${BUILD_DIR}
RUN ls -la
RUN git --version
RUN pwd
ENV PACKAGE_NAME=admin-webapp.tgz
RUN echo ${PACKAGE_NAME}
RUN rm -f ${PACKAGE_NAME}

#RUN npm install

#RUN npx au build --env prod

#RUN tar -zcvf ${PACKAGE_NAME:-admin-webapp.tgz} index.html scripts
RUN touch  ${PACKAGE_NAME:-admin-webapp.tgz}

RUN ls -la
FROM scratch AS export-stage
#ENV PACKAGE_NAME=admin-webapp.tgz
ENV PACKAGE_NAME=admin-webapp.tgz
COPY --from=node_base /${PACKAGE_NAME} /
