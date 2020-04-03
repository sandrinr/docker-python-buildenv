FROM python:3-slim

ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PIP_NO_CACHE_DIR=true \
  PIP_DISABLE_PIP_VERSION_CHECK=true

RUN set -x && \
  apt-get update && \
  apt-get install -y --no-install-recommends curl openssh-client git && \
  pip install poetry && \
  curl -L https://gist.github.com/sandrinr/675736c1b2cff82a6e1d2bed8bae81f1/raw > /usr/local/bin/python-wheel-remove-git-reference && \
  chmod +x /usr/local/bin/python-wheel-remove-git-reference && \
  rm -rf /var/lib/apt/lists/* /root/{.cache,.*_history}
