# Use Python 3.11 slim image as base
FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python3 - && \
    cd /root/.local/bin && \
    ln -sf /root/.local/share/pypoetry/venv/bin/poetry . && \
    ln -sf /root/.local/share/pypoetry/venv/bin/poetry /usr/local/bin/ && \
    export PATH="/root/.local/bin:$PATH"

COPY pyproject.toml poetry.lock* README.md ./

RUN poetry config virtualenvs.create false

RUN poetry install --only main --no-interaction --no-ansi --no-root

COPY . .

EXPOSE 8000

CMD ["poetry", "run", "uvicorn", "src.api:app", "--host", "0.0.0.0", "--port", "8000"] 