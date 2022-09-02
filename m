Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95F71860
	for <regressions@lists.linux.dev>; Fri,  2 Sep 2022 11:23:59 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oU4mB-00062e-Sn; Fri, 02 Sep 2022 13:23:55 +0200
Message-ID: <6134ee07-a6c4-18e8-d54e-def4896821db@leemhuis.info>
Date: Fri, 2 Sep 2022 13:23:55 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [loop] efcfec579f: mdadm-selftests.12imsm-r0_2d-grow-r0_3d.fail
 #forregzbot
Content-Language: en-US, de-DE
To: Philip Li <philip.li@intel.com>
Cc: "Si, Beibei" <Beibei.Si@intel.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "Sang, Oliver" <oliver.sang@intel.com>, lkp@intel.com
References: <BN6PR11MB1729F27147FBD06FDED3F355FB659@BN6PR11MB1729.namprd11.prod.outlook.com>
 <384393c2-6155-9a07-ebd4-c2c410cbe947@leemhuis.info>
 <YxC5PJJlAG7VycLP@rli9-MOBL1.ccr.corp.intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <YxC5PJJlAG7VycLP@rli9-MOBL1.ccr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1662117839;82114b13;
X-HE-SMSGID: 1oU4mB-00062e-Sn

TWIMC for those that might not be aware of it: there is a parallel
discussion about the interaction about 0day and regzbot ongoing here:
https://lore.kernel.org/regressions/57c596f7-014f-1833-3173-af3bad2ca45d@leemhuis.info/

On 01.09.22 15:53, Philip Li wrote:
> On Mon, Aug 15, 2022 at 09:19:30PM +0800, Thorsten Leemhuis wrote:
>> On 10.08.22 07:44, Si, Beibei wrote:
> [...]
>> Would be really really great if these mails could also directly tell
>> users to add links tags that point to the report, e.g. in this case the
>> mail from Oliver that started this thread:
>>
>> ```
>>  If you fix the issue, kindly add following tag
>>  Reported-by: kernel test robot <oliver.sang@intel.com>
>>  Link: https://lore.kernel.org/lkml/YvEgyQM%2FWi0E2J3J@xsang-OptiPlex-9020/
>> ```
>>
>> Obviously you need the msgid of the mail before you sent it in this
>> case, but I assume you generate those mails semi-automatically anyway,
>> so it hopefully won't be too hard to add this.
> 
> Thanks, this is really great suggestion for us, we will be able to add
> this Link tag in future.

Great, thx.

> [...]
>> I care deeply in the case of 0-bot when the reports contains lines like
>> this:
>>
>>>> #regzbot introduced: efcfec579f
>> That's because regzbot uses the URL in Link: tags to associate patch
>> postings and commits with reports -- and even automatically closes
>> regression tracking entries in case a fix linking to a tracked report is
>> committed to the appropriate tree. A proper "Link:" tag thus saves me a
>> lot of trouble, as I otherwise have to tell regzbot manually about each
>> fix for tracked issues, which quickly becomes a PITA. :-/
>>
>> BTW: I noticed this was not the only recent reports from the kernel test
>> robot that directly got regzbot involved, but not all do. Is some bot
>> decising this or a human?
> 
> this is controlled by human, we try to connect with regzbot for the regression
> we found on mainline. So we add #regzbot after we confirm the issue is valid
> on mainline.

Okay, good to know. As maybe visible between the lines in the other mail
I linked above already: I guess it's fine that way and we should
continue with this and just see how it goes.

> BTW: 0day does testing on nearly all repos from developer to maintainers
> to next and mainline, thus part of them are bisected down to mainline.

Yeah, I know. Regzbot in principle is handling next as well, but I guess
we should ignore that for now with 0day, as keeping an eye on the
reports against mainline keeps me quite busy already.

>> Because the thing is: the time I can spend on tracking regressions is
>> limited, hence I (at least for now) want to avoid spending any time on
>> regressions that likely only ever show up in CI testing. But if the
> 
> got it, probably we need consider a few test suites (and kernel configruations)
> that is more "standard", such as kselftests. But this is hard, for example,
> we detects performance issue on micro benchmark, and it only shows one perspective
> to developer as it may not reflect the use scenario of developer (thus sometimes
> it is not reasonable/necessary to fix).

Yeah, it's hard. :-/

>> problem is something that is likely to be seen in the wild it's totally
>> okay for me if you get regzbot involved. FWIWI, it remains to be seen if
>> that's a good idea in general (and is likely something I will bring up
>> for discussion on this years kernel summit), but let's just give it a
>> try. :-D
> 
> Thanks, we will stop this default behavior to send them directly regzbot. 

See above, as I said, it's fine for me if you just continue to get
regzbot involved for now and I'll get in contact if it becomes a problem
for me.

> [...]
> BTW: i want to consult that anyone (or CI) else send report to regzbot directly so far?
> 
> [1] https://lore.kernel.org/lkml/6b12a0b4-2f6d-1c35-f2e2-a28022583c47@leemhuis.info/

A few developers and users get regzbot directly involved when reporting
regressions, but I add most of the issues to the tracking. But no CI is
doing it currently. How to handle reports from CI is actually something
I hope to discuss on kernel and/or maintainers summit in ~10 days, if
time permits.

Ciao, Thorsten
