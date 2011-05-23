# Duck Duck Go for the Honeycomb Browser

This is the main reason I built the Mitsuki scripts in the first place.

## How to Install
* Run the *prepare.sh* script to fetch all dependencies and initialize the working tree.
* Run the *apply-patch.sh* script to apply the *net.r-ch.ddgforhoneycombbrowser.patch* patch.
* Run *reassemble.sh* to build a patched apk (Browser+DuckDuckGo.apk)
* Uninstall the system's browser, preferably keeping a backup handy. Instructions can be found [here][1]. You cannot simply use *adb install -r* to install the patched browser to the device as you'd get an error about inconsistent certificates.
* Install the patched browser using *adb install Browser+DuckDuckGo.apk*.
* Set your in-browser search engine to Duck Duck Go.

[1]: http://wiki.cyanogenmod.com/index.php?title=Barebones
