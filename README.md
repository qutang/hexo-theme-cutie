---
title: 'Hexo theme: cutie'
date: 2017-06-27 10:31:00
tags:
	- hexo
	- hexo theme
	- card
	- blogging
categories:
	- projects
photos:
  - cutie.png
icon:
  - /images/hexo.svg
version: 5
---
_cutie_ is a responsive hexo theme heavily inspired by the clean and user friendly design of [www.linpx.com](http://www.linpx.com).

> Note: if you are using this theme and would like to add your website as a reference link in the end of the post, please send me a note through email or github.

## Intro

### Features

* Responsive design
	* Single and dual column layout
	* Bottom navigation menu
* Configurable
	* Navigation menu (name, link and icon)
	* Disqus comment section
	* Google analytics
	* Slogan
	* Signature
	* Versioned post and unread notification badge for post
* Extra
	* Mathjax
	* Instant click
	* Search page template
	* Lightgallery support

### Demo

Visit my [personal website](https://qutang.github.io) for the demo.

## Installation

### For first time user who wants to have a demo site ready to go

1. fork repository https://github.com/qutang/theme-cutie-demo
1. clone to your local machine
1. go into the `themes` subfolder
1. clone repository https://github.com/qutang/hexo-theme-cutie
1. rename folder name `hexo-theme-cutie` to `cutie`
1. run `hexo serve`

### Normal installation

* clone repository into `themes` folder of your hexo website and rename the folder to `cutie`

```bash
git clone https://github.com/qutang/hexo-theme-cutie.git
```

### Recommended Hexo plugins

Cutie works better with these hexo plugins:

* [hexo-prism-plugin](https://github.com/ele828/hexo-prism-plugin)
* [hexo-lazyload-image](https://www.npmjs.com/package/hexo-lazyload-image)

## Changelog

### 2017-12-08

* Adjust heading, inline code, list typography

### 2017-12-05

* Remove bottom border for header (I know it's ugly!). Redesign header.
* Add support for logo image (can be omitted). See `_config.yml` file field.

```yaml
cutie:
  logo: /your/path/to/logo/image
```

* Add more padding to footer nav menu.
* Add zooming effect to logo image, post icon (index page), pagination button and nav menu (close issue [#1](https://github.com/qutang/hexo-theme-cutie/issues/1))

### 2017-11-28

* Fix bug of badge notification for external link post.
* Fix bug causing conflict with hexo-prism-plugin when displaying line numbers on some themes.

### 2017-11-10

* Add front matter key word `meta_info: [string]` (e.g. `meta_info: "<a>external link</a>"`) to page template, the page will show provided meta info at the upper right corner of the header.

### 2017-11-05

* Add front matter key word `version: [integer number]` (e.g. `version: 2`), when updating this number, the index page will show unread red dot at the upper left corner of post card and dismiss when user clicks on the post link.

### 2017-11-04 

* Change lightbox to light gallery to remove jquery dependency

## Usage

### Page meta info

![Page meta info](page-meta-info.png)

Use `meta_info: [string]` in page front matter to display meta info at the upper right corner of the page.

This feature is useful when you want to show an external link, last updated time, change log, navigation list and so on. The string supports html tags.

Examples:

  * `meta_info: "Last updated: 2015-01-12"`
  * `meta_info: "<a href="">中文</a>"`
  * `meta_info: "<ul><li><a href="#heading1">Heading 1</a></li><li><a href="#heading1">Heading 2</a></li></ul>"`

### Versioned post and unread notification badge

![Badge illustration](unread-badge-illustration.png)

You may add a new front matter keyword `version` to post. 

- If `version: -1` or absent, the unread dot is disabled until the version is updated to a larger number. This is useful if you don't want to make your old posts all become unread.
- If `version` is greater than previous push's `version` number or if `version` number is new presented, the unread dot will show up on the card corner of index page until the post is visited.
- If `version` is smaller than previous push's `version` number, the unread dot will not show up.

This feature is implemented with browser cookie.

### A sample snippet about the theme in `_config.yml` of the website

```yaml
# Be careful about the indent
theme: cutie

google-analytics: UA-xxxxxxxx-1

author_link: http://link/to/your/personal/website

cutie:
  logo: /your/path/to/logo/image
  slogan: This is a slogan.
  signature: SIGNATURE

# Configure navigation menu, provide a relative link and a path to icon (icon should better be square)
# If menu is absent, only "archive" and "search" menu items will be preserved
# Configurable menu items should not exeed 4, otherwise the last ones will be ignored

  menu:
    Resume: 
      link: /resume/
      icon: /images/resume.svg
    Projects: 
      link: /categories/projects/
      icon: /images/projects.svg
    Notes: 
      link: /categories/notes/
      icon: /images/notes.svg
    Fun: 
      link: /categories/fun/
      icon: /images/fun.svg

# As long as the name matches the font awesome icon name, you can add even more social links
# Tip: the social link can be a QRCODE link
  social:
    medium: 
    skype: 
    slack: 
    steam: 
    tumblr: 
    whatsapp: 
    youtube: 
    snapchat: 
    instagram: 
    qq: 
    google-plus: 
    twitter: 
    facebook: 
    weibo: 
    weixin: 
    github: https://your/github/profile/link
    linkedin: https://your/linkedin/profile/link
```

### A set of default icons, referring using path(`/images/icon_name.svg`)

* [archive](https://qutang.github.io/images/archive.svg)
* [fun](https://qutang.github.io/images/fun.svg)
* [home](https://qutang.github.io/images/home.svg)
* [notes](https://qutang.github.io/images/notes.svg)
* [projects](https://qutang.github.io/images/projects.svg)
* [resume](https://qutang.github.io/images/resume.svg)
* [search](https://qutang.github.io/images/search.svg)
* [uncategorized](https://qutang.github.io/images/uncategorized.svg)

### Add search page

1. Create a new page called `search`
1. Use layout `search` in the front matter of `search` page

  ```yaml
  ---
  layout: search
  ---
  ```

### It is recommended to use the hexo prism js plugin for code highlight.

### Custom post icon

Use `icon: path/to/your/icon` in post front matter to use custom icon when displaying in home page instead of default category icon.

### Post gallery photos

You may add photos to a gallery display at the top of the post by adding the filenames of the images to the YAML front matter of a post.

```yaml
---
photos:
  - image1.png
  - image2.png
---
```

Make sure to put these images in the `source/images/[post-file-name]/` folder.

## Contribution
Post feature request or bugs [here](https://github.com/qutang/hexo-theme-cutie/issues), or send me pull request.

## Acknowledge

1. [www.linpx.com](http://www.linpx.com)
1. [Flaticon](http://www.flaticon.com/)
1. [InstantClick](http://instantclick.io)
1. [Lightgallery](http://sachinchoolur.github.io/lightGallery/)
1. [Cookie.js](https://github.com/js-cookie/js-cookie)

## Websites that use the theme

_Let me know if you want your website appears here._