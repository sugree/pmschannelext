version = 0.1

macrodef kpPlayer {
	media {
		matcher=<meta property=\"og:title\" content=\"([^\"]+)\"/>[^*]+?<meta property=\"og:image\" content=\"([^\"]+)\"/>[^*]+?<iframe width=\"[^\"]+\" height=\"[^\"]+\" src=\"(http://www.youtube.com/embed/[^\"]+)\" frameborder=\"0\" allowfullscreen></iframe>
		order=name,thumb,url
	}
	media {
		matcher=<meta property=\"og:title\" content=\"([^\"]+)\"/>[^*]+?<meta property=\"og:image\" content=\"([^\"]+)\"/>[^\\]+?<embed src=\"(http://www.youtube.com/v/[^\"&]+)[^\"]*?\" type=\"application/x-shockwave-flash\"
		order=name,thumb,url
#		url=http://www.youtube.com/watch?v=
	}
}

macrodef kpList {
	item {
		matcher=<a href=\"([^\"]+)\" target=\"_blank\" title=\"([^\"]+)\"><img src=\"([^\"]+)\" width=\"100\" height=\"80\"
		order=url,name,thumb
		url=http://play.kapook.com
		macro=kpPlayer
	}
}

macrodef kpPager {
	folder {
		matcher=<li ><a\s+href=\'/vdo(/[^/]+/\d+)\' >(\d+)</a></li>
		order=url,name
		url=http://play.kapook.com
		type=recurse
		macro=kpList
	}
}

channel Kapook {
	img=http://image.kapook.com/head_kapook/kapook.jpg
    folder {
		name=Categories
		url=http://play.kapook.com/vdo
		folder {
			matcher=<span class=\"style17\"><img src=\"[^\"]+\" align=\"absmiddle\" /> <a href=\"([^\"]+)\" >([^<]+)</a></span>
            order=url,name
            url=http://play.kapook.com
			macro=kpList
			macro=kpPager
	    }
    }		
}