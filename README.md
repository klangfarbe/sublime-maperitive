Maperitive for Sublime Text
===========================

This [Sublime Text](http://www.sublimetext.com/) package adds Syntax
definition and Code Snippets for [Maperitive](http://maperitive.net) - a tool
which allows yout to render your custom maps based on
[OpenStreetMap data](http://wiki.openstreetmap.org/).

Screenshot
----------

![](https://raw.github.com/klangfarbe/sublime-maperitive/master/images/screenshot.png "Sublime Text with Soda Theme and Maperitive package")


Installation
------------

### Via Package Control

The easiest way to install is by using Will Bonds great [Package Control](http://wbond.net/sublime_packages/package_control).

* Open the Command Pallete by typing `cmd + shift + p` (OS X)
  or `ctrl + shift + p` (Windows, Linux)
* Start typing `package install`
* Look for the package **Maperitive**

### Manual installation

Clone the project repository into your [Sublime Packages directory](http://docs.sublimetext.info/en/latest/basic_concepts.html#the-data-directory):

    git clone https://github.com/klangfarbe/sublime-maperitive.git


Usage
-----

Syntax highlighting will automatically available when opening `.mrules` files
which is the default file extension used by Maperitive.

### Code Snippets

All snippets start with the prefix `osm:`. Currently for all
[Rendering Properties](http://maperitive.net/docs/#Rendering%20Properties) code
snippets exists and can be accessed by typing `osm:<property name>`.

### Writing rendering rules

Since this is out of scope please see the projects homepage at
http://maperitive.net for more information about the tool and have a look into
the [comprehensive documentation](http://maperitive.net/docs/Rendering_Rules_Introduction.html) on how to write rendering rules.
