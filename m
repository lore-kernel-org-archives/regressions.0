Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6DDA92A
	for <regressions@lists.linux.dev>; Wed, 11 Jan 2023 20:16:31 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pFhWO-0004YL-9c; Wed, 11 Jan 2023 21:16:28 +0100
Message-ID: <edc4191e-7912-3e53-c1b4-249713d5ab2b@leemhuis.info>
Date: Wed, 11 Jan 2023 21:16:27 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: =?UTF-8?Q?Re=3a_=5bRegression=5d_Bug=c2=a0216911_-_get=5funmapped?=
 =?UTF-8?Q?=5farea_returns_addresses_below_mmap=5fmin=5faddr?=
Content-Language: en-US, de-DE
To: Liam Howlett <liam.howlett@oracle.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Amanieu d'Antras <amanieu@gmail.com>,
 "maple-tree@lists.infradead.org" <maple-tree@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <0b9f5425-08d4-8013-aa4c-e620c3b10bb2@leemhuis.info>
 <df59eaf6-ae77-adb7-295a-15997950f1f5@leemhuis.info>
 <20230111192217.mgiliyxfh3jt2jvt@revolver>
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230111192217.mgiliyxfh3jt2jvt@revolver>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1673468191;3f219c7d;
X-HE-SMSGID: 1pFhWO-0004YL-9c

On 11.01.23 20:22, Liam Howlett wrote:
> * Linux kernel regression tracking (Thorsten Leemhuis) <regressions@leemhuis.info> [230111 05:54]:

> [...]
> Thanks Thorsten.

yw

> [...]
> I'll send out a patch shortly.

Great, thx!

>>> BTW, let me use this mail to also add the report to the list of tracked
>>> regressions to ensure it's doesn't fall through the cracks:
>>>
>>> #regzbot introduced: d4af56c5c7c6..3499a13168da
>>> https://bugzilla.kernel.org/show_bug.cgi?id=216911
>>> #regzbot title: mm: get_unmapped_area returns addresses below mmap_min_addr
>>> #regzbot ignore-activity
> 
> Just a note that the fixes tag will be outside the above introduced
> range. It will be 54a611b60590 ("Maple Tree: add new data structure")
> 
> I hope this doesn't cause issues with the bots.

Not at all. Regzbot currently[1] only looks out for Link: tags to the
report; in this case both a link to the start of this thread or the
bugzilla ticket will automatically be associated with the report, which
will be automatically marked as resolved by regzbot once a patch with
such a Link: tag lands in mainline.

Ciao, Thorsten

[1] a lot of people forget to place those Link: tags, that's why I at
some point will likely change regzbot to also consider patches as a
related where both the Reported-by and the commit id (in case it's a
fully bisected regression) match a tracked report.
