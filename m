Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D286306764
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433337; cv=none; b=Whf/sCKHNNqwpiRGjr1+WN0zCu1wNw8/RBag64YQmMYOJ9R3wc0o6FT4yYFz+RLcJWmgqcUt626K2q1rsru8RAPcZLMJbD/Jsv5sZ3AIkfLtkJ4T7sE/D99f/09bqHHrdiVcWxWFDecEuCDDOdliR+lfPmJizAlUzGUDYeLh0vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433337; c=relaxed/simple;
	bh=8EXUz96E7wG5U1YoUA9ESlWFgT1FDI24Ni/grIsQTP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8tCiqrGRoETWPzc/pDvxiFjRnAl9dCdD5tlyrjXjAmD9vzaorbsimaLOyCdb8PdElSYM5eGdhJtJEdB1kbTT68dY+2ZUzh4tos4MSAebHHc4Vdzd1eVu5XvfGqa9/wHSbBmkO9trI9oU6KvZ7B4ZIwT0GUBGbhHkBnXjCXdbig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8W7NUgD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8W7NUgD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1736078f8f.3
        for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 00:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786433333; x=1787038133; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDP8FL9MuQ0PXH9ggGxLVTnQzIMzeA/Agxw+EtHBOZU=;
        b=s8W7NUgDGpkPIf/825FKVyjwQg9gkAZxsi5uhpKcO1FeevSfm7bVH66SCyv4vFE6AQ
         OnDNOyHfuAuaDGMX6Y+6fgNgOTD6Vc4V0olDW2MfIjTJXG37YQJoHfGhtEOBElITpg1l
         k22MGedYMCCqEVujONbTailqWY8VJ+E7r0auEGyBKbLbw1XUaPgDkzWhE6LYyPsD1qcO
         8EXQE644h0HS5ZCcs33FZaHcCmMMq08mc9TcDcDWO9PIdv5CJdcl50FiS8X2kKcGD+UF
         M5bzswsiKaqBl3IZTbJsFNNyNPZw4RzRt2sfM2lSd6X8MBgdg805AJq+tHNcgYYQr9UU
         F5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786433333; x=1787038133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yDP8FL9MuQ0PXH9ggGxLVTnQzIMzeA/Agxw+EtHBOZU=;
        b=kam75bsI1qPrS4KR57Ud5VFbFKfFKQhARsYJe6slD18uSxqeY8RsQbFXE1MYulBcxe
         2vIjNCCDMd17R7Kus1YGkOcDObQ5hxuqoITfv5SjRPhg7nLl36hr/9Wj4b4e93puL+X2
         PwM8ZTElLkhYDV/p13qbLN9f7as6VwIVHG2I/cCauivfC2lJm3dtmYpQAYnrghcmFc4A
         CLMdq5dLCSiIdcNRcl8cbvrPNwLTIA+lCgrBjFeOJrtQQVUUUqQGYup+SBH6a3iUlwxB
         rHpVR0LmaTlw/dg3buChhpVynOFFgWIejV98QffumhSISozNCN+NuC0i7fj3vQ++P5NQ
         +g3w==
X-Forwarded-Encrypted: i=1; AHgh+RpxfqqsWWmgpWblR6O468ewmevh4nsVOFv4iNV0JF1ibV9fD2+a23bYq4Fj2SiHJyW77wRETzy1+7lqgA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm8anQL7LK7dEca0l/FUxPAtbmfDuPCIyFl+GEa+C7Top6ihCu
	2uiZYcScyJoZ/7BsXkojbapnGKhGbg/R/At78ZTL8CjOAGLa/Ld1Xnx0
X-Gm-Gg: AR+sD12sc4b6UPDHUWcCy2BzM+iIrgH3/AgM5HdCsiRWyxP6/xzDfXHvy8W+2NNIELy
	vCOg0hJogdqCyhUzLZ79xeAb/btVew9lcvAVFpjHD2cJKBSE9g1v4CR5W42zJXFVgDTfFK8K2rx
	xZTQuePbUd2J7COPjWAlXKxkg4PH99Lx9dn2hUe/csFSj6BAezsZRsl+nRgaOGTkvvnJwT998rb
	FcKJJYFcMJkzxnP9eDdfT88qSy2aS7cjpbRyQvuu9Jz4vvpK2reELHGIFFjtirJY4iew5Z5poIr
	r5JJg/vHF086BcBqr+ydmdeKU3r4jGHIrczdUm1Hlhgys250Wczk6oFiCaVcDj78DJTDSnPPChC
	YmsOsKWtBPiSHJTu1jetuawdmq4uGQxgER/m36hpuPZ+GwvOWpC0U60HFOKm2EEpFj2/oag65SE
	NRC1lzuof3JUT29O3z/Gy0RcGp/QsgUjK4utWMXgF7IEDp4LK18Fhf5VK9xR2MG6PjwgFC+zXzL
	Vv9
X-Received: by 2002:a05:600c:1381:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-499783a9ef4mr21293835e9.0.1786433333391;
        Tue, 11 Aug 2026 00:28:53 -0700 (PDT)
Received: from [192.168.10.195] ([188.216.175.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997415df9asm41374625e9.13.2026.08.11.00.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 00:28:52 -0700 (PDT)
Message-ID: <1caea72e-b9c8-452b-a3ff-5690d948b4fc@gmail.com>
Date: Tue, 11 Aug 2026 09:28:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Please revert 1191285ecb42 from 7.1.y
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 George Zhang <george.zhang@amd.com>
References: <9c6acb62-4080-48e6-9ba2-d1c457c4ec88@gmail.com>
 <2026081106-pebbly-cahoots-37a7@gregkh>
 <23db5f95-c2d6-4712-856e-28f647e184f7@leemhuis.info>
Content-Language: en-US, it-IT
From: Sergio Callegari <sergio.callegari@gmail.com>
In-Reply-To: <23db5f95-c2d6-4712-856e-28f647e184f7@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2026 07:24, Thorsten Leemhuis wrote:
 >
 > And yes, 6.18.y seems affected, too, according to a comment in the
 > ticket linked below.
 >

Yes, my bad I only mentioned 7.1.6 to be quick. My actual concern is 
that the troublesome commit got to the LTS kernels, which I think is the 
biggest issue right now. People may find their display completely black 
or almost black as soon as their DE starts. Getting to the conclusion 
that they need to /reduce/ the brightness to recover is not totally 
obvious and is not applicable at all if you have a system that is 
touchscreen only (since you won't be able to see where to press).

 >> It needs to be reverted in Linus's tree first, otherwise the regression
 >> will be hit when you update to 7.2.

Indeed, but I think the biggest issue is with the LTS kernels right now.

 > Normally I'd agree, but according to one reporter that problem does not
 > happen with 7.2-rc:
 > https://gitlab.freedesktop.org/drm/amd/-/work_items/5562#note_3603131

I'll see if I can try myself the 7.2 RCn series. From my superficial 
analysis of the commits that brought us to the current situation, the 
troublesome commit actually tried to patch on a true issue, namely that 
the user facing brightness data is not mapped symmetrically to the 
hardware data, but that the correct solution involves some more thorough 
rework of the brightness coordinate system. So there may well be some 
larger activity on it on upstream.
 >
 > Given all that I wonder if dropping that commit for now might be the
 > best move.

Personally, I think that dropping on the stable series would be 
beneficial, unless upstream can now offer a correct solution to pick. 
Behavior you get by dropping is not 100% ideal but certainly not as bad 
as what you get with the problematic commit.

Best,
Sergio
