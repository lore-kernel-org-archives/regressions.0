Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD56920F7
	for <regressions@lists.linux.dev>; Sun, 23 Oct 2022 14:58:21 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1omcQd-0002qe-Db; Sun, 23 Oct 2022 16:58:19 +0200
Message-ID: <a7eb41bf-3503-3057-783e-205ec4c2dc96@leemhuis.info>
Date: Sun, 23 Oct 2022 16:58:18 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] efi/libstub: arm64: avoid SetVirtualAddressMap() when
 possible #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220916101843.495879-1-ardb@kernel.org>
 <56877644-8173-d2ed-ed00-7973734a3698@huawei.com>
 <9c06c75d-5079-dd27-6533-c053c986083e@leemhuis.info>
In-Reply-To: <9c06c75d-5079-dd27-6533-c053c986083e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1666537101;61c428cf;
X-HE-SMSGID: 1omcQd-0002qe-Db

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]
On 20.10.22 14:39, Thorsten Leemhuis wrote:

>> After entering 6.1-rc1 the efi runtime services is not working on my platform:
>>
>> [    0.054039] Remapping and enabling EFI services.
>> [    0.054043] UEFI virtual mapping missing or invalid -- runtime services will not be available
>>
>> Not sure this patch is the root cause since I see some refactor of efi codes in 6.1-rc1,
>> but simply reverting this make EFI runtime services works again. Tested on HiSilicon's
>> Kunpeng 920 arm64 server using 48 bit VA address:
> 
> #regzbot ^introduced d3549a938b73f203ef522562ae9f2d38aa43d234
> #regzbot title efi/libstub: arm64: efi runtime services stopped working
> #regzbot ignore-activity

#regzbot fixed-by: 37926f96302d8b6

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
