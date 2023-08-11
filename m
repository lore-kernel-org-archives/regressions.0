Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03B45692
	for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 15:54:15 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4RMpHy3M3gz9tSP
	for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 17:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1691769246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTuajfLsCcGMa9IOnk3R+jfgWRd85G1t+7EPVjfW77E=;
	b=gwhhpQP8dEFY8pefMHycDikpg/IH7IaDz9TSF5kWMPlZnfH7JhHJAHCzKCa0sYRNoS8toc
	NJoneuJiH12ZBb23Fv8tlnTINrYMvf6fT9BbBwjlc28Zsax9TKNsy3PqHwfuJY7aoEmzSE
	4nK5+4FnJQZERlttY4akFj01tSCfwitDy2e8oR6euQa2sooN2FOPs8v6P/wYOP7Stcq9Vz
	VKne66XogltVeMGWZ7TTh6BwcutgjIZ7ATv0yoq5el54GcwlICwXehbqU6oBgVpyk1+5pX
	jja+NOQrUJ19yUYjoUIh4jyJvyKP8DIwcnZNa1/YaRRghoB/6EXd574ekChMFA==
Message-ID: <a5e1f671-af9c-de7d-af6d-6193c6907389@mailbox.org>
Date: Fri, 11 Aug 2023 17:54:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 28/29] drm/amdkfd: Refactor migrate init to support
 partition switch
Content-Language: en-CA, de-CH-frami
To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230510212333.2071373-28-alexander.deucher@amd.com>
 <647beed4-9d0b-e351-6f66-756f73eb73a5@daenzer.net>
 <620b0254-cdf7-b3aa-adfc-d7bda286b641@leemhuis.info>
 <c2f38e22-547d-9dec-cb50-95df3ba62975@leemhuis.info>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <c2f38e22-547d-9dec-cb50-95df3ba62975@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xi39diuw48r9yqp7ocr1qb64b5ugwg81
X-MBO-RS-ID: 85773b433e857374289

On 8/11/23 11:02, Linux regression tracking #update (Thorsten Leemhuis) wrote:
> [TLDR: This mail in primarily relevant for Linux kernel regression
> tracking. See link in footer if these mails annoy you.]
> 
> On 19.07.23 18:17, Linux regression tracking #adding (Thorsten Leemhuis)
> wrote:
>> On 17.07.23 15:09, Michel Dänzer wrote:
>>> On 5/10/23 23:23, Alex Deucher wrote:
>>>> From: Philip Yang <Philip.Yang@amd.com>
>>>>
>>>> Rename smv_migrate_init to a better name kgd2kfd_init_zone_device
>>>> because it setup zone devive pgmap for page migration and keep it in
>>>> kfd_migrate.c to access static functions svm_migrate_pgmap_ops. Call it
>>>> only once in amdgpu_device_ip_init after adev ip blocks are initialized,
>>>> but before amdgpu_amdkfd_device_init initialize kfd nodes which enable
>>>> SVM support based on pgmap.
>>>>
>>>> svm_range_set_max_pages is called by kgd2kfd_device_init everytime after
>>>> switching compute partition mode.
>>>>
>>>> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
>>>> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>
>>> I bisected a regression to this commit, which broke HW acceleration on this ThinkPad E595 with Picasso APU.
> 
> #regzbot fix: drm/amdkfd: disable IOMMUv2 support for Raven
> #regzbot ignore-activity
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

Danke Thorsten!


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

