# common-voice-tool
Common Voice Tool - CLI Tool <br>
GUI - Coming soon!<br>

[[Click here for the Italian Version]](LEGGIMI.MD)

## Preliminary operations

**STABLE VERSIONI!**<br>
**LAST BETA: v0.4.2**

You need to clone this repo:
```
git clone https://github.com/dag7dev/common-voice-tool
```
Beta branch:
```
git clone --single-branch -b beta https://github.com/dag7dev/common-voice-tool
```

## BASH VERSION

```
cd common-voice-tool
cd BASH
sudo chmod 755 common-voice-tool.sh
```

You can finally run this script ;)

## CLI USAGE

If you run without parameter you will get (after language selection):
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
  -noEmpty
      Remove all the empty lines.
  -capitalize
      Capitalize every single character at the beginning of every sentence.
  -all
      It performs every operation. Easy :)
```

To run this script you need to include at least one parameter.<br>
For example: 
```
./common-voice-tool en -range
```
will perform a check if a row's length is in a range. <br>

You no need to pass the filename as parameter as the script will prompt you to choose a file. <br>

You can run this script with multiple parameters.<br>
As example:
```
./common-voice-tool en -range -noEmpty
```
will check if a row's length is in a range and it will remove all the empty lines.<br>

You need to put "en" as the first parameter or wheatever is your language code, if not, it won't work!

## LIST OF PARAMETERS
Parameter | What does it do
------------ | -------------
-h | show helps (as you run without parameters)
-range | Check if a row's length is in a range
-chkLen | same as above
-trim | Trim whitespace at the end of every row.
-chkPoint | Check if every file's row ends with a dot (just check).
-ac | same as above but it will add if it's missing
-noEmpty | Remove all the empty lines.
-capitalize | Capitalize every single character at the beginning of every sentence.
-all | It performs every operation

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
- [ ] Split lines automatically
- [x] ~~Localization~~ **DONE**
- [x] ~~Capitalize all first letters at the begin of each row~~ **DONE**
- [x] ~~Remove empty lines.~~ **DONE**
- [x] ~~Add check row's length while adding a dot at the end of each row.~~ **DONE**

## Can I contact you?
Sure! You can found my email address inside source code!<br>
You can also contact me here, on GitHub!<br>
Let me know if you love this software or if it has something to fix!<br>

## Why this tool?
This tool was meant for making faster working with common-voice strings.<br>
It can help you in checking length, adding full stop (when needed) and other several useful things.<br>

## How can I help you?
Submit issues and give me more ideas about implementing new features! :) <br>
