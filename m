Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A482F3A
	for <regressions@lists.linux.dev>; Thu, 15 Dec 2022 12:12:43 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p5n6P-000529-2s; Thu, 15 Dec 2022 13:12:41 +0100
Message-ID: <497de3c9-605f-d791-c8a9-e7ed1a080af1@leemhuis.info>
Date: Thu, 15 Dec 2022 13:12:40 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [regression] [Bug 216804] Lenovo IdeaPad 5 Flex 14ALC7 trackpad
 does not work past 5.19.10, patch in 6.1 has no effect
Content-Language: en-US, de-DE
To: Hans de Goede <hdegoede@redhat.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <0dabe251-0182-28d0-705d-d50e27bde39d@leemhuis.info>
 <5b1b6d7a-ed5c-9ca1-b215-a32c07a40140@redhat.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <5b1b6d7a-ed5c-9ca1-b215-a32c07a40140@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671106363;a096c4fa;
X-HE-SMSGID: 1p5n6P-000529-2s



On 15.12.22 12:13, Hans de Goede wrote:
> Hi,
> 
> On 12/15/22 08:43, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> I noticed a regression reported in bugzilla.kernel.org that seems to be
>> handled there already, nevertheless I'd like to add to the tracking to
>> ensure it's doesn't fall through the cracks in the end:
>>
>> #regzbot introduced: 9946e39fe8d0
>> https://bugzilla.kernel.org/show_bug.cgi?id=216804
>> #regzbot monitor
>> https://lore.kernel.org/all/20221213201311.10022-1-adrian@freund.io/
>> #regzbot ignore-activity
> 
> A patch fixing this has already been posted, see:
> 
> https://lore.kernel.org/linux-acpi/20221213201311.10022-1-adrian@freund.io/
> 
> Sorry I don't know what the regzbot command to let regzbot know
> about this.

No worries and thx for letting me know. FWIW, look a bit upwards, there
you find a similar looking link, as I was aware of that patch already.

> Maybe include a link to some regzbot manual / cheat-sheet
> in the standard footer of these mails?

Good idea, will look into that again. I actually had one for some of my
mails, but I was not consequent and also dropped it for some cases along
the way. :-/

Ciao, Thorsten

P.S.: for completeness, here are the docs:
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
