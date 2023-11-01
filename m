Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6E9134CD
	for <regressions@lists.linux.dev>; Wed,  1 Nov 2023 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qyCmF-0001LJ-J3; Wed, 01 Nov 2023 16:05:03 +0100
Message-ID: <74466a74-0c42-40ce-8176-ba7ba56cb6d6@leemhuis.info>
Date: Wed, 1 Nov 2023 16:05:03 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Nouveau] Fwd: System (Xeon Nvidia) hangs at boot terminal after
 kernel 6.4.7
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux Regressions <regressions@lists.linux.dev>
Cc: Linux Nouveau <nouveau@lists.freedesktop.org>,
 Linux Stable <stable@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
References: <4b0c06ba-b05c-071c-d494-67775bd7250f@gmail.com>
 <94a31824-016a-7fe3-7477-e3ab500844c1@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <94a31824-016a-7fe3-7477-e3ab500844c1@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698851107;3fabe3da;
X-HE-SMSGID: 1qyCmF-0001LJ-J3

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 10.08.23 06:19, Thorsten Leemhuis wrote:
> On 10.08.23 05:03, Bagas Sanjaya wrote:
>>
>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>
>> [...]
>> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217776

#regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/255
#regzbot fix: 6eb4a83e612af65bab8492957cba
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

