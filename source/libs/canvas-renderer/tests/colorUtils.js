"use strict";

var tap = require("tap");
var colorUtils = require("../lib/colorUtils");

tap.equal(255, colorUtils.red(0xff000000));
tap.equal(255, colorUtils.green(0x00ff0000));
tap.equal(255, colorUtils.blue(0x0000ff00));
tap.equal(255, colorUtils.alpha(0x000000ff));

tap.equal("#00000000", colorUtils.format(colorUtils.parse("transparent")));
tap.equal("#66cdaaff", colorUtils.format(colorUtils.parse("mediumaquaMarine")));
tap.equal("#aabbccdd", colorUtils.format(colorUtils.parse("#abcd")));
tap.equal("#abcdef21", colorUtils.format(colorUtils.parse("#abcdef21")));
tap.equal("#aabbccff", colorUtils.format(colorUtils.parse("#abc")));
tap.equal("#aabbccff", colorUtils.format(colorUtils.parse("#aabbcc")));
tap.equal("#fffefdff", colorUtils.format(colorUtils.parse("rgb(255, 254, 253)")));
tap.equal("#ff7f00ff", colorUtils.format(colorUtils.parse("rgb(100%, 50%, 0%)")));
tap.equal("#fffefd7f", colorUtils.format(colorUtils.parse("rgb(255, 254, 253, 0.5)")));
tap.equal("#fffefd7f", colorUtils.format(colorUtils.parse("rgba(255, 254, 253, 0.5)")));
tap.equal("#adcbaeff", colorUtils.format(colorUtils.parse("hsl(123, 23%, 74% )")));
tap.equal("#adcbaeff", colorUtils.format(colorUtils.parse("hsl(123deg, 23%, 74% )")));
tap.equal("#adcbaeff", colorUtils.format(colorUtils.parse("hsl(123.000001deg, 23%, 74% )")));
tap.equal("#adcbae7f", colorUtils.format(colorUtils.parse("hsl(123.000001deg, 23%, 74% , 0.5)")));
tap.equal("#adcbae7f", colorUtils.format(colorUtils.parse("hsla(123.000001deg, 23%, 74% , 0.5)")));
tap.equal("#bcbcbcff", colorUtils.format(colorUtils.parse("hsl(123, 0%, 74% )")));
tap.equal("#000000ff", colorUtils.format(colorUtils.parse("hsl(123deg, 23%, 0% )")));
tap.equal("#ffffffff", colorUtils.format(colorUtils.parse("hsl(123.000001deg, 23%, 100% )")));
tap.equal("#adcbaeff", colorUtils.format(colorUtils.parse("hsl(2.146755rad, 23%, 74% )")));
tap.equal("#adcbaeff", colorUtils.format(colorUtils.parse("hsl(0.3416667turn, 23%, 74% )")));
tap.equal("#adcbaeff", colorUtils.format(colorUtils.parse("hsl(136.66667grad, 23%, 74% )")));
tap.equal("#00bfffff", colorUtils.format(colorUtils.parse("hwb(195, 0%, 0%)")));
tap.equal("#00bfffb2", colorUtils.format(colorUtils.parse("hwb(195, 0%, 0%, 0.7)")));
tap.equal("#bfbfe5b2", colorUtils.format(colorUtils.parse("hwb(239.0000deg, 75%, 10%, 0.7)")));
tap.equal("#9c9c9cff", colorUtils.format(colorUtils.parse("hwb(5, 91%, 57%)")));
tap.equal("#000000ff", colorUtils.format(colorUtils.parse("hwb(5, 0%, 100%)")));
tap.equal("#ffffffff", colorUtils.format(colorUtils.parse("hwb(5, 100%, 0%)")));
