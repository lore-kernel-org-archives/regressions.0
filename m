Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDE026E17C
	for <regressions@lists.linux.dev>; Fri, 28 Feb 2025 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751731; cv=none; b=rpMtrIJlsCWkCZQz/sHP/IPDK3+kxTz41hb4LSD/Zc0FkSPyBKqQw95zO38gi33dvLwOw6GO6ZppVyhVoJ4qxT1O0RA3pMnSwGIbbvKa9cEZb+6j3iiIAbttNbIcJkTlPmEbX8O7uAAQAccimRj+Pa3cTl2o/YGULqV75Jkoo+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751731; c=relaxed/simple;
	bh=7DWNdt/2v2uJzfa9a4Lu3gm3NbTQQQo0EG0KhdAX1p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uVC7qUarIo1R0NdbG6HZSbtRQxUpleIElBE0wyCti2K4o++7UgyZoFneAAMBB9ZTeVPEe7po601gje2FDUHSkr2tO3vEkinKTSevCaPz2MXsn/3WDL24AMrK0CeOAY8ywONpnF7JBVD7vYvPAGlijvZQZ8eHwG1GKOfwwIy6QY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=dC6f34qf; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="dC6f34qf"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22128b7d587so42111075ad.3
        for <regressions@lists.linux.dev>; Fri, 28 Feb 2025 06:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1740751729; x=1741356529; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7CILUScLE0hBWAgWre2/oKndCrDoF+/2Wtd3L87a/bg=;
        b=dC6f34qfY5V9CzbhF3/UZYEmgsBfitgDuj4dQZb7WNELOoMEXip4FMVo0gJ6khYqbJ
         MHEXp6VJbjwZDyJFiTTv6bHLiP+7nQZNvyQpIV8dhs1vOimBz3QY/E+zO7qvTCgAW81l
         oR1lDATBTG+JXzNbis5outqXyMKlI6Ir+Q5aUwTkbm1m8jj3XLH0XJSdvwT49ex8g8nV
         IKmfl08wK+/sRXjnrL44yhY7g7TcGvACSjGABFAb66W0iBoz3duUAZIvmwzyypRCo7pt
         5fJ7IW/bwrdtgn+KuZtLSwhKMseiPRRW4OeF4Svc6dYEYhlyfhxt8LkkoA9jN6R0Qt/s
         xo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751729; x=1741356529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7CILUScLE0hBWAgWre2/oKndCrDoF+/2Wtd3L87a/bg=;
        b=o/NlmDQxZVtgwd2p/huQIRahgNaXwmIvth+fby/WCNxUzoiK3V5B3sezz57uLZk2f+
         8j453ulD+1qmr59l7K776EyT6rCvNqbTmvY+ysz+h+StI4NQuAnlziupWi7N6ZwuX/b/
         XUCZZKX54jBpuzX6WcpYicLmShUrXmGUXZxpAtn0Fo21HRo0XJLPV2QuD7QbkesVxo3t
         RaDOJkRu7gvX+wixV20W0cxEh6nsvEeMHRmq2auvFohB0XwJfxopmdDvApeHuUmKPSgh
         1ib4azXKnZq0ekPQqZIDNiWchSh66y2pQQT6jdBiHCm3Kj0iaENhh/kIvVadPaFMOa4B
         F0UA==
X-Forwarded-Encrypted: i=1; AJvYcCVyCwRCyoepYNVHmFfU+QOCQrpQl5D1euZd1N1wIBhkYvxC/NXve6S1JSvQltBkcFzJNRlIRlcG6EBEbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWyUtPC8MARzLYgg6UOVqNZGukgC0dmUz2erUawzi9aO7AO+9r
	pDrT8qqCqd0aAeC4ODzKl14QXrQ92J9VIYGTVVY2N6pStCcpguL0zJL5dtDW+Lc=
X-Gm-Gg: ASbGncs+TUL+44vZXapozIKM1RZkxYCHuL/YgtNxZ15Hf3bM4Ktl9HFKBkhv1Rh5kiO
	ixouZA9qUG/8d6gYKiNzdn73Rbh7upfgNhlEFvR2tReO6Tw1DcsmbWXSGTnf83jbNlvv4D9GuPE
	kxS7mHxySkM20+P833UXr4BOqymMTeq3iJRLbEE5Bj5Pb3xaAO6kIbb4SUHZUzxwLAEg3JnbBZk
	gQKKSO6xc2W8PcksSLwkrPfkscgzDLG+wAMvkIvqYwZT07sW/ZKLov31p8x3QIh8hS1RZ4pIRwy
	hBIjSKG0eLy10+6tyLE=
X-Google-Smtp-Source: AGHT+IH0RvwNCYwa6/BYzvW095Ti4mOLDCGElcS+QZXC85+fl4rOlbbZ3z3pilQKgJLmbSgtB5MatA==
X-Received: by 2002:a17:902:da91:b0:223:5c33:56a2 with SMTP id d9443c01a7336-223690e1aafmr59671725ad.28.1740751729331;
        Fri, 28 Feb 2025 06:08:49 -0800 (PST)
Received: from [172.16.2.60] ([4.96.84.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050b123sm33495085ad.197.2025.02.28.06.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 06:08:48 -0800 (PST)
Message-ID: <459b9c3b-0d5e-4797-86f7-4237406608ff@kernel.dk>
Date: Fri, 28 Feb 2025 07:08:47 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] block: cleanup and fix batch completion adding conditions
To: Ondrej Kozina <okozina@redhat.com>, linux-block@vger.kernel.org
Cc: gmazyland@gmail.com, regressions@lists.linux.dev
References: <20575f0a-656e-4bb3-9d82-dec6c7e3a35c@kernel.dk>
 <71bbd596-a3a0-4e37-baae-19f02c6997be@redhat.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <71bbd596-a3a0-4e37-baae-19f02c6997be@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/28/25 4:59 AM, Ondrej Kozina wrote:
> Hi Jens,
> 
> this patch introduced regression to locked SED OPAL2 devices. The locked region no longer returns -EIO upon IO. On read the caller receives block of zeroes, on write it does not report any error either. In both cases, previous to this patch, the caller would get IO error (expected) with locked device.
> 
> It was discovered by cryptsetup testsuite specifically https://gitlab.com/cryptsetup/cryptsetup/-/blob/main/tests/compat-test-opal
> 
> I've attached a simple patch that changes the ioerror condition and it fixed the problem with SED OPAL2 devices for me.
> 
> #regzbot introduced: 1f47ed294a2bd577d5ae43e6e28e1c9a3be4a833

Oops thanks - does someone want to send a "real" patch with commit message
etc, or do you just want me to queue something up?

-- 
Jens Axboe

