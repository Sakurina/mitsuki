#!/bin/sh

. _config.sh
rm ${MITSUKI_FINAL_APK}
java -jar deps/smali-1.2.6.jar new -o apk/classes.dex
cd apk
zip -r ../${MITSUKI_APK} *
cd ..
jarsigner -verbose -keystore ~/.android/debug.keystore -storepass android -keypass android -signedjar signed.apk ${MITSUKI_APK} androiddebugkey
rm ${MITSUKI_APK}
zipalign -f -v 4 signed.apk ${MITSUKI_FINAL_APK}
rm signed.apk
