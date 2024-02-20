Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8537762CC
	for <regressions@lists.linux.dev>; Tue, 20 Feb 2024 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708443743; cv=none; b=eWt22O3AURHFFlX0erTczoiu6DSeIfGdqb5NN0pn4JyuKEF8ryDfLp9K8/8jiVHYPKC4UYqfAm1h111KFuA6UN9UicREnbF8fgsvXc16RZ7Vx8fe7lruL4KhYbpBg5GBh7VBGfblXlAKZMN0vRKMwaH9UjNtlY1VGkuT3TOsTVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708443743; c=relaxed/simple;
	bh=Qp7uNOXQM7N8B/4cww3X7mLtzMc8sajkQeJ2htK/O3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VARo7fFb0/DW/Bwby2CQej01CCCzCNxNF+HKQZxRKQAkhh2H/4u1YAPW51NvsvPQyyPCWFLQmcQrpydXXpsyd5BRKP3eBvk04aIaiEV52Xsl07idoUbkbxkKaRhUataWKXBfJoumfpLJz0aSro8wM6DgjpRAbpdlLpXblchepYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rcSG6-0001na-4I; Tue, 20 Feb 2024 16:42:14 +0100
Message-ID: <a6243c3b-d773-4693-88e9-033995616f12@leemhuis.info>
Date: Tue, 20 Feb 2024 16:42:12 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel 6.7+ broke under-powering of my RX 6700XT. (Archlinux,
 mesa/amdgpu)
Content-Language: en-US, de-DE
To: Hans de Goede <hdegoede@redhat.com>, Alex Deucher
 <alexdeucher@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>, Roman Benes <benes@riadoklan.sk.eu.org>
References: <ae64f04d-6e94-4da4-a740-78ea94e0552c@riadoklan.sk.eu.org>
 <2024021732-framing-tactful-833d@gregkh>
 <d369b45f-e1af-4117-83a5-3e429e3bfb23@leemhuis.info>
 <CADnq5_OgPBtYpxBQ+aBmA2t7ob7EFPFWrF9OYXNgm00eEayMNA@mail.gmail.com>
 <62bf771e-640a-45ab-a2de-3df459a9ed30@leemhuis.info>
 <CADnq5_M4Zwv0_B1DoU_a8aNpyPVJj_PpjDG_oi3JkrGC5-hNgg@mail.gmail.com>
 <4bc8747a-d87f-423b-b0ce-8891e78ae094@redhat.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <4bc8747a-d87f-423b-b0ce-8891e78ae094@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708443738;7c84151d;
X-HE-SMSGID: 1rcSG6-0001na-4I



On 20.02.24 16:27, Hans de Goede wrote:
> Hi,
> 
> On 2/20/24 16:15, Alex Deucher wrote:
>> On Tue, Feb 20, 2024 at 10:03 AM Linux regression tracking (Thorsten
>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>
>>> On 20.02.24 15:45, Alex Deucher wrote:
>>>> On Mon, Feb 19, 2024 at 9:47 AM Linux regression tracking (Thorsten
>>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>
>>>>> On 17.02.24 14:30, Greg KH wrote:
>>>>>> On Sat, Feb 17, 2024 at 02:01:54PM +0100, Roman Benes wrote:
>>>>>>> Minimum power limit on latest(6.7+) kernels is 190W for my GPU (RX 6700XT,
>>>>>>> mesa, archlinux) and I cannot get power cap as low as before(to 115W),
>>>>>>> neither with Corectrl, LACT or TuxClocker and /sys have a variable read-only
>>>>>>> even for root. This is not of above apps issue but of the kernel, I read
>>>>>>> similar issues from other bug reports of above apps. I downgraded to v6.6.10
>>>>>>> kernel and my 115W(under power)cap work again as before.
>>>>>>
>>>>> For the record and everyone that lands here: the cause is known now
>>>>> (it's 1958946858a62b ("drm/amd/pm: Support for getting power1_cap_min
>>>>> value") [v6.7-rc1]) and the issue afaics tracked here:
>>>>>
>>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/3183
>>>>>
>>>>> Other mentions:
>>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/3137
>>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/2992
>>>>>
>>>>> Haven't seen any statement from the amdgpu developers (now CCed) yet on
>>>>> this there (but might have missed something!). From what I can see I
>>>>> assume this will likely be somewhat tricky to handle, as a revert
>>>>> overall might be a bad idea here. We'll see I guess.
>>>>
>>>> The change aligns the driver what has been validated on each board
>>>> design.  Windows uses the same limits.  Using values lower than the
>>>> validated range can lead to undefined behavior and could potentially
>>>> damage your hardware.
>>>
>>> Thx for the reply! Yeah, I was expecting something along those lines.
>>>
>>> Nevertheless it afaics still is a regression in the eyes of many users.
>>> I'm not sure how Linus feels about this, but I wonder if we can find
>>> some solution here so that users that really want to, can continue to do
>>> what was possible out-of-the box before. Is that possible to realize or
>>> even supported already?
>>>
>>> And sure, those users would be running their hardware outside of its
>>> specifications. But is that different from overclocking (which the
>>> driver allows, doesn't it? If not by all means please correct me!)?
>>
>> Sure.  The driver has always had upper bound limits for overclocking,
>> this change adds lower bounds checking for underclocking as well.
>> When the silicon validation teams set the bounding box for a device,
>> they set a range of values where it's reasonable to operate based on
>> the characteristics of the design.
>>
>> If we did want to allow extended underclocking, we need a big warning
>> in the logs at the very least.
> 
> Requiring a module-option to be set to allow this, as well as a big
> warning in the logs sounds like a good solution to me.

Yeah, especially as it sounds from some of the reports as if some
vendors did a really bad job when it came to setting the proper
lower-bound limits are now adhered -- and thus higher then what we used
out-of-the box before 1958946858a62b was applied.

Side note: I assume those "lower bounds checking" is done round about
the same way by the Windows driver? Does that one allow users to go
lower somehow? Say after modifying the registry or something like that?
Or through external tools?

Ciao, Thorsten

>>>>> Roman posted something that apparently was meant to go to the list, so
>>>>> let me put it here:
>>>>>
>>>>> """
>>>>> UPDATE: User fililip already posted patch, but it need to be merged,
>>>>> discussion is on gitlab link below.
>>>>>
>>>>> (PS: I hope I am replying correctly to "all" now? - using original addr.)
>>>>>
>>>>>
>>>>>> it seems that commit was already found(see user's 'fililip' comment):
>>>>>>
>>>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/3183
>>>>>> commit 1958946858a62b6b5392ed075aa219d199bcae39
>>>>>> Author: Ma Jun <Jun.Ma2@amd.com>
>>>>>> Date:   Thu Oct 12 09:33:45 2023 +0800
>>>>>>
>>>>>>     drm/amd/pm: Support for getting power1_cap_min value
>>>>>>
>>>>>>     Support for getting power1_cap_min value on smu13 and smu11.
>>>>>>     For other Asics, we still use 0 as the default value.
>>>>>>
>>>>>>     Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>>>>>>     Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
>>>>>>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>>
>>>>>> However, this is not good as it remove under-powering range too far. I
>>>>> was getting only about 7% less performance but 90W(!) less consumption
>>>>> when set to my 115W before. Also I wonder if we as a OS of options and
>>>>> freedom have to stick to such very high reference for min values without
>>>>> ability to override them through some sys ctrls. Commit was done by amd
>>>>> guy and I wonder if because of maybe this post that I made few months
>>>>> ago(business strategy?):
>>>>>>
>>>>>>
>>>>> https://www.reddit.com/r/Amd/comments/183gye7/rx_6700xt_from_230w_to_capped_115w_at_only_10/
>>>>>>
>>>>>> This is not a dangerous OC upwards where I can understand desire to
>>>>> protect HW, it is downward, having min cap at 190W when card pull on
>>>>> 115W almost same speed is IMO crazy to deny. We don't talk about default
>>>>> or reference values here either, just a move to lower the range of
>>>>> options for whatever reason.
>>>>>>
>>>>>> I don't know how much power you guys have over them, but please
>>>>> consider either reverting this change, or give us an option to set
>>>>> min_cap through say /sys (right now param is readonly, even for root).
>>>>>>
>>>>>>
>>>>>> Thank you in advance for looking into this, with regards:  Romano
>>>>> """
>>>>>
>>>>> And while at it, let me add this issue to the tracking as well
>>>>>
>>>>> [TLDR: I'm adding this report to the list of tracked Linux kernel
>>>>> regressions; the text you find below is based on a few templates
>>>>> paragraphs you might have encountered already in similar form.
>>>>> See link in footer if these mails annoy you.]
>>>>>
>>>>> Thanks for the report. To be sure the issue doesn't fall through the
>>>>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
>>>>> tracking bot:
>>>>>
>>>>> #regzbot introduced 1958946858a62b /
>>>>> #regzbot title drm: amdgpu: under-powering broke
>>>>>
>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>> --
>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>> That page also explains what to do if mails like this annoy you.
>>>>
>>>>
>>
> 
> 
> 
