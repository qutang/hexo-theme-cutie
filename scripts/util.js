hexo.extend.helper.register("get_posts_by_year", function(posts, year){
	var result = posts.filter(function(post){
		if(post.date.year() === year) return true;
		else return false;
	});
	return result;
});

hexo.extend.helper.register("get_posts_by_year_count", function(posts, year){
	var result = posts.filter(function(post){
		if(post.date.year() === year) return true;
		else return false;
	});
	return result.size();
});

hexo.extend.helper.register("get_posts_by_year_month", function(posts, year_month){
	var result = posts.filter(function(post){
		if(post.date.year() + "-" + post.date.month() === year_month) return true;
		else return false;
	});
	return result;
});

hexo.extend.helper.register("get_posts_by_year_and_month", function(posts, year, month){
	var result = posts.filter(function(post){
		if(post.date.year() === year && post.date.month() === month) return true;
		else return false;
	});
	return result;
});

hexo.extend.helper.register("get_years", function(posts){
	var years = new Set();
	posts.forEach(function(post){
		years.add(post.date.year());
	});
	return Array.from(years);
});

hexo.extend.helper.register("get_year_months", function(posts){
	var year_months = new Set();
	posts.forEach(function(post){
		year_months.add(post.date.year() + '-' + post.date.month());
	});
	return Array.from(year_months);
});

hexo.extend.helper.register("get_months", function(posts){
	var months = new Set();
	posts.forEach(function(post){
		months.add(post.date.month());
	});
	return Array.from(months);
});

hexo.extend.helper.register("get_month_name", function(month_number){
	var month_names = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
	return month_names[month_number - 1];
});

hexo.extend.helper.register("get_intro", function(site){
	var result = site.pages.filter(function(page){
		if(page.title === "Intro") return true;
		else false;
	});
	return result;
});