Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4551367
	for <regressions@lists.linux.dev>; Sun, 19 Feb 2023 13:20:09 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pTjJS-0000j4-Ss; Sun, 19 Feb 2023 14:01:06 +0100
Message-ID: <2dbfaaa8-fc2f-7eb6-6e66-452b54186290@leemhuis.info>
Date: Sun, 19 Feb 2023 14:01:06 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: =?UTF-8?Q?Re=3a_=5bregression=5d_Bug=c2=a0216909_-_Avantree_Leaf_US?=
 =?UTF-8?Q?B_audio_device_does_not_play_sound_in_applications_run_via_wine?=
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Takashi Iwai <tiwai@suse.de>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Bernd Steinhauser <linux@bernd-steinhauser.de>,
 Alsa-devel <alsa-devel@alsa-project.org>, LKML
 <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <f5beb73a-4306-fc04-8ab1-e5fc06c9f40f@leemhuis.info>
In-Reply-To: <f5beb73a-4306-fc04-8ab1-e5fc06c9f40f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676812809;ab2e844d;
X-HE-SMSGID: 1pTjJS-0000j4-Ss

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 11.01.23 11:52, Linux kernel regression tracking (Thorsten Leemhuis)
wrote:
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developer don't keep an eye on it, I decided to forward it by
> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216909 :

Per https://bugzilla.kernel.org/show_bug.cgi?id=216909#c11

#regzbot inconclusive: likely more of an application bug that surfaced
by improvements in the kernel side; workaround is available
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
