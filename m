Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9013217
	for <regressions@lists.linux.dev>; Mon, 26 Sep 2022 13:37:15 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ocoIF-00061v-5a; Mon, 26 Sep 2022 15:37:07 +0200
Message-ID: <ce38e824-2083-fcce-dc6c-2e6d58c132c2@leemhuis.info>
Date: Mon, 26 Sep 2022 15:37:06 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: tboot suspend broken on Lenovo T460p #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <0b09b35a-64d3-5ba3-dabc-1e36ace1c275@leemhuis.info>
In-Reply-To: <0b09b35a-64d3-5ba3-dabc-1e36ace1c275@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1664199435;0f4e02a1;
X-HE-SMSGID: 1ocoIF-00061v-5a

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 29.04.22 14:03, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> About a week ago a regression was reported to bugzilla.kernel.org that
> seems to be handled there already, nevertheless I'd like to add to the
> tracking to ensure it's not forgotten.
> 
> #regzbot introduced: 453e41085183980087f8a80dada523caf1131c3c
> #regzbot from: Derek Dolney <z23@posteo.net>
> #regzbot title: tboot suspend broken on Lenovo T460p
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215867


#regzbot backburner: fix available, but maintainer didn't pick it up and
developer of the fix is MIA for unkown reason

For details see:
https://lore.kernel.org/lkml/42237005-5a6e-9462-bfdd-f1ba0c725c72@leemhuis.info/

Sigh. That's not how things should be, but happen anyway.

Ciao, Thorsten

> Quote:
> 
>> I am using tboot (v1.10.5) to make use of intel-txt and all was
>> working fine with the Linux kernel 5.10 series. However later in 5.12
>> release candidates, I have  proper booting however suspend is broken.
>> I am using a Lenovo T460p. Usually when suspending on this machine
>> the power button LED will blink 8 times and then it goes into a sleep
>> state. With newer kernels I get power LED and caps lock LED blinking,
>> cpu fan runs fast, and can't get out of that state without hard
>> powerdown.
>>
>> I did a git bisect on and found that commit
>> 453e41085183980087f8a80dada523caf1131c3c is the one that breaks
>> tboot+suspend to ram. It is part of a series of some cpu hotplug
>> commits.
>>
>> Just to be clear: if I build a kernel from the commit just before
>> this one, I can suspend and resume, but if I build with this commit I
>> can not suspend, laptop gets stuck on blinking power LED. Let me also
>> mention that, given the above commit, if I do not use tboot, I can
>> suspend and resume ok. It is only within the tboot boot context that
>> I have suspend&resume problems.
> 
> 
> See the ticket for details, there were a few replies already.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
> 
