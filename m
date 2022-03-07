Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30117A
	for <regressions@lists.linux.dev>; Mon,  7 Mar 2022 14:26:36 +0000 (UTC)
Received: from [77.20.72.149] (helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nREJk-0002Tm-M3; Mon, 07 Mar 2022 15:26:32 +0100
Message-ID: <0011724c-655b-a667-9ff7-0e18c2a8c3f5@leemhuis.info>
Date: Mon, 7 Mar 2022 15:26:31 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Linux regressions report for mainline [2022-03-06]
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Marcel Holtmann <marcel@holtmann.org>, Jakub Kicinski <kuba@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Netdev <netdev@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
References: <164659571791.547857.13375280613389065406@leemhuis.info>
 <CAHk-=wgYjH_GMvdnNdVOn8m81eBXVykMAZvv_nfh8v_qdyQNvA@mail.gmail.com>
 <4a28b83b-37ef-1533-563a-39b66c5ff158@leemhuis.info>
 <CAL_JsqLHun+X4jMwTbVMmjjETfbP73j52XCwWBj9MJCkpQ41mA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAL_JsqLHun+X4jMwTbVMmjjETfbP73j52XCwWBj9MJCkpQ41mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1646663196;db28dbbe;
X-HE-SMSGID: 1nREJk-0002Tm-M3

On 07.03.22 14:34, Rob Herring wrote:
> On Mon, Mar 7, 2022 at 1:32 AM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
>>
>> On 06.03.22 22:33, Linus Torvalds wrote:
>>> On Sun, Mar 6, 2022 at 11:58 AM Regzbot (on behalf of Thorsten
>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>
>>>> ========================================================
>>>> current cycle (v5.16.. aka v5.17-rc), culprit identified
>>>> ========================================================
>>>>
>>>> Follow-up error for the commit fixing "PCIe regression on APM Merlin (aarch64 dev platform) preventing NVME initialization"
>>>> ---------------------------------------------------------------------------------------------------------------------------
>>>> https://linux-regtracking.leemhuis.info/regzbot/regression/Yf2wTLjmcRj+AbDv@xps13.dannf/
>>>> https://lore.kernel.org/stable/Yf2wTLjmcRj%2BAbDv@xps13.dannf/
>>>>
>>>> By dann frazier, 29 days ago; 7 activities, latest 23 days ago; poked 13 days ago.
>>>> Introduced in c7a75d07827a (v5.17-rc1)
> Actually, it was introduced over a year ago in 6dce5aa59e0b. It was
> fixed in c7a75d07827a for XGene2, but that *further* broke XGene1
> which was just reported this cycle.

Many thx for the clarification, I'll update the regzbot entry
accordingly and..

>>> Hmm. The culprit may be identified, but it looks like we don't have a
>>> fix for it, so this may be one of those "left for later" things. It
>>> being Xgene, there's a limited number of people who care, I'm afraid.
>>>
>>> Alternatively, maybe 6dce5aa59e0b ("PCI: xgene: Use inbound resources
>>> for setup") should just be reverted as broken?
>>
>> I don't care much, I just hope someone once again will look into this,
>> as this (and the previous) regression are on my list for quite a while
>> already and process once again seems to have slowed down. :-/
> 
> It's going to take some more debug patches from me as what's been
> tried so far didn't work and I'm not ready to give up and revert this
> cleanup.

...will mark it as "on backburner" then, which stands for "get it out of
sight, but don't forget about this completely".

Ciao, Thorsten
