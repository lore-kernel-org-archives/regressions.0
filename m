Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A90F24B47
	for <regressions@lists.linux.dev>; Mon, 19 Feb 2024 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708342537; cv=none; b=CkzOMkOd7zWdQX5lYOu1OwvPrH8ht3XaBgb4N6mPAvH/ZGzaM0vRGEqOux10C6iKmJboEpgecgH2t28eVd7Y1ID/M8X5xf/1/TKT76vjqjwjk5V4HGq2MjqaGafaax3Ndze+CDV7AICXnF/+mdx2RWDeA6BsVIWpdEC7KZyTycc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708342537; c=relaxed/simple;
	bh=xmqPjVzYpogRAijd8pYRZRipn0W2NEyFnUi5nFHDuT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c10c05zK7sVecA2S+/Lm7r5I1gSLX7CtagsfERcN8A3OgzxjONaBFje5E06MHRLJs90aoSbrPYKVGJJfvF7ZezkvNeAz3jk8sA1TPrvuo+ZPUT8YfGUFuB1zkqvyWFz8smvySNVaCAjOLkS6iUjou4MmUxkl7IsXioQGSl3Jth8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/nD/fD4; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/nD/fD4"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-512a65cd2c7so1908130e87.0
        for <regressions@lists.linux.dev>; Mon, 19 Feb 2024 03:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708342534; x=1708947334; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fp0CljdJHSwjfF5ZNUmuD0dU70AWZ9zUOAjyO5xBNe4=;
        b=f/nD/fD4jsAYgmKBoZ/xb6XV836JfjyBZx9NYhPvmXQapEdNHDFfWHyjzgBzdTxOz6
         gMNirDWmaQKNpoh2SlOPu4rMIgyNno2fBNT4Whl1oPQ5G6ywCrnjaAmpKFAPn/ASxkrS
         n6VZ0CyjggnwOf+XPBhK/KHlz+8+lANdzFtQnjco0E0vyN043u9YNgSBdMXMvhaTPoWe
         Y8f/k370r5mL4Nt175veOUgA4lkDWfZ6vy2gPDPlUEsoCKiIh9YoYEGtk5PwlrlOkuM8
         OF9m8c6MrCqA8m5wvO2sOYvr31pSkGbGk2v/vXJUUvzdADmFE6ZjpJY+rgTQqem01xbo
         ZxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708342534; x=1708947334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fp0CljdJHSwjfF5ZNUmuD0dU70AWZ9zUOAjyO5xBNe4=;
        b=S/U35hAg6GG6flaf7l54upLjcXOdibn4Y2wapKctYK7mXGOQ0Ychyq1kKbIO9+4sOO
         ytJt/xxK6Eh8K2eMuxJW/az9wcskOgogl0nAo3rXeOCu0nRxzO2qC7ZDD7itUSxZoiEV
         tnvHRW6D8qOH/m4TabS0RXtXMhY220MQUPFBV0wQ0DzAby/bJeyfohmp7OgMW10jZ2T7
         8dJwPwwXRf9QL1Jt8JyW27mve/4ZriMku9LQRKrrqlZlRN2Vm9TqV9EU7AIjsZhVYFBc
         mFOWhZyv4NAciJ/LV8YehtIwJkIu27IuduMe16bfpCVE6eMP+7BgNrCaqyOBiTudT630
         dy2g==
X-Gm-Message-State: AOJu0YwibvxzeL2iNJsYPIZVivSLxWUsEXD4fU9mwk74m1GkYbBqqv2+
	OohNX56RqONjDDK7LLcxRLc2GJGYszIdD5l8Lak6EWvzSgAkf0QkMiWg2iAfEF4=
X-Google-Smtp-Source: AGHT+IGfyk1oGv6vKjSp6w6XW7c0CC4S9n/+WgaeOfiW2DLN0CbfpnIgrZVk+qQe23FJKdbg1HFndQ==
X-Received: by 2002:a05:6512:358a:b0:512:b702:a794 with SMTP id m10-20020a056512358a00b00512b702a794mr963508lfr.17.1708342533352;
        Mon, 19 Feb 2024 03:35:33 -0800 (PST)
Received: from [10.0.2.1] (server.riadoklan.sk.eu.org. [195.3.170.77])
        by smtp.gmail.com with ESMTPSA id d21-20020aa7d695000000b00560e72d22b8sm2589324edr.2.2024.02.19.03.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 03:35:32 -0800 (PST)
Message-ID: <8857ad7c-c42a-435c-a74f-ecd6d77dbfa5@gmail.com>
Date: Mon, 19 Feb 2024 12:35:31 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel 6.7+ broke under-powering of my RX 6700XT. (Archlinux,
 mesa/amdgpu)
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Ma Jun <Jun.Ma2@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>
References: <ae64f04d-6e94-4da4-a740-78ea94e0552c@riadoklan.sk.eu.org>
 <2024021732-framing-tactful-833d@gregkh>
 <d369b45f-e1af-4117-83a5-3e429e3bfb23@leemhuis.info>
From: Romano <romaniox@gmail.com>
In-Reply-To: <d369b45f-e1af-4117-83a5-3e429e3bfb23@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,

patch by user @fililip was posted there, but not submitted:

"I think I'd have to submit it to the linux kernel mailing list, which I 
am kinda scared of 😅. It could be better to submit that patch to Arch 
Linux maintainers; they could include it in their kernel builds."

Implementation of this patch can be simplified by simply setting:

smu->min_power_limit = amdgpu_ignore_min_pcap ? 0 : whatever_default_smuxx;

and then leave rest of the code unchanged(except defining 
amdgpu_ignore_min_pcap variable of course). Nothing tricky nor need to 
revert anything should be needed I hope. Please add it to the general 
kernel as an option, it certainly should not be related to Archlinux only.

Roman



On 2/19/24 12:15, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 17.02.24 14:30, Greg KH wrote:
>> On Sat, Feb 17, 2024 at 02:01:54PM +0100, Roman Benes wrote:
>>> Minimum power limit on latest(6.7+) kernels is 190W for my GPU (RX 6700XT,
>>> mesa, archlinux) and I cannot get power cap as low as before(to 115W),
>>> neither with Corectrl, LACT or TuxClocker and /sys have a variable read-only
>>> even for root. This is not of above apps issue but of the kernel, I read
>>> similar issues from other bug reports of above apps. I downgraded to v6.6.10
>>> kernel and my 115W(under power)cap work again as before.
>> Any chance you can use 'git bisect' to figure out the offending change?
> For the record and everyone that lands here: the cause is known now
> (it's 1958946858a62b ("drm/amd/pm: Support for getting power1_cap_min
> value") [v6.7-rc1]) and the issue afaics tracked here:
>
> https://gitlab.freedesktop.org/drm/amd/-/issues/3183
>
> Other mentions:
> https://gitlab.freedesktop.org/drm/amd/-/issues/3137
> https://gitlab.freedesktop.org/drm/amd/-/issues/2992
>
> Haven't seen any statement from the amdgpu developers (now CCed) yet on
> this there (but might have missed something!). From what I can see I
> assume this will likely be somewhat tricky to handle, as a revert
> overall might be a bad idea here. We'll see I guess.
>
> Roman posted something that apparently was meant to go to the list, so
> let me put it here:
>
> """
> UPDATE: User fililip already posted patch, but it need to be merged,
> discussion is on gitlab link below.
>
> (PS: I hope I am replying correctly to "all" now? - using original addr.)
>
>
>> it seems that commit was already found(see user's 'fililip' comment):
>>
>> https://gitlab.freedesktop.org/drm/amd/-/issues/3183
>> commit 1958946858a62b6b5392ed075aa219d199bcae39
>> Author: Ma Jun <Jun.Ma2@amd.com>
>> Date:   Thu Oct 12 09:33:45 2023 +0800
>>
>>      drm/amd/pm: Support for getting power1_cap_min value
>>
>>      Support for getting power1_cap_min value on smu13 and smu11.
>>      For other Asics, we still use 0 as the default value.
>>
>>      Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>>      Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
>>      Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>
>> However, this is not good as it remove under-powering range too far. I
> was getting only about 7% less performance but 90W(!) less consumption
> when set to my 115W before. Also I wonder if we as a OS of options and
> freedom have to stick to such very high reference for min values without
> ability to override them through some sys ctrls. Commit was done by amd
> guy and I wonder if because of maybe this post that I made few months
> ago(business strategy?):
>>
> https://www.reddit.com/r/Amd/comments/183gye7/rx_6700xt_from_230w_to_capped_115w_at_only_10/
>> This is not a dangerous OC upwards where I can understand desire to
> protect HW, it is downward, having min cap at 190W when card pull on
> 115W almost same speed is IMO crazy to deny. We don't talk about default
> or reference values here either, just a move to lower the range of
> options for whatever reason.
>> I don't know how much power you guys have over them, but please
> consider either reverting this change, or give us an option to set
> min_cap through say /sys (right now param is readonly, even for root).
>>
>> Thank you in advance for looking into this, with regards:  Romano
> """
>
> And while at it, let me add this issue to the tracking as well
>
> [TLDR: I'm adding this report to the list of tracked Linux kernel
> regressions; the text you find below is based on a few templates
> paragraphs you might have encountered already in similar form.
> See link in footer if these mails annoy you.]
>
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
>
> #regzbot introduced 1958946858a62b /
> #regzbot title drm: amdgpu: under-powering broke
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> That page also explains what to do if mails like this annoy you.
