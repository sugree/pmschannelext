version = 0.1

macrodef mtPlayer {
	media {
		matcher=<meta property=\"og:title\" content=\"([^\"]+)\" />[^*]+?<meta property=\"og:image\" content=\"([^\"]+)\" />[^*]+?id: \d+, url: \'([^\']+)', \'playtime\': \d+, \'duration\': \'[^\']*', \'owner\':\'[^\']*\'
		order=name,thumb,url
	}
	media {
		matcher=<meta property=\"og:title\" content=\"([^\"]+)\" />[^*]+?<meta property=\"og:image\" content=\"([^\"]+)\" />[^*]+?<iframe width=\"[^\"]+\" height=\"[^\"]+\" src=\"(http://www.youtube.com/embed/[^?]+)\?fs=1&feature=oembed\" frameborder=\"0\" allowfullscreen></iframe>
		order=name,thumb,url
	}
}

macrodef mtList {
	item {
		matcher=<img class=\"thumbnail\" src=\"(http://video.mthai.com/thumbnail/[^\"]+)\" /></a>\s*<a href=\"([^\"]+)\" class=\"[^\"]+\" title=\"[^\"]+\">([^<]+)</a>
		order=thumb,url,name
		macro=mtPlayer
	}
}

macrodef mtPager {
	folder {
		matcher=<span class=\"pager active\"><a href=\"([^\"]+)\" title=\"([^\"]+)\">[^<]+</a></span>
		order=url,name
		url=http://video.mthai.com
		type=recurse
		macro=mtList
	}
}

channel MThai {
    img=http://video.mthai.com/videonew/images/logo_video_2011.png
	folder {
		name=Webmaster Picks
		url=http://video.mthai.com/webmasterpicks.php
		macro=mtList
		macro=mtPager
	}
    folder {
		name=Categories
		url=http://video.mthai.com/list.php
		folder {
			matcher=<li>\s*<div class=\"cate-pic\">\s*<img src=\"([^\"]+)\" alt=\"[^\"]+\" />\s*</div>\s*<a href=\"([^\"]+)\" title=\"([^\"]+)\">[^<]+</a></li>
            order=thumb,url,name
			macro=mtList
			macro=mtPager
	    }
    }		
    folder {
		name=Latest
        url=http://video.mthai.com/latest.php
		macro=mtList
		macro=mtPager
    }
    folder {
    	name=Live
    	media {
    		name=TV3
    		url=http://tv.mthai.com/wp-content/themes/minimalism/asx/thai-ch-3.asx
    		type=asx
    	}
    	media {
    		name=Zaa Network
    		url=rtmp://110.164.48.228/live/live
    		live=true
    	}
    	media {
    		name=ASTV
    		url=http://tv.mthai.com/wp-content/themes/minimalism/asx/thai-ch-astv.asx
    		type=asx
    	}
    	media {
    		name=Movie Plus
    		url=http://tv.mthai.com/wp-content/themes/minimalism/asx/thai-ch-movieplus.asx
    		type=asx
    	}
    	media {
    		name=MIC
    		url=http://tv.mthai.com/wp-content/themes/minimalism/asx/thai-ch-mic.asx
    		type=asx
    	}
    	media {
    		name=Mongkol Major
    		url=http://tv.mthai.com/wp-content/themes/minimalism/asx/thai-ch-mongkol.asx
    		type=asx
    	}
    }
}