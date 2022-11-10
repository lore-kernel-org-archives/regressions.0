Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1776A626
	for <regressions@lists.linux.dev>; Thu, 10 Nov 2022 08:10:14 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ot2dV-0006Ey-RP; Thu, 10 Nov 2022 09:10:09 +0100
Message-ID: <7d19ba1f-f78b-a629-c1cc-e5b3f84a94df@leemhuis.info>
Date: Thu, 10 Nov 2022 09:10:08 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US, de-DE
Cc: Casey Tucker <dctucker@hotmail.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 alsa-devel@alsa-project.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: [Regression] Bug 216675 Since 6.0.3 Roland STUDIO-CAPTURE no longer
 registers
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1668067815;618e4453;
X-HE-SMSGID: 1ot2dV-0006Ey-RP

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developer don't keep an eye on it, I decided to forward it by
mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216675 :

>  Casey Tucker 2022-11-09 20:09:22 UTC
> 
> After updating kernel to latest, my Roland audio device no longer shows up in aplay -l or cat /proc/asound/cards.
> 
> I'm running Arch Linux. The last known good kernel was 6.0.2-arch1, and I was able to determine by booting a couple of virtual machines in qemu that an upstream patch shipped in 6.0.3-arch3 refactors card registration, and effectively breaks initialization of this device.
> 
> Patch: https://lore.kernel.org/all/20220904161247.16461-1-tiwai@suse.de/

@Casey, btw and just to be sure you are aware of it, there was a fix-up
patch ("ALSA: usb-audio: Fix last interface check for registration") for
that commit in 6.0.3, too:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.0.y&id=52076a41c128146c9df4a157e972cb17019313b1

> I will be looking at this later this evening attempting to implement a fix that doesn't depend on reverting this patch, and may update this bug report with more details.

See the ticket for more details.

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: 30d629795e2
https://bugzilla.kernel.org/show_bug.cgi?id=216675
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
