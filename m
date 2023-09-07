Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132E110F8
	for <regressions@lists.linux.dev>; Thu,  7 Sep 2023 03:40:36 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qe5sg-0001c0-SR; Thu, 07 Sep 2023 05:40:34 +0200
Message-ID: <f8588a24-85aa-405e-bd4d-7a570f69fe4c@leemhuis.info>
Date: Thu, 7 Sep 2023 05:40:34 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS share
 is mounted (cifsd-cfid-laundromat in"D" state)
Content-Language: en-US, de-DE
To: Linux CIFS <linux-cifs@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Bagas Sanjaya <bagasdotme@gmail.com>
References: <CAO+kfxTwOvaxYV0ZRESxZB-4LHsF9b_VBjAKahhwUm5a1_c4ug@mail.gmail.com>
 <ZPfPfyIoVxw5L6El@debian.me>
 <CAO+kfxQgXOsx6u+xLKGJe0KDiFsRAGstSpnrwxjQF6udgz5HFQ@mail.gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAO+kfxQgXOsx6u+xLKGJe0KDiFsRAGstSpnrwxjQF6udgz5HFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1694058037;6fb4caec;
X-HE-SMSGID: 1qe5sg-0001c0-SR

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 06.09.23 23:03, Brian Pardy wrote:
> Added committer Ronnie Sahlberg to CC.
> 
> On Tue, Sep 5, 2023 at 9:01 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>> On Tue, Sep 05, 2023 at 01:09:05PM -0400, Brian Pardy wrote:
>>> I've noticed an issue with the CIFS client in kernel 6.5.0/6.5.1 that
>>> does not exist in 6.4.12 or other previous kernels (I have not tested
>>> 6.4.13). Almost immediately after mounting a CIFS share, the reported
>>> load average on my system goes up by 2. At the time this occurs I see
>>> two [cifsd-cfid-laundromat] kernel threads running the "D" state,
>>> where they remain for the entire time the CIFS share is mounted. The
>>> load will remain stable at 2 (otherwise idle) until the share is
>>> unmounted, at which point the [cifsd-cfid-laundromat] threads
>>> disappear and load drops back down to 0. This is easily reproducible
>>> on my system, but I am not sure what to do to retrieve more useful
>>> debugging information. If I mount two shares from this server, I get
>>> four laundromat threads in "D" state and a sustained load average of
>>> 4.
> [...]
> 
> Thank you for directing me to the bug-bisect documentation. Results below:
> 
> # git bisect bad
> d14de8067e3f9653cdef5a094176d00f3260ab20 is the first bad commit
>

#regzbot ^introduced: d14de8067e3f9653cdef5a094176d00f3260a
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

