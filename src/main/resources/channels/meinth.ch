version = 0.1
scriptdef ch3url {
	url='mms://202.43.34.236/3
	concat url s_url
	print url
	play
}
channel MeInTh {
	img=http://me.in.th/image/home/logo.jpg
	folder {
		name=Live
		url=http://me.in.th/live/chrome.php
		item {
			matcher=(chrome_play\.php)
			order=url
			url=http://me.in.th/live/
			prop=prepend_name=CH3
			media {
				matcher=wmLiveServer\+ch\+\"(\?server_time=[^&]+&hash_value=[^&]+&validminutes=480)\";
				order=url
				prop=prepend_name=CH3
				script=ch3url
			}
		}
		item {
			matcher=(chrome_play\.php)
			order=url
			url=http://me.in.th/live/
			prop=prepend_name=CH5
			media {
				matcher=wmLiveServer\+ch\+\"(\?server_time=[^&]+&hash_value=[^&]+&validminutes=480)\";
				order=url
				url=mms://202.43.34.236/5
				prop=prepend_name=CH5
			}
		}
		item {
			matcher=(chrome_play\.php)
			order=url
			url=http://me.in.th/live/
			prop=prepend_name=CH7
			media {
				matcher=wmLiveServer\+ch\+\"(\?server_time=[^&]+&hash_value=[^&]+&validminutes=480)\";
				order=url
				url=mms://202.43.34.236/7
				prop=prepend_name=CH7
			}
		}
		item {
			matcher=(chrome_play\.php)
			order=url
			url=http://me.in.th/live/
			prop=prepend_name=CH9
			media {
				matcher=wmLiveServer\+ch\+\"(\?server_time=[^&]+&hash_value=[^&]+&validminutes=480)\";
				order=url
				url=mms://202.43.34.236/9
				prop=prepend_name=CH9
			}
		}
	}		
}
