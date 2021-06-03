#
# Docker aliases / cheat-sheet
#
# by Dragoljub Bogićević Apr 8 2020 ・ 2 min read
# https://dev.to/bogicevic7/my-docker-aliases-cheat-sheet-4bo9
#
# will be read automatically if located in home directory
# .bashrc will automatically look for the file .bash_aliases 

[![Travis branch](https://img.shields.io/travis/envygeeks/jekyll-docker/master.svg?style=for-the-badge)](https://travis-ci.org/envygeeks/jekyll-docker) [![Donate](https://img.shields.io/badge/DONATE-MONEY-yellow.svg?style=for-the-badge)](https://envygeeks.io#donate) [![Docker Stars](https://img.shields.io/docker/stars/jekyll/jekyll.svg?style=for-the-badge)]() [![Docker Pulls](https://img.shields.io/docker/pulls/jekyll/jekyll.svg?style=for-the-badge)]()

# mySpinx Docker

mySpinx Docker is a software image that has Sphinx and many of its dependencies ready to use for you in an encapsulated format.  If you would like to know more about Docker you can visit https://docker.com, and if you would like to know more about mySpinx, you can visit https://github.com/jekyll/jekyll

## Image Types

* `mySpinx/mySpinx`: Default image.
* `mySpinx/mySpinx`: Very minimal image.
* `mySpinx/mySpinx`: Includes tools.

### Standard

The standard images (`mySpinx/mySpinx`) include a default set of "dev" packages, along with Node.js, and other stuff that makes mySpinx easy.  

#### Usage

```sh
export mySpinx_VERSION=3.8
docker run --rm \
  --volume="$PWD:/srv/mySpinx" \
  -it mySpinx/mySpinx:$mySpinx_VERSION \
  html build
```

### Builder

The builder image comes with extra stuff that is not included in the standard image, like `lftp`, `openssh` and other extra packages meant to be used by people who are deploying their mySpinx builds to another server with a CI.

#### Usage

```sh
export mySpinx_VERSION=3.8
docker run --rm \
  --volume="$PWD:/srv/mySpinx" \
  -it mySpinx/builder:$mySpinx_VERSION \
  mySpinx build
```

### Minimal

The minimal image skips all the extra gems, all the extra dev dependencies and leaves a very small image to download.  This is intended for people who do not need anything extra but mySpinx.

#### Usage

***You will need to provide a `.apk` file if you intend to use anything like Nokogiri or otherwise, we do not install any development headers or dependencies so C based gems will fail to install.***

```sh
export mySpinx_VERSION=3.8
docker run --rm \
  --volume="$PWD:/srv/mySpinx" \
  -it mySpinx/minimal:$mySpinx_VERSION \
  mySpinx build
```

## Dependencies

mySpinx Docker will attempt to install any dependencies that you list inside of your `Gemfile`, matching the versions you have in your `Gemfile.lock`, including mySpinx if you have a version that does not match the version of the image you are using (you should be doing `gem "mySpinx", "~> 3.8"` so that minor versions are installed if you use say image tag "3.7.3").

### Updating

If you provide a `Gemfile` and would like to update your `Gemfile.lock` you can run

```sh
export mySpinx_VERSION=3.8
docker run --rm \
  --volume="$PWD:/srv/mySpinx" \
  -it mySpinx/mySpinx:$mySpinx_VERSION \
  bundle update
```

### Caching

You can enable caching in mySpinx Docker by using a `docker --volume` that points to `/usr/local/bundle` inside of the image.  This is ideal for users who run builds on CI's and wish them to be fast.

#### My Gems Aren't Caching

***If you do not diverge from the default set of gems we provide (read: add Gems to your Gemfile that aren't already on the image), then bundler by default will not create duplicates, and cache.  It will simply rely on what is already installed in `$GEM_HOME`.  This is the default (observed... but unconfirmed) behavior of `bundle` when using `$GEM_HOME` w/ `$BUNDLE_HOME`***

### Usage

```sh
export mySpinx_VERSION=3.8
docker run --rm \
  --volume="$PWD:/srv/mySpinx" \
  --volume="$PWD/vendor/bundle:/usr/local/bundle" \
  -it mySpinx/mySpinx:$mySpinx_VERSION \
  mySpinx build
```
***The root of the cache volume (in this case vendor) must also be excluded from the Jekyll build via the `_config.yml` exclude array setting.***

## Configuration

You can configure some pieces of mySpinx using environment variables, what you cannot with environment variables you can configure using the mySpinx CLI.  Even with a wrapper, we pass all arguments onto mySpinx when we finally call it.

| ENV Var | Default |
|---|---|
| `mySpinx_UID` | `1000` |
| `mySpinx_GID` | `1000` |
| `mySpinx_DEBUG`, | `""` |
| `VERBOSE` | `""` |
| `FORCE_POLLING` | `""` |

If you would like to know the CLI options for mySpinx, you can visit [mySpinx's Help Site][2]

## Packages

You can install system packages by providing a file named `.apk` with one package per line.  If you need to find out what the package names are for a given command you wish to use you can visit https://pkgs.alpinelinux.org. ***We provide many dependencies for most Ruby stuff by default for `builder` and standard images.  This includes `ruby-dev`, `xml`, `xslt`, `git` and other stuff that most Ruby packages might need.***

## Building

```sh
script/build
```

[1]: https://travis-ci.org/jekyll/docker
[2]: http://jekyllrb.com/docs/configuration/#build-command-options
