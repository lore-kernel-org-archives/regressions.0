Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F8C39C
	for <regressions@lists.linux.dev>; Sat, 20 Jan 2024 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705710777; cv=none; b=kyWpfZJJl+LUb+nv9bZp6iFFYSzFFh3+kQx0JJHv1dZ0QERNZqsHddV8rHRofLuUCknVHJplhz6FO5FPDJTLD6NMYqBIbkt9uWpUI3OjKF8lMWZh4ppcopEOlKR4Mb17IXbB8oSYAzKkf5S9DVriDgjg36AFgTANgHjqWu23VCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705710777; c=relaxed/simple;
	bh=/+xk1GzZ99hwKDwrlG+v/nJqc/sv4UabtTzChwEyZeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJpBuYyf4eOXRBn6uk6xX2lxLVanypAhVnIpVNvmTIqPCpRGWyPSY7FuD8uk6jRd1+kFODG4/0lGQkph8cwTbHEZOEct5o7/R8BvhHPJVvOcMO04RVVrLkpoFyKOrGjjWEgo+hngVKYknFbqXHeSu4/3zD/Pj07SNoZIY0SqjLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=crT6e1ba; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="crT6e1ba"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d9ac0521c6so258103b3a.0
        for <regressions@lists.linux.dev>; Fri, 19 Jan 2024 16:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1705710775; x=1706315575; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zXbx5KLjnuEXGoUIzJq2FnD3gOZC2HLZU+Ar46f2g5k=;
        b=crT6e1bapHqEhI/X8wmUahgdsvvytyFmU1+fCpUnFA3wnwKE2hGuiIS8AGdwCpU7HK
         02QE4JOl+NL8jDZcFv1whTerubVRjff9MI7QKb061YlKIfRRncLdgDu8g9eZc3dRQtCf
         ATPvDQYaxU23fcyVYYxqINEX8dPlMxxShromAjgkKSp4fEi3euGgDJSdp+1QRTvcMmfF
         WH+cWtvY+Amca/Xg5usZPNvpn6YJHPKLQ9/KUGfbIvGl3lbx5wgY7jByFxIkth8hlgaM
         1P0laKAZUViS4oKhvO5JWyp97yIWmM/ZnvK/1qBG6tnkeD9DNx0fS2Yh5g2Uk6kRYHrD
         szpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705710775; x=1706315575;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zXbx5KLjnuEXGoUIzJq2FnD3gOZC2HLZU+Ar46f2g5k=;
        b=EXYRh0f+5YGBKsM8rVnUfgZ4Lk2etrlY9VrbnkVUc/g9rEjzWVnetLRVPzK/0O70JI
         RbfSN2mSO0EWeDCFgpjg51XBAcP9urxtwSQL56cf25unWKu+4LF4nuu673iMQRKy/49S
         3jU82gd7g89M2FrPn/rWOhjHjHc5whBaA7lMRiIlCXjfRH6hv2GyaG6YZDq3wUlE5q9A
         EzQBEYaGVY2sTRCC1rCSqUK9wSwiCQ1DLpTL7c8s7f27eaFFa4zDioSNbV0XT63QY9MV
         rGf8Ke0vrdDylu6PY5Qx0JOz7MGwMGO0p0TYsIfv6Sf9/qMeuQZZBPXVDOh0wd2WMpvA
         zOJg==
X-Gm-Message-State: AOJu0YwuHPz666YbPE3ahyylyYRHFFUkjN9jSgJxqydynaBYG4cQjkR7
	RI3tULQ3PH5j2EkAdzp7rLmPRjUaRUyXUQ1X1bmdjQsZCd/APldKDihyqKKlf4U=
X-Google-Smtp-Source: AGHT+IH59wAMlt2d7W+nL3Uwl8nawc/QUfSY+ID2uXcxJLUh4jRHJpOIHDQd2m9rMCO4UXjvPCm5vA==
X-Received: by 2002:a05:6a20:c887:b0:19a:40f3:e460 with SMTP id hb7-20020a056a20c88700b0019a40f3e460mr1487067pzb.2.1705710774817;
        Fri, 19 Jan 2024 16:32:54 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id q1-20020a63f941000000b005cfba3c84b7sm968115pgk.81.2024.01.19.16.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 16:32:54 -0800 (PST)
Message-ID: <93ffd2ee-fa83-4469-96fb-fb263c26bb3c@kernel.dk>
Date: Fri, 19 Jan 2024 17:32:52 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION: no console on current -git
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: avier Martinez Canillas <javierm@redhat.com>,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
References: <05ea3233-20dd-4af7-86cc-de11ad2efe84@kernel.dk>
 <0293b14b-6188-4229-9fb6-29fbbdb8dc83@gmx.de>
 <9e09464a-d58c-4f17-9318-26f0813a3023@kernel.dk>
 <b6350dac-0be6-45f9-9309-d196ea455dea@gmx.de>
 <017a1df5-e08b-44c5-9e4e-f61a9ce49e8d@kernel.dk>
 <2c267aef-f1a7-4277-aac6-75d9ea22ec03@gmx.de>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2c267aef-f1a7-4277-aac6-75d9ea22ec03@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/19/24 5:27 PM, Helge Deller wrote:
> On 1/19/24 22:22, Jens Axboe wrote:
>> On 1/19/24 2:14 PM, Helge Deller wrote:
>>> On 1/19/24 22:01, Jens Axboe wrote:
>>>> On 1/19/24 1:55 PM, Helge Deller wrote:
>>>>> Adding Mirsad Todorovac (who reported a similar issue).
>>>>>
>>>>> On 1/19/24 19:39, Jens Axboe wrote:
>>>>>> My trusty R7525 test box is failing to show a console, or in fact anything,
>>>>>> on current -git. There's no output after:
>>>>>>
>>>>>> Loading Linux 6.7.0+ ...
>>>>>> Loading initial ramdisk ...
>>>>>>
>>>>>> and I don't get a console up. I went through the bisection pain and
>>>>>> found this was the culprit:
>>>>>>
>>>>>> commit df67699c9cb0ceb70f6cc60630ca938c06773eda
>>>>>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> Date:   Wed Jan 3 11:15:11 2024 +0100
>>>>>>
>>>>>>        firmware/sysfb: Clear screen_info state after consuming it
>>>>>>
>>>>>> Reverting this commit, and everything is fine. Looking at dmesg with a
>>>>>> buggy kernel, I get no frame or fb messages. On a good kernel, it looks
>>>>>> ilke this:
>>>>>>
>>>>>> [    1.416486] efifb: probing for efifb
>>>>>> [    1.416602] efifb: framebuffer at 0xde000000, using 3072k, total 3072k
>>>>>> [    1.416605] efifb: mode is 1024x768x32, linelength=4096, pages=1
>>>>>> [    1.416607] efifb: scrolling: redraw
>>>>>> [    1.416608] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
>>>>>> [    1.449746] fb0: EFI VGA frame buffer device
>>>>>>
>>>>>> Happy to test a fix, or barring that, can someone just revert this
>>>>>> commit please?
>>>>>
>>>>> I've temporarily added a revert patch into the fbdev for-next tree for now,
>>>>> so people should not face the issue in the for-next series:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/commit/?h=for-next
>>>>> I'd like to wait for Thomas to return on monday to check the issue
>>>>> as there are some other upcoming patches in this area from him.
>>>>
>>>> Given the issue (and that I'm not the only one reporting it), can we
>>>> please just get that pushed so it'll make -rc1? It can always get
>>>> re-introduced in a fixed fashion. I don't run -next here, I rely on
>>>> mainline working for my testing.
>>>
>>> I agree, it would be good to get it fixed for -rc1.
>>> So, it's ok for me, but I won't be able to test the revert short time right now.
>>> If you can assure that the revert fixes it, and builds in git-head,
>>> I can now prepare the pull request for Linus now (or he just reverts
>>> commit df67699c9cb0 manually).
>>
>> I already tested a revert on top of the current tree, and it builds just
>> fine and boots with a working console. So reverting it does work and
>> solves the issue.
> 
> I sent a pull request with the revert.

Thanks! You forgot the Reported-by, but no big deal.

-- 
Jens Axboe

