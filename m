Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400E87C
	for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 09:48:51 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oawLY-0002vY-Ug; Wed, 21 Sep 2022 11:48:48 +0200
Message-ID: <595451b2-fa7f-8ff0-6ffd-bebf6e76c577@leemhuis.info>
Date: Wed, 21 Sep 2022 11:48:48 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <linux@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <a44901ff-9f4a-07ff-1187-250666679e97@leemhuis.info>
Subject: Re: Bug 216340 - Kernel stuck on "Loading initial ramdisk" since 5.11
 #forregzbot
In-Reply-To: <a44901ff-9f4a-07ff-1187-250666679e97@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1663753731;a356aca6;
X-HE-SMSGID: 1oawLY-0002vY-Ug

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 23.08.22 18:38, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> There is a bug report in bugzilla.kernel.org that seems to be handled
> there already, nevertheless I'd like to add to the tracking to ensure
> it's not forgotten.
> 
> #regzbot introduced: f289041ed4cf9a3f6e8a32068fef9ffb2acc5662
> https://bugzilla.kernel.org/show_bug.cgi?id=216340

#regzbot invalid: odd corner case, workaround available, not a real
regression; see https://bugzilla.kernel.org/show_bug.cgi?id=216340#c52
and later for details
