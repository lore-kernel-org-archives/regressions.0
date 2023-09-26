Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8449A273CB
	for <regressions@lists.linux.dev>; Tue, 26 Sep 2023 11:51:25 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ql6b3-0004gD-Li; Tue, 26 Sep 2023 13:51:21 +0200
Message-ID: <2e9c9b6a-daee-4d6d-ba93-47965fa2b443@leemhuis.info>
Date: Tue, 26 Sep 2023 13:51:20 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression since 6.1.46 (commit 8ee39ec): rtsx_pci from
 drivers/misc/cardreader breaks NVME power state, preventing system boot
To: Salvatore Bonaccorso <carnil@debian.org>, Ricky WU <ricky_wu@realtek.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Paul Grandperrin <paul.grandperrin@gmail.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Wei_wang <wei_wang@realsil.com.cn>, Roger Tseng <rogerable@realtek.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <5DHV0S.D0F751ZF65JA1@gmail.com>
 <82469f2f-59e4-49d5-823d-344589cbb119@leemhuis.info>
 <2023091333-fiftieth-trustless-d69d@gregkh>
 <7991b5bd7fb5469c971a2984194e815f@realtek.com>
 <2023091921-unscented-renegade-6495@gregkh>
 <995632624f0e4d26b73fb934a8eeaebc@realtek.com>
 <2023092041-shopper-prozac-0640@gregkh>
 <3ddcf5fae0164fbda79081650da79600@realtek.com> <ZRK_Iqj1ZSjx1fZS@eldamar.lan>
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZRK_Iqj1ZSjx1fZS@eldamar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695729086;2bb22162;
X-HE-SMSGID: 1ql6b3-0004gD-Li

On 26.09.23 13:23, Salvatore Bonaccorso wrote:
> On Wed, Sep 20, 2023 at 08:32:17AM +0000, Ricky WU wrote:
>>> On Wed, Sep 20, 2023 at 07:30:00AM +0000, Ricky WU wrote:
>
>>>> This patch is our solution for this issue...
>>>> And now how can I push this?
>>>
>>> Submit it properly like any other patch, what is preventing that from
>>> happening?
>>
>> (commit 8ee39ec) some reader no longer force #CLKREQ to low when system need to enter ASPM.
>> But some platform maybe not implement complete ASPM? I don't know..... it causes problems...
>>
>> Like in the past Only the platform support L1ss we release the #CLKREQ.
>> But new patch we move the judgment (L1ss) to probe, because we met some host will clean the config space from S3 or some power saving mode 
>> And also we think just to read config space one time when the driver start is enough  
> 
> Is there a potential fix which is queued for this or would be the
> safest option to unbreak the regression to revert the commit in the
> stable trees temporarily?
> 
> I'm asking because in Debian we got the report at 
> https://bugs.debian.org/1052063 
> 
> (and ideally to unbreak the situation for the user I would like to
> include a fix in the next upload we do, but following what you as
> upstream will do ideally).

A fix is out for review and will likely be merged for mainline soon:
https://lore.kernel.org/all/37b1afb997f14946a8784c73d1f9a4f5@realtek.com/
https://lore.kernel.org/all/2023092522-climatic-commend-8c99@gregkh/

A few distros reverted the culprit for now in their stable trees.

HTH, Ciao,  Thorsten

