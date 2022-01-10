Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD92CA1
	for <regressions@lists.linux.dev>; Mon, 10 Jan 2022 14:02:30 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1n6vFg-0005FF-59; Mon, 10 Jan 2022 15:02:24 +0100
Message-ID: <a754b7d0-8a20-9730-c439-1660994005d0@leemhuis.info>
Date: Mon, 10 Jan 2022 15:02:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-BW
To: Jakub Kicinski <kuba@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Rao Shoaib <rao.shoaib@oracle.com>, "David S. Miller"
 <davem@davemloft.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>,
 Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>,
 regressions@lists.linux.dev
References: <CAKXUXMzZkQvHJ35nwVhcJe+DrtEXGw+eKGVD04=xRJkVUC2sPA@mail.gmail.com>
 <20220109132038.38f8ae4f@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Observation of a memory leak with commit 314001f0bf92 ("af_unix:
 Add OOB support")
In-Reply-To: <20220109132038.38f8ae4f@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1641823351;b8cf0a38;
X-HE-SMSGID: 1n6vFg-0005FF-59


On 09.01.22 22:20, Jakub Kicinski wrote:
> On Fri, 7 Jan 2022 07:48:46 +0100 Lukas Bulwahn wrote:
>> Dear Rao and David,
>>
>>
>> In our syzkaller instance running on linux-next,
>> https://elisa-builder-00.iol.unh.edu/syzkaller-next/, we have been
>> observing a memory leak in prepare_creds,
>> https://elisa-builder-00.iol.unh.edu/syzkaller-next/report?id=1dcac8539d69ad9eb94ab2c8c0d99c11a0b516a3,
>> for quite some time.
>>
>> It is reproducible on v5.15-rc1, v5.15, v5.16-rc8 and next-20220104.
>> So, it is in mainline, was released and has not been fixed in
>> linux-next yet.
>>
>> As syzkaller also provides a reproducer, we bisected this memory leak
>> to be introduced with  commit 314001f0bf92 ("af_unix: Add OOB
>> support").
>>
>> We also tested that reverting this commit on torvalds' current tree
>> made the memory leak with the reproducer go away.
>>
>> Could you please have a look how your commit introduces this memory
>> leak? We will gladly support testing your fix in case help is needed.
> 
> Let's test the regression/bug report tracking bot :)
> 
> #regzbot introduced: 314001f0bf92

Great, thx for trying, you only did a small mistake: it lacked a caret
(^) before the "introduced", which would have told regzbot that the
parent mail (the one you quoted) is the one containing the report (which
later is linked in patch descriptions of fixes and allows rezgbot to
connect things). That's why regzbot now thinks you reported the issue
and looks out for patches and commits that link to your mail. :-/

Don't worry, I just added it properly and now mark this as duplicate:

#regzbot dup-of:
https://lore.kernel.org/lkml/CAKXUXMzZkQvHJ35nwVhcJe%2BDrtEXGw%2BeKGVD04=xRJkVUC2sPA@mail.gmail.com/

Thx again for trying.


I wonder if this mistake could be avoided. I came up with one idea while
walking the dog:

 * if there is *no* parent mail, then "regzbot introduce" could consider
the current mail as the report

 * if there *is* a parent mail, then "regzbot introduce" could consider
the parent as the report

Then regzbot would have done the right thing in this case. But there is
a "but": I wonder if such an approach would be too much black magic that
confuses more than it helps. What do you think?

Ciao, Thorsten
