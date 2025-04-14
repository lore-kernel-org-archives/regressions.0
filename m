Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A4225DAE8
	for <regressions@lists.linux.dev>; Mon, 14 Apr 2025 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621749; cv=none; b=cFKCSapmmd7cv0TFAnbxX46Y8CvQ7FoOC/DtPEd/z9l3E/NWgVRXpeEhPntNTOi3RcayInos1wdeRt2gXzduMl1QsjFCcahB9mEHf11JhgiBX8o2CmlYpneUY1J40VHP/7b/e+DkrygrhEGAVC9p9C8mdbxLXwNbuaplO7WCSQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621749; c=relaxed/simple;
	bh=+ae7PEkBWVnD/XgndULpX0wq3u56Hkq7Lh8T4H7CnMw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=C6vFu5/gASXMiTxBaVVqegIUr5d5plGKJTkOTcIBCfs2MdX61+Auherb1lo/noJu+0oaj7/zDVFphDX1Bn4FYFpRcVlJcw1hlFN7jQC0/MoUQNZnsfjzeZ6EAJ1OWcMKqF9O+wCAcf50DQeQpEPlNIu0ijBa7FFzFCodspYh2dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgHV1ERB; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgHV1ERB"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so6536798a12.0
        for <regressions@lists.linux.dev>; Mon, 14 Apr 2025 02:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744621746; x=1745226546; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ln9rD8BOUkqsdcSku7nsN2RysHqQx1gKf4wgBYpxgJo=;
        b=WgHV1ERB+QGNkPngRg7vUpBeZxvfaxXF7GIQj+XATzhvQdA2STPsSTmLV1+T8q5b2/
         d5UAATrOEmwfueIXBj7jF29TbXMYDxz1+kEQdcMY1APzrIgF4gwcIix2lYnjR9iyYddP
         Y/p1ieyo+QiNQOuwnNVNQd1dN1vnm3S3bwSQDM9BubA/edBDRIVf0LdxLsclkyjX53Gc
         x+BEgcepj2A81RFWvAHAR6uSFzyYpGF68K58gVL8+sUwRmIQ7+gfBfuF+qOdbyXZyPCG
         gmHnzp1sb2ZYH1cXMxV+NRKSgYnbp0Cz9bI1JutQ5hIDAaZSzEzr4wm/7r0fe17tyRfx
         d/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744621746; x=1745226546;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ln9rD8BOUkqsdcSku7nsN2RysHqQx1gKf4wgBYpxgJo=;
        b=e+BHkSDjgADihIy9c4mnBKUaPh1YJoVcl6yDVuYyeHhRxeFVhGZ3gX5eOagA/4JfM1
         nls0KXBBtowK4RDkTvEDHBVnE2AqZ6ad9C4It9nZ0c54JtYrsGQYfrPu/FZM8TS1hCKH
         P5dlOTmGk0+DJaGxSrO87PVIssMY/5pb9g/7lg2vZ/srBV/mS0ou7ZLEzkEu/IZr56qW
         bwO5JJE+1jpPqbLEIXhWIQh4PlzFFYU79jWcR3RhQPWTIm/Os0aIebw3EI+7H8qu3ZeX
         v15Fue0eF/EHZjqY6q7D8VbJvwT6YkU6x7MELYsIXIZ2mh8q4lleJRvB8CdOcAzbObHH
         uFPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5tmzxAXYM5P2Yo+W5FJVTKWdugRgtomc2xnhIna2l4tk68/bKqH0aEVY5XXV4ZwoNqoKg5Da2Lv4RHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9097dritAWHS9bLRUJ4v6EqUyv7vq36pt0+1HrokwsycrHaJo
	DMLFJ2Unxn8RV+HL3ngQwHEC5ByYV+FCpfWwyJ67zX0omUe1QygZ
X-Gm-Gg: ASbGncsZ/mDOgbYcjOZiSA58VGU9b7Gya617L30/uj+yYjgSfs9JlXHEiAFTAD5/VXW
	MB1K5PE7jMDXrG5124lLdLB9n+nQwonnSJmNIMUpddH6CQl09fsjc8oI1RFdE5PRoCGeVfaxB/t
	DkiccDGlG2p0jjd2M8bZQFlprth11sXxWWnVHRu7OK8Y4o/vPyn5jq23hrKQxVXJUbejmaJEWZy
	+C93sJfTjOu7Y2MzvxDCRIGM1Bl+AgYb1qCcET5hYn6AelQifIncSnMKbu9yEhG5+B2F2pSM+0R
	CJy4oNysnQqfyEp19MKtJTBNZD9K4faMfJemfbq9uK+P+N7w6ZKl0nfFax5a9iXY29C6M+GU/kN
	ByFl4fhrZAw==
X-Google-Smtp-Source: AGHT+IEbHNROGx3S1lNvZJDO7eQBzvciyzW8bEHw5f3aZlJfOkGE9b7WpF07oD50zzLrUC2dqkc18w==
X-Received: by 2002:a05:6402:2399:b0:5f3:7f49:a397 with SMTP id 4fb4d7f45d1cf-5f37f49f631mr5972654a12.26.1744621745650;
        Mon, 14 Apr 2025 02:09:05 -0700 (PDT)
Received: from [137.204.143.152] (arces143152.arces.unibo.it. [137.204.143.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f06c5desm4620406a12.48.2025.04.14.02.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:09:05 -0700 (PDT)
Message-ID: <ba8ac396-4531-464c-86ce-90345896e176@gmail.com>
Date: Mon, 14 Apr 2025 11:09:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: mt7921e unable to change power state from d3cold to
 d0 - 6.12.x broken, past LTS 6.6.x works
From: Sergio Callegari <sergio.callegari@gmail.com>
To: Christian Heusel <christian@heusel.eu>
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Linux Regressions <regressions@lists.linux.dev>
References: <415e7c31-1e8d-499b-911e-33569c29ebe0@gmail.com>
 <2025031923-rocklike-unbitten-9e90@gregkh>
 <5e260035-1f1b-4444-b3b8-1b5757e5ed08@gmail.com>
 <38658f1a-216b-470d-99a2-13d66f075c77@heusel.eu>
 <efde5e18-672f-484f-90c3-d23d673daa18@gmail.com>
Content-Language: it, en-US-large
In-Reply-To: <efde5e18-672f-484f-90c3-d23d673daa18@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Happened again, so I could make a test:

Kernel 6.9.12 does not have the issue. When the system comes up on 
kernel 6.12 and no wifi, no ability to change the power state, booting 
6.9.12 fixes the issue.

As the issue is fixed, the dmesg is interesting.

I have a long series of

mt7921e 0000:05:00.0: not ready <some time> after FLR; waiting

where <some time> is a time in ms that is progressively doubled, until:

[   57.726146] mt7921e 0000:05:00.0: not ready 32767ms after FLR; waiting
[   91.812263] mt7921e 0000:05:00.0: not ready 65535ms after FLR; giving up
[   91.955247] mt7921e 0000:05:00.0: enabling device (0000 -> 0002)

Next time it happens, I'll try to see what happens with one or more 
kernels between 6.9.12 and 6.12.

Thanks,
Sergio

On 30/03/2025 18:35, Sergio Callegari wrote:
> Hi Christian,
> 
> Thanks for your nice offer, details below:
> 
> On 20/03/2025 11:05, Christian Heusel wrote:
>> Hey Sergio,
>>
>> On 25/03/20 08:49AM, Sergio Callegari wrote:
>>> Might be able to test on the distro built kernels that basically 
>>> trace the
>>> releases and stable point releases. This should start helping 
>>> bracketing the
>>> problem a bit better as a starter. But it is going to take a lot of 
>>> time,
>>> since the issue happens when the machine fails to get out of 
>>> hibernation,
>>> that is not always, and obvioulsy I need to try avoiding this 
>>> situation as
>>> much as possible.
>>
>> Which linux distro are you using? If you're on Arch Linux I can provide
>> you with prebuilt images for the bisection :)
> 
> I am on manjaro, where the kernel follows slightly different naming 
> conventions, but the arch kernels should be OK. So thank you very much 
> for the nice offer. The thing is possibly a bit premature, in that I 
> would like to identify first what is the kernel RC or point release 
> where the issue started to appear, because I have these kernels 
> available for my distro which makes things easier. Unfortunately, I am 
> still in the dark even wrt this.
> 
> The issue is nasty, because it only happens when you crash on restore 
> from hibernation, which is something that I am desperately trying to 
> avoid because this is my work machine and I really don't want to risk 
> data loss.
> 
> The big problem with this bug is that you remain with the impression 
> that your hardware is bricked. On the web I read that booting windows 
> immediately gives you back the wifi device on pcie, but I really cannot 
> say, as I have no windows to try. What I can say is that the 6.6 LTS 
> kernel also lets you recover the WIFI, while 6.12 LTS does not.
> 
> As a stopgap, would be great to know if there is anything that can be 
> done while on 6.12 to fully reset the pcie (or the pcie device, I still 
> don't know what is the culprit), so you don't need to boot an older kernel.
> 
> Thanks again,
> Sergio
> 
>>
>>>
>>> Incidentally, the machine seems to hibernate-resume just fine. It is 
>>> when I
>>> suspend-then-hibernate that I get the failures.
>>>
>>> Before contacting the network driver authors, I just wanted to query 
>>> whether
>>> the issue is likely in it or in the power-management or pcie subsystems.
>>>
>>> Thanks,
>>> Sergio
>>
>> Cheers,
>> Chris
>>
>>>
>>> On 20/03/2025 00:54, Greg KH wrote:
>>>> On Wed, Mar 19, 2025 at 08:38:52PM +0100, Sergio Callegari wrote:
>>>>> There is a nasty regression wrt mt7921e in the last LTS series 
>>>>> (6.12). If
>>>>> your computer crashes or fails to get out of hibernation, then at 
>>>>> the next
>>>>> boot the mt7921e wifi does not work, with dmesg reporting that it 
>>>>> is unable
>>>>> to change power state from d3cold to d0.
>>>>>
>>>>> The issue is nasty, because rebooting won't help.
>>>>
>>>> Can you do a 'git bisect' to track down the issue?  Also, maybe letting
>>>> the network driver authors know about this would be good.
>>>>
>>>> thanks,
>>>>
>>>> greg k-h
>>>
>>>
> 

