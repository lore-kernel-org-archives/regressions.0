Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB34117FF
	for <regressions@lists.linux.dev>; Wed, 11 Jan 2023 10:15:27 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pFY8e-0001Fo-9E; Wed, 11 Jan 2023 11:15:20 +0100
Message-ID: <373f5280-baf0-7d6a-7176-09d63b146d28@leemhuis.info>
Date: Wed, 11 Jan 2023 11:15:19 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#adding)" <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Suspend to ram fails due to tpm errors, caused by a race or something
 that happens more often now
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1673432128;f19b9d6f;
X-HE-SMSGID: 1pFY8e-0001Fo-9E

Hi! This is a mail send just for tracking purposes. It's meant as a
follow up to the thread
https://lore.kernel.org/all/7cbe96cf-e0b5-ba63-d1b4-f63d2e826efa@suse.cz/
which ended like this:

> On 10.01.23 18:19, Vlastimil Babka wrote:
>> On 1/9/23 17:08, Jason A. Donenfeld wrote:
>>>
>>> So, this is now in rc3:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1382999aa0548a171a272ca817f6c38e797c458c
>>>
>>> That should help avoid the worst of the issue -- laptop not sleeping.
>>> But the race or whatever it is still does exist. So you might want to
>>> keep this in your tracker to periodically nudge the TPM folks about it.
>> 
>> Heh, booted rc3 and managed to hit it on very first suspend to ram attempt:
>> 
>> tpm tpm0: A TPM error (28) occurred continue selftest
>> 
>> But thanks to the patch, the next suspend worked:
>> 
>> [  236.598900] tpm tpm0: Error (28) sending savestate before suspend
>> [  236.598915] tpm_tis 00:08: Ignoring error 28 while suspending
>> 
>> and on resume again:
>> 
>> [  238.196645] tpm tpm0: A TPM error (28) occurred continue selftest
>> 
>> and indeed now I keep getting (as expected)
>> 
>> [  399.671077] tpm tpm0: A TPM error (28) occurred attempting get random
>> 
>> So hopefully somebody will look into the root cause at some point.

IOW: the regression is kinda solved (and marked as such in regzbot),
kinda not. To ensure the regression tracking doesn't loose track of it,
create another entry as a follow up:

#regzbot ^introduced v6.0..v6.1-rc4
#regzbot from: Vlastimil Babka <vbabka@suse.cz>
#regzbot title tpm: suspend to ram fails due to tpm errors, caused by a
race or something that happens more often now
#regzbot monitor
https://lore.kernel.org/all/58d7a42c-9e6b-ab2a-617f-d5e373bf63cb@suse.cz/
#regzbot ignore-activity


Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
