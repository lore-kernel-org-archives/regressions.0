Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8AAAD36
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 10:32:01 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qRs68-0000ML-HP; Fri, 04 Aug 2023 12:31:56 +0200
Message-ID: <ec277622-a5b4-71c2-123b-18d73499cf6a@leemhuis.info>
Date: Fri, 4 Aug 2023 12:31:55 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btrtl: Load FW v2 otherwise FW v1 for RTL8852C
Content-Language: en-US, de-DE
To: Max Chou <max.chou@realtek.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 "marcel@holtmann.org" <marcel@holtmann.org>
Cc: "johan.hedberg@gmail.com" <johan.hedberg@gmail.com>,
 "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alex_lu@realsil.com.cn" <alex_lu@realsil.com.cn>,
 Hilda Wu <hildawu@realtek.com>, Karen Hsu <karenhsu@realtek.com>,
 KidmanLee <kidman@realtek.com>,
 "juerg.haefliger@canonical.com" <juerg.haefliger@canonical.com>,
 "vicamo.yang@canonical.com" <vicamo.yang@canonical.com>,
 "Riley.Kao@dell.com" <Riley.Kao@dell.com>, Josh Boyer <jwboyer@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20230804055426.6806-1-max.chou@realtek.com>
 <202308040950.3749oOuG5031679@rtits1.realtek.com.tw>
 <b31c10fd01614414b01728db4b7330ba@realtek.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <b31c10fd01614414b01728db4b7330ba@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1691145122;2c63205b;
X-HE-SMSGID: 1qRs68-0000ML-HP

On 04.08.23 12:15, Max Chou wrote:
>> -----Original Message-----
>> [CCing the linux-firmware maintainer, the network maintainers, and the
>> regressions lists]
>>
>> On 04.08.23 07:54, max.chou@realtek.com wrote:
>>> From: Max Chou <max.chou@realtek.com>
>>>
>>> In the commit of linux-firmware project, rtl8852cu_fw.bin is updated
>>> as FW v2 format[1]. Consider the case that if driver did not be updated fo>
>> FW v2 supported[2], it can not use FW v2.
>>>
>>> By Canonical's suggestion, older driver should be able to load FW v1,
>>
>> Well, that's not only Canonical suggestion, that is how things are supposed to
>> be handled in general. See
>> Documentation/driver-api/firmware/firmware-usage-guidelines.rst (alt:
>> https://docs.kernel.org/driver-api/firmware/firmware-usage-guidelines.html
>> ) for details.
>>
>> We had a similar situation in March already with a Wifi driver:
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/c
>> ommit/?id=416a66cae796939d7d096988c72c641656c81c5a
>>
>> Makes me wonder: is there a problem here we should try harder to avoid?
>> Especially as the problem in this case would have been simple to predict by
>> reading the changelog of the linux-firmware change. To quote from
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/c
>> ommit/?id=55e7448533e7
>>
>> ```
>> Note: This firmware patch needs to be used with driver
>> "btrtl: Firmware format v2 support". Please update the driver with this commit:
>> 9a24ce5e29b15c4c6b0c89c04f9df6ce14addefa
>> ```
> 
> Actually, we thought this note is enough. [...]

Yeah, no big deal, error are made and dealt with, and you are working on
that. Thx for that. It's just that the episode got got me thinking:

It's the second time such error is made within a a few months, hence I
wonder if we on the side of the Linux kernel and/or Linux-firmware
should change something to ideally prevent this from happening.

Ciao, Thorsten

