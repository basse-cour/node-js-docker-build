ARG NODE_TAG=lts-alpine
FROM node:${NODE_TAG}

# Copy application files
ARG BOT_DIR
COPY $BOT_DIR /app

WORKDIR /app

### Transpilation to Javascript

# Install dev dependencies (including Typescript and types)
RUN npm ci

RUN npm run build

### Production build

# Remove dev dependencies
RUN npm prune --omit=dev

CMD ["npm", "start"]
