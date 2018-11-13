# common-voice-tool
Common Voice Tool - CLI Tool <br>
GUI - Coming soon!<br>

[[Click here for the Italian Version]](LEGGIMI.MD)

## Preliminary operations

You need to clone this repo:

```
git clone https://github.com/dag7dev/common-voice-tool
```

then

```
cd common-voice-tool
```
and use chmod to change permissions:

```
chmod 755 common-voice-tool.sh
```

## CLI

```
./common-voice-tool
usage: ./common-voice-tool <options>
  -h or -help
    	Shows this message
  -range or -chkLen
    	Check if a row's length is in a range
  -trim
    	Trim whitespace at the end of the lines.
  -chkPoint
      Check if every file's row ends with a dot (doesn't replace it, just check).
  -ac
      Add a dot if a file's row is not ending with a dot.
```
## NOTES
This script MUST be used JUST with plain TEXT files.<br>


## WIP

Todo:
- Localization
- Split lines automatically
- ~~Add check row's length while adding a dot at the end each row.~~ **DONE**

## Can I contact you?
Sure! You can found my email address inside source code!<br>
You can also contact me here, on GitHub!<br>
Let me know if you love this software or if it has something to fix!<br>

## Why this tool?
This tool was meant for making faster working with common-voice strings.<br>
It can help you in checking length, adding full stop (when needed) and other several useful things.<br>

## How can I help you?
Submit issues and give me more ideas about implementing new features! :) <br>
