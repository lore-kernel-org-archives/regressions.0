Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E59A53B9
	for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 09:02:09 +0000 (UTC)
Received: from 46.183.103.8.relaix.net ([46.183.103.8] helo=[172.18.99.178]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qUO23-0003Fi-C9; Fri, 11 Aug 2023 11:02:07 +0200
Message-ID: <c2f38e22-547d-9dec-cb50-95df3ba62975@leemhuis.info>
Date: Fri, 11 Aug 2023 11:02:06 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/29] drm/amdkfd: Refactor migrate init to support
 partition switch
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Cc: amd-gfx@lists.freedesktop.org
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230510212333.2071373-28-alexander.deucher@amd.com>
 <647beed4-9d0b-e351-6f66-756f73eb73a5@daenzer.net>
 <620b0254-cdf7-b3aa-adfc-d7bda286b641@leemhuis.info>
In-Reply-To: <620b0254-cdf7-b3aa-adfc-d7bda286b641@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1691744529;1d2c900c;
X-HE-SMSGID: 1qUO23-0003Fi-C9

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 19.07.23 18:17, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> On 17.07.23 15:09, Michel Dänzer wrote:
>> On 5/10/23 23:23, Alex Deucher wrote:
>>> From: Philip Yang <Philip.Yang@amd.com>
>>>
>>> Rename smv_migrate_init to a better name kgd2kfd_init_zone_device
>>> because it setup zone devive pgmap for page migration and keep it in
>>> kfd_migrate.c to access static functions svm_migrate_pgmap_ops. Call it
>>> only once in amdgpu_device_ip_init after adev ip blocks are initialized,
>>> but before amdgpu_amdkfd_device_init initialize kfd nodes which enable
>>> SVM support based on pgmap.
>>>
>>> svm_range_set_max_pages is called by kgd2kfd_device_init everytime after
>>> switching compute partition mode.
>>>
>>> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
>>> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>
>> I bisected a regression to this commit, which broke HW acceleration on this ThinkPad E595 with Picasso APU.

#regzbot fix: drm/amdkfd: disable IOMMUv2 support for Raven
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

