# FreeDVDBoot
PlayStation 2 DVD Player Exploit. This allows you to burn your own PlayStation 2 homebrew discs and play them on an unmodified console as seen in the [demo video](https://www.youtube.com/watch?v=ez0y-hz3VuM). With uLaunchELF as the initial program, users can include multiple homebrew programs on the same disc.

For technical details please refer to my [blog post](https://cturt.github.io/freedvdboot.html).

## Easy setup for all PS2 Slim consoles / Bravia TV
All you need is:

- A compatible console (all PS2 Slim / Sony Bravia TV units are supported),
- A DVD (not a CD), preferably a DVD-R as other types such as DVD+RW put more strain on the PS2 laser,
- A computer with a built-in disc burner / external USB disc burner,

### Step 1: Download the ISO
Download [`PREBUILT ISOs/All PS2 Slims - English language.iso`](https://github.com/CTurt/FreeDVDBoot/raw/master/PREBUILT%20ISOs/All%20PS2%20Slims%20-%20English%20language.iso)

### Step 2: Burn the ISO
Please check following to ensure a good burn which the PS2 will be able to read:

- Clean off any dust from the disc,
- Select lowest burning speed option,
- Select finalise disc option,

### Step 3: Set console language to English
Your console must be set to **English language** for the exploit to work (other languages cause memory contents to change).

To do this, boot without a disc inserted, press **Circle** to enter **System Configuration** and set your system language to **English**.

### Step 4: Boot!
Insert the disc into your console, and wait. It should boot into **uLaunchELF** within a few seconds.

From **uLaunchELF**, you have the ability to run any homebrew you want over USB **mass** storage! Many people choose to run **FreeMCBoot** or **Fortuna** installer, as they find booting from a memory card more convenient.

If you want to add additional homebrew to your DVD / replace uLaunchELF, please read from [Custom disc setup](#custom-disc-setup).

## Troubleshooting - please read if the above didn't work
| Problem                                                                            | Solution                                                                                                                                                                                                                                                                                         |
|------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Disc doesn't spin on slim console                                                  | Press the lid down hard to ensure the sensors detect that the lid is closed. If still not working try placing some weight such as a book on the top of the console.                                                                                                                              |
| PS2 detects the disc as "PlayStation 2 disc" instead of "DVD Video" in the browser | Your PS2 has a modchip which is incorrectly preventing the DVD player from launching. You do not need this exploit for a console with a modchip, but if you really want to try it some modchips offer the ability to temporarily disable themselves (by holding start when booting for example). |
| PS2 displays "unable to read disc"                                                 | Please try playing a real DVD movie disc to verify that your console's DVD laser works; doing this can also recalibrate the laser which might solve the issue, as [commented here](https://github.com/CTurt/FreeDVDBoot/issues/27).                                                                                                                |
| PS2 freezes at black/red/green screen                                              | If your PS2 DVD laser is really worn out, or you are using something difficult to read like a dusty DVD+RW burned on high speed, it might take some time before uLaunchELF actually starts. Please try waiting 3 minutes or so, per [this comment](https://github.com/CTurt/FreeDVDBoot/issues/3#issuecomment-651337741)                                            |

Other suggestions that worked for others:

- Try unplugging your controller, and plugging it back in. Apparently [that solved the issue for this user](https://github.com/CTurt/FreeDVDBoot/issues/103).

- Try removing all memory cards. Apparently [that solved the issue for this user](https://github.com/CTurt/FreeDVDBoot/issues/3#issuecomment-651970564).

- Try burning with different software. Apparently [for this user](https://github.com/CTurt/FreeDVDBoot/issues/108) ImgBurn didn't work, but CDBurnerXP with 1x speed, compatibility settings, and finalize option worked.

- Check that your console's language is set to English.

**Please, only open a GitHub issue if you have read and tried all of the above. If you do open an issue, please confirm that you tried a real DVD movie and it worked on your system so that we know it's not just a laser failure; also include your DVD player version, the name of the ISO you tried, the type of DVD, and what happens when you launch the disc.**

## Phat consoles
Phat consoles have many different firmware version revisions, which makes them harder to add support for. It also means you will need to identify your firmware version, and burn the matching ISO file.

It's still early in terms of support for different versions, check back here later. Hopefully over time other developers from the scene will also contribute support for additional DVD Player versions.

### Step 1: Identify your DVD Player Version
Boot your PlayStation 2 without any disc inserted, and press Triangle to identify which DVD Player version your console has.

**Currently only support:**

- 3.03 (tested only region E in emulator as other BIOS versions aren't available to me, but guess other regions will work - any language),
- 3.04 (tested only region M in emulator so far, but guess most other regions EUMACDG, except for J will work - with English language set in settings),
- 3.04 (J region only - use the "All Slim PS2s" image - with English language set in settings),

### Step 2: Download the ISO
Download the ISO that corresponds to your firmware version.

**Please don't bother trying on a non-supported firmware/language configuration, it won't work...**

For example, if your DVD Player version is 3.04M, you would want to burn `PREBUILT ISOs/3.04 only - M+maybe other regions except J - English language.iso`.

### Step 3, 4, 5 - Burn the ISO, set console language to English, and boot!
These steps are the same as described for slim above.

## Custom disc setup
If you intend to make your own image containing additional homebrew / modified initial loader, please read on.

### Step 1: Copy your homebrew
Once you've identified your console's DVD Player version, copy all of the homebrew you would like to include on the disc into that directory in the `Filesystems` (EG: `Filesystems/All PS2 slims (3.10 + 3.11) - English language/` is the one that supports all slim consoles).

### Step 2: Make an image
Once you've placed all the homebrew files you'd like into the directory, generate a UDF (ISO9960/UDF hybrid also works) image of the directory (so `VIDEO_TS` is in the root).

On Windows, you can use a GUI like ImgBurn to make an disc image. It will give a warning that `VIDEO_TS.BUP` is missing, but just click continue anyway (PS2 doesn't require this file).

On Linux the easiest way is probably to use `genisoimage` as it comes pre-installed on many Linux distributions like Ubuntu. Run the following on terminal (where `exploit.iso` is the output and `Filesystem/All PS2 slims (3.10 + 3.11) - English language` is the directory containing `VIDEO_TS` and any homebrew):

    genisoimage -udf -o exploit.iso "Filesystems/All PS2 slims (3.10 + 3.11) - English language"

### Step 3: Test and burn
I would recommend you test in PCSX2 first, but since [PCSX2 doesn't support loading the DVD Player](https://github.com/PCSX2/pcsx2/issues/1981), you have to decrypt and repack it yourself, which is beyond the scope of this README. With that said, if you aren't touching anything in `VIDEO_TS`, there shouldn't really be any reason for the exploit to fail.

## Replacing the initial program
I've included uLaunchELF recompiled with [DVD support](https://github.com/ps2dev/ps2sdk/pull/130) as the default initial program. It presents a menu which allows you to select any of the homebrew programs you chose to include on the disc (and also allows booting from USB).

Alternatively, if you would rather just boot into a single homebrew application, the initial program the exploit attempts to boot is located at `VIDEO_TS/VTS_02_0.IFO`, replace it with your desired `ELF` file, with the below caveat that compatibility might be lower than if you booted a program through uLaunchELF:

For the initial release, I didn't bother to reimplement a couple of functions used by the loader, so it requires that the ELF you load doesn't overwrite those functions I use (those are around `0x84000 - 0x85fff` and `0x250000 - 0x29ffff`). I will probably remove this limitation in the future, but all ELFs I could find were fine with this limitation.

You can run `readelf -l` to verify your executable satisfies this requirement. For example, this Tetris homebrew just uses `0x00100000 - 0x0017a940`:

	$ readelf -l VTS_02_0.IFO

	Elf file type is EXEC (Executable file)
	Entry point 0x104490
	There is 1 program header, starting at offset 52

	Program Headers:
	  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
	  LOAD           0x001000 0x00100000 0x00100000 0x72ef4 0x7a940 RWE 0x1000

	 Section to Segment mapping:
	  Segment Sections...
	   00     .text .ctors .dtors .rodata .data .jcr .sdata .sbss .bss

## Loading backups
It's possible to patch backup images of commercial games to make them bootable using this exploit. I didn't want to maintain this tool, so it's not included in this repository, but can be found by searching for something like FreeDVDBoot ESR auto patcher.

## DEVELOPMENT: Replacing the loader payload
The default payload will boot `VIDEO_TS/VTS_02_0.IFO` as an ELF file, but tweaks might be desired to improve compatibility, or maybe changing the behaviour to boot `BOOT.ELF` instead for instance.

If you wish to update the loader payload, run `build.sh` inside `PAYLOAD` directory, and copy the output `.bin` files into `VIDEO_TS/VIDEO_TS.IFO` at the offsets displayed by the output of the command.

## PORTING:
Please read my technical writeup, to understand how the exploit works. I've also provided some [notes about porting](https://cturt.github.io/FreeDVDBoot/portingnotes.html) in the [`gh-pages`](https://github.com/CTurt/FreeDVDBoot/tree/gh-pages) branch.
