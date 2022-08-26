Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EB02FAE
	for <regressions@lists.linux.dev>; Fri, 26 Aug 2022 11:01:03 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oRX58-0007DN-5g; Fri, 26 Aug 2022 13:00:58 +0200
Message-ID: <a3ab81d9-0fe1-0bc9-b265-37793c11ff77@leemhuis.info>
Date: Fri, 26 Aug 2022 13:00:57 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Jiri Kosina <jikos@kernel.org>
Cc: gomapo2868@safe-cart.com, LKML <linux-kernel@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: [Regression] Bug 216395 - XP-Pen Star G430S stops working on any
 kernel newer than 5.18.7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1661511663;ba3c7f20;
X-HE-SMSGID: 1oRX58-0007DN-5g

Hi, this is your Linux kernel regression tracker.

I noticed a regression report in bugzilla.kernel.org that afaics nobody
acted upon since it was reported. That's why I decided to forward it by
mail to those that afaics should handle this.

To quote from https://bugzilla.kernel.org/show_bug.cgi?id=216395 :

>  gomapo2868@safe-cart.com 2022-08-22 16:28:00 UTC
> 
> XP-Pen Star G430S stops working on newer kernels than 5.18.7 (5.18.8, 5.19, 6.0rc1 tested)
> It seems to use the uclogic drivers.

See the ticket for details and further comments.

Please look into the issue if you're among the main recipients of this
mail (and not just CCed). I hope I picked the right people to sent this
to, if not just let everyone know (and apologies for getting it wrong!).

Anyway, to ensure this is not forgotten lets get this tracked by the the
Linux kernel regression tracking bot:

#regzbot introduced: v5.18..5.18.7
https://bugzilla.kernel.org/show_bug.cgi?id=216395
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report in bugzilla, as the kernel's documentation calls
for; above page explains why this is important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
