Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8A8361
	for <regressions@lists.linux.dev>; Wed,  7 Dec 2022 05:36:33 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p2n6b-0005OG-Sz; Wed, 07 Dec 2022 06:36:30 +0100
Message-ID: <45f96562-e6d9-f586-0fcb-4e4f560f98ea@leemhuis.info>
Date: Wed, 7 Dec 2022 06:36:28 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [GIT PULL] arm64 updates for 6.1-rc1 #forregzbot
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221005144116.2256580-1-catalin.marinas@arm.com>
 <CAMi1Hd38YB2m_r=m0wuDz+wErii37fUq1BJnvN9=y6opDzo_Fw@mail.gmail.com>
 <Y0aq8y5mEZi14lJ/@arm.com>
 <CAMi1Hd3Y9AibeVnh9_KYJ2EXar7bBSypKm4Tixj47htM7ZOURw@mail.gmail.com>
 <CAMi1Hd1VBCFhf7+EXWHQWcGy4k=tcyLa7RGiFdprtRnegSG0Mw@mail.gmail.com>
 <49ab0931-0d45-7884-e7b6-5c7d4de82ee2@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <49ab0931-0d45-7884-e7b6-5c7d4de82ee2@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1670391393;b29cead8;
X-HE-SMSGID: 1p2n6b-0005OG-Sz

On 14.11.22 19:59, Thorsten Leemhuis wrote:
> [Note: this mail is primarily send for documentation purposes and/or for
> regzbot, my Linux kernel regression tracking bot. That's why I removed
> most or all folks from the list of recipients, but left any that looked
> like a mailing lists. These mails usually contain '#forregzbot' in the
> subject, to make them easy to spot and filter out.]
> 
> On 08.11.22 18:28, Amit Pundir wrote:
>> On Tue, 25 Oct 2022 at 18:08, Amit Pundir <amit.pundir@linaro.org> wrote:
>>> On Wed, 12 Oct 2022 at 17:24, Catalin Marinas <catalin.marinas@arm.com> wrote:
>>>> On Sat, Oct 08, 2022 at 08:28:26PM +0530, Amit Pundir wrote:
>>>>> On Wed, 5 Oct 2022 at 20:11, Catalin Marinas <catalin.marinas@arm.com> wrote:
>>>>>> Will Deacon (2):
>>>>>>       arm64: dma: Drop cache invalidation from arch_dma_prep_coherent()
>>>>>
>>>>> Hi Will,
>>>>>
>>>>> This patch broke AOSP on Dragonboard 845c (SDM845). I don't see any
>>>>> relevant crash in the attached log and device silently reboots into
>>>>> USB crash dump mode. The crash is fairly reproducible on db845c. I
>>>>> could trigger it twice in 5 reboots and it always crash at the same
>>>>> point during the boot process. Reverting this patch fixes the crash.
> [...]
> #regzbot ^introduced c44094eee32f
> #regzbot title arm64: crash on the Qualcomm SM8250
> #regzbot monitor
> https://lore.kernel.org/all/20221114110329.68413-1-manivannan.sadhasivam@linaro.org/

#regzbot fixed-by: b7d9aae404841d9999b7476170867ae441e948d2
