Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706D01DFE8
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 19:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716320189; cv=none; b=YoYvkZSa05WFG9f5+lalJSXGB+UMlyIxyz5RNQGL2WwrUgS1x5Mshic+IeFSyeC6JpaQFabMgkU9/5BhFXHTBMfxOaHvhMLopnTmlWqb2tRkho8AhTzAM4KcA/VR5S7R/xjO010TaRRpgJUokE+JkEbUCUEhi3NwA23PSTsluzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716320189; c=relaxed/simple;
	bh=ikxbxZ8FjqMDhrrkk2D5nLqfIfAn0RqHaPpraJv+K/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MLg48UFVY6bbVNoZpu+hGnerxziEZ7/RNnlMA12egohAurA+mK4l7fo3sNSKctCDmyV0N8ocXoMV306GCfFKZSno9HfDcdeOdtk3n8sqrdM9WZ6hSvMHB9QYanNYslnbXnbBUL5Ts8NUnMKHx0CkIYy7RBRoRP1OOtYJl4/ypsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=fBJuZW46; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="fBJuZW46"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7e22af6fed5so20697739f.2
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 12:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1716320187; x=1716924987; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xePqQlr9Hwg/NyUW4bJAe88xQcUe0YJyjg2xMqe02j4=;
        b=fBJuZW46/D30kebb2oA6zyDvs1nIgADDfBfmnN8aQoSe0RTX3GVFhK7ANxUtSDArrf
         G5OG0PcxnsdCue7EFMJWAJDju0Wh7AzOahnjQH9UezxRZSMGbzIhLVvK6twJM4E3QcNV
         alKS5k0omLAKzfAaIV0U+8mMtFUksC47WWufBDjPElvRuMDuIpwUj59bITdXby3bQSYm
         TagFpFgCRZ7PYz6mOBfKpyj/lz2APgChaf2uviJyBRIMDWHP7tnPztEYC/E9a2v+1jUk
         pUtxwFYe7lgDqOJlSUzhkTivZzY8/NgiA34VVAz6sK8JsK41pVL8bX4dKURgm1p3123n
         7C8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716320187; x=1716924987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xePqQlr9Hwg/NyUW4bJAe88xQcUe0YJyjg2xMqe02j4=;
        b=dj2egiVc+wuLV7N7GtdJJmIEBWlnhvl93+4BdYL6YiWLiYBLbDxBKOgbG58+eskR2V
         WvT3C/Ex8KmwRySooMYRB8m32UMco6xrJZzj/9pjoSaOqmutkCA3RO/UHBU68nHgi52i
         r3f6qw3XX0oV7irqNlwXNhRgslvUKKyjCta7bxaU0ae/bTZCYadmY60Vl3DRN7LmMI0e
         Mrn6cH4QRkZ9CBpn5bSP0ewoCXItxhhqNkdBKB0y+yHW4AySIjf8ct0NrJwy8Kvk/RdI
         T48/Jbs/GtDYVI1JObgd2vQkIN1ll7vtHKyNTRAABofKukLb7dXJVlsnGg0orxOopve9
         FhsQ==
X-Gm-Message-State: AOJu0YwdZzyygF6yzdpS2N6tcCKIWYA/2Z8jmK7+YP8k+svkqjBA+DWz
	AFY7dFlyuLNesN0+baWf7Vhs5U8NQO/S4VIxImpQHd7yIJH6+RpXwbITm4GzprQHIRUJ6sDWi3c
	P
X-Google-Smtp-Source: AGHT+IFk2v5N71VRLaKar/Gv9UHdlrX6c0Pv9qkJ50PzawnksP2Zx+uvBLPpPUIbBIU6Bk0lWQT3lg==
X-Received: by 2002:a5d:9496:0:b0:7e1:8bc8:8228 with SMTP id ca18e2360f4ac-7e34f7ff29fmr2400939f.0.1716320187504;
        Tue, 21 May 2024 12:36:27 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-48b9b4d71eesm3522227173.143.2024.05.21.12.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 12:36:26 -0700 (PDT)
Message-ID: <be0bb7ea-8e82-4bf1-b592-918080216db6@kernel.dk>
Date: Tue, 21 May 2024 13:36:23 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ETXTBSY when running Yarn (Node) since af5d68f
To: Andrew Udvare <audvare@gmail.com>, Christian Heusel <christian@heusel.eu>
Cc: regressions@lists.linux.dev, io-uring <io-uring@vger.kernel.org>
References: <313824bc-799d-414f-96b7-e6de57c7e21d@gmail.com>
 <8979ae0b-c443-4b45-8210-6394471dddd1@kernel.dk>
 <8de221f7-fe5a-4da9-899e-de2a856a4ddc@kernel.dk>
 <yywbp7fjnwgqxvc66zimea4hgdc2eysjx5nezky3vndr7xw25l@jv76rdseqm3e>
 <b8018270-6e9a-4888-87fd-69620d62c4e5@kernel.dk>
 <0ec1d936-ee3f-4df2-84df-51c15830091b@kernel.dk>
 <bcf1e758-66de-47fd-8cfe-ce77c545a8bc@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <bcf1e758-66de-47fd-8cfe-ce77c545a8bc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/24 1:33 PM, Andrew Udvare wrote:
> On 21/05/2024 14:29, Jens Axboe wrote:
>> On 5/21/24 12:25 PM, Jens Axboe wrote:
>>> Outside of that, only other thing I can think of is that the final
>>> close would be punted to task_work by fput(), which means there's also
>>> a dependency on the task having run its kernel task_work before it's
>>> fully closed.
>>
>> Yep I think that's it, the below should fix it.
> 
> Tested-by: Andrew Udvare <audvare@gmail.com>

Added, thanks.

-- 
Jens Axboe


