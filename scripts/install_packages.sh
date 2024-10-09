#!/bin/bash

set -ouex pipefail

utility=(
  "flameshot"
  "nextcloud-client"
  "plank"
  "sg3_utils"
)

packages=(
  ${utility[@]}
  ${extensions[@]}
)

rpm-ostree install ${packages[@]} 
