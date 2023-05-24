Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD19C8E0
	for <regressions@lists.linux.dev>; Wed, 24 May 2023 09:22:15 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q1kh7-0007zs-M9; Wed, 24 May 2023 11:22:09 +0200
Message-ID: <53ce7dba-24ec-22b2-d3e6-80ad68a09f88@leemhuis.info>
Date: Wed, 24 May 2023 11:22:08 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: verisilicon: Additional fix for the crash when
 opening the driver
Content-Language: en-US, de-DE
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
 <e227724a-fb39-5d68-4453-f03fb532bfde@xs4all.nl>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <e227724a-fb39-5d68-4453-f03fb532bfde@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1684920135;53eb143e;
X-HE-SMSGID: 1q1kh7-0007zs-M9

On 24.05.23 11:15, Hans Verkuil wrote:
> On 24/05/2023 11:06, Thorsten Leemhuis wrote:
>> On 23.05.23 18:36, Benjamin Gaignard wrote:
>>>
>>> Le 23/05/2023 à 18:25, Benjamin Gaignard a écrit :
>>>> This fixes the following issue observed on Odroid-M1 board:
>>> [...]
>>> Diederick, Marek, Michael,
>>> I have tested this patch on my boards and I see no regressions on
>>> decoder part and no more crash when probing the encoder.
>>> Could you test it on your side to confirm it is ok ?
>>
>> They all did, so that is done. Thx for your help, everybody!
>>
>> /me now hopes this patch will be quickly reviewed, accepted and sent to
>> Linus to prevent even more people running into this...
> 
> I plan to make a PR with 6.4 fixes today or tomorrow.

Ahh, fabulous, many thx!

Ciao, Thorsten
