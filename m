Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD191872
	for <regressions@lists.linux.dev>; Mon, 15 Aug 2022 13:19:34 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oNa0A-0008AT-U6; Mon, 15 Aug 2022 15:19:30 +0200
Message-ID: <384393c2-6155-9a07-ebd4-c2c410cbe947@leemhuis.info>
Date: Mon, 15 Aug 2022 15:19:30 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: "Si, Beibei" <beibei.si@intel.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: "Li, Philip" <philip.li@intel.com>, "Sang, Oliver" <oliver.sang@intel.com>
References: <BN6PR11MB1729F27147FBD06FDED3F355FB659@BN6PR11MB1729.namprd11.prod.outlook.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [loop] efcfec579f: mdadm-selftests.12imsm-r0_2d-grow-r0_3d.fail
 #forregzbot
In-Reply-To: <BN6PR11MB1729F27147FBD06FDED3F355FB659@BN6PR11MB1729.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1660569574;20e6e511;
X-HE-SMSGID: 1oNa0A-0008AT-U6

On 10.08.22 07:44, Si, Beibei wrote:
> #regzbot ^introduced efcfec579f
> #regzbot title [loop] efcfec579f: mdadm-selftests.12imsm-r0_2d-grow-r0_3d.fail

Thx for trying to get regzbot involved, but FWIW, the original mail from
Oliver already did so. :-D Hence let me mark this entry as a duplicate:

#regzbot dup-of:
https://lore.kernel.org/lkml/YvEgyQM%2FWi0E2J3J@xsang-OptiPlex-9020/

While at it something else:

>> -----Original Message-----
>> From: Sang, Oliver <oliver.sang@intel.com>
>> Sent: Monday, August 8, 2022 10:42 PM
>> To: Darrick J. Wong <darrick.wong@oracle.com>
>> Cc: Jens Axboe <axboe@kernel.dk>; Christoph Hellwig <hch@lst.de>; LKML
>> <linux-kernel@vger.kernel.org>; linux-block@vger.kernel.org; lkp@lists.01.org;
>> lkp <lkp@intel.com>; regressions@lists.linux.dev
>> Subject: [loop] efcfec579f: mdadm-selftests.12imsm-r0_2d-grow-r0_3d.fail

>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>

Would be really really great if these mails could also directly tell
users to add links tags that point to the report, e.g. in this case the
mail from Oliver that started this thread:

```
 If you fix the issue, kindly add following tag
 Reported-by: kernel test robot <oliver.sang@intel.com>
 Link: https://lore.kernel.org/lkml/YvEgyQM%2FWi0E2J3J@xsang-OptiPlex-9020/
```

Obviously you need the msgid of the mail before you sent it in this
case, but I assume you generate those mails semi-automatically anyway,
so it hopefully won't be too hard to add this.

These tags are considered important by Linus and others, as they allow
anyone to look into the backstory weeks or years later. That is why they
should be placed in cases like this, as
Documentation/process/submitting-patches.rst and
Documentation/process/5.Posting.rst explain in more detail.

I care deeply in the case of 0-bot when the reports contains lines like
this:

>> #regzbot introduced: efcfec579f
That's because regzbot uses the URL in Link: tags to associate patch
postings and commits with reports -- and even automatically closes
regression tracking entries in case a fix linking to a tracked report is
committed to the appropriate tree. A proper "Link:" tag thus saves me a
lot of trouble, as I otherwise have to tell regzbot manually about each
fix for tracked issues, which quickly becomes a PITA. :-/


BTW: I noticed this was not the only recent reports from the kernel test
robot that directly got regzbot involved, but not all do. Is some bot
decising this or a human?

Because the thing is: the time I can spend on tracking regressions is
limited, hence I (at least for now) want to avoid spending any time on
regressions that likely only ever show up in CI testing. But if the
problem is something that is likely to be seen in the wild it's totally
okay for me if you get regzbot involved. FWIWI, it remains to be seen if
that's a good idea in general (and is likely something I will bring up
for discussion on this years kernel summit), but let's just give it a
try. :-D

Ciao, Thorsten
