#!/usr/bin/env bash

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -xe

: ${AIRSHIPCTL_PROJECT:="../airshipctl"}
: ${TREASUREMAP_PROJECT:="$(pwd)"}

export SITE=${SITE:-"test-site"}
export AIRSHIP_CONFIG_METADATA_PATH=${AIRSHIP_CONFIG_METADATA_PATH:-"treasuremap/manifests/site/$SITE/metadata.yaml"}
# Setting the same value as targetPath that gets updated after create config step (22_test_configs.sh)
export AIRSHIP_CONFIG_MANIFEST_DIRECTORY=${AIRSHIP_CONFIG_MANIFEST_DIRECTORY:-"/tmp/treasuremap"}

# Primary repo options
# Only the last item in the repo url path, e.g., 'treasuremap', is used by
# the generate secret command.
# In the case the init_site script was used to generate the project and site
# directory outside of treasuremap, set it to the PROJECT value so we don't
# need to ask the user to set the repo url.
export PROJECT=${PROJECT:-"treasuremap"}
export AIRSHIP_CONFIG_PHASE_REPO_URL=${AIRSHIP_CONFIG_PHASE_REPO_URL:-$PROJECT}

cd ${AIRSHIPCTL_PROJECT}
./tools/deployment/23_generate_secrets.sh
