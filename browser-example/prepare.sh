#!/bin/sh

# load config
. _config.sh

if [ ! -d deps ]
then
  mkdir deps
fi

# unzip the apk
if [ -f deps/${MITSUKI_APK} ]
then
  echo :: apk-dep: ${MITSUKI_APK} already found!
  unzip deps/${MITSUKI_APK} -d apk
  rm -r apk/META-INF
else
  echo :: apk-dep: attempting to pull ${MITSUKI_APK} from ${MITSUKI_ATTEMPT_APK_PATH} from connected device...
  adb pull ${MITSUKI_ATTEMPT_APK_PATH} deps/${MITSUKI_APK}
  if [ -f deps/${MITSUKI_APK} ]
  then
    unzip deps/${MITSUKI_APK} -d apk
    rm -r apk/META-INF
  else
    echo :: apk-dep: attempt to pull ${MITSUKI_APK} failed! halting
    exit 1
  fi
fi

# pull dependencies from the phone
for dep in "android.policy.odex" "bouncycastle.odex" "core-junit.odex" "core.odex" "ext.odex" "framework.odex" "services.odex"
do
  if [ -f deps/${dep} ]
  then
    echo :: framework-deps: ${dep} already found!
  else
    echo :: framework-deps: attempting to pull ${dep} from connected device...
    adb pull /system/framework/${dep} deps/
    if [ ! -f deps/${dep} ]
    then
      echo :: framework-deps: attempt to pull ${dep} failed! halting
      exit 1
    fi
  fi
done

# is smali and baksmali in the deps folder?
for dep in "smali-1.2.6.jar" "baksmali-1.2.6.jar"
do
  if [ -f deps/${dep} ]
  then
    echo :: smali-deps: ${dep} already found!
  else
    echo :: smali-deps: attempting to pull ${dep} from google code...
    curl http://smali.googlecode.com/files/${dep} -o deps/${dep}
    if [ ! -f deps/${dep} ]
    then
      echo :: smali-deps: attempt to pull ${dep} failed! halting
      exit 1
    fi
  fi
done

# deodex + smali the file
if [ -f deps/${MITSUKI_ODEX} ]
then
  echo :: odex-dep: ${MITSUKI_ODEX} already found!
else
  echo :: odex-dep: attempting to pull ${MITSUKI_ODEX} from ${MITSUKI_ATTEMPT_ODEX_PATH} from connected device...
  adb pull ${MITSUKI_ATTEMPT_ODEX_PATH} deps/${MITSUKI_ODEX}
  if [ ! -f deps/${MITSUKI_ODEX} ]
  then
    echo :: odex-dep: attempt to pull ${MITSUKI_ODEX} failed! halting
    exit 1
  fi
fi
java -jar deps/baksmali-1.2.6.jar -d deps -x deps/${MITSUKI_ODEX} -o old/

# copy all of that code into "new"
cp -r old new
