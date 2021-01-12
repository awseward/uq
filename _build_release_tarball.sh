#!/usr/bin/env bash

set -euo pipefail

readonly binary_name='uq'

readonly tag_name="$1"
readonly platform_name="${2:-}"

if [ "${platform_name}" != '' ]; then
  readonly tarball_name="${binary_name}-${tag_name}-${platform_name}.tar.gz"
else
  readonly tarball_name="${binary_name}-${tag_name}.tar.gz"
fi

echo "${binary_name}" \
  | xargs -t >&2 nimble build --accept --define:release --stacktrace:on \
                   --linetrace:on

echo "${binary_name}" \
  | xargs -t >&2 tar -czf "${tarball_name}"

echo "${tarball_name}"
