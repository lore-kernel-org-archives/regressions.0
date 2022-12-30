Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA147E
	for <regressions@lists.linux.dev>; Fri, 30 Dec 2022 09:15:11 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pBBTp-0002ty-6V; Fri, 30 Dec 2022 10:15:09 +0100
Message-ID: <82364292-666b-c275-37b2-18afe401c06c@leemhuis.info>
Date: Fri, 30 Dec 2022 10:15:08 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: =?UTF-8?Q?Bug=c2=a0216859_-_PCI_bridge_to_bus_boot_hang_at_enumerat?=
 =?UTF-8?Q?ion?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672391711;3d76d13e;
X-HE-SMSGID: 1pBBTp-0002ty-6V

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression reported in bugzilla.kernel.org that seems to be
handled already, nevertheless I'd like to add to the tracking to ensure
it's doesn't fall through the cracks in the end:

#regzbot introduced: v6.0..v6.1
https://bugzilla.kernel.org/show_bug.cgi?id=216859
#regzbot title: pci(?): boot hang at PCI enumeration
#regzbot monitor:
https://lore.kernel.org/all/20221228120248.GA508080@bhelgaas/
#regzbot ignore-activity

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
