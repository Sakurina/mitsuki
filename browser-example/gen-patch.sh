#!/bin/sh
# gen-patch.sh: use this to generate a patch file you can distribute

. _config.sh
diff -rupN old/ new/ > ${MITSUKI_PROJECT_NAME}.patch
