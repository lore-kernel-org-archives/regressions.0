Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA28980C08
	for <regressions@lists.linux.dev>; Wed, 21 Feb 2024 16:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708534035; cv=none; b=YgsGU1Z2UO6RRntI3Edy9QBumfchYgreXKzraHQGcoCfoaym0c07djI767m2QYi2LUtK2cqX3HiUneqMFLp4Z3LaTod6CcRyYthMc234uB3CsbojnBRlXpdbM4oP7tA0M44L+OenPJb2OzsgtWzLYgAk8jpjC8XqSkTy96DHUJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708534035; c=relaxed/simple;
	bh=ZMMEKKl3ItQPvValWmSa0XwheTYE21H6FgQoG5UaZm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=almucfdm4dZbjzRorb7Gx8tlIsK0o7ko2h4+baRin8PipfkbRPBEoZTZcythVDotGopyWgGQo5tujUUHMzfV/chnP4lmtqUyTY6ZMcW842mOYPAGvC6afg0jjmKyYRRkY0x7xLti3q+EkJj8AHh0LFtYhIs/RQPKog4tb70o3uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcxxYE+3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcxxYE+3"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56454c695e6so6151196a12.0
        for <regressions@lists.linux.dev>; Wed, 21 Feb 2024 08:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708534031; x=1709138831; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFgTDD2G/Xcb+l1Yb3Oj/EHpMRhk8MEDHyRK2ibp9Kg=;
        b=hcxxYE+3I9LUryMhGXbfYIFsOrYlFTzWCC/HL0nCKzvCQOwM2AElkGUcMLW9Tchgmi
         XbNLHRexfpTRIbT0TtkjJ0QYy8mAYhR3tiy9MNjzliS6+8JVUAZE++NnQaZydMHFfNDJ
         TVsSSTMm3vJ+QHcKZfYPo8tRGd5AcDG8/1jU8uzP76Cy7BYULuEx5xhCpHKRjK32r7KY
         /UpbkPFXvubONJFxzl7xPQaLYvhhBH5ryCfEd0dd6iyVisYk/MhZHACCf4iLOZVAz+Cm
         8QRb/x6HFEFWsKhjA61IVCS3DH2BM3wGMoQrkzLexiM6nhfJfMorL4WeY6gG0CDHHLGP
         yaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708534031; x=1709138831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFgTDD2G/Xcb+l1Yb3Oj/EHpMRhk8MEDHyRK2ibp9Kg=;
        b=cVKth5aPnbVFc0BEgFAC+Ui7QMjp6A9gB9kleYvv8Hx8pan1qjAz60pmqyODa4DAJd
         oSOuJRQcO16ZTv9tLq6U3UeJZCRzPmtWPZqNd7lkwMlKxwtELWta+8f+Rxn4BKHlEffM
         S72/eOUXCMUb1wKVp6nzqYMSGNugyCKpstH4h5ygdb6lRduoObO8SDSDKzeHEb+uZUHP
         RKRpBvNPOxM145mYQA5z16MwmdcsVb50f4rMt/z6dtiaS/7eGGMs4HwXt7a8MP22JJ6r
         WAdyHqq4rx1AQbqZ7xXhYzIStrc0ustD2PlvyaQUXSkTethlqKi/J8Gp/KH+rLKH56NX
         iZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCWOLRbwB/VypgGVxhF+O4RhFeN3I8OszltJVWQSwkW1811WVrtOKpDJu76gHR4cr8gz7yQbCrlwRGm2g0+d8ABypO+C5vSrHwfgIDU=
X-Gm-Message-State: AOJu0Yz4ct3BL0fPLSIq83SnmytHHYg3Cx7W3zc8buGUiaUajXa0n3qG
	/5n1ynOb4WmAuym9s+LzAnO7YAk/Cn3pKfxrKD3f3HRQlF7YCJHw
X-Google-Smtp-Source: AGHT+IE1YgDOklUI41F7Af5l7+rjOPg736adZphw1J590el3ObPi/mg9tcqCnk6vgkXQr1lOkZtdXA==
X-Received: by 2002:a05:6402:556:b0:565:9a3:9f44 with SMTP id i22-20020a056402055600b0056509a39f44mr56987edx.8.1708534030862;
        Wed, 21 Feb 2024 08:47:10 -0800 (PST)
Received: from [10.0.2.1] (server.riadoklan.sk.eu.org. [195.3.170.77])
        by smtp.gmail.com with ESMTPSA id fe12-20020a056402390c00b00564fa936b2bsm683400edb.94.2024.02.21.08.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 08:47:10 -0800 (PST)
Message-ID: <91fe4d91-edc3-4dc7-a8b2-8905b0611fe3@gmail.com>
Date: Wed, 21 Feb 2024 17:47:09 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel 6.7+ broke under-powering of my RX 6700XT. (Archlinux,
 mesa/amdgpu)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>
References: <ae64f04d-6e94-4da4-a740-78ea94e0552c@riadoklan.sk.eu.org>
 <2024021732-framing-tactful-833d@gregkh>
 <d369b45f-e1af-4117-83a5-3e429e3bfb23@leemhuis.info>
 <CADnq5_OgPBtYpxBQ+aBmA2t7ob7EFPFWrF9OYXNgm00eEayMNA@mail.gmail.com>
 <62bf771e-640a-45ab-a2de-3df459a9ed30@leemhuis.info>
 <CADnq5_M4Zwv0_B1DoU_a8aNpyPVJj_PpjDG_oi3JkrGC5-hNgg@mail.gmail.com>
 <4bc8747a-d87f-423b-b0ce-8891e78ae094@redhat.com>
 <a6243c3b-d773-4693-88e9-033995616f12@leemhuis.info>
 <CADnq5_MHmz=HdGA22U-bk2b+4un70bmLzpbDyc3+tjzoRAnCeA@mail.gmail.com>
 <1aa3830d-ceb7-4eb1-b5bb-d6043684507f@gmail.com>
 <CADnq5_Nc+eEfXwaXfaTz75C9ww6ETVm_adCSfGsdD6OzguUQ6Q@mail.gmail.com>
 <3e077b5f-0684-4a07-9b74-ab242bb01975@gmail.com>
 <CADnq5_NszWGKVZZomTojAm_u7O-04M6x_ox4KXQC79OuGA9ARA@mail.gmail.com>
 <af6291d4-45c3-4eb6-95b8-14a5221e72a1@leemhuis.info>
 <2ae0f677-a3b7-4cad-8b37-beb0ae502da8@gmail.com>
Content-Language: en-US
From: Romano <romaniox@gmail.com>
In-Reply-To: <2ae0f677-a3b7-4cad-8b37-beb0ae502da8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

So that's what its about. Somehow I knew it all along. Not long ago, I 
posted this on reddit:

https://www.reddit.com/r/Amd/comments/183gye7/rx_6700xt_from_230w_to_capped_115w_at_only_10/

That was 3 months ago. Now suddenly AMD *require*("..hardware engineers 
have explicitly pointed out that we *have to* do this in the software 
stack", "..open source drivers are *not respecting* the min value") that 
you fix min_cap hard. What a coincidence, with unlimited min_cap being 
fine for years. What is the statistical probability that just 3 months 
after someone blow it into public, they patch the driver to "respect 
firmware" and thing is suddenly "out of specs". I don't know.

Maybe someone remind them we do not work for them and we don't care for 
their marketing strategies. What is it to them if user can override 
kernel value? Card literally cannot die, I cannot fry it, I am not going 
over peak allowed power but opposite. Whether I have to do it via boot 
or patch a kernel should not be up to them.

By all means set min_cap to specification, but do allow for override. 
That's all we ask, there are many users and more issues about this 
opened on gitlab than just mine.

Also the points about vendors knowing and defining range due to HW 
components... please. How come they haven't seen such a huge savings 
when HW is clearly operating safe? To me this is intentional and have to 
do about how bad may future HW sell, like an arbitrary hold-back to milk 
money(kind of what Intel did for many CPU generations). Because they 
don't have much room on the die shrink and other optimizations also 
happened over decades. Things are saturated everywhere. You can show 
nice upgrade charts on how next gen. beat 6700XT if it draw ~200W, but 
can next gen beat it to warrant purchase if my 6700XT get almost same 
perf., but on **80% less** power? That efficiency ratio is so blown out 
it leave few jaws on the floor and 2-3 generations obsolete. No wonder 
they have to fake specs. I don't believe them a word, cards operate 
safely and this could not be missed.




On 2/21/24 16:15, Christian König wrote:
> Am 21.02.24 um 07:06 schrieb Linux regression tracking (Thorsten 
> Leemhuis):
>> On 20.02.24 21:18, Alex Deucher wrote:
>>> On Tue, Feb 20, 2024 at 2:41 PM Romano <romaniox@gmail.com> wrote:
>>>> If the increased low range is allowed via boot option, like in 
>>>> proposed
>>>> patch, user clearly made an intentional decision. Undefined, but won't
>>>> fry his hardware for sure. Undefined is also overclocking in that
>>>> matter. You can go out of range with ratio of voltage vs 
>>>> frequency(still
>>>> within vendor's limits) for example and crash the system.
>>> This whole thing reminds me of this:
>>> https://xkcd.com/1172/
>>> The problem is another module parameter is another interface to
>>> maintain and validate.
>> Yup, of course, all that is understood.
>>
>> But we have this "no regressions" rule for a reason. Adhering to it
>> strictly would afaics be counter-productive in this situation, but give
>> users some way to manually do what was possible before out-of-the box
>> IMHO is the minimum we should do.
>>
>> Maybe just allow that parameter only up to a certain recent GPU
>> generation, that way you won't have to deal with that at some point in
>> the future.
>>
>>>   Moreover, we've had a number of cases in the
>>> past where users have under or overclocked and reported bugs or
>>> stability issues and it did not come to light that they were doing
>>> that until we'd already spent a good deal of time trying to debug the
>>> issue.
>> Taint the kernel when that module parameter is used? We iirc have a
>> taint bit exactly for this sort of situation. Sure, such reports will
>> still happen, but then you at least have an indicator to spot them.
>
> Let me recap what happened here:
>
> 1. AMD is the GPU manufacturer, but apart from a few exceptions 
> doesn't assemble boards.
>
> 2. Vendors take AMDs GPUs and assemble them together with power 
> regulators, memory and a bunch of other components into PCIe board.
>
> 3. AMD provides a vendor agnostic driver and for this to work vendors 
> describe to the min/max voltage their power regulators can do in some 
> flash memory.
>
> 4. Hardware engineers point out that AMDs open source drivers are not 
> respecting the min value.
>
> 5. In response a patch was applied to respect that value and not use 
> something outside of the hardware specification the vendor provided.
>
> I'm not sure about it but I think AMD need to respect the min/max 
> values simply by contract and it's not really an option to not do that.
>
> If someone really want to run your hardware outside the vendor 
> recommended values that person can still patch the driver to ignore 
> the limits. It's just that then AMD is not responsible for any damage 
> resulting from that.
>
> So as far as I can see the request to make that a module option is a 
> no-go, especially since hardware engineers have explicitly pointed out 
> that we have to do this in the software stack.
>
> Regards,
> Christian.
>
>>
>> Ciao, Thorsten
>>
>>>   This obviously can still happen if you allow any sort of over
>>> or underclocking, but at least if you stick to the limits you are
>>> staying within the bounding box of the design.
>>>
>>> Alex
>>>
>>>> On 2/20/24 19:09, Alex Deucher wrote:
>>>>> On Tue, Feb 20, 2024 at 11:46 AM Romano <romaniox@gmail.com> wrote:
>>>>>> For Windows, apps like MSI Afterburner is the one to try and what 
>>>>>> most
>>>>>> people go for. Using it in the past myself, I would be surprised 
>>>>>> if it
>>>>>> adhered to such a high min power cap. But even if it did, why 
>>>>>> would we
>>>>>> have to.
>>>>>>
>>>>>> Relying on vendors cap in this case has already proven wrong because
>>>>>> things worked for quite some time already and people reported saving
>>>>>> significant amount of watts, in my case 90W(!) for <10% perf.
>>>>>>
>>>>>> Therefore this talk about safety seems rather strange to me and
>>>>>> especially so when we are talking about min_cap. Or name me a single
>>>>>> case where someone fried his card due to "too low power" set in said
>>>>>> variable. Now there was a report, where by going way too low, driver
>>>>>> goes opposite into max power. That's it. That can be easily
>>>>>> detected(vents going crazy etc.) and reverted. It is a max_cap that
>>>>>> protect HW(also above scenario), not a min_cap. Feel free to 
>>>>>> adhere to
>>>>>> safety standards with that one.
>>>>> Because operation outside of the design bounding box is 
>>>>> undefined.  It
>>>>> might work for some boards but not others.  It's possible some of the
>>>>> logic in the firmware or some of the components used on the board may
>>>>> not work correctly below a certain limit, or the voltage regulators
>>>>> used on a specific board have a minimum requirement that would not be
>>>>> an issue if you stick the bounding box.
>>>>>
>>>>> Alex
>>>>>
>>>>>> As for solution, what some suggested already exist - a patch 
>>>>>> posted by
>>>>>> fililip on gitlab is probably the way most of you would agree. It
>>>>>> introduce a variable that can be set during boot to override 
>>>>>> min_cap.
>>>>>> But he did not pull requested it, so please, if any one of you 
>>>>>> who have
>>>>>> access to code and merge kernel would be kind enough to implement 
>>>>>> it.
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 2/20/24 16:46, Alex Deucher wrote:
>>>>>>> On Tue, Feb 20, 2024 at 10:42 AM Linux regression tracking 
>>>>>>> (Thorsten
>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>>>> On 20.02.24 16:27, Hans de Goede wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 2/20/24 16:15, Alex Deucher wrote:
>>>>>>>>>> On Tue, Feb 20, 2024 at 10:03 AM Linux regression tracking 
>>>>>>>>>> (Thorsten
>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>>>>>>> On 20.02.24 15:45, Alex Deucher wrote:
>>>>>>>>>>>> On Mon, Feb 19, 2024 at 9:47 AM Linux regression tracking 
>>>>>>>>>>>> (Thorsten
>>>>>>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>>>>>>>>> On 17.02.24 14:30, Greg KH wrote:
>>>>>>>>>>>>>> On Sat, Feb 17, 2024 at 02:01:54PM +0100, Roman Benes wrote:
>>>>>>>>>>>>>>> Minimum power limit on latest(6.7+) kernels is 190W for 
>>>>>>>>>>>>>>> my GPU (RX 6700XT,
>>>>>>>>>>>>>>> mesa, archlinux) and I cannot get power cap as low as 
>>>>>>>>>>>>>>> before(to 115W),
>>>>>>>>>>>>>>> neither with Corectrl, LACT or TuxClocker and /sys have 
>>>>>>>>>>>>>>> a variable read-only
>>>>>>>>>>>>>>> even for root. This is not of above apps issue but of 
>>>>>>>>>>>>>>> the kernel, I read
>>>>>>>>>>>>>>> similar issues from other bug reports of above apps. I 
>>>>>>>>>>>>>>> downgraded to v6.6.10
>>>>>>>>>>>>>>> kernel and my 115W(under power)cap work again as before.
>>>>>>>>>>>>> For the record and everyone that lands here: the cause is 
>>>>>>>>>>>>> known now
>>>>>>>>>>>>> (it's 1958946858a62b ("drm/amd/pm: Support for getting 
>>>>>>>>>>>>> power1_cap_min
>>>>>>>>>>>>> value") [v6.7-rc1]) and the issue afaics tracked here:
>>>>>>>>>>>>>
>>>>>>>>>>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/3183
>>>>>>>>>>>>>
>>>>>>>>>>>>> Other mentions:
>>>>>>>>>>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/3137
>>>>>>>>>>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/2992
>>>>>>>>>>>>>
>>>>>>>>>>>>> Haven't seen any statement from the amdgpu developers (now 
>>>>>>>>>>>>> CCed) yet on
>>>>>>>>>>>>> this there (but might have missed something!). From what I 
>>>>>>>>>>>>> can see I
>>>>>>>>>>>>> assume this will likely be somewhat tricky to handle, as a 
>>>>>>>>>>>>> revert
>>>>>>>>>>>>> overall might be a bad idea here. We'll see I guess.
>>>>>>>>>>>> The change aligns the driver what has been validated on 
>>>>>>>>>>>> each board
>>>>>>>>>>>> design.  Windows uses the same limits. Using values lower 
>>>>>>>>>>>> than the
>>>>>>>>>>>> validated range can lead to undefined behavior and could 
>>>>>>>>>>>> potentially
>>>>>>>>>>>> damage your hardware.
>>>>>>>>>>> Thx for the reply! Yeah, I was expecting something along 
>>>>>>>>>>> those lines.
>>>>>>>>>>>
>>>>>>>>>>> Nevertheless it afaics still is a regression in the eyes of 
>>>>>>>>>>> many users.
>>>>>>>>>>> I'm not sure how Linus feels about this, but I wonder if we 
>>>>>>>>>>> can find
>>>>>>>>>>> some solution here so that users that really want to, can 
>>>>>>>>>>> continue to do
>>>>>>>>>>> what was possible out-of-the box before. Is that possible to 
>>>>>>>>>>> realize or
>>>>>>>>>>> even supported already?
>>>>>>>>>>>
>>>>>>>>>>> And sure, those users would be running their hardware 
>>>>>>>>>>> outside of its
>>>>>>>>>>> specifications. But is that different from overclocking 
>>>>>>>>>>> (which the
>>>>>>>>>>> driver allows, doesn't it? If not by all means please 
>>>>>>>>>>> correct me!)?
>>>>>>>>>> Sure.  The driver has always had upper bound limits for 
>>>>>>>>>> overclocking,
>>>>>>>>>> this change adds lower bounds checking for underclocking as 
>>>>>>>>>> well.
>>>>>>>>>> When the silicon validation teams set the bounding box for a 
>>>>>>>>>> device,
>>>>>>>>>> they set a range of values where it's reasonable to operate 
>>>>>>>>>> based on
>>>>>>>>>> the characteristics of the design.
>>>>>>>>>>
>>>>>>>>>> If we did want to allow extended underclocking, we need a big 
>>>>>>>>>> warning
>>>>>>>>>> in the logs at the very least.
>>>>>>>>> Requiring a module-option to be set to allow this, as well as 
>>>>>>>>> a big
>>>>>>>>> warning in the logs sounds like a good solution to me.
>>>>>>>> Yeah, especially as it sounds from some of the reports as if some
>>>>>>>> vendors did a really bad job when it came to setting the proper
>>>>>>>> lower-bound limits are now adhered -- and thus higher then what 
>>>>>>>> we used
>>>>>>>> out-of-the box before 1958946858a62b was applied.
>>>>>>>>
>>>>>>>> Side note: I assume those "lower bounds checking" is done round 
>>>>>>>> about
>>>>>>>> the same way by the Windows driver? Does that one allow users 
>>>>>>>> to go
>>>>>>>> lower somehow? Say after modifying the registry or something 
>>>>>>>> like that?
>>>>>>>> Or through external tools?
>>>>>>> Windows uses the same limit.  I'm not aware of any way to 
>>>>>>> override the
>>>>>>> limit on windows off hand.
>>>>>>>
>>>>>>> Alex
>>>>>>>
>>>>>>>
>>>>>>>> Ciao, Thorsten
>>>>>>>>
>>>>>>>>>>>>> Roman posted something that apparently was meant to go to 
>>>>>>>>>>>>> the list, so
>>>>>>>>>>>>> let me put it here:
>>>>>>>>>>>>>
>>>>>>>>>>>>> """
>>>>>>>>>>>>> UPDATE: User fililip already posted patch, but it need to 
>>>>>>>>>>>>> be merged,
>>>>>>>>>>>>> discussion is on gitlab link below.
>>>>>>>>>>>>>
>>>>>>>>>>>>> (PS: I hope I am replying correctly to "all" now? - using 
>>>>>>>>>>>>> original addr.)
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>> it seems that commit was already found(see user's 
>>>>>>>>>>>>>> 'fililip' comment):
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/3183
>>>>>>>>>>>>>> commit 1958946858a62b6b5392ed075aa219d199bcae39
>>>>>>>>>>>>>> Author: Ma Jun <Jun.Ma2@amd.com>
>>>>>>>>>>>>>> Date:   Thu Oct 12 09:33:45 2023 +0800
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>        drm/amd/pm: Support for getting power1_cap_min value
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>        Support for getting power1_cap_min value on smu13 
>>>>>>>>>>>>>> and smu11.
>>>>>>>>>>>>>>        For other Asics, we still use 0 as the default value.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>        Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>>>>>>>>>>>>>>        Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
>>>>>>>>>>>>>>        Signed-off-by: Alex Deucher 
>>>>>>>>>>>>>> <alexander.deucher@amd.com>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> However, this is not good as it remove under-powering 
>>>>>>>>>>>>>> range too far. I
>>>>>>>>>>>>> was getting only about 7% less performance but 90W(!) less 
>>>>>>>>>>>>> consumption
>>>>>>>>>>>>> when set to my 115W before. Also I wonder if we as a OS of 
>>>>>>>>>>>>> options and
>>>>>>>>>>>>> freedom have to stick to such very high reference for min 
>>>>>>>>>>>>> values without
>>>>>>>>>>>>> ability to override them through some sys ctrls. Commit 
>>>>>>>>>>>>> was done by amd
>>>>>>>>>>>>> guy and I wonder if because of maybe this post that I made 
>>>>>>>>>>>>> few months
>>>>>>>>>>>>> ago(business strategy?):
>>>>>>>>>>>>> https://www.reddit.com/r/Amd/comments/183gye7/rx_6700xt_from_230w_to_capped_115w_at_only_10/ 
>>>>>>>>>>>>>
>>>>>>>>>>>>>> This is not a dangerous OC upwards where I can understand 
>>>>>>>>>>>>>> desire to
>>>>>>>>>>>>> protect HW, it is downward, having min cap at 190W when 
>>>>>>>>>>>>> card pull on
>>>>>>>>>>>>> 115W almost same speed is IMO crazy to deny. We don't talk 
>>>>>>>>>>>>> about default
>>>>>>>>>>>>> or reference values here either, just a move to lower the 
>>>>>>>>>>>>> range of
>>>>>>>>>>>>> options for whatever reason.
>>>>>>>>>>>>>> I don't know how much power you guys have over them, but 
>>>>>>>>>>>>>> please
>>>>>>>>>>>>> consider either reverting this change, or give us an 
>>>>>>>>>>>>> option to set
>>>>>>>>>>>>> min_cap through say /sys (right now param is readonly, 
>>>>>>>>>>>>> even for root).
>>>>>>>>>>>>>> Thank you in advance for looking into this, with 
>>>>>>>>>>>>>> regards:  Romano
>>>>>>>>>>>>> """
>>>>>>>>>>>>>
>>>>>>>>>>>>> And while at it, let me add this issue to the tracking as 
>>>>>>>>>>>>> well
>>>>>>>>>>>>>
>>>>>>>>>>>>> [TLDR: I'm adding this report to the list of tracked Linux 
>>>>>>>>>>>>> kernel
>>>>>>>>>>>>> regressions; the text you find below is based on a few 
>>>>>>>>>>>>> templates
>>>>>>>>>>>>> paragraphs you might have encountered already in similar 
>>>>>>>>>>>>> form.
>>>>>>>>>>>>> See link in footer if these mails annoy you.]
>>>>>>>>>>>>>
>>>>>>>>>>>>> Thanks for the report. To be sure the issue doesn't fall 
>>>>>>>>>>>>> through the
>>>>>>>>>>>>> cracks unnoticed, I'm adding it to regzbot, the Linux 
>>>>>>>>>>>>> kernel regression
>>>>>>>>>>>>> tracking bot:
>>>>>>>>>>>>>
>>>>>>>>>>>>> #regzbot introduced 1958946858a62b /
>>>>>>>>>>>>> #regzbot title drm: amdgpu: under-powering broke
>>>>>>>>>>>>>
>>>>>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression 
>>>>>>>>>>>>> tracker' hat)
>>>>>>>>>>>>> -- 
>>>>>>>>>>>>> Everything you wanna know about Linux kernel regression 
>>>>>>>>>>>>> tracking:
>>>>>>>>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>>>>>>>>>> That page also explains what to do if mails like this 
>>>>>>>>>>>>> annoy you.
>>>
>
