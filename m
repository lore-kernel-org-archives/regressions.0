Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B994B1FA1
	for <regressions@lists.linux.dev>; Thu, 24 Mar 2022 15:13:54 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nXP9s-0003YF-ML; Thu, 24 Mar 2022 16:13:52 +0100
Message-ID: <3b1b8d23-9295-41f8-6aa8-392145ca5c5a@leemhuis.info>
Date: Thu, 24 Mar 2022 16:13:52 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Bug 215605 - [5.14 regression] BUG: unable to handle page fault
 while running badblocks (fsck.ext4 -c) on a raid5 md array #forregzbot
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <53e7de78-4d27-5089-f159-0d443b354666@leemhuis.info>
 <35bafd68-b340-dfaa-dd5f-d45843104f91@leemhuis.info>
 <CAPhsuW44tX0rBpy5c63HgTtRSF=UAAsgv8ZuYE_QTLhi6syXaA@mail.gmail.com>
 <Yh/nbZYmYD6SpZV9@sakura.greysector.net>
 <CAPhsuW4otwSDcOr8NWFhmecM4AfKim5jQ8aoZO-CY4KkwDFCgg@mail.gmail.com>
 <254dc1fb-cda7-6249-35e5-a0c584c41206@leemhuis.info>
 <CAPhsuW5vn7gepzFSn3a1p6SqzFHdvf0N7-U7EoAC7YTnF8wiFQ@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAPhsuW5vn7gepzFSn3a1p6SqzFHdvf0N7-U7EoAC7YTnF8wiFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1648134834;1382e01c;
X-HE-SMSGID: 1nXP9s-0003YF-ML

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 17.03.22 23:41, Song Liu wrote:
> On Thu, Mar 17, 2022 at 6:14 AM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
>>
>> Hi, this is your Linux kernel regression tracker. Top-posting for once,
>> to make this easily accessible to everyone.
>>
>> Song, two weeks ago you said you would try to reproduce this. Any
>> success? Or was the discussion moved somewhere else and I just missed it?
>>
> 
> I haven't got luck to reproduce the issue yet. I will keep trying and
> update when
> there is progress.

#regzbot backburner: things progress slowly, as developer had no luck in
reproducing, but is still trying

>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>
>> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
>> reports on my table. I can only look briefly into most of them and lack
>> knowledge about most of the areas they concern. I thus unfortunately
>> will sometimes get things wrong or miss something important. I hope
>> that's not the case here; if you think it is, don't hesitate to tell me
>> in a public reply, it's in everyone's interest to set the public record
>> straight.
>>
> 
