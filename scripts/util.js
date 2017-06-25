hexo.extend.helper.register("get_posts_by_year", function(posts, year,limit = 10){
	var result = posts.filter(function(post){
		if(post.date.year() === year) return true;
		else return false;
	}).slice(0, limit);
	return result;
});

hexo.extend.helper.register("get_years", function(posts){
	var years = new Set();
	posts.forEach(function(post){
		years.add(post.date.year());
	});
	return Array.from(years);
});

hexo.extend.helper.register("get_intro", function(site){
	var result = site.pages.filter(function(page){
		if(page.title === "Intro") return true;
		else false;
	});
	return result;
});