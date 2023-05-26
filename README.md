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

### `run.sh`

The `run.sh` script is responsible for repackaging the Debian package arranged in the remote i-Device and downloading it locally. It then calls `repack-rootless.sh` to convert it into a rootless Debian package.

```bash
./run.sh <remote package bundle ID> [<remote host name>]
```

### `repack-rootless.sh`

The `repack-rootless.sh` script is responsible for unpacking a rootful Debian package, converting it into a rootless Debian package, and repackaging it. Finally, the script copies the packaged rootless version of the Debian package along with its pre-packaging directory files to the current directory.

```bash
./repack-rootless.sh <local rootful package>
```

### `build.sh`

The `build.sh` script is a relatively independent script that is solely responsible for packaging the directory structure of a Debian package into a Debian package format. Additionally, the script reads the information from `DEBIAN/control` to provide the Debian package with an appropriate name.

```bash
./build.sh <Debian directory structure>
```

