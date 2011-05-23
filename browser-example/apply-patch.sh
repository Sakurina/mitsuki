#!/bin/sh
# apply-patch.sh: use this to apply the patches to the new/ directory to continue working where someone left off

. _config.sh
cd new/
patch -p1 < ../${MITSUKI_PROJECT_NAME}.patch
cd ..
