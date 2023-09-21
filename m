Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EF28F49
	for <regressions@lists.linux.dev>; Thu, 21 Sep 2023 08:10:43 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qjEll-0000d8-Jk; Thu, 21 Sep 2023 10:10:41 +0200
Message-ID: <2a298145-b6ec-4b4e-bd45-0cddf62b6052@leemhuis.info>
Date: Thu, 21 Sep 2023 10:10:39 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: what to do on no reproducer case? (was Re: Fwd: Uhhuh. NMI
 received for unknown reason 3d/2d/ on CPU xx)
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <0e6de51b-da1d-43f0-ffae-fb521febbe07@gmail.com>
 <ZQo8hzP-eRjXvtXf@debian.me>
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <ZQo8hzP-eRjXvtXf@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695283844;99c75013;
X-HE-SMSGID: 1qjEll-0000d8-Jk

On 20.09.23 02:27, Bagas Sanjaya wrote:
> [addressing to Thorsten]
> 
> On Sat, Sep 02, 2023 at 07:20:55AM +0700, Bagas Sanjaya wrote:
>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>
>>> seems to be a regression since 6.5 release:
>>> the infamous error message from the kernel on this 32c/64t threadripper:
>>>> [ 2046.269103] perf: interrupt took too long (3141 > 3138), lowering
>>>> kernel.perf_event_max_sample_rate to 63600
>>>> [ 2405.049567] Uhhuh. NMI received for unknown reason 2d on CPU 48.
>>>> [ 2405.049571] Dazed and confused, but trying to continue
>>>> [ 2406.902609] Uhhuh. NMI received for unknown reason 2d on CPU 33.
>>>> [ 2406.902612] Dazed and confused, but trying to continue
>>>> [ 2423.978918] Uhhuh. NMI received for unknown reason 2d on CPU 33.
>>>> [ 2423.978921] Dazed and confused, but trying to continue
> [...]
>>> according to dmesg, this happens without any special reason (I didn't even notice)
>>> some googling points at a ACPI C state problem on AMD CPUs a few years ago
>>> in 5.14 kernels, I didn't see it.
>>
>> See Bugzilla for the full thread.
>>
>> Anyway, I'm adding this regression to be tracked by regzbot:
>>
>> #regzbot introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cgi?id=217857
> 
> This regression looks stalled: on Bugzilla, the reporter keeps asking to me,
> for which I'm not the expert of involved subsystem. And apparently, he still
> had not any reproducer yet (is it triggered by random chance?). Should I
> mark this as inconclusive?

Yes, without a reliable bisection result there sometimes is not much we
can do -- apart from prodding various developers directly and asking for
help or an idea. But in this case that's not worth it afaics, as
messages like
https://lore.kernel.org/all/e08e33d5-4f6d-91aa-f335-9404d16a983c@amd.com/
indicate that it might be a hardware problem and not really a
regression. Hence:

#regzbot resolve: inconclusive: not bisected and might be a hardware
problem after all

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
