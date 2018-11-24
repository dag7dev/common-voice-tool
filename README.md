# common-voice-tool
Common Voice Tool - CLI Tool <br>
GUI - Coming soon!<br>

[[Click here for the Italian Version]](LEGGIMI.MD)

## Preliminary operations

You need to clone this repo:

```
git clone https://github.com/dag7dev/common-voice-tool
```

## BASH VERSION

```
cd common-voice-tool
cd BASH
sudo chmod 755 common-voice-tool.sh
```

You can finally run this script ;)

## CLI

```
./common-voice-tool
usage: ./common-voice-tool <options>
  -h or -help
    	Show this message
  -range or -chkLen
    	Check if a row's length is in a range
  -trim
    	Trim whitespace at the end of the lines.
  -chkPoint
      Check if every file's row ends with a dot (doesn't replace it, just check).
  -ac
      Add a dot if a file's row is not ending with a dot.
  -no-empty
      Remove all the empty lines.
  -capitalize
      Capitalize every single character at the beginning of every sentence.
```
## NOTES
This script MUST be used JUST with plain TEXT files.<br>
You can select your language by selecting country-code when you run the script.
'lang' folder must exists and at least one file must be onto the folder.

## What branch should I use?
The beta one is "experimental", I update everytime this branch.
The master one, even though I thought about using just the master one, it is unstable.
Until the beta becomes stable, I won't push to master and there won't be a release.

## WIP

Todo:
- Split lines automatically
- ~~Localization~~ **DONE**
- ~~Capitalize all first letters at the begin of each row~~ **DONE**
- ~~Remove empty lines.~~ **DONE**
- ~~Add check row's length while adding a dot at the end of each row.~~ **DONE**

## Can I contact you?
Sure! You can found my email address inside source code!<br>
You can also contact me here, on GitHub!<br>
Let me know if you love this software or if it has something to fix!<br>

## Why this tool?
This tool was meant for making faster working with common-voice strings.<br>
It can help you in checking length, adding full stop (when needed) and other several useful things.<br>

## How can I help you?
Submit issues and give me more ideas about implementing new features! :) <br>
