# HEXO theme: _cutie_

## Intro

_cutie_ is a responsive hexo theme heavily inspired by the clean and user friendly design of [www.linpx.com](http://www.linpx.com).

### Features

* Responsive design
	* single and double column layout on different screens
	* Alternative display on touch screen when hovering is not available
	* Stick to bottom navigation menu in one column layout
* Configurable navigation menu (name, link and icon)
* Transition **animation** involved
* **Instant click** involved
* `Mathjax` involved
* Google analytics involved
* Google custom search page and tag cloud involved
* Customizable home screen top section
* Four default categories with associated icons:
	* projects
	* notes
	* fun
	* uncategorized
* Default page, post layout

### Demo

Visit my [personal website](https://qutang.github.io) for the demo.

## Installation and usage

1. clone repository into `themes` folder of your hexo website and rename the folder to `cutie`
1. Change `_config.yml` of your website:

```
theme: cutie
```
1. Add following information to `_config.yml` of the downloaded theme to configure the theme, refer to `_config.yml` for a concrete example:

```
menu:
	menuName1:
		link: yourlink.com
		icon: path/to/your/icon
	menuName2:
		...
	...
```

2. Refer to default icons, refer using path(`images/icon_name.svg`):
[archive](source/images/archive.svg)
,[fun](source/images/fun.svg)
,[home](source/images/home.svg)
,[notes](source/images/notes.svg)
,[projects](source/images/projects.svg)
,[resume](source/images/resume.svg)
,[search](source/images/search.svg)
,[uncategorized](source/images/uncategorized.svg)

3. Customize home page
Add a new page called `intro` to your website. The information in this page will show up before the card columns in the home page, otherwise it will only show card columns.

4. Customize website name and signature in `_config` of website.

```
title: your title
signature: your signature
```

Signature will appear at the footer in the same font as title.

## Contribution
Post feature request or bugs [here](https://github.com/qutang/hexo-theme-cutie/issues), or send me pull request.

## Acknowledge

1. [www.linpx.com](http://www.linpx.com)
1. [Flaticon](http://www.flaticon.com/)
1. [InstantClick](http://instantclick.io)