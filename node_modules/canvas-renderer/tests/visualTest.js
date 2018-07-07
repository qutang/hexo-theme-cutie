/**
 * canvas-renderer
 * https://github.com/dmester/canvas-renderer
 * 
 * Copyright (c) 2017-2018 Daniel Mester Pirttijärvi
 *
 * Permission is hereby granted, free of charge, to any person obtaining 
 * a copy of this software and associated documentation files (the 
 * "Software"), to deal in the Software without restriction, including 
 * without limitation the rights to use, copy, modify, merge, publish, 
 * distribute, sublicense, and/or sell copies of the Software, and to 
 * permit persons to whom the Software is furnished to do so, subject to 
 * the following conditions:
 * 
 * The above copyright notice and this permission notice shall be 
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
 
"use strict";

/**
 * This script generates a png out of a set of polygons that
 * are constructed to cover as many possibilities as possible.
 * 
 * So far the output is not checked automatically. Compare the 
 * output manually with expected.svg.
 */

const fs = require("fs");
const canvasRenderer = require("../index");

var canvas = canvasRenderer.createCanvas(100, 100);
canvas.backColor = "#00000000";

var ctx = canvas.getContext("2d");

// Diamond background, should be clipped to viewport
ctx.fillStyle = "#0000ff1e";
ctx.beginPath();
ctx.moveTo(10, 10);
ctx.lineTo(10, 90);
ctx.lineTo(90, 90);
ctx.lineTo(90, 10);
ctx.lineTo(10, 10);
ctx.closePath();
ctx.fill();

// Entirely contained rectangle
ctx.fillStyle = "#282828e6";
ctx.beginPath();
ctx.moveTo(50, -15);
ctx.lineTo(115, 50);
ctx.lineTo(50, 115);
ctx.lineTo(-15, 50);
ctx.closePath();
ctx.fill();

// Center figures with holes
ctx.fillStyle = "#ffff00ff";
ctx.beginPath();
ctx.moveTo(20, 50);
ctx.lineTo(40, 30);
ctx.lineTo(60, 50);
ctx.lineTo(40, 70);
ctx.closePath();
ctx.moveTo(30, 50);
ctx.lineTo(20, 70);
ctx.lineTo(40, 60);
ctx.lineTo(50, 50);
ctx.lineTo(40, 40);
ctx.closePath();
ctx.fill();

ctx.fillStyle = "#0000ff80";
ctx.beginPath();
ctx.moveTo(40, 50);
ctx.lineTo(60, 30);
ctx.lineTo(80, 50);
ctx.lineTo(60, 70);
ctx.closePath();
ctx.moveTo(50, 50);
ctx.lineTo(40, 70);
ctx.lineTo(60, 60);
ctx.lineTo(70, 50);
ctx.lineTo(60, 40);
ctx.closePath();
ctx.fill();

// The following shapes should not be rendered
ctx.fillStyle = "#ff0000";
ctx.beginPath();
ctx.moveTo(-10, -15);
ctx.lineTo(-5, -10);
ctx.lineTo(0, 110);
ctx.lineTo(-15, 115);
ctx.closePath();
ctx.fill();

ctx.fillStyle = "#ff0000";
ctx.beginPath();
ctx.moveTo(115, -15);
ctx.lineTo(120, -10);
ctx.lineTo(120, 110);
ctx.lineTo(115, 115);
ctx.closePath();
ctx.fill();

ctx.fillStyle = "#ff0000";
ctx.beginPath();
ctx.moveTo(-20, -20);
ctx.lineTo(-20, 120);
ctx.lineTo(120, 120);
ctx.lineTo(120, -20);
ctx.closePath();
ctx.moveTo(-10, -10);
ctx.lineTo(110, -10);
ctx.lineTo(110, 110);
ctx.lineTo(-10, 110);
ctx.closePath();
ctx.fill();

// Black with antialiasing
ctx.fillStyle = "#000";
ctx.beginPath();
ctx.moveTo(5, 5);
ctx.lineTo(15, 5);
ctx.lineTo(25, 25);
ctx.lineTo(15, 25);
ctx.closePath();
ctx.fill();

ctx.fillStyle = "#000";
ctx.beginPath();
ctx.moveTo(15, 5);
ctx.lineTo(25, 5);
ctx.lineTo(15, 25);
ctx.lineTo(5, 25);
ctx.closePath();
ctx.fill();

// White with antialiasing
ctx.fillStyle = "#fff";
ctx.beginPath();
ctx.moveTo(5, 75);
ctx.lineTo(15, 75);
ctx.lineTo(25, 95);
ctx.lineTo(15, 95);
ctx.closePath();
ctx.fill();

ctx.fillStyle = "#fff";
ctx.beginPath();
ctx.moveTo(15, 75);
ctx.lineTo(25, 75);
ctx.lineTo(15, 95);
ctx.lineTo(5, 95);
ctx.closePath();
ctx.fill();

var testpng = fs.createWriteStream("actual.png");
testpng.write(canvas.toPng({ "Software": "CanvasRenderer" }));
testpng.close();

