Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD3668
	for <regressions@lists.linux.dev>; Sat,  6 Nov 2021 09:26:58 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mjHyT-0000Hd-0L; Sat, 06 Nov 2021 10:26:57 +0100
Message-ID: <f9e01ccd-5bcd-36db-fc84-e7129955e15c@leemhuis.info>
Date: Sat, 6 Nov 2021 10:26:56 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-BS
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <42bcbea6-5eb8-16c7-336a-2cb72e71bc36@redhat.com>
 <466b8730-1424-dfc0-3f14-f279954188b9@leemhuis.info>
 <YYOF9+wDS2J0oqU8@kroah.com>
 <e75eb70e-2495-dce5-34b2-0b933d887f4a@leemhuis.info>
 <YYTju3KSkC2MHvhf@kroah.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: 5.14.14+ USB regression caused by "usb: core: hcd: Add support
 for deferring roothub registration" series
In-Reply-To: <YYTju3KSkC2MHvhf@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1636190819;7669021c;
X-HE-SMSGID: 1mjHyT-0000Hd-0L

On 05.11.21 08:56, Greg KH wrote:
> On Thu, Nov 04, 2021 at 09:50:12AM +0100, Thorsten Leemhuis wrote:
>> aOn 04.11.21 08:04, Greg KH wrote:
>>> On Thu, Nov 04, 2021 at 07:53:37AM +0100, Thorsten Leemhuis wrote:
>>>> On 03.11.21 10:02, Hans de Goede wrote:
>>>>>
>>>>> We (Fedora) have been receiving multiple reports about USB devices stopping
>>>>> working starting with 5.14.14 .
>>>>>
>>>>> An Arch Linux user has found that reverting the first 2 patches from this series:
>>>>> https://lore.kernel.org/all/20210909064200.16216-1-kishon@ti.com/
>>>>>
>>>>> Fixes things (the 3th patch is just some mostly unrelated refactoring/cleanup).
>>>>>
>>>>> See here for the Arch-linux discussion surrounding this:
>>>>> https://bbs.archlinux.org/viewtopic.php?pid=2000956#p2000956
>>>>>
>>>>> And here are 2 Fedora bug reports of Fedora users being unable to use their
>>>>> machines due their mouse + kbd not working:
>>>>>
>>>>> https://bugzilla.redhat.com/show_bug.cgi?id=2019542
>>>>> https://bugzilla.redhat.com/show_bug.cgi?id=2019576
>>>>>
>>>>> Can we get this patch-series reverted from the 5.14.y releases please ?
>>>> #regzbot ^introduced: b7a0a792f864583207c593b50fd1b752ed89f4c1
>>>> #regzbot ignore-activity
>>>
>>> Process question.  Is there anything I need to do here when this is
>>> resolved?  I'm thinking of reverting the offending patches in 5.16-rc1,
>>> but when/if that happens, how will the regzbot know this?
>>
>> You don't need to do something special, but you need to do something ;-)
>> Regzbot will know the regression got resolved if the commit message of
>> the fix (a proper one or a revert) in mainline links to the report with
>> a Link: tag. Hence, the commit should have something like this:
>>
>> Link:
>> https://lore.kernel.org/stable/42bcbea6-5eb8-16c7-336a-2cb72e71bc36@redhat.com/
> 
> Close, the patch will have this link tag:
>     Link: https://lore.kernel.org/r/42bcbea6-5eb8-16c7-336a-2cb72e71bc36@redhat.com
> 
> Is that ok?

Yes, of course it is, in fact I just forgot to do s/stable/r/ when
writing above mail. But an url with /stable/ in it would work, too, as
Regzbot in this case will not care what's between lore.kernel.org/ and
the /<msgid> part.

> I've committed the reverts to my tree and pushed them out so they show
> up in the next linux-next release and will get the reverts to Linus
> before 5.16-rc1.  Let's see if the bot can notice them :)

It should even notice them in linux-next and mark the regression as "to
be fixed" until the commits land mainline. Just to be sure I wanted to
wait for this to happen before writing this mail, but forgot it's
Saturday today -- there thus is no new linux-next, so I have to wait
till Monday. :-/

Ciao, Thorsten

