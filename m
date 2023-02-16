Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA536120
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 14:18:56 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pSf65-0003oe-KA; Thu, 16 Feb 2023 15:18:53 +0100
Message-ID: <7e02467e-84d7-55d9-9edb-bb8107434a29@leemhuis.info>
Date: Thu, 16 Feb 2023 15:18:53 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Resume after suspend broken, reboots instead on kernel 6.1
 onwards x86_64 RTW88
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: gary.chang@realtek.com, Yan-Hsuan Chuang <tony0620emma@gmail.com>
Cc: regressions@lists.linux.dev, linux-wireless@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Paul Gover <pmw.gover@yahoo.co.uk>,
 stable@vger.kernel.org
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <3739412.kQq0lBPeGt.ref@ryzen> <3739412.kQq0lBPeGt@ryzen>
 <10a47408-3019-403d-97b1-c9f36e52e130@leemhuis.info>
In-Reply-To: <10a47408-3019-403d-97b1-c9f36e52e130@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676557136;318d2d74;
X-HE-SMSGID: 1pSf65-0003oe-KA

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 10.02.23 13:24, Linux kernel regression tracking (Thorsten Leemhuis)
wrote:
> On 09.02.23 20:59, Paul Gover wrote:
>> Suspend/Resume was working OK on kernel 6.0.13, broken since 6.1.1
>> (I've not tried kernels between those, except in the bisect below.)
>> All subsequent 6,1 kernels exhibit the same behaviour.
>>
>> Suspend works OK, but on Resume, there's a flicker, and then it reboots.
>> Sometimes the screen gets restored to its contents at the time of suspend. but 
>> less than a second later, it starts rebooting.
>> To reproduce, simply boot, suspend, and resume.
>>
>> Git bisect blames RTW88
>> commit 6bf3a083407b5d404d70efc3a5ac75b472e5efa9
> 
> TWIMC, that's "wifi: rtw88: add flag check before enter or leave IPS"
> 
>> I'll attach bisect log, dmesg and configs to the bug I've opened 
>> 	https://bugzilla.kernel.org/show_bug.cgi?id=217016

#regzbot monitor:
https://lore.kernel.org/linux-wireless/20230216053633.20366-1-pkshih@realtek.com/T/#u
#regzbot fix: wifi: rtw88: use RTW_FLAG_POWERON flag to prevent to power
on/off twice
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
