package com.sugree.pmschannelext;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.io.File;
import java.io.IOException;

import net.pms.PMS;

import org.apache.commons.configuration.ConfigurationException;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.sharkhunter.channel.Channel;
import com.sharkhunter.channel.ChannelMediaStream;
import com.sharkhunter.channel.ChannelPMSFolder;
import com.sharkhunter.channel.ChannelPMSItem;
import com.sharkhunter.channel.Channels;
import com.sugree.pmschannelext.ChannelsFactory;

public class MeInThTest {
	private static final String CH_PATH = "src/main/resources/channels/meinth.ch";

	private Channels root;
	private Channel ch;

	@BeforeClass
	public static void init() throws ConfigurationException, IOException {
		PMS.main(new String[] {"noconsole", "headless"});
	}

	@Before
	public void setUp() {
		root = ChannelsFactory.getInstance();
	}

	@Test
	public void parse() throws Exception {
		root.parseChannels(new File(CH_PATH));
		//root.refreshChildren();
		System.out.println(root.getChildren());
		System.out.println(Channels.getChannels());
		assertEquals(1, Channels.getChannels().size());

		ch = Channels.getChannels().get(0);
		assertNotNull(ch);
		assertEquals("MeInTh", ch.getName());
		ch.discoverChildren();
		System.out.println(ch.getChildren());
		assertEquals(1, ch.getChildren().size());
	}

	@Test
	public void live() {
		ch = Channels.getChannels().get(0);
		ch.discoverChildren();

		ChannelPMSFolder f = (ChannelPMSFolder) ch.getChildren().get(0);
		f.resolve();
		f.discoverChildren();
		System.out.println(f.getChildren());
		assertEquals(4, f.getChildren().size());

		ChannelPMSItem c0 = (ChannelPMSItem) f.getChildren().get(0);
		System.out.println(c0);
		c0.discoverChildren();
		System.out.println(c0.getChildren());
		assertEquals(1, c0.getChildren().size());

		ChannelMediaStream m0 = (ChannelMediaStream) c0.getChildren().get(0);
		System.out.println(m0);
		m0.discoverChildren();
		System.out.println(m0.getChildren());
		assertEquals(0, m0.getChildren().size());
	}
}
