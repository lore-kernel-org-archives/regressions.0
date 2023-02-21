Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A417A33D8
	for <regressions@lists.linux.dev>; Tue, 21 Feb 2023 12:44:39 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pUS0T-0002pQ-0B; Tue, 21 Feb 2023 13:44:29 +0100
Message-ID: <698e7bfa-09dc-ad74-3eba-ceacd7a29f18@leemhuis.info>
Date: Tue, 21 Feb 2023 13:44:28 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mark Brown <broonie@kernel.org>, Joseph R <prosenfeld@Yuhsbstudents.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: [regression] Bug 217063 - Commit 2232b2d breaks microphone on Lenovo
 "82SJ" Ideapad 14ARH7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676983479;c56082b1;
X-HE-SMSGID: 1pUS0T-0002pQ-0B

Hi, this is your Linux kernel regression tracker.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developer don't keep an eye on it, I decided to forward it by
mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217063 :

> [reply] [−] Description Joseph R 2023-02-21 00:35:34 UTC
> 
> Created attachment 303765 [details] lspci -vv
> 
> Commit 2232b2dd8cd4f1e6d554b2c3f6899ce36f791b67, intended to fix
> sound on Lenovo Yoga Slim 7 Pro X, makes the microphone on Lenovo
> Ideapad 14 14ARH7 with product code Lenovo "82SJ" unusable.
> 
> Simply removing the lines added by the commit make the microphone
> work again without issues.
> 
> Attached is lspci on a kernel with the lines removed.
> 
> First kernel bug report, so please let me know how I can help get
> this fixed!


See the ticket for more details.


[TLDR for the rest of this mail: I'm adding this report to the list of
tracked Linux kernel regressions; the text you find below is based on a
few templates paragraphs you might have encountered already in similar
form.]

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: 2232b2dd8cd4f1e6d5
https://bugzilla.kernel.org/show_bug.cgi?id=217063
#regzbot title: alsa/asoc: microphone on Lenovo "82SJ" Ideapad 14ARH7 broken
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
