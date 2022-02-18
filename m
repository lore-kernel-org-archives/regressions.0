Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA95F48CA
	for <regressions@lists.linux.dev>; Fri, 18 Feb 2022 11:23:47 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nL1MY-0007dO-54; Fri, 18 Feb 2022 12:23:46 +0100
Message-ID: <0debe946-9418-c8aa-9ba4-ecc77f8dac53@leemhuis.info>
Date: Fri, 18 Feb 2022 12:23:45 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: 100 ms boot time increase regression in
 acpi_init()/acpi_scan_bus() #forregzbot
Content-Language: en-BS
Cc: Paul Menzel <pmenzel@molgen.mpg.de>
References: <b177cb21-aa01-2408-9b26-164c028b6593@molgen.mpg.de>
 <31603144-edec-df2d-fb46-283692c67420@leemhuis.info>
 <CAJZ5v0hyp1nR5id02abZh4cjw=sT0J_nf9spbUHfuwzjdJb5KA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: regressions@lists.linux.dev
In-Reply-To: <CAJZ5v0hyp1nR5id02abZh4cjw=sT0J_nf9spbUHfuwzjdJb5KA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1645183428;6e61cc85;
X-HE-SMSGID: 1nL1MY-0007dO-54

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 08.02.22 18:59, Rafael J. Wysocki wrote:
> On Tue, Feb 8, 2022 at 1:03 PM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
>>
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> Top-posting for once, to make this easy accessible to everyone.
>>
>> @Rafael or any other @acpi/@pm developer: what's the status here?
>> Neither in this thread nor in the bug ticket anything happened afaics.
>> Or is a 100ms boot time increase considered "not a regression"?
> 
> It is on my list of things to look into, because it used to work
> faster, so depending on what change made it work slower, it may be
> possible to restore the previous performance without sacrificing too
> much.
> 
> I honestly don't think that it is a noticeable issue for users in the
> field, though.

Great. FWIW, I'm putting this in regzbot on "backburner", as it's
something that shouldn't be forgotten, but is less urgent then other
regressions

#regzbot backburner: not that urgent, still on the developers's todo list
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.
