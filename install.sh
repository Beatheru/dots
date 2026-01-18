#!/bin/bash

set -euo pipefail

start=$(date +%s)

source setup.sh
source packages.sh
source scripts.sh

end=$(date +%s)
elapsed=$((end - start))

minutes=$((elapsed / 60))
seconds=$((elapsed % 60))

if (( minutes > 0 )); then
  echo "Finished in ${minutes}m ${seconds}s"
else
  echo "Finished in ${seconds}s"
fi