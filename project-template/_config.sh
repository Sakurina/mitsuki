export MITSUKI_PROJECT_NAME="com.yournamehere.yourpatch"
export MITSUKI_FINAL_APK="PatchedApp.apk"

# the file names you are looking for in the deps directory
export MITSUKI_APK="OriginalApp.apk"
export MITSUKI_ODEX="OriginalApp.odex"

# if the file can't be found in the deps directory, attempt to pull it off the
# connected device using these paths
export MITSUKI_ATTEMPT_APK_PATH="/system/app/OriginalApp.apk"
export MITSUKI_ATTEMPT_ODEX_PATH="/system/app/OriginalApp.odex"
