Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1D833FC
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 15:21:27 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pMVyH-00031O-36; Mon, 30 Jan 2023 16:21:25 +0100
Message-ID: <794e2dd8-5412-e74d-66de-7e19b2c3ab39@leemhuis.info>
Date: Mon, 30 Jan 2023 16:21:24 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PASEMI] Nemo board doesn't reboot anymore after the commit "HID:
 usbhid: Add ALWAYS_POLL quirk for some mice" #forregzbot
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
To: linux-input@vger.kernel.org, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de>
 <d0119f9f-421c-069a-91f6-ff7a0187038d@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <d0119f9f-421c-069a-91f6-ff7a0187038d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1675092088;baa7d5cb;
X-HE-SMSGID: 1pMVyH-00031O-36

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 22.12.22 12:24, Thorsten Leemhuis wrote:

> On 22.12.22 11:42, Christian Zigotzky wrote:
>>
>> The Nemo board [1] doesn't reboot anymore since the final kernel 6.1.
>> The reboot works with the RC8 of kernel 6.1.
>> Actually, a reboot works but the CFE firmware is not loaded. Maybe there
>> is still something in the memory after the reboot.
>>
>> I bisected today. [2]
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced f6d910a89a23
> #regzbot title hid: PASEMI Nemo board doesn't reboot anymore
> #regzbot ignore-activity

#regzbot fix: cbf44580ce6b310272a73
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


