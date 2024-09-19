Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826B312E48
	for <regressions@lists.linux.dev>; Thu, 19 Sep 2024 03:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726717130; cv=none; b=o+MYS8DZVNdEDl4vupe/UTLFWGJ0DZMZOWWlCmDO2IhuH2DFZ/HhqJI7+ETdlGodpqy1ISQ8373dPf55yhxe2qv7u2Zl3db6/r/FexNycjzRa4vxTZVk1Auw2lCqgVGLzIyVzZR7iOqPk7QalEU80Fph9SfwC9doNzmF0d4FYWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726717130; c=relaxed/simple;
	bh=LoMi13A4AfE43GdKZNtf5scV3hXW2dBvlxD8UDU1VWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWU5NlhLj5Y6nkEM+PSRCxzxEtr3mJ/bDyXjKFCVAnni8YXvcOqJ8wo3uPZDEA1w9hubUkCRTDvkC3Ii5T1Lzujq2QYovEUAVsKUgDHa2c/+xEf2B7Ii/7iK2IbfJAp7C5BVBG0AaHNbbShvzHy43/oLVnbuNdX/w5gagHZ9WEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=KQLa1Q42; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="KQLa1Q42"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c24ebaa427so2238174a12.1
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 20:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1726717126; x=1727321926; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ip2Z9ZN8QnSQEWnaDGGUtbvLzJ9Kl1C8B/3QvjgaEU=;
        b=KQLa1Q42gwY+9h7NMlGUOlUJhj766l0ULGbMa3ZZMEz5zG5kF1/4/+hlkwQY80Lud1
         tA2ikaox9PzUf17jGhedzWWuLruqXETIiIEcq9lvItxUETgActg/hM8BZHpiBt2EpDU4
         lcMB+Qg27oBiIW9xfV+nSdsvTklL1OOB1AKOaygECRwgYrct08i/IAm+2hgHKgkM5s9q
         EC1N+0Uc6FX9ruZK3a7Xvd5X0AJboZR4wPMkRN3mIavSrSKtYHiOekz9Cj7kBZXmDTnJ
         8YcFklYRdcV3Yv+CxyT5Xf6brzPmhYrvolonwdWTpnufrN37ZQxfen8p6K0KZfry9Qoc
         N8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726717126; x=1727321926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ip2Z9ZN8QnSQEWnaDGGUtbvLzJ9Kl1C8B/3QvjgaEU=;
        b=pu88vzxVw7ukANzdGP4OIONOO2RBapkgxIx8hzH4VF4Gtxn7P2X5goUE4CF5G3HC7v
         zubWEJGvNMKlVChuiETurbNnTOkx9skGg3DM+w8fttYRobUD3ETDDBneMT0+VlXuODy8
         e98N5VA73T1Y2qERiujwYdO3Y6nVsqrxmYF0VJt0skgmbIxCzCI2Psa2key7KKivPcZp
         951gvTLqIEdUC3oT7eR9ex5cMaD9tC7+6kez89OhZKpS/fdDvCfucjhq6iZGFwLGrSxD
         EggV14odKrRsno2fm6dHUbSyXs6q3qsZc+lvsIEr73Sju9bJNdc/WZ/0ox9C6VWkC4n2
         j7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUkI264VxNTgviy2t+ZCORGzz5qcNGSLLO/80CQVBVj/jG1c4YKQvpFsUT/8EXufmb4zTUTafKDPnODGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyZBHfkyNyPpTFxW29ctcnGExooT7XARPzFp44Py1uODbwtXyD
	kT/OI5ep8o2MVjRCMb1vX3iYwgdNENgqXFLtXO6wlaUUWmEtQcClPE50oQrglTY=
X-Google-Smtp-Source: AGHT+IEoH3Dhv73LGspYMYEfg6SjReNg6iDMuoDHAeKmrMPg6QH84CSbwClYlsxjJrTcrRMZ7RzAJg==
X-Received: by 2002:a17:907:3f88:b0:a8d:6372:2d38 with SMTP id a640c23a62f3a-a90c1cba61emr142785266b.18.1726717125742;
        Wed, 18 Sep 2024 20:38:45 -0700 (PDT)
Received: from [192.168.0.216] ([185.44.53.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f4375sm666457166b.73.2024.09.18.20.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 20:38:43 -0700 (PDT)
Message-ID: <8697e349-d22f-43a0-8469-beb857eb44a1@kernel.dk>
Date: Wed, 18 Sep 2024 21:38:41 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Chinner <david@fromorbit.com>
Cc: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@meta.com>,
 Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Dao <dqminh@cloudflare.com>, regressions@lists.linux.dev,
 regressions@leemhuis.info
References: <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>
 <Zud1EhTnoWIRFPa/@dread.disaster.area>
 <CAHk-=wgY-PVaVRBHem2qGnzpAQJheDOWKpqsteQxbRop6ey+fQ@mail.gmail.com>
 <74cceb67-2e71-455f-a4d4-6c5185ef775b@meta.com>
 <ZulMlPFKiiRe3iFd@casper.infradead.org>
 <52d45d22-e108-400e-a63f-f50ef1a0ae1a@meta.com>
 <ZumDPU7RDg5wV0Re@casper.infradead.org>
 <5bee194c-9cd3-47e7-919b-9f352441f855@kernel.dk>
 <459beb1c-defd-4836-952c-589203b7005c@meta.com>
 <ZurXAco1BKqf8I2E@casper.infradead.org>
 <ZuuBs762OrOk58zQ@dread.disaster.area>
 <CAHk-=wjsrwuU9uALfif4WhSg=kpwXqP2h1ZB+zmH_ORDsrLCnQ@mail.gmail.com>
 <CAHk-=wgQ_OeAaNMA7A=icuf66r7Atz1-NNs9Qk8O=2gEjd=qTw@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAHk-=wgQ_OeAaNMA7A=icuf66r7Atz1-NNs9Qk8O=2gEjd=qTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/24 9:12 PM, Linus Torvalds wrote:
> On Thu, 19 Sept 2024 at 05:03, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> I think we should just do the simple one-liner of adding a
>> "xas_reset()" to after doing xas_split_alloc() (or do it inside the
>> xas_split_alloc()).
> 
> .. and obviously that should be actually *verified* to fix the issue
> not just with the test-case that Chris and Jens have been using, but
> on Christian's real PostgreSQL load.
> 
> Christian?
> 
> Note that the xas_reset() needs to be done after the check for errors
> - or like Willy suggested, xas_split_alloc() needs to be re-organized.
> 
> So the simplest fix is probably to just add a
> 
>                         if (xas_error(&xas))
>                                 goto error;
>                 }
> +               xas_reset(&xas);
>                 xas_lock_irq(&xas);
>                 xas_for_each_conflict(&xas, entry) {
>                         old = entry;
> 
> in __filemap_add_folio() in mm/filemap.c
> 
> (The above is obviously a whitespace-damaged pseudo-patch for the
> pre-6758c1128ceb state. I don't actually carry a stable tree around on
> my laptop, but I hope it's clear enough what I'm rambling about)

I kicked off a quick run with this on 6.9 with my debug patch as well,
and it still fails for me... I'll double check everything is sane. For
reference, below is the 6.9 filemap patch.

diff --git a/mm/filemap.c b/mm/filemap.c
index 30de18c4fd28..88093e2b7256 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -883,6 +883,7 @@ noinline int __filemap_add_folio(struct address_space *mapping,
 		if (order > folio_order(folio))
 			xas_split_alloc(&xas, xa_load(xas.xa, xas.xa_index),
 					order, gfp);
+		xas_reset(&xas);
 		xas_lock_irq(&xas);
 		xas_for_each_conflict(&xas, entry) {
 			old = entry;

-- 
Jens Axboe
