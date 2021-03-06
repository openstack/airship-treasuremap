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

set -ex

: ${AIRSHIPCTL_PROJECT:="../airshipctl"}

export WORKER_NODE=${WORKER_NODE:-"$(airshipctl phase render workers-target \
	-k BareMetalHost 2> /dev/null | \
	yq .metadata.name | \
	sed 's/"//g')"}

cd ${AIRSHIPCTL_PROJECT}
./tools/deployment/37_verify_hwcc_profiles.sh
