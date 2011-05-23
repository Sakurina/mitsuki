# Mitsuki
*Mitsuki* is an attempt to simplify distributing and applying patches for disassembled Android applications. Thank you, Google for not distributing source code for Honeycomb system applications, I *really* appreciate it. *Finally*, I have an excuse to learn Dalvik bytecode!

This was mostly made to scratch my own itch; I wanted to replace the Honeycomb browser's search engine with [Duck Duck Go][2], but couldn't due to the lack of source code. You can find my patch as an example under the *browser-example* directory.

## Requirements
* bash
* curl
* unzip
* Java (to run [smali/baksmali][1])
* Android SDK

For what it's worth, this was all tested and developed on a late 2010 MacBook Air running OS X 10.6.7.

## Scripts
* *prepare.sh*: Automatically pulls down dependencies require to disassemble, disassembles the apk + odex specified in the config file.
* *gen-patch.sh*: After working on code in the new/ directory, use this script to generate a patch file you can distribute
* *apply-patch.sh*: Takes a new/ folder fresh from the preparation stage and applies the patch so you can continue working where someone left off.
* *reassemble.sh*: Reassembles a dex file and rebuilds an apk from the dex and the unzipped apk from the preparation stage.
* *_config.sh*: Set environment variables specific to your project.


[1]: https://code.google.com/p/smali
[2]: https://duckduckgo.com
