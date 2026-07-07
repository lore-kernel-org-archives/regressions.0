Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706DE2FF641
	for <regressions@lists.linux.dev>; Tue,  7 Jul 2026 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424384; cv=none; b=FbubkcY7Fo+tS5pQKleDagmIIDT5SFqcSpNUW6Rrkm8Y9+6d2LCKglLxq/FqVuipQUs8+XatqHa7S210g9VfoqqPL2WVn5Qc6kvYapw/sLsU3Ty2yVyCSgc/h6fdLchtHPLY9TgbygmW9lIFf46CfphVBAspcuTTzxO01btCyB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424384; c=relaxed/simple;
	bh=78FK5UmQEEog9J6hIDvqMIlBt89ugNqFurdAwpKBrf0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=tmZ0LhP6KzvNipdzlYAksGP5twn26pTD7B7lpImxkrEyyjzGWS3d96FrQbOfouV9RzVUSVlh9JT6RWE8cZqeB/H1Ff7k0h3886fRGWe3go960pngbOlaiJBt0bInvMUWKDsrrrYgWunt8eFmAkJ64Eqvg2Cq3yilFY05WAYHmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=eWqQNUof; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="eWqQNUof"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gvfQZ0L0kz422L
	for <regressions@lists.linux.dev>; Tue,  7 Jul 2026 13:39:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1783424374;
	bh=78FK5UmQEEog9J6hIDvqMIlBt89ugNqFurdAwpKBrf0=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=eWqQNUofHXFtEiUvmX1kK/6WLXo1trbYqo3uShUQm0E7qh2kEn0irv0tlBG6xxQaE
	 TcLG3AgkkXD0Xvm/8s+P8IJcj3bvtCFjDRHNtryppfHHbZrZPBaxs3fopDZh7o2Umr
	 T7V1oKvsaDAn2uvF+VkuNikjDe/lFsFSGRevsaBKApj6aLFtYpm+lQkcn8pM9ymxbW
	 PODkphHDKu3tE+JqCUWmokqX80p7i60Wvg2pnAtTNzLcsBly1xCC/sJ50cmzTi7OI4
	 5BM4yhjbijM4X0tlrL+D2DfxZmk6sl2mo1t7bDQrDCW16O9eJygZgoO64qmEmOBkSk
	 DcTqdukNLZfzQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gvfQY6m88z41fl
	for <regressions@lists.linux.dev>; Tue,  7 Jul 2026 13:39:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gvfQY2FHsz8tZg
	for <regressions@lists.linux.dev>; Tue,  7 Jul 2026 13:39:33 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 956396038E
	for <regressions@lists.linux.dev>; Tue,  7 Jul 2026 13:39:32 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <338d868b-7c12-47b7-9007-f43fc42c099d@leemhuis.info>
Date: Tue, 7 Jul 2026 13:39:30 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178342437278.31713.14714711440340057536@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 956396038E
X-NC-CID: Dwsx3Q5ulogb7NAE32CCLw8qMoapmy0cehyIacLZjbUT7nQgWP0=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/ajRmlyx_AEGybykL@soda.int.kasm.eu/
#regzbot dup:
https://lore.kernel.org/all/CAPpkL-y54ySw8ftqeumccNEVatY0Zt6-Ag4PejYddK5WcsiV3A@mail.gmail.com/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221727
#regzbot introduced: 4d4c10f763d7
#regzbot title: net: e1000e: init fails without

#regzbot report:
https://lore.kernel.org/all/5185687e-8993-4736-a592-054e2b5be276@suse.com/
#regzbot introduced: 095be159f3eb
#regzbot title: btrfs: PAGECACHE_TAG_DIRTY is never cleared
#regzbot fix: btrfs: fix a regression where PAGECACHE_TAG_DIRTY is never
cleared
#regzbot monitor:
https://lore.kernel.org/all/d47af8cae38e32462d61cb62139c2732e4e8fdbe.1783407237.git.wqu@suse.com/

#regzbot report:
https://lore.kernel.org/all/20260629-btmtk-ryzen-remote-wakeup-v1-1-1d2f1cee6d22@rong.moe/
#regzbot introduced: e31d761628ad
#regzbot title: bluetooth: mediatek: remote wakeup can cause
MT7922/MT7925's btusb interface to be completely unresponsive
#regzbot fix: Bluetooth: Properly disable remote wakeup for
MT7922/MT7925 on Ryzen platform
#regzbot monitor:
https://lore.kernel.org/all/20260701-btmtk-ryzen-remote-wakeup-v2-1-767ac7907472@rong.moe/

#regzbot report:
https://lore.kernel.org/all/20260629143439.361560-1-leoreis.costa@gmail.com/
#regzbot introduced: 610fa91d9863
#regzbot title: PCI: imx6: Apalis iMX6 stopped booting

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221721
#regzbot introduced: 9e896b4a48c4e815956d28961448041c80ad5a19
#regzbot title: usb: xhci-pci: unable to type in LUKS password in plymouth

