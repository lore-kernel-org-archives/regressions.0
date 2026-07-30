Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E0C44C4E3
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428541; cv=none; b=hgrBiExXUz/dYHVEQZ4WmPk0+TJOVzb6lFBITsTk02McvI4UFaPq615eQ8NqKgy+lSoQbYSwE8vP79nGWOiheMrU6c6d7arYxicsEh3qTM20kB6kpojc6vaHOmguDJGidi/EVO2L5kDZBo9k4pgPcqb5RmXlzQHYGX82Y1DgLCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428541; c=relaxed/simple;
	bh=LzrA83SNg0xwZHckZyesHpd9prkk7E8+AsPKLw0gsqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hD8xttqtWhlDzYmk8V3i+0sJpPU1UvVmcKpAPgihbXpD5Glrbi8GEBOsPz2Qg7UtQYQSLp81OdlAHXmo72aIOKmrv09VIr0GCdTAxN5srTU1YWP/HG+BYrM3iAt5Otyv4Xre8kcmmJHAMDSezSKIoH9K01JwYCRrEFvyfSzRPDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=oeN1Yf36; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="oeN1Yf36"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-448b69cfc6dso21017fac.3
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 09:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785428538; x=1786033338; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2TO7rhJEb0t2mz700nvgDIByTqbVS2Yz6f37I4sh7O8=;
        b=oeN1Yf36kEhrrWIHGbUjBV2+eIOQVdifYUj49zh2Ju9LChTUicEbY88Cfj2HwtxpgU
         YQKYItF2eK76v0NXHk/Hylg0nxbKpk1dfdqYhwvycgMpXCVJiPbx3X/k9uenIzBsnzwL
         vFh+GT59cZ7KGCfV0dhAUP8kXwyFgVrASUxOyDxK6pk/IKuDWeHFlVXR8IZYd+AGTBJe
         5bzZJouMfta5C4F6VklXn9m8y6lYlTGlE7ppF7DS2BQBtpyPbofzDSnse8qdI+ULFYKO
         c70Zzt1zok7nGDpd4o5tP99b2o8kfyDO88n+u0FUjn5OmQIwUfaM6yfi3JqQmTE2YNpP
         ASwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428538; x=1786033338;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TO7rhJEb0t2mz700nvgDIByTqbVS2Yz6f37I4sh7O8=;
        b=H5GoUzvwkj1iNxlA4YL3/LFMUGsCZe8eDZlXpV2rz3cFqgfNhXb1QJPbdfZZJ4u1Xj
         99o5ERYn8fdFMqWGfP9Kr43hrZc3vS93g2l7p/dklZ6P4XQDL1ZKh/Zenpviy13939v8
         NWJQPMb+zso0arezy1LHYltBozm9eyY4HGFRQTy0vcCj1++yoFQHCP98UxhgagqBQl/F
         6twxr6anIAi1MrWv09nKcKh7A+/PO3ALES3SApZdkPBDLjF2nM9HF/mBdT6lukvKr74S
         gpksB1LPjJsGZa3VxzSDRWNVC81RqBb1NrOJYQQiiPyCMHmsdw+IHVxFXvmuhWwdxL7o
         LH7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqM6alPA0TUb0bDrokiv1u6pOhGpniUCendwiBlcHhLnCM8fpm0x2H2c5o8ZObQj5Y+5KIEz6HMKiBlyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcVmkBYLcobLup8BkLl6iXwRO0N1hl9RtWSIK/UoTTLFy0zgx7
	ZgkFhGuaxUXdHL0PJX/N74oRGZ5w82zswlrwRTm0B4kB+Z0tCaokvqRicmpsgOP0AA4vEaXAb8L
	7yry51IuM7w==
X-Gm-Gg: AR+sD13MNZyjUVpmrNSQabBR6V0+371Oa14VJ51u8Xp3IJKxpH1aUTVWcDQQUXrF3+B
	6v9isw6flBpJ508+vhpIRd16C7NRB3EkQOE4DKyhNWMTTTlRnY+gFQI4xZDdxWladfX/qeKoGVA
	KqL3XLARn6SXDY6MJ1zxmrHNmtA5Tm9ar9z8Xa45ag4rDLv3UFZMxcZhTzKTGZgOH6LRs5WIFN4
	vqXuO9eoeRZTiRn1U1OMbMDSvkKo/Bm/qyVa1HOpXr7RpV53hwvngNhwO5kUxGWN8D6hUYG/3nY
	1T0eXraUHa638Q+3zO+uYZf4FtfwhUDK/HPUro7jKMd82AKE8qVynjBE21Y/BPAsynzs34hua0m
	Xt43aKI4DSdsZ9DgMWQUzmSVnYS8ZtBy8eLDzMCKkAF7E+sipeoXIE1qIbBexlIM3XHudp92Wbn
	OufDPlnjsPGg4IkXcR3utdjysmvr6NdjWY44SdJLBPsPL6L72mr6tmYGeTAr+IEW9qUkw68mVne
	jVVDXFeY3ud6FQzwuVbIQ37RkmOyC8UyeQjBY5ykxHit0aQ0hiiv0AU
X-Received: by 2002:a05:6870:d361:b0:456:4c3f:7e03 with SMTP id 586e51a60fabf-458c0e12897mr2206023fac.18.1785428537794;
        Thu, 30 Jul 2026 09:22:17 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c257c4d0sm2482546fac.2.2026.07.30.09.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:22:17 -0700 (PDT)
Message-ID: <e85ec957-d648-4d6a-bcfe-09dd2d21d090@kernel.dk>
Date: Thu, 30 Jul 2026 10:22:15 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/5] block: validate direct I/O memory alignment
To: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@meta.com>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@lists.linux.dev, brauner@kernel.org,
 djwong@kernel.org, viro@zeniv.linux.org.uk, regressions@lists.linux.dev,
 torvalds@linux-foundation.org
References: <20260720201057.1862857-1-kbusch@meta.com>
 <ampRQyXDbGgeg49V@kbusch-mbp>
 <fbe9e74d-c389-46f4-9874-3e9ffd9c91d3@kernel.dk>
 <ampce7mxSmxAwAiu@kbusch-mbp> <20260730112626.GA24827@lst.de>
 <amtJDCtczVyX1baB@kbusch-mbp>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <amtJDCtczVyX1baB@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/30/26 6:52 AM, Keith Busch wrote:
> On Thu, Jul 30, 2026 at 01:26:26PM +0200, Christoph Hellwig wrote:
>> On Wed, Jul 29, 2026 at 02:03:07PM -0600, Keith Busch wrote:
>>>>> Hi Jens, have you had a chance to look at this one yet? This addresses
>>>>> previous issues with certain device mappers under direct io.
>>>>
>>>> I they look fine, but at this point we should toss them into 7.3. Yes
>>>> I know there are regressions around this, but from 6.1x days. And the
>>>> series doesn't apply to the current block-7.2 anyway.
>>>
>>> This series is kind of old at this point, but yes, it's not fixing a new
>>> regression either. I'm okay if this goes to the next window, and I will
>>> handle the stable follow-up.
>>
>> Honestly, I think that'a a reall bad idea.  This is a regression in 6.18,
>> and while it took a while for people to hit this with their a little
>> more complicated lvm/md setups, it has stopped real systems from being
>> used.  We need to fix this ASAP.
> 
> This should have gone in several weeks ago, IMO. You can most readily
> hit a problem running qemu against one of those lvm setups. We're just
> so late in this release cycle that I'm not pushing hard for 7.2, but I
> would support that choice too.

Exactly, it's been floating for a bit, and the last week is surely on
me. But merging at the time it was posted would've been late for fairly
substantial changes.

Hence why I think 7.3 is just the better choice. We're talking weeks in
difference on when it gets to stable anyway, which is what matters.

-- 
Jens Axboe
