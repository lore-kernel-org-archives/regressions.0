Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578D010FB
	for <regressions@lists.linux.dev>; Sun, 16 Apr 2023 12:37:07 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1po1cv-0006Na-5h; Sun, 16 Apr 2023 14:37:05 +0200
Message-ID: <70355498-3902-9efb-192a-3b60661ffdab@leemhuis.info>
Date: Sun, 16 Apr 2023 14:37:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [regression] Bug 217252 - warning: v4l_enum_fmt+0x125a/0x1c20 -
 Unknown pixelformat 0x00000000
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <dc8e5276-ef88-648f-9f0d-10151ea62c90@leemhuis.info>
 <1bd64a7f-9bcb-3057-4c51-7144122370fc@leemhuis.info>
In-Reply-To: <1bd64a7f-9bcb-3057-4c51-7144122370fc@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1681648627;b668bfbb;
X-HE-SMSGID: 1po1cv-0006Na-5h


On 09.04.23 11:18, Linux regression tracking #update (Thorsten Leemhuis)
wrote:
> [TLDR: This mail in primarily relevant for Linux kernel regression
> tracking. See link in footer if these mails annoy you.]
> 
> On 29.03.23 13:25, Linux regression tracking (Thorsten Leemhuis) wrote:
>>
>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>> kernel developers don't keep an eye on it, I decided to forward it by mail.
>>
>> Note, you have to use bugzilla to reach the reporter, as I sadly[1] can
>> not CCed them to mails like this.
>>
>> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217252 :
>>
>> #regzbot introduced: v5.15..v6.1.21
>> https://bugzilla.kernel.org/show_bug.cgi?id=217252
>> #regzbot title: media: Unknown pixelformat 0x00000000
>> #regzbot ignore-activity
> 
> Update the status, this was caused by a backport of a recent mainline
> commit to various stable trees.
> 
> #regzbot introduced: 50459f103edf
> #regzbot fix: media: usb: uvc: fill in description for unknown pixelformats
> #regzbot ignore-activity

Get this out of sight in the tracking, as it's not that urgent:

#regzbot backburner: only a warning, doesn't cause any trouble for users
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
