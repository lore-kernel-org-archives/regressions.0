Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7747911CA4
	for <regressions@lists.linux.dev>; Sun, 19 Nov 2023 13:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmIyLK5f"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cc5916d578so31344465ad.2
        for <regressions@lists.linux.dev>; Sun, 19 Nov 2023 05:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700402019; x=1701006819; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKKLS+w0ex8qV597KBVIuYVHQ6+SkzFRNWt3xyBrGms=;
        b=AmIyLK5fK1qhnwixvD8xB9KsnNl3nTPdOXJn1UggxszQygAAQ6VGtNjLGu50F0nAfu
         s2LOZrzhhmE0AKNfVLmVa7CHLHR2tOpZ4tTas3tqSk5jH5N81iaThLUz9qqFrEccivX6
         B+Gy2EjJC5kYpCqXMn2ToGeVJDvzuI0gyOdtyOiLdt+HsqenyAauCczFaROxt9T2RV3E
         4CPHWE9dwTfsOtXFn0ljP5JKAhA9uszLqQ2/lmYyODsABgzd82c45HG0IMGtyaXEUXlI
         Ar5rB823DGgjx2c/jyCgZLeiTa2afuuE07oFjPGJ83z5y69xLR3aa7jB3Kt1iq2bZ0P8
         eO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700402019; x=1701006819;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKKLS+w0ex8qV597KBVIuYVHQ6+SkzFRNWt3xyBrGms=;
        b=Xl0PqWxnuP70cR4mrByp/2BERIEF/AGqMa5RMFpNpdH4oBG3oo9pTFBgq2TB5BJdgC
         wYda8NC1e/lygQzCVCCvNW+KXqKsKdLMO+iJCmqRLHBZp+Rruc4v3fIZlXnLL8bRFolZ
         oUcISrnAv0uhAxOOVpW59CZcT4qY2ZxqVjzICvSHKWzyZmQF+sfmgdjGl7CsctiJfCuf
         uqFQBMb6CyCb3O+Md5HNkdI7dlAR+1wV2onz5ZpTuoe0lLcntxjEwM3QUAndN16jO056
         ROOCUdTiTg+dTSAdmOOUZN6S4ZA+2gpeEOHo2HWTV7IFWZomY7xCSXnCbFbluoPHvoP8
         n9Og==
X-Gm-Message-State: AOJu0YyYL2CMKUYGo1iFroFunFE7kAIcWbR0geVQV6Occb09Ik1T/UUO
	5jCOmbhYmD0yuhnfcvO9Aivf2c5/G2k6sQ==
X-Google-Smtp-Source: AGHT+IHriLxPDpGKhWAjBZMWDVWsozrin31cIWjg7jAzFtJ80MgWjLRxNJXU2ldtCC5/2LJ3VhQf8w==
X-Received: by 2002:a17:903:495:b0:1c9:ff46:163d with SMTP id jj21-20020a170903049500b001c9ff46163dmr5386849plb.38.1700402019602;
        Sun, 19 Nov 2023 05:53:39 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id z4-20020a170902ee0400b001c55db80b14sm4372776plb.221.2023.11.19.05.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Nov 2023 05:53:39 -0800 (PST)
Message-ID: <af2d08ab-54c3-4066-9c28-18e96de8643a@gmail.com>
Date: Sun, 19 Nov 2023 20:53:33 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Radeon regression in 6.6 kernel
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Dave Airlie <airlied@gmail.com>
Cc: Phillip Susi <phill@thesusis.net>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <ZVoMklvIVClr_IIH@archie.me>
 <9195ca1f-1d72-4616-8bdf-62f9f5c636b9@leemhuis.info>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <9195ca1f-1d72-4616-8bdf-62f9f5c636b9@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/23 20:48, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 19.11.23 14:24, Bagas Sanjaya wrote:
>> Hi Dave,
>>
>> AFAIK commit c07bf1636f0005 ("MAINTAINERS: Update the GPU Scheduler email")
>> doesn't seem to do with this regression as it doesn't change any amdgpu code
>> that may introduce the regression.
> 
> Bagas, sorry for being blunt here, I know you mean well. But I feel the
> need to say the following in the open, as this otherwise falls back on
> me and regression tracking.
> 
> Stating the above is not very helpful, as Dave for sure will know.
> Telling Phillip that he likely can skip that commit might have been
> something different. But I guess even for most users that are able to do
> a bisection it's obvious and maybe not worth pointing out.
> 

I was scratching my itch then when replying. Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara

