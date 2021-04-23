Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CBF72;
	Fri, 23 Apr 2021 11:11:27 +0000 (UTC)
Received: from ip4d14bd53.dynamic.kabel-deutschland.de ([77.20.189.83] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1lZtiS-0003lY-Nq; Fri, 23 Apr 2021 13:11:20 +0200
To: Takashi Iwai <tiwai@suse.de>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, regressions@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Pablo Neira Ayuso <pablo@netfilter.org>, ksummit@lists.linux.dev,
 workflows@vger.kernel.org
References: <268a3049-7c0b-8a33-1ff6-5a2d35fcba16@leemhuis.info>
 <YIKdQKJNZOSfdL9B@kroah.com>
 <8a44e6b3-fff4-ea6f-2643-bb2a15ff990a@leemhuis.info>
 <s5htunx5ko6.wl-tiwai@suse.de>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: RFC: building a regression tracking bot for Linux kernel
 development
Message-ID: <23587f44-573e-b0b2-30aa-6d68cbbab9d2@leemhuis.info>
Date: Fri, 23 Apr 2021 13:11:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <s5htunx5ko6.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-BS
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1619176288;e4e99be0;
X-HE-SMSGID: 1lZtiS-0003lY-Nq



On 23.04.21 13:01, Takashi Iwai wrote:
> On Fri, 23 Apr 2021 12:49:25 +0200,
> Thorsten Leemhuis wrote:
>>
>> On 23.04.21 12:11, Greg KH wrote:
>>> On Thu, Apr 22, 2021 at 09:16:40AM +0200, Thorsten Leemhuis wrote:
>>>> That can't be all
>>>> -----------------
>>>>
>>>> Of course the world is more complicated than the simple example scenario
>>>> above, as the devil is always in the details. The three most obvious
>>>> problems the initial ideal scenario left aside:
>>>>
>>>> * The reporter doesn't specify the #regzb tag at all. Regzbot can't do
>>>> anything about it, it sadly won't have visionary power and a AI engine
>>>> any time soon. Some human (for a while that often will be me) thus needs
>>>> to reply with the tag with a proper reply-to to the report to make
>>>> regboz track it.
>>>
>>> Any specific format/tag we can use to help make this easier?  Or is that
>>> just something that you are going to do "by hand" to start with?
>>
>> For now making sure regressions@lists.linux.dev is added to the CCed of
>> any replies to regression reports would be a really big help to already
>> establish it as central place where they are all visible. Then no human
>> or bot needs to monitor hundreds of mailing list to find them -- which
>> obviously is doomed to fail and was one of the pain points when I
>> tracked regressions manually years ago.
> 
> That sounds great.

Good :-D

> One thing I still wonder is how to populate the report from distro bug
> trackers.  AFAIK, many reports come from there directly or
> indirectly.
> 
> Can regzbot can have a reference to bug trackers or such?

There was a small, easily missed note about that in the long mail that
started this thread:

```
 * Initially it won't be possible to track reports that are filed in bug
trackers; but this use-case will be kept in mind during the design to
make sure such a functionality can be added later easily.
```

When I wrote that I mainly had the bug trackers used by the ACPI/PM and
DRM people in mind, but yes, making sure that it works for distro
tracker as well is a good point. Thx for bringing this to my attention.
And FWIW: I might leave that out initially, but I guess it won't take
too long before I will add this.

Ciao, Thorsten
