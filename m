Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBB3259C
	for <regressions@lists.linux.dev>; Thu,  7 Sep 2023 14:34:32 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qeG5X-0004US-7J; Thu, 07 Sep 2023 16:34:31 +0200
Message-ID: <c05272d6-2fc2-4d61-96de-69e06ff3250f@leemhuis.info>
Date: Thu, 7 Sep 2023 16:34:30 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: which regression to add to the tracking (Was: Fwd: AMD Geode LX
 hardware RNG driver produces regular patterns (geode-rng.c))
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
References: <9a28c2fc-d769-4802-a1f2-77ba2cb34d25@gmail.com>
 <3d7825ad-ebde-4ff0-878c-fdf970bc82ba@leemhuis.info>
 <5627ee60-8f74-0595-b901-f8cbf161e582@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <5627ee60-8f74-0595-b901-f8cbf161e582@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1694097273;3f8804c9;
X-HE-SMSGID: 1qeG5X-0004US-7J

On 07.09.23 16:24, Bagas Sanjaya wrote:
> On 07/09/2023 21:12, Thorsten Leemhuis wrote:
>> Hi Bagas! Thanks again for all the work your do, it helps a lot. But it
>> might be better to discuss something related to a message of yours from
>> earlier today.
> OK, let's see.

thx for your reply.

>>> Subject: Fwd: AMD Geode LX hardware RNG driver produces regular
>>> patterns (geode-rng.c)
>>> Date: Thu, 7 Sep 2023 18:37:00 +0700
>>>
>>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>>
>>>> System: Alix board 2d13 (AMD Geode LX800) running OpenWrt
>>>> 23.05.0-rc3 (kernel 5.15.127)
>>>>
>>>> Steps to reproduce:
>>>>
>>>> cat /dev/hwrng and see output. Output in console shows regular
>>>> pattern, rngd daemon (from rng-tools) refuses to run because of low
>>>> entropy from /dev/hwrng. Pattern doesn't change until I reboot
>>>> system.
>>>>
>>>> Important notice: This problem started somewhere between 4.14.267
>>>> (kernel used in OpenWrt 19.07.9) and my current 5.15.127.
>>
>> I wonder if it is wise or a good idea at all to (1) forward these
>> regressions reports to the developers while (2) adding them to the
>> regression tracking:
> 
> I'm on the err side of adding relevant devs so that they can reach
> the reporter.

That might or might not be a good idea, as devs might start to ignore
your mails (and mine maybe, too) if too many of them contained reports
that didn't reach certain standards.

>> * I'm not sure if OpenWrt's kernel is close to vanilla; I guess many
>> developers won't have an idea either and thus might ignore the report
>> (which they are free to)[1].
> FWIK (from what I know), I'm not openwrt kernel hacker, so I don't know
> how to build kernels for it and flash it to my router.

Yeah, same here. In that case simply asking the reporter to check that
and mention the answer when forwarding is best.

>> * 5.15.y in ancient for upstream kernel standards, hence mainline
>> developers might ignore this report (see [1])
>> * the span (v4.14.267..v5.15.127) is extremely large and the regression
>> might be caused my a mainline change or by the stable team; hence it's
>> unclear who has to handle it and thus might be ignored by both camps
>> (see [1])
> Yikes! I forgot to ask the reporter to also try mainline (which is mostly
> what I do in this case).

+1

>> * I'm swamped with work already, so I can't follow up to each of those
>> reports, hence adding them to the tracking is likely of no benefit for
>> anyone.
>> I in this case would have asked the reporter to test mainline first
>> before taking further action.
> Ack.
> 
>> None of this is a big deal (and with a bit of luck some developer will
>> look into this), but there were similar things with a few of the other
>> reports you forwarded. I wonder how we could reach a situation that is
>> more fruitful for everyone involved (you, me, the reporters, developers
>> that receive mails like the one quoted above). Which leads to the question:
>>
>> Are you planning to continue your regression report monitoring work for
>> the foreseeable future? Then it might be best if I start on a
>> "contributor guide" or something like that which mentions some basic
>> quality aspects a report should reach before it is forwarded. Or do you
>> have a better idea?
>>
> 
> Likely so.
> 
> I think for a good regression report:
> 
> * as always, test mainline first
> * if it still reproducible on mainline, bisect. When reporting,
>   specify commit range as narrow as possible (or better, exact culprit commit)
> * provide relevant logs (preferably in LC_ALL=C) and clear description

yeah; but fwiw, forwarding after testing mainline is fine, as sometimes
the devs will known about the problem already and then reports don't
have to waste time on a bisection.

Anyway, thx again for your work. I guess sooner or later I might find
the time to work on that contributor guide. Or would a checklist be
better (might help myself, as I sometimes forgot to check certain
aspects myself...)?

Ciao, Thorsten
