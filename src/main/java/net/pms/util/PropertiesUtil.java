/*
 * PS3 Media Server, for streaming any medias to your PS3.
 * Copyright (C) 2008  A.Brochard
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; version 2
 * of the License only.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
package net.pms.util;

import java.io.IOException;

import net.pms.PMS;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PropertiesUtil {
	/**
	 * Logs messages to all different channels.
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(PMS.class);

	/**
	 * General properties for the PMS project.
	 */
	private static final PmsProperties projectProperties = new PmsProperties();

	static {
		try {
			// Read project properties resource file.
			projectProperties.loadFromResourceFile("/resources/project.properties");
		} catch (IOException e) {
			LOGGER.error("Could not load project.properties");
		}
	}

	/**
	 * Returns the project properties object.
	 * 
	 * @return The properties object.
	 */
	public static PmsProperties getProjectProperties() {
		return projectProperties;
	}
}
