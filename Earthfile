# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

ARG MIX_ENV=dev

all:
  BUILD +check
  BUILD +lint-copyright

get-deps:
  FROM elixir:1.12-alpine
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

  RUN mix check --except reuse

lint-copyright:
  FROM fsfe/reuse

  COPY . .

  RUN reuse lint
