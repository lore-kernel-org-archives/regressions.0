Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A38F6ADE
	for <regressions@lists.linux.dev>; Fri, 13 Jan 2023 13:07:16 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pGJm0-000111-I3; Fri, 13 Jan 2023 14:07:08 +0100
Message-ID: <43b15899-c976-fa45-aae8-1f381dc4150a@leemhuis.info>
Date: Fri, 13 Jan 2023 14:07:08 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: =?UTF-8?Q?Re=3a_Bug=c2=a0216839_-_Connecting_a_MT76_device_causes_c?=
 =?UTF-8?Q?omputer_to_hang_since_linux_6=2e1?=
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <e85d24d1-0ac5-f580-bb89-907ee77e65ea@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <e85d24d1-0ac5-f580-bb89-907ee77e65ea@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1673615236;171ac948;
X-HE-SMSGID: 1pGJm0-000111-I3

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 26.12.22 13:46, Thorsten Leemhuis wrote:
> 
> I noticed a regression reported in bugzilla.kernel.org that seems to be
> handled there already, nevertheless I'd like to add to the tracking to
> ensure it's doesn't fall through the cracks in the end:
> 
> #regzbot ^introduced v6.0..v6.1
> https://bugzilla.kernel.org/show_bug.cgi?id=216839
> #regzbot title hang with mediatek MT76 device during boot
> #regzbot ignore-activity

#regzbot fix: wifi: mac80211: fix initialization of rx->link and
rx->link_sta

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
