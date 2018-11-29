# common-voice-tool
Common Voice Tool - CLI Tool <br>
GUI - Coming soon!<br>

[[Click here for the Italian Version]](LEGGIMI.MD)

## Preliminary operations

**LAST STABLE: v0.4.2**

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
cd Bash
sudo chmod 755 common-voice-tool.sh
```

You can finally run this script ;)

## Python version
This version can turn in handy if you're on a system that can't run bash scripts (e.g. Windows unless you use WSL or other stuff). It was made by [jotaro-sama](https://github.com/jotaro-sama) to automate the work of checking whether the sentences to pass to Mozilla's [Common Voice](https://voice.mozilla.org/) were properly formatted. To run it, any version of Python 3.x should be fine. Just pass the file with the sentences to the script like this:
```
python3 common-voice-tool.py sentences.txt      #Most GNU/Linux distros, macOS
py -3 common-voice-tool.py sentences.txt        #Windows Command Prompt
```
The exact commands may vary depending on how you configured your system.

At the moment, the Python version works a bit differently from the bash one, but it's **fully functional**. It automatically formats the file (putting the output in `out.txt`) so that:
- There are no empty lines.
- There are no double spaces, spaces before the final dot or spaces at the end of the lines.
- All lines are capitalized.
- All lines end with a dot.

It also notifies you whether some sentences exceed the 125 characters length (dot included), which was the maximum length for sentences to be passed to Common Voice.

## CLI USAGE

If you run the bash script without parameters you will get this (after language selection):
```
./common-voice-tool
usage: ./common-voice-tool <language-code> <options>
  -h or -help
    	Show this message
  -range or -chkLen
    	Check if there are lines in the file which exceed a maximum length.
  -trim
    	Trim whitespace at the end of the lines.
  -chkPoint
      Check if all rows in the file end with a dot (doesn't replace it, just checks).
  -ac
      Add a dot to the rows not ending with one.
  -noEmpty
      Remove all the empty lines.
  -capitalize
      Capitalize the first character of every sentence.
  -all
      It performs everything listed! Probably using just this option will be what are you looking for ;)
```

To run this script you need to include your language code and at least one parameter.<br>
For example: 
```
./common-voice-tool en -range
```
will check if there are lines in the file which exceed a maximum length. <br>

You don't need to pass the filename as a parameter, as the script will prompt you to choose a file when launched. <br>

You can run this script with multiple parameters.<br>
As an example:
```
./common-voice-tool en -range -noEmpty
```
will check if there are lines exceeding a maximum length and remove all the empty lines.

## LIST OF PARAMETERS
Parameter | What does it do
------------ | -------------
-h | show help (as if you run without parameters)
-range | Check if there are lines exceeding a maximum length
-chkLen | same as above
-trim | Trim whitespace at the end of every row.
-chkPoint | Check if all rows in the file end with a dot (just check).
-ac | same as above but it will add the dot if it's missing.
-noEmpty | Remove all the empty lines.
-capitalize | Capitalize the first character of every sentence.
-all | It performs every operation listed here!

## NOTES
This script MUST be used ONLY with plain TEXT files.<br>
You can select your language by selecting the right country-code when you run the script.
'lang' folder must exists and at least one file must be into the folder.

## What branch should I use?
The beta one is "experimental", I always update this branch. <br>

Until the beta becomes stable, I won't push to master and there won't be a release.<br>

In future, branches management may change.


## WIP

Todo:
- [ ] Split lines automatically
- [x] ~~Localization~~ **DONE**
- [x] ~~Capitalize all first letters at the begin of each row~~ **DONE**
- [x] ~~Remove empty lines.~~ **DONE**
- [x] ~~Add check row's length while adding a dot at the end of each row.~~ **DONE**

## Can I contact you?
Sure! You can found my email address inside the source code!<br>
You can also contact me here, on GitHub!<br>
Let me know if you love this software or if it has something which needs a fix!<br>

## Why this tool?
This tool was meant to help people prepare strings to be used with Mozilla's [Common Voice project](https://voice.mozilla.org/) (check it out, it's really cool!).<br>
It can help you in checking length, adding full stop (when needed) and other several useful things.<br>

## How can I help you?
Submit issues and give me more ideas about implementing new features! :) <br>
