Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297DC7EB
	for <regressions@lists.linux.dev>; Tue, 26 Sep 2023 04:39:07 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qkzqh-0003tX-Bj; Tue, 26 Sep 2023 06:39:03 +0200
Message-ID: <72d3eae0-efdc-41ad-bed9-008df36f320e@leemhuis.info>
Date: Tue, 26 Sep 2023 06:39:02 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: AMD Geode LX hardware RNG driver produces regular patterns
 (geode-rng.c)
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>, Andres Salomon
 <dilinger@queued.net>, "Timur I. Davletshin" <timur.davletshin@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux AMD GEODE <linux-geode@lists.infradead.org>
References: <9a28c2fc-d769-4802-a1f2-77ba2cb34d25@gmail.com>
 <ZP2ERFydER7pJprL@debian.me> <ZRIplFgg0ZnzGzre@debian.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZRIplFgg0ZnzGzre@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695703148;db3fde87;
X-HE-SMSGID: 1qkzqh-0003tX-Bj

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 26.09.23 02:45, Bagas Sanjaya wrote:
> On Sun, Sep 10, 2023 at 03:54:28PM +0700, Bagas Sanjaya wrote:
>> On Thu, Sep 07, 2023 at 06:37:00PM +0700, Bagas Sanjaya wrote:
>>> #regzbot ^introduced: v4.14.267..v5.15.127
>>> #regzbot title: predictable urandom output on Alix 2d13
>>>
>>
>> #regzbot fix: https://lore.kernel.org/lkml/20230910083418.8990-1-jonas.gorski@gmail.com/
>>
> 
> Fix up:
> 
> #regzbot fix: hwrng: geode: fix accessing registers

Fix afaics was slightly renamed on merge, hence:

#regzbot fix: hwrng: geode - fix accessing registers
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
