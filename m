Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B6F135A4B
	for <regressions@lists.linux.dev>; Tue,  9 Apr 2024 15:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712675827; cv=none; b=q/M+XhCG5mOqsZTELs1GNVxf7rbYNeNf8K/TVhClkMTUIU9OV6EnEVlASKvXtyhDKYT7u3aK54SHXfGoqiD60zsS96b4H+iVCyKsCRG3V1Ve7/7MrrP5SZ4rY2tJmqRezA1opGS7GMn+rDEJ0LLWhGxcO2XXL8wevMS22LVlxzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712675827; c=relaxed/simple;
	bh=GpV2fHcAbppCLh2u5U1+w9Mj9ggp/1FWwmBurNKmVg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrUvLSZiP4qBWLzSotIe4DzPA9/BIOO7V7QH8AugRg1AkjEjNBSJht6p5cGsC7gVGo6nKTSKgpIQq2Fy3hoPgc7xoJ738p08cgAjtQzix6EIVVO4MRDAxCSsPGW/FY5KQf9KnCePoDGtlrbGBZbjOUg1XF28OJXXtEqKu+t4v/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=K4mNDF6k; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="K4mNDF6k"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e45f339708so4304275ad.0
        for <regressions@lists.linux.dev>; Tue, 09 Apr 2024 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1712675825; x=1713280625; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFN5ra1aznPU86rqQVA8b3ykCxoSF9HNqWhAYFl+4RQ=;
        b=K4mNDF6ku7JYS6k/iUmxxl8kib9tauEyv8yVcmAdkKboBioSYiX1QOWQwr3RfKPi2r
         dUfqfe3bvd1axAfkKIGselQswHZEL48D83QZSG98Ro2SVe32Z3CTrpv6cHpRAbSF3BgT
         /J218hoRmkC18m3TjvSyb+9347ev6Kh5C2Dq8KfGLS3Dkv3WscgrJ3ZlNjg2zv1mmG3c
         ltGpEKLH8VMhzGxMQrHDiks6wMofuLwdb9lwMTBNE4FjrHDAkq602lsAR9ejoFEzRtUz
         dMZt8pvmDGd1Jv3RmH4W1CtDJ3gbGerxBsx3TP8LcryXD2D2kaNv0EDh3PbQMstjoZw1
         NKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712675825; x=1713280625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFN5ra1aznPU86rqQVA8b3ykCxoSF9HNqWhAYFl+4RQ=;
        b=cufHPWmA/Nr8bS6EeKnflpUZC54M9WBqwQqaaAQojsQpn/zUB/pJwPehvFO/HTT6IL
         lrsAahialuzwxsWgNzLPimSlrTxyCINIMAfJueqywa/vhHwQFc5Bu/VJ9cf+HlPIPwqk
         3JZG7H9aaWBj/acKfMAGj8dfC92fNZRHWuvLJIq4c7rzVKs3f2YqHugUhJuCudtxAeit
         j3h/QdBIDtzVrBZcF5E0bfwKfNNP+kURpaWFyCKjmt552stO21pAqxtA47OGUtAKMyDQ
         6rLGjO2X9LrXwH0lPs3PADTdm99rqtaLeDoD227bQO4uXBjs0GWrPWQtznaf0pZmgJSn
         bL2A==
X-Forwarded-Encrypted: i=1; AJvYcCUK63fEftf6cQa6YpybgN+ghg5/WuOa+T2vvUl0pp8EStTw3OB0O8lc6wPPXw01bPjd+imTXVOjlT+k1a4ZPKjIUbsAPkYu5FjAkGU=
X-Gm-Message-State: AOJu0YwdINt94ItzLFJbW2CWNt7DrswoXkJ3/FglNANHlom/+06OScu1
	iFX+7HRBI642Z+Sgm2BZjp+Wp2wrTbxEJCQbCNCo2MUhmg8OxQOLD2SgJWxBVL0=
X-Google-Smtp-Source: AGHT+IEFav7+y9oyCqRY7zx1fepSUKQxh2+t7rbF9PdgaetXQkALGBsEsh+5vF07Bn24RD62f0/qxg==
X-Received: by 2002:a17:903:22c8:b0:1e0:b5f2:3284 with SMTP id y8-20020a17090322c800b001e0b5f23284mr115142plg.0.1712675824751;
        Tue, 09 Apr 2024 08:17:04 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902ed0d00b001e0e8e4f7e3sm8947433pld.206.2024.04.09.08.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 08:17:04 -0700 (PDT)
Message-ID: <d7a2b07c-26eb-4d55-8aa7-137168bd0b49@kernel.dk>
Date: Tue, 9 Apr 2024 09:17:02 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: API break, sysfs "capability" file
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Lennart Poettering <mzxreary@0pointer.de>
Cc: Keith Busch <kbusch@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-block@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <ZhQJf8mzq_wipkBH@gardel-login>
 <54e3c969-3ee8-40d8-91d9-9b9402001d27@leemhuis.info>
 <ZhQ6ZBmThBBy_eEX@kbusch-mbp.dhcp.thefacebook.com>
 <ZhRSVSmNmb_IjCCH@gardel-login>
 <ZhRyhDCT5cZCMqYj@kbusch-mbp.dhcp.thefacebook.com>
 <ZhT5_fZ9SrM0053p@gardel-login> <20240409141531.GB21514@lst.de>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240409141531.GB21514@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/9/24 8:15 AM, Christoph Hellwig wrote:
> On Tue, Apr 09, 2024 at 10:19:09AM +0200, Lennart Poettering wrote:
>> All I am looking for is a very simple test that returns me a boolean:
>> is there kernel-level partition scanning enabled on this device or
>> not.
> 
> And we can add a trivial sysfs attribute for that.

And I think we should. I don't know what was being smoked adding a sysfs
interface that exposed internal flag values - and honestly what was
being smoked to rely on that, but I think it's fair to say that the
majority of the fuckup here is on the kernel side.
 
> At this point we're just better off with a clean new interface.
> And you can use the old hack for < 5.15 if you care strongly enough
> or just talk distros into backporting it to make their lives easier.

We should arguably just stable mark the patch adding the above simple
interface.

-- 
Jens Axboe

