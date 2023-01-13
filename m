Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E75E2F2A
	for <regressions@lists.linux.dev>; Fri, 13 Jan 2023 16:05:36 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pGMYe-00059A-LL; Fri, 13 Jan 2023 17:05:32 +0100
Message-ID: <18fe16c6-ebba-8387-100e-34e5688b9638@leemhuis.info>
Date: Fri, 13 Jan 2023 17:05:32 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH wireless 3/3] wifi: mt76: dma: fix a regression in adding
 rx buffers
Content-Language: en-US, de-DE
To: Kalle Valo <kvalo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <20230113105848.34642-1-nbd@nbd.name>
 <20230113105848.34642-3-nbd@nbd.name>
 <ce9a1141-810a-491a-1293-67beb46efb1f@leemhuis.info>
 <87sfgebf6q.fsf@kernel.org>
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <87sfgebf6q.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1673625937;c8a1e294;
X-HE-SMSGID: 1pGMYe-00059A-LL

On 13.01.23 16:57, Kalle Valo wrote:
> "Linux kernel regression tracking (Thorsten Leemhuis)"
> <regressions@leemhuis.info> writes:
> 
>> On 13.01.23 11:58, Felix Fietkau wrote:
>>> When adding WED support, mt76_dma_add_buf was accidentally changed to set
>>> the skip_buf0 flag for tx buffers on the wrong queue descriptor entry.
>>> Additionally, there is a rxwi leak when rx buffer allocation fails.
>>
>> thx for working on this
>>
>>> Fix this and make the code more readable by adding a separate function for
>>> adding rx buffers.
>>>
>>> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>>> Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>>
>> Many thx for taking care of this. There is one small thing to improve,
>> please add the following tags here to make things easier for future code
>> archaeologists and give proper credit:
> 
> I can add those.

Great, many thx!

>> Link:
>> https://lore.kernel.org/r/CABXGCsMEnQd=gYKTd1knRsWuxCb=Etv5nAre%2BXJS_s5FgVteYA@mail.gmail.com/
>> Reported-by: Mike Lothian <mike@fireburn.co.uk>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216829
>> Reported-by: AngeloGioacchino Del Regno
> 
> But the email is missing for AngeloGioacchino.

/me wonders how that happened

Sorry for that. Here it is again:

Reported-by: AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com>
 Ciao, Thorsten
