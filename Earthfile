# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

VERSION 0.6

ARG MIX_ENV=dev
ARG ELIXIR_VERSION=1.13

all:
  BUILD +check \
    --ELIXIR_VERSION=1.14 \
    --ELIXIR_VERSION=1.13 \
    --ELIXIR_VERSION=1.12

  BUILD +lint-copyright

get-deps:
  FROM elixir:${ELIXIR_VERSION}-alpine

  WORKDIR /app
  RUN mix do local.rebar --force, local.hex --force
  COPY mix.exs .
  COPY mix.lock .

  RUN mix deps.get

  SAVE ARTIFACT deps AS LOCAL ./deps

compile-deps:
  FROM +get-deps
  RUN MIX_ENV=$MIX_ENV mix deps.compile

  SAVE ARTIFACT _build/$MIX_ENV AS LOCAL ./_build/$MIX_ENV

build:
  FROM +compile-deps

  COPY lib ./lib

  RUN MIX_ENV=$MIX_ENV mix compile

  SAVE ARTIFACT _build/$MIX_ENV AS LOCAL ./_build/$MIX_ENV

check:
  FROM +build

  COPY README.md .
  COPY CHANGELOG.md .
  COPY CONTRIBUTING.md .
  COPY --dir LICENSES .
  COPY code_of_conduct.md .
  COPY .doctor.exs .
  COPY .check.exs .

  RUN mix check --except reuse

lint-copyright:
  FROM fsfe/reuse

  COPY . .

  RUN reuse lint
