# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

# Elixir library best practice is to have a workflow that unlocks dependencies
# and then compiles and runs tests.
# The mix.lock file is ignored when a project is used as a dependency,
# and dependency resolution only obeys the mix.exs values.

VERSION 0.6

ARG MIX_ENV=dev
ARG ELIXIR_VERSION=1.14

all:
  BUILD +all-test
  BUILD +all-test-unlocked

  BUILD +check
  BUILD +lint-copyright

all-test:
  BUILD +test \
    --ELIXIR_VERSION=1.14 \
    --ELIXIR_VERSION=1.13 \
    --ELIXIR_VERSION=1.12

all-test-unlocked:
  BUILD +test-unlocked \
    --ELIXIR_VERSION=1.14 \
    --ELIXIR_VERSION=1.13 \
    --ELIXIR_VERSION=1.12

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

test:
  FROM +build

  RUN mix check --only test

test-unlocked:
  FROM elixir:${ELIXIR_VERSION}-alpine

  WORKDIR /app
  RUN mix do local.rebar --force, local.hex --force
  COPY mix.exs .
  COPY mix.lock .

  RUN mix deps.unlock --all
  RUN mix deps.get

  COPY lib ./lib

  RUN mix check --only test

check:
  FROM +build

  COPY README.md .
  COPY CHANGELOG.md .
  COPY CONTRIBUTING.md .
  COPY --dir LICENSES .
  COPY code_of_conduct.md .
  COPY .doctor.exs .
  COPY .check.exs .

  RUN mix check --except reuse --except test

lint-copyright:
  FROM fsfe/reuse

  COPY . .

  RUN reuse lint
