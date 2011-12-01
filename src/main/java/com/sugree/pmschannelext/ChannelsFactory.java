package com.sugree.pmschannelext;

import java.io.File;

import com.sharkhunter.channel.ChannelCfg;
import com.sharkhunter.channel.ChannelNaviXNookie;
import com.sharkhunter.channel.Channels;

import net.pms.PMS;

public class ChannelsFactory {
	private static final String CHANNELS_PATH = "src/main/resources/channels";
	private static final String CHANNELS_NAME = "Channels";
	private static final String CHANNELS_ICON = "http://findicons.com/icon/download/226723/tv/128/png";
	
	public static Channels instance;

	public static Channels getInstance() {
		if (instance != null) {
			return instance;
		}

		Channels chRoot = null;

		try {
			String pluginName=CHANNELS_NAME;
			String img=CHANNELS_ICON;
			String path=CHANNELS_PATH;

			chRoot=new Channels(path,pluginName,img);
			ChannelCfg cfg=new ChannelCfg(chRoot);
			cfg.init();
			chRoot.setCfg(cfg);
			String dPath=path+File.separator+"data";
			cfg.ensureCreated(dPath);
			cfg.commit();
			ChannelNaviXNookie.init(new File(dPath+File.separator+"nookie"));
		}
		catch (Exception e) {
			e.printStackTrace();
			PMS.debug("exp "+e)	;
		}
		instance = chRoot;
		return chRoot;
	}
}
