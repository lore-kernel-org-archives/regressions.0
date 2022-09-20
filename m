Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ACD10F9
	for <regressions@lists.linux.dev>; Tue, 20 Sep 2022 08:07:11 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oaYHc-0007Gk-En; Tue, 20 Sep 2022 10:07:08 +0200
Message-ID: <48bb6266-2d5c-ffcd-6982-4fd02bfdcfc3@leemhuis.info>
Date: Tue, 20 Sep 2022 10:07:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US, de-DE
To: hazem ahmed mohamed <hazem.ahmed.abuelfotoh@gmail.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "tytso@mit.edu" <tytso@mit.edu>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>
References: <CACX6voDfcTQzQJj=5Q-SLi0in1hXpo=Ri28rX73Og3GTObPBWA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Ext4: Buffered random writes performance regression with
 dioread_nolock enabled
In-Reply-To: <CACX6voDfcTQzQJj=5Q-SLi0in1hXpo=Ri28rX73Og3GTObPBWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1663661231;01544da8;
X-HE-SMSGID: 1oaYHc-0007Gk-En

On 19.09.22 17:18, hazem ahmed mohamed wrote:
> 
> I am sending this e-mail to report a performance regression that’s
> caused by commit 244adf6426(ext4: make dioread_nolock the default) , I
> am listing the performance regression symptoms below & our analysis
> for the reported regression.

FWIW, that patch went into v5.6-rc1~113^2~12

And BTW: it seems 0-day back then noticed that 244adf6426 caused a
performance regression as well, but it seems that was ignored:
https://lore.kernel.org/all/20201024120829.GK31092@shao2-debian/

Anyway, now to the main reason why I write this mail:

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced 244adf6426
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; the webpage mention at the end of
the last para explains why this is important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
