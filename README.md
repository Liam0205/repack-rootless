# repack-rootless
This repository provides scripts you need to fetch iphoneos-arm debian packages and convert them into iphoneos-arm64 debian packages.

## Pre-requirements

* Remote i-Device (iphoneos-arm; the rootful jailbroken device)
  * package `redeb`: provides the ability to repackage your installed debian packages.
  * package `openssh`: we need to connect to remote i-Device viw OpenSSH
  * SSH key authorized
* Local i-Device (iphoneos-arm64; the rootless jailbroken device)
  * package `dpkg-deb`, `file`, `fakeroot`, `odcctools`, and `ldid` (from Procursus).
  * package `openssh-client`

## Usage

```bash
./run.sh <remote package bundle ID> [<remote host name>]
```
