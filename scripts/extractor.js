const cheerio = require('cheerio')

hexo.extend.helper.register("get_post_images", function(post, root_path){
  var images = []
  console.log('extract images from post front matter (photos)');
  front_matter_images = post.photos;
  console.log('extract images from post content');
  var content = post.content;
  var content_images = get_images_from_html_string(content);
  images = images.concat(front_matter_images.concat(content_images));
  images = images.map(function(path){
    if(path.startsWith('/')){
      return path;
    }else if(path.search('http:|https:|ftp:|sftp:') != -1){
      return path;
    }else{
      return post.path + path;
    }
  });
  console.log(images);
  return images;
});

hexo.extend.helper.register("get_post_videos", function(post, root_path){
  var videos = []
  console.log('extract video from post content');
  var content = post.content;
  var content_youtubes = get_youtube_from_html_string(content);
  var content_bilibili = get_bilibili_from_html_string(content);
  videos = videos.concat(content_youtubes).concat(content_bilibili);
  console.log('found ' + videos.length + ' videos');
  return videos;
});

hexo.extend.helper.register("get_post_codes", function(post){
  console.log('extract codes from post content');
  var codes = get_codes_from_html_string(post.content);
  console.log(codes);
  return codes;
});

hexo.extend.helper.register("has_math_equations", function(post){
  return has_equations_in_html(post.content);
});

var has_equations_in_html = function(content){
  var eq_pattern = /\$.*\$/gmiu
  console.log('parse math');
  console.log(content.match(eq_pattern));
  // console.log(content);
  return content.match(eq_pattern) != null
}

hexo.extend.helper.register("get_excerpt_display", function(post){
  tokens = post.raw.split('\n', 100)
  var start_fm = -1
  var stop_fm = -1
  selected_tokens = []
  for(var i=0; i < tokens.length; i++){
    if(tokens[i] == '---' && start_fm == -1){
      start_fm = i
    }else if(tokens[i] == '---' && start_fm != -1 && stop_fm == -1){
      stop_fm = i
    }else if(start_fm != -1 && stop_fm != -1){
      selected_tokens.push(tokens[i])
    }
  }
  return selected_tokens.join('\n')
})

var get_youtube_from_html_string = function(content){
  var youtube_pattern = /src=['"]([-_:/\.a-zA-z0-9]+\.youtube\.com\/embed\/[0-9a-zA-z]+)['"]/gmiu
  var matches;
  var youtubes = [];
  while( (matches = youtube_pattern.exec(content)) != null) {
    var path = matches[1];
    youtubes.push({
      url: path,
      type: 'youtube'
    });
  }
  return youtubes;
}

var get_bilibili_from_html_string = function(content){
  var bilibili_pattern = /src=['"]([-_:/\.a-zA-z0-9]+\.bilibili\.com\/player\.html\?aid=[0-9]+)['"]/gmiu
  var matches;
  var bilibili = [];
  while( (matches = bilibili_pattern.exec(content)) != null) {
    var path = matches[1];
    bilibili.push({
      url: path,
      type: 'bilibili'
    });
  }
  return bilibili;
}

var get_images_from_html_string = function(content){
  var image_pattern = /src=['"]([-_:/\.a-zA-z0-9]+\.(jpg|png|jpeg|svg|gif|bmp|cur|tiff|webp|dds))['"]/gmiu
  var matches;
  var images = [];
  while( (matches = image_pattern.exec(content)) != null) {
    var path = matches[1];
    images.push(path);
  }
  return images;
}

var get_codes_from_html_string = function(content){
  const $ = cheerio.load(content);
  var codes = [];
  $('figure.highlight .code').each(function(i, el){
    var lang = $(this).parents('figure.highlight').attr('class').split(' ')[1]
    var lines = $(this).find('.line').length;
    codes.push({
      'content': $(this).html(),
      'lang': lang,
      'lines': lines
    });
  });
  return codes;
}
