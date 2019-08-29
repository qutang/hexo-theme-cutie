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

const EdgeTable = require("./rasterization/edgeTable");
const rasterizer = require("./rasterization/rasterizer");
const PngPalette = require("./png/pngPalette");
const PngEncoder = require("./png/pngEncoder");
const CanvasContext = require("./canvasContext");
const colorUtils = require("./colorUtils");

/**
 * Creates a new canvas with the specified dimensions given in pixels.
 * @param {number} width  Canvas width in pixels.
 * @param {number} height  Canvas height in pixels.
 * @constructor
 * @public
 */
function Canvas(width, height) {
    this.width = width;
    this.height = height;
    this._edges = new EdgeTable(width, height);
}

/**
 * The width of the canvas in pixels.
 * @type {number}
 * @public
 */
Canvas.prototype.width = 0;

/**
 * The height of the canvas in pixels.
 * @type {number}
 * @public
 */
Canvas.prototype.height = 0;

/**
 * Specifies the background color. Allowed values are:
 * - 32 bit integers on the format 0xRRGGBBAA
 * - strings on the format #RGB
 * - strings on the format #RRGGBB
 * - strings on the format #RRGGBBAA
 * @type {number}
 * @public
 */
Canvas.prototype.backColor = 0x00000000;

/**
 * Gets a context used to draw polygons on this canvas.
 * @returns {CanvasContext}
 * @public
 */
Canvas.prototype.getContext = function Canvas_getContext() {
    return new CanvasContext(this);
};

/**
 * Renders the canvas as a PNG data stream.
 * @param {Object} keywords  Keywords to be written to the PNG stream. See https://www.w3.org/TR/PNG/#11keywords.
 * @returns {Buffer}
 * @public
 */
Canvas.prototype.toPng = function Canvas_toPng(keywords) {
    var backColor = colorUtils.parse(this.backColor);
    var colorRanges = rasterizer(this._edges, backColor);

    var palette = new PngPalette(colorRanges);
    var png = new PngEncoder();

    png.writeImageHeader(this.width, this.height, palette.isValid ?
        PngEncoder.INDEXED_COLOR : PngEncoder.TRUE_COLOR_WITH_ALPHA);

    png.writeImageGamma();
    
    if (keywords) {
        for (var key in keywords) {
            png.writeTextualData(key, keywords[key]);
        }
    }

    if (palette && palette.isValid) {
        png.writePalette(palette);
        png.writeTransparency(palette);
        png.writeIndexed(colorRanges, palette, this.width, this.height);
    }
    else {
        png.writeTrueColorWithAlpha(colorRanges, this.width, this.height);
    }

    png.writeImageEnd();

    return png.getBuffer();
};

/**
 * Renders the canvas as a data URI. Only type 'image/png' is supported.
 * @returns {string}
 * @public
 */
Canvas.prototype.toDataURL = function Canvas_toDataURL() {
    if (this.width <= 0 || this.height <= 0) {
        return "data:,";
    }
    
    var png = this.toPng();
    return "data:image/png;base64," + png.toString("base64");
};

module.exports = Canvas;
