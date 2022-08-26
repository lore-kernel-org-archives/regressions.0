Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1749A23DB
	for <regressions@lists.linux.dev>; Fri, 26 Aug 2022 07:49:26 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oRU5b-0005b5-EA; Fri, 26 Aug 2022 09:49:15 +0200
Message-ID: <d88838ed-f49a-ac9f-5b4c-8e58cabf76fb@leemhuis.info>
Date: Fri, 26 Aug 2022 09:49:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: Commit 'r8152: fix a WOL issue' makes Ethernet port on Lenovo
 Thunderbolt 3 dock go crazy
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Hayes Wang <hayeswang@realtek.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <3745745afedb2eff890277041896356149a8f2bf.camel@redhat.com>
 <339e2f94-213c-d707-b792-86d53329b3e5@leemhuis.info>
 <8c214c0b-4b8f-5e62-5aef-76668987e8fd@leemhuis.info>
 <20220825091343.2e5f99dd@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220825091343.2e5f99dd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1661500167;8cdadd88;
X-HE-SMSGID: 1oRU5b-0005b5-EA

On 25.08.22 18:13, Jakub Kicinski wrote:
> On Thu, 25 Aug 2022 09:26:21 +0200 Thorsten Leemhuis wrote:
>> On 24.08.22 13:16, Thorsten Leemhuis wrote:
>>> Hi, this is your Linux kernel regression tracker.
>>>
>>> Quick note before the boilerplate: there is another report about issues
>>> caused by cdf0b86b250fd3 also involving a dock, but apparently it's
>>> ignored so far:
>>> https://bugzilla.kernel.org/show_bug.cgi?id=216333  
>>
>> TWIMC, apparently it's the same problem.
>>
>> Fun fact: Hayes discussed this in privately with the bug reporter
>> according to this comment:
>> https://bugzilla.kernel.org/show_bug.cgi?id=216333#c3
>>
>> Well, that's not how things normally should be handled, but whatever, he
>> in the end recently submitted a patch to fix it that is already merged
>> to net.git:
>>
>> https://lore.kernel.org/lkml/20220818080620.14538-394-nic_swsd@realtek.com/
> 
> Yup, it will be part of 6.0-rc3. 

Great. BTW, a small note for Hayes and reviewers: The commit
b75d61201444 ("r8152: fix the RX FIFO settings when suspending") links
to the report with a "BugLink" tag. You want to use plain "Link:" tags
instead, as explained in the documentation. Also: a "BugLink" tag not
that long ago made Linus write:

```
please stop making up random tags that make no sense.

Just use "Link:"
```

Quote from:
https://lore.kernel.org/all/CAHk-=wgs38ZrfPvy=nOwVkVzjpM3VFU1zobP37Fwd_h9iAD5JQ@mail.gmail.com/

Ciao, Thorsten
