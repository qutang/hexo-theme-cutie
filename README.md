# HEXO theme: _cutie_

## Intro

_cutie_ is a responsive hexo theme heavily inspired by the clean and user friendly design of [www.linpx.com](http://www.linpx.com).

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
* Extra
	* Mathjax
	* Instant click
	* Search page template

### Demo

Visit my [personal website](https://qutang.github.io) for the demo.

## Installation and usage

1. clone repository into `themes` folder of your hexo website and rename the folder to `cutie`
1. A sample snippet about the theme in `_config.yml` of the website:

```yaml
# Be careful about the indent
theme: cutie

google-analytics: UA-xxxxxxxx-1

cutie:
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
# As the tip: the social link can be a QRCODE link
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

2. A set of default icons, referring using path(`images/icon_name.svg`):
	* [archive](source/images/archive.svg)
	* [fun](source/images/fun.svg)
	* [home](source/images/home.svg)
	* [notes](source/images/notes.svg)
	* [projects](source/images/projects.svg)
	* [resume](source/images/resume.svg)
	* [search](source/images/search.svg)
	* [uncategorized](source/images/uncategorized.svg)

3. Add search page
	1. Create a new page called `search`
	1. Use layout `searching` in the front matter of `search` page

4. It is recommended to use the hexo prism js plugin for code highlight.

```yaml
---
layout: search
---
```

## Contribution
Post feature request or bugs [here](https://github.com/qutang/hexo-theme-cutie/issues), or send me pull request.

## Acknowledge

1. [www.linpx.com](http://www.linpx.com)
1. [Flaticon](http://www.flaticon.com/)
1. [InstantClick](http://instantclick.io)