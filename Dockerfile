FROM python:3.12-slim AS python-image

WORKDIR /app

RUN pip install uv

COPY pyproject.toml uv.lock ./

RUN uv sync

COPY . .

CMD ["uv", "run", "granian", "--interface", "asginl", "--port", "8000", "--host", "0.0.0.0", "app:app.asgi"]

FROM node:20-slim AS node-image

WORKDIR /app

COPY frontend/package.json frontend/pnpm-lock.yaml ./

RUN npx pnpm install

COPY frontend .

RUN npm run build

# RUN echo $(date) > /tmp/buildtime

# RUN ls -la .next

CMD ["npm", "run", "start"]
