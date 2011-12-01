version = 0.1

macrodef snPlayer {
	media {
		matcher=<file>([^<]+)</file>\s*<image>([^<]+)</image>\s*<id>[^<]+</id>\s*<url>[^<]+</url>\s*<title><!\[CDATA\[(.*?)\]\]></title>
		order=url,thumb,name
	}
}

macrodef snList {
	item {
		matcher=<a href=\"http://video.sanook.com/.*-(\d+)-player\.html\"><img src=\"([^\"]+)\" alt=\"([^\"]+)\"
		order=url,thumb,name
		url=http://video.sanook.com/player/xml/getvdo.php?id=
		macro=snPlayer
	}
}

macrodef snPager {
        folder {
                matcher=<a href=\"http://video.sanook.com/category/show_category\.php\?(catalogID=[^&]+)&amp;(page=[^\"]+)\">([^<]+)</a>
                order=url,url,name
                url=http://video.sanook.com/category/show_category.php?
                type=recurse
                prop=url_separator=&
                macro=snList
        }
}

channel Sanook {
	img=http://c1.s1sf.com/vi/0/di/logo_video.jpg
	folder {
		name=Categories
		url=http://video.sanook.com/category/index.php
		folder {
			matcher=<a href=\"http://video.sanook.com/category/show_category.php\?catalogName=[^&]+&amp;catalogID=(\d+)\" title=\"[^\"]+\">([^<]+)</a>
			order=url,name
			url=http://video.sanook.com/category/show_category.php?catalogID=
			macro=snList
			macro=snPager
		}
	}		
}
