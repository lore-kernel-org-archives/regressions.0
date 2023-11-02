Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9AE1C297
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qyZSq-0002aY-7a; Thu, 02 Nov 2023 16:18:32 +0100
Message-ID: <58a85c78-3aef-4b82-a4f8-a677b2b75ec7@leemhuis.info>
Date: Thu, 2 Nov 2023 16:18:31 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Backport? RIP: 0010:throtl_trim_slice+0xc6/0x320
 caused kernel panic
Content-Language: en-US, de-DE
To: Christian Theune <ct@flyingcircus.io>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org
Cc: linux-block@vger.kernel.org
References: <F5E0BC95-9883-4E8E-83A6-CD9962B7E90C@flyingcircus.io>
 <8624167B-9565-40C7-B151-1FD56EA65310@flyingcircus.io>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <8624167B-9565-40C7-B151-1FD56EA65310@flyingcircus.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698938314;d656c0be;
X-HE-SMSGID: 1qyZSq-0002aY-7a

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking that uses a reduced set of recipients. See link in footer if
these mails annoy you.]

On 02.11.23 16:03, Christian Theune wrote:
>> On 2. Nov 2023, at 15:53, Christian Theune <ct@flyingcircus.io> wrote:
>>
>> Hi,
>>
>> I hope i’m not jumping the gun, but I guess I’d be interested in a backport to said issue … ;)
> 
> It appears I jumped the gun. :(
> 
> I guess 6a5b845b57b122534d051129bc4fc85eac7f4a68 mentioned in https://cdn.kernel.org/pub/linux/kernel/v6.x/ChangeLog-6.1.61 is the fix for this. 
> 
> Sorry for the noise and mea culpa.

Happens, no worries, but here is a tip that might help avoid this in the
future: if you know the mainline commit ids of the culprit and/or the
fix, search for them on lore abbreviated to ~8 characters and with a
wildcard, as that often will turn up fixes and backports (either in
progress or already happened). E.g.
https://lore.kernel.org/all/?q=e8368b57*

Anyway:

#regzbot fix: 6a5b845b57b122534d051129bc4fc85ea
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


