var Trianglify = require('trianglify');
var fs = require('fs');
var Hashes = require('jshashes');
var path = require('path')

hexo.extend.helper.register("generate_trianglify_image", function (title) {
    var id = new Hashes.SHA256().hex(title);
    var image_name = id + '.png';
    var image_path = './source/images/trianglify/';
    var render_path = '/images/trianglify/';
    if (!fs.existsSync(path.dirname(image_path))) {
        fs.mkdirSync(path.dirname(image_path))
    }
    if (!fs.existsSync(image_path)) {
        fs.mkdirSync(image_path)
    }
    var image_path = path.join(image_path, image_name);
    // Generate a pattern and then grab the PNG data uri
    

    if (!fs.existsSync(image_path)) {
        console.log('generating random post image');
        var pngURI = Trianglify({
            width: 500,
            height: 500,
            cell_size: Math.random() * 200 + 40,
            x_colors: 'random',
            seed: id,
            variance: Math.random(),
        }).png();
    
        // Strip off the uri part of the data uri, leaving the data
        var data = pngURI.substr(pngURI.indexOf('base64') + 7);
    
        // Decode the base64 encoded blob into a buffer
        var buffer = new Buffer.from(data, 'base64');
        fs.writeFileSync(image_path, buffer);
    }

    return path.join(render_path, image_name);
});