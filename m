Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B715C15F
	for <regressions@lists.linux.dev>; Wed, 24 May 2023 09:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB84C433D2;
	Wed, 24 May 2023 09:15:46 +0000 (UTC)
Message-ID: <e227724a-fb39-5d68-4453-f03fb532bfde@xs4all.nl>
Date: Wed, 24 May 2023 11:15:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: verisilicon: Additional fix for the crash when
 opening the driver
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
 p.zabel@pengutronix.de, mchehab@kernel.org, m.szyprowski@samsung.com,
 m.tretter@pengutronix.de, didi.debian@cknow.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com, kernel@pengutronix.de,
 regressions@lists.linux.dev
References: <20230523162515.993862-1-benjamin.gaignard@collabora.com>
 <c034db29-b664-793d-35e0-406fdfe2b145@collabora.com>
 <de161e23-1ec6-1c16-b1c4-f423a088b711@leemhuis.info>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <de161e23-1ec6-1c16-b1c4-f423a088b711@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/05/2023 11:06, Thorsten Leemhuis wrote:
> On 23.05.23 18:36, Benjamin Gaignard wrote:
>>
>> Le 23/05/2023 à 18:25, Benjamin Gaignard a écrit :
>>> This fixes the following issue observed on Odroid-M1 board:
>> [...]
>> Diederick, Marek, Michael,
>> I have tested this patch on my boards and I see no regressions on
>> decoder part and no more crash when probing the encoder.
>> Could you test it on your side to confirm it is ok ?
> 
> They all did, so that is done. Thx for your help, everybody!
> 
> /me now hopes this patch will be quickly reviewed, accepted and sent to
> Linus to prevent even more people running into this...

I plan to make a PR with 6.4 fixes today or tomorrow.

Regards,

	Hans

> 
>> Thorsten, I try/test regzbot commands, please tell me if it is correct.
>>
>> #regzbot ^introduced db6f68b51e5c
>> #regzbot title media: verisilicon: null pointer dereference in try_fmt
>> #regzbot ignore-activity
> 
> Thx for this, we just now track this regression two times. No worries,
> let me fix this and also tell regzbot about the fix:
> 
> #regzbot dup-of: https://lore.kernel.org/lkml/4995215.LvFx2qVVIh@bagend/
> #regzbot fix: media: verisilicon: Additional fix for the crash when
> opening the driver
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.

