Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068F4749D
	for <regressions@lists.linux.dev>; Thu, 12 Jan 2023 14:14:49 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pFyLt-0008E1-HX; Thu, 12 Jan 2023 15:14:45 +0100
Message-ID: <57e2f165-4d4a-d8bc-47c0-1b0609cd2147@leemhuis.info>
Date: Thu, 12 Jan 2023 15:14:45 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Hans de Goede <hdegoede@redhat.com>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: walter59 <walter.moeller@moeller-it.net>, Adrien <kernel@asdrip.fr>,
 LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: =?UTF-8?Q?=5bregression=5d_Bug=c2=a0216904_-_backlight_brighness_co?=
 =?UTF-8?Q?ntrol_with_video_missing_/sys/class/backlight_interface?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1673532890;39a34e20;
X-HE-SMSGID: 1pFyLt-0008E1-HX

Hi, this is your Linux kernel regression tracker.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developer don't keep an eye on it, I decided to forward it by
mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216904 :

>  walter59 2023-01-09 11:31:18 UTC
> 
> backlight brighness control with video missing /sys/class/backlight interface
> 
> kernel 6.1 it is ok --- kernel 6.2 not
> 
> [reply] [−] Comment 1 The Linux kernel's regression tracker (Thorsten Leemhuis) 2023-01-10 06:24:45 UTC
> 
> What kind of machine is this? Could you please attach the output of `lspci -nn`  and `dmidecode`
> 
> [reply] [−] Comment 2 Adrien 2023-01-11 21:47:24 UTC
> 
> Hi,
> 
> Same here. Everything is fine on 6.1.3 and the issue seems to happen starting 6.1.4. 
> `ls /sys/class/backlight/` returns nothing.
> I can't adjust the brightness with Fn+F3/F4 (dmesg returns acer_wmi: Unknown function number - 4 - 0).
> I'll try to do a bisect.
> 

See the ticket for more details.


[TLDR for the rest of this mail: I'm adding this report to the list of
tracked Linux kernel regressions; the text you find below is based on a
few templates paragraphs you might have encountered already in similar
form.]

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v6.1..v6.2-rc4
https://bugzilla.kernel.org/show_bug.cgi?id=216904
#regzbot title: brightness: /sys/class/backlight interface is missing
(in 6.1.3->6.1.4, too?)
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (e.g. the buzgzilla ticket and maybe this mail as well, if
this thread sees some discussion). See page linked in footer for details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
