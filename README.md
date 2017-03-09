# RunMario+Patch - For Mario Run 1.1.2

RunMario is a iOS tweak that allow you to play SuperMarioRun on a jailbreak device.

## Usage

- Download from https://www.aijunkiez.xyz/Thread-Patcher-Hack-Super-Mario-Run-Ver-1-1-2-3
- or Compile with THEOS

## Why
When your iOS device is jailbreaked, SuperMarioRun.app will quit immediately after launching. It may on the perpose 
of preventing cheating, but, as a developer, where are many more reasons to jailbreak my iOS device while playing 
my SuperMarioRun. Also dont pay $10 for world unlock and have some coins to spend ;)

## How

There are many methods of checking jailbreak state for an AppStore APP. The most common method is checking the pathes outside an app's 
sandbox. By disassenble the binary, `fileExistsAtPath` is found to use for checking. Just hook this method and return NO for 
some pathes outside the sandbox.

## Added
- Unlock all worlds
- Unlimited coins (play a tour game)

## Credits
Leavez for the original JB patch, and Sterling0x1 for world unlock and coins.
