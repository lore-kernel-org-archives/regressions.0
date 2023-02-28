Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A637E1
	for <regressions@lists.linux.dev>; Tue, 28 Feb 2023 04:29:04 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pWrbq-00006U-1b; Tue, 28 Feb 2023 05:29:02 +0100
Message-ID: <9a6e3e00-bb44-c216-bd39-fd890530f8c1@leemhuis.info>
Date: Tue, 28 Feb 2023 05:29:01 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Bug with /dev/vcs* devices
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 regressions@lists.linux.dev
References: <Y/KS6vdql2pIsCiI@hotmail.com>
 <6685c2ab-fffe-4eb7-b8df-1019f68a5d5d@t-8ch.de>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <6685c2ab-fffe-4eb7-b8df-1019f68a5d5d@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1677558544;abb48135;
X-HE-SMSGID: 1pWrbq-00006U-1b

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 24.02.23 15:25, Thomas Weißschuh wrote:
> On Sun, Feb 19, 2023 at 04:21:46PM -0500, Storm Dragon wrote:
>>
>> This is my first time ever submitting a kernel bug, so I apologize if this is the wrong place. As per the instructions I found, I first filed a bug in Arch Linux:
>>
>> https://bugs.archlinux.org/task/77575
>>
>> I will add the contents of the response here:
>>
>> For the record, here are the 2 associated mailing list threads [1][2].
>> The reason why it affects both LTS and current linux is because it appears a security patch was applied to both trees to fix a UAF (use after free) bug.
>> If that patch is problematic, you should report it upstream to the kernel folks. Maybe even email the patch author directly. It's this patch [3]. Please let us
>> know what you find out.
>> [1] https://lists.archlinux.org/archives/list/arch-general%40lists.archlinux.org/thread/EOSHIVGUZLNAD7BPHSUGOXFYSAFWDYH7/
>> [2] https://lists.archlinux.org/archives/list/arch-general%40lists.archlinux.org/thread/S6R6UDUMX2LWL4HJ74MFNYOES45UBFLF/
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/tty/vt/vc_screen.c?h=v5.15.94&id=fc9e27f3ba083534b8bbf72ab0f5c810ffdc7d18
>>
>> ----------End Response ----------
>>
>> Methods for reproducing the bug are included in the link to the bug above. But I will include one of them here as well. As root:
>>
>> [root@mjollnir ~]# cat /dev/vcsa1
>>    cat: /dev/vcsa1: No such device or address
>>
>> The contents is displayed very briefly before the No such device or address error.
>>
>> Thank you,
>> Storm
> 
> #regzbot title: vc_screen: unexpected ENXIO on read
> #regzbot introduced: 226fae124b2dac217ea5436060d623ff3385bc34 ^

#regzbot fix: ae3419fbac84

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot ignore-activity
