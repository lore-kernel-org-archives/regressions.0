Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D1431B119
	for <regressions@lists.linux.dev>; Tue,  9 Sep 2025 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757414689; cv=none; b=YOmgSN+gY5Usn2pVOx5ejJxID2GONSGngmY06j6/r8bvet4LvZQWzahSPKbeBJd6hcx8ctWqqmLfl0we8SJOli9RqweY0G+RR4fGybP8huCOUZ36DLX9SzTYWQzZMb3X6/IY/imMub1M5XsZbSsbD+d2PQnnL6bgAHNFnWtlCWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757414689; c=relaxed/simple;
	bh=55qJvKXyE+9pfSZrALQhyDOBipWDxJ/LPfV2fWOsdRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYZjrV6XBDZ3d9tFcrjWvc89kj4ICjzh2sqW31gcc5fTv8Ap3j1T4m+LmCfFd7mRpfKpYaRL+/Icumlvm3eFJEfNNaVV1xplsSAO9o0SBOsID1O2mK6RAg7d2FBzJex23ekT0uRnRVn7gItXe5g2NsuwwzvvruZGB6vbVwR/6I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jQLJZq2L; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jQLJZq2L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=tXbXX4VV7Uj3uV02FImdkS5jeLH6NPOOJu0XrVEt5bs=; t=1757414686;
	x=1757846686; b=jQLJZq2LTjD+Z64HeFYL1bHBYfGWblDzGSFhAAitc4sp6I9beeJZ0s299+Cc8
	eEN+7qRMawFS3x8sccNjHtmhDleYUAAmzdqt++DMtEiX0KjiAAnnYfLnlUkIEoDO9e1/Ch/IgNCUA
	CwTXwVbES62H1ZMLNzHSSs2vXEzbALCaLiUKc3m+DYGskF5XFOUySLI96F9L4YqwabFo+CkP99djV
	T7w7bm3WR9fAlOYULkLtiG6B48gOCbEINfCHQ+zFyomoDnLn44jQ34Dz3VaOhPr6ndFgWNKq6+fGw
	rqOzIIpMUsu/lE0tSdMuiSYQ6AgYfoAa1gHKqKASdVovLiy28g==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1uvv64-007Jas-0X;
	Tue, 09 Sep 2025 11:57:08 +0200
Message-ID: <4c3ee5e5-95fc-4bb7-b62e-cf7ddfaf3fb2@leemhuis.info>
Date: Tue, 9 Sep 2025 11:57:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] iwlwifi: Centrino Advanced-N 6230 causes kernel BUG
 in 6.16-rc7 (works in 6.1)
To: labhras loughran <dr_labhras_loughran@hotmail.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: "miriam.rachel.korenblit@intel.com" <miriam.rachel.korenblit@intel.com>
References: <PA3P192MB2948B29D87DBEEDFAE211DDEBA05A@PA3P192MB2948.EURP192.PROD.OUTLOOK.COM>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <PA3P192MB2948B29D87DBEEDFAE211DDEBA05A@PA3P192MB2948.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1757414686;f38dd7d9;
X-HE-SMSGID: 1uvv64-007Jas-0X

Hi! Sorry for the late reply. I guess a bisection will be needed here,
as the problem in iwlwifi you noticed might be just a symptom of another
problem on a lower level (say pci or something); that's might also be
why the iwlwifi maintainer didn't even reply.

But note: the range between the failed and the working kernel is also
quite large. So even if you manage to bisect this (which is guess won't
be easy), it might be tricky to fix this; but with a bit of luck things
will work out in your favor!

Ciao, Thorsten

On 30.08.25 09:44, labhras loughran wrote:
> 
> My 12-year-old dell XPS 13  laptop freezes after a period of time, an hour or two. Particularly if it is coming out of sleep mode. 
> By freeze is meant = the keyboard and mouse not work. So only way to get back control is to power cycle.
> 
> If you need me to, I can try and bisect the problem by trying a release intermediate between the two below. 
> 
> Here is detailed info on versions and the log messages:
> 
> // version info 
> XPS 13 L321X
> chip model - Centrino advanced-n 6230. 
> kernels 
> failed kernel  /boot/vmlinuz-6.16.0-rc7+
> working kernel  /boot/vmlinuz-6.1.0-31-amd64
> wifi firmware is same version for both kernels 
> [    5.753606] iwlwifi 0000:02:00.0: loaded firmware version 18.168.6.1 6000g2b-6.ucode op_mode iwldvm
> 
> // logs 
> root@labhras-Dell-System-XPS13:~# journalctl -b -1 -p err
> Aug 20 12:39:09 labhras-Dell-System-XPS13 kernel: Error: Driver 'pcspkr' is already registered, aborting...
> Aug 20 12:39:10 labhras-Dell-System-XPS13 kernel: Bluetooth: hci0: unexpected event for opcode 0x0000
> Aug 20 12:39:10 labhras-Dell-System-XPS13 bluetoothd[473]: src/plugin.c:plugin_init() Failed to init vcp plugin
> Aug 20 12:39:10 labhras-Dell-System-XPS13 bluetoothd[473]: src/plugin.c:plugin_init() Failed to init mcp plugin
> Aug 20 12:39:10 labhras-Dell-System-XPS13 bluetoothd[473]: src/plugin.c:plugin_init() Failed to init bap plugin
> Aug 20 12:39:11 labhras-Dell-System-XPS13 bluetoothd[473]: profiles/sap/server.c:sap_server_register() Sap driver initialization failed.
> Aug 20 12:39:11 labhras-Dell-System-XPS13 bluetoothd[473]: sap-server: Operation not permitted (1)
> Aug 20 12:39:24 labhras-Dell-System-XPS13 gdm-password][1069]: gkr-pam: unable to locate daemon control file
> Aug 20 12:39:27 labhras-Dell-System-XPS13 systemd[1089]: Failed to start app-gnome-im\x2dlaunch-1475.scope - Application launched by gnome-s>
> Aug 20 12:39:30 labhras-Dell-System-XPS13 gdm-launch-environment][593]: GLib-GObject: g_object_unref: assertion 'G_IS_OBJECT (object)' failed
> Aug 20 14:35:39 labhras-Dell-System-XPS13 kernel: Bluetooth: hci0: unexpected event for opcode 0x0000
> Aug 20 14:35:39 labhras-Dell-System-XPS13 bluetoothd[473]: profiles/sap/server.c:sap_server_register() Sap driver initialization failed.
> Aug 20 14:35:39 labhras-Dell-System-XPS13 bluetoothd[473]: sap-server: Operation not permitted (1)
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Microcode SW error detected.  Restarting 0x2000000.
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Loaded firmware version: 18.168.6.1 6000g2b-6.ucode
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Start IWL Error Log Dump:
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Status: 0x0000044C, count: 6
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00001030 | ADVANCED_SYSASSERT          
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5F0 | uPc
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5E8 | branchlink1
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5E8 | branchlink2
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000DBEA | interruptlink1
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | interruptlink2
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x001A0072 | data1
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | data2
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000800 | line
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x9300A2E1 | beacon time
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x33607D1F | tsf low
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00001E46 | tsf hi
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000B59 | time gp1
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0399D2A8 | time gp2
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | time gp3
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x754312A8 | uCode version
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x000000B0 | hw version
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00488700 | board version
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0101001C | hcmd
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0xA7F63004 | isr0
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x11C1C000 | isr1
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000F1A | isr2
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0143F0C0 | isr3
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | isr4
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x10008112 | isr_pref
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0002443C | wait_event
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x000000C4 | l2p_control
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000B78 | l2p_duration
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000007 | l2p_mhvalid
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00101042 | l2p_addr_match
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000015 | lmpm_pmg_sel
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x13011136 | timestamp
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000F808 | flow_handler
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Start IWL Event Log Dump: nothing in log
> Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Device error - SW reset
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Microcode SW error detected.  Restarting 0x2000000.
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Loaded firmware version: 18.168.6.1 6000g2b-6.ucode
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Start IWL Error Log Dump:
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Status: 0x0000044C, count: 6
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00001030 | ADVANCED_SYSASSERT          
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5F0 | uPc
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5E8 | branchlink1
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5E8 | branchlink2
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000DBEA | interruptlink1
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | interruptlink2
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x001A0072 | data1
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | data2
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000800 | line
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x32006F4C | beacon time
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x3ADF70B4 | tsf low
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00001E46 | tsf hi
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000B59 | time gp1
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0779DB1E | time gp2
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | time gp3
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x754312A8 | uCode version
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x000000B0 | hw version
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00488700 | board version
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0103001C | hcmd
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0xA7F63004 | isr0
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x11C18000 | isr1
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000F1A | isr2
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0147F0C0 | isr3
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | isr4
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x10008112 | isr_pref
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0002443C | wait_event
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x000000C4 | l2p_control
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000B78 | l2p_duration
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000007 | l2p_mhvalid
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00101042 | l2p_addr_match
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000015 | lmpm_pmg_sel
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x13011136 | timestamp
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C8D0 | flow_handler
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Start IWL Event Log Dump: nothing in log
> Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Device error - SW reset
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Microcode SW error detected.  Restarting 0x2000000.
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Loaded firmware version: 18.168.6.1 6000g2b-6.ucode
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Start IWL Error Log Dump:
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Status: 0x0000044C, count: 6
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00001030 | ADVANCED_SYSASSERT          
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5F0 | uPc
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5E8 | branchlink1
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5E8 | branchlink2
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000DBEA | interruptlink1
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | interruptlink2
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0015005E | data1
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | data2
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000800 | line
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x7C0031E2 | beacon time
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x636CEE1E | tsf low
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00001E46 | tsf hi
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000B59 | time gp1
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x288872A9 | time gp2
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | time gp3
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x754312A8 | uCode version
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x000000B0 | hw version
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00488700 | board version
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0102001C | hcmd
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0xA7F63004 | isr0
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x11C1E000 | isr1
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000F1A | isr2
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0147FCC1 | isr3
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | isr4
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x10008112 | isr_pref
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00026D36 | wait_event
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x000000C4 | l2p_control
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000B78 | l2p_duration
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000007 | l2p_mhvalid
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00101042 | l2p_addr_match
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000015 | lmpm_pmg_sel
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x13011136 | timestamp
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00002830 | flow_handler
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Start IWL Event Log Dump: nothing in log
> Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Device error - SW reset
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Microcode SW error detected.  Restarting 0x2000000.
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Loaded firmware version: 18.168.6.1 6000g2b-6.ucode
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Start IWL Error Log Dump:
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Status: 0x0000044C, count: 6
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00001030 | ADVANCED_SYSASSERT          
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5F0 | uPc
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5E8 | branchlink1
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5E8 | branchlink2
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000DBEA | interruptlink1
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | interruptlink2
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0015005E | data1
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | data2
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000800 | line
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0F40E0E7 | beacon time
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x63D1CF19 | tsf low
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00001E46 | tsf hi
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000B5A | time gp1
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x005FC4C3 | time gp2
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | time gp3
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x754312A8 | uCode version
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x000000B0 | hw version
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00488700 | board version
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0102001C | hcmd
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0xA7F63006 | isr0
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x11818000 | isr1
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000E1A | isr2
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x8143F0C1 | isr3
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | isr4
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x10808112 | isr_pref
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00026D36 | wait_event
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x000000C4 | l2p_control
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000B78 | l2p_duration
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000007 | l2p_mhvalid
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00101042 | l2p_addr_match
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000015 | lmpm_pmg_sel
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x13011136 | timestamp
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000010 | flow_handler
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Start IWL Event Log Dump: nothing in log
> Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Device error - SW reset
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Microcode SW error detected.  Restarting 0x2000000.
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Loaded firmware version: 18.168.6.1 6000g2b-6.ucode
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Start IWL Error Log Dump:
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Status: 0x0000044C, count: 6
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00001030 | ADVANCED_SYSASSERT          
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5F0 | uPc
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5E8 | branchlink1
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000C5E8 | branchlink2
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000DBEA | interruptlink1
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | interruptlink2
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0015005E | data1
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | data2
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000800 | line
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0100F3F3 | beacon time
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x63DE3C0D | tsf low
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00001E46 | tsf hi
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000B32 | time gp1
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00074814 | time gp2
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | time gp3
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x754312A8 | uCode version
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x000000B0 | hw version
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00488700 | board version
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0100001C | hcmd
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0xA7F63006 | isr0
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x01818000 | isr1
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000E1A | isr2
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0146B0C1 | isr3
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000000 | isr4
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x10008112 | isr_pref
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00026D36 | wait_event
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x000000C4 | l2p_control
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000B50 | l2p_duration
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000007 | l2p_mhvalid
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00101042 | l2p_addr_match
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x00000015 | lmpm_pmg_sel
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x13011136 | timestamp
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0000B0C0 | flow_handler
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Start IWL Event Log Dump: nothing in log
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Device error - reprobe!
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Q: 2, freed 0
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_LEDS_CMD failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_LEDS_CMD failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_TXFIFO_FLUSH failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: flush request fail
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_ADD_STA failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_ADD_STA failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_ADD_STA failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_ADD_STA failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: wlp2s0: failed to remove key (0, 3c:52:a1:94:cd:45) from hardware (-5)
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_QOS_PARAM failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Failed to update QoS
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_RXON failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Error clearing ASSOC_MSK on BSS (-5)
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_RXON failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Error clearing ASSOC_MSK on BSS (-5)
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_RXON failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Error clearing ASSOC_MSK on BSS (-5)
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_RXON failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Error clearing ASSOC_MSK on BSS (-5)
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_ADD_STA failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: wlp2s0: failed to remove key (1, ff:ff:ff:ff:ff:ff) from hardware (-5)
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Command REPLY_RXON failed: FW Error
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Error clearing ASSOC_MSK on BSS (-5)
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Failing on timeout while stopping DMA channel 8 [0x07fd0001]
> Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: kernel BUG at mm/slub.c:546
> 
> 
> 

