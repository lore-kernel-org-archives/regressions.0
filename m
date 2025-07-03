Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9782F3635
	for <regressions@lists.linux.dev>; Thu,  3 Jul 2025 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555628; cv=none; b=CHzcddACA6M1TRBUL7Vk+yhwiy5l/RxiXWtq81zSscUFyxIpTHsC2Im6zu6Eq40LRxChkFvg/E6pHof3A42YnYwU1ThhhPPfoLTKqdk4G/iUdyG+2EP9VdP7m6PwIbzx2HThSRRr22Qv6Y1tHRJXKrFRyf7KHTgdfIQ6+JY+oHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555628; c=relaxed/simple;
	bh=ypjreYPJ7DpTt9JqUM3qZTM6pG61xK8rDbalnxcM+mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umM6Uvhch9pTjiJrFJjbhFI0UqAghARtQGXUvi0B/Grwlb9dpKiyNkaEfQl9eXLBGWXewiwC43LNs7K14u2kW7KnM66JtbeW2jXF78WDoQWAlp3CvJeZpy9BtcwGTQ0UlWv8speoxuQZmek6ZOfcyoNQj1GepCsIQLAtRkslN7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B3j9UWtH; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B3j9UWtH"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6119cd1a154so31281eaf.0
        for <regressions@lists.linux.dev>; Thu, 03 Jul 2025 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555626; x=1752160426; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KVPzloh1oUX1Y6h3ndP8c2+rIYKbbClu7XHnxXtmGIQ=;
        b=B3j9UWtH/DSLBbbtcnt335yDGKsbbrblSnHp6Xr52I3Q4qO+9QU/TLfwM41zjfGQ5h
         kkA4mzyEGloPzA53Mh5HJBoaXROuwqffhSz/prGVjVsFA0mgHYOiTyBx5M5GCeXp2Nbn
         0fvOIup6yEmEmyYitYaujQ/KmVxYeDMxhsD63i0O+9EQe4GS6zGH8GO0z2IdlpvtXpUI
         vClJ2SvH0ZT4pdfrknVwJtQa7oDPme+jOPTQWdrR+uANteqhERLhR+sWhlx1T3qIhTf/
         8zyA9K55MzVnQUSr1yWRCCziDTWZj+oeXQAvD+87qrodApnd8kHToHJSyyxDzSGNhsFw
         7Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555626; x=1752160426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVPzloh1oUX1Y6h3ndP8c2+rIYKbbClu7XHnxXtmGIQ=;
        b=l/a6+KN1F/0O8VNzxIN1noe9JZMcjll3gx9MCjs8ceNB6WgzyCxFd+J6TV9vCNK72w
         MCBgx4nMvyJsVki5Xk60LS+8sEXzuupSBV/+1xn5Xx+b99RNkSQl9tvbWtB53cNI4VQQ
         R73iFU48+Eau+QxZ27ywBzftKQB7DhTAllGKmmizvDEkPkkmxPs7TJfqgxek5sjwW3v4
         QRmUDA9OR9QWGvgrhn8b0JLYEwX+NhGMLMDFWeheHAPjiuDdv/GwkZhYHAixsYZ/Vtsu
         p7i7zE1F5ExzjmkNXIQbgXDCtmCnc5kg2jRVx8/bG+Fhq1jQajzvhZzuqiv+jtHt8lnw
         APeA==
X-Forwarded-Encrypted: i=1; AJvYcCVW3PWyY33KESnZL8OGSNqoW2GQdz8lM68+lEfC1I3DW7/zeubdgbf1Hv69LrNh210gkRsKlmWfyMt9Fw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxASkLqCeBAYeKuQ89g+zD9nZYwgJzKjiPwj64nMsXzfFPBqk8U
	RJZ67IV+/lMOm7rWxecXROqI/fv4QbOHZFyMqR8w/ixv9avAEPlzci6RvK+Teyn5np2vw118JqT
	ycj/mHh26+AJBvd8YT7lWNMx4gKqf3MJ0c9bGsLPW
X-Gm-Gg: ASbGncttXDu9AffUKGBmeqPOjsJR9FkukE9TBiyhU1hXspr8I4GpqTY8BP67HFdrmWl
	LXw1zyqOQPxaNhJjnrt0Cys9QxEmRLFUPWQ3D5iM2JMhkJXIHrCvb4jOtrScdkO8Gf8Q9jxN+VC
	qrSR/XqjUrbCay25i9/jo3fNUuaaoB2vHvjUS5pVUap6Idn9OxCo4=
X-Google-Smtp-Source: AGHT+IFNofYLmKV5Ky0RG07x0qI3JXTBrrZQnExq8xPcLRUNb9KWtuoW/38SR0jSXaannNWxKg0dLKoxlfAIQh14pQs=
X-Received: by 2002:a05:6870:288b:b0:2d4:e101:13ec with SMTP id
 586e51a60fabf-2f5a8d3f1b6mr6005725fac.33.1751555625656; Thu, 03 Jul 2025
 08:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAL0q8a6pOBZbWYdwKzC1U-PuH4rgf2miv0jcF=fWVZt_dUZHmw@mail.gmail.com>
 <20250630133343.GA26040@lst.de> <aGLyswGYD6Zai_sI@kbusch-mbp>
 <20250701132936.GA18807@lst.de> <aGRMilWhgF4z0WOf@kbusch-mbp>
 <20250703093042.GA7387@lst.de> <aGaTw7SzermpfiD7@kbusch-mbp>
In-Reply-To: <aGaTw7SzermpfiD7@kbusch-mbp>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Thu, 3 Jul 2025 16:13:33 +0100
X-Gm-Features: Ac12FXwWdPQaun6KP1n2WG90MWR4J8ZJY7tGLBNOTSkceZgMU661bsKnTuwWQZc
Message-ID: <CAL0q8a62bcjkJdKjTUbEOXMRfaCr1eB4YWeNugdRO1GjLLQe0g@mail.gmail.com>
Subject: Re: next-20250627: IOMMU DMA warning during NVMe I/O completion after 06cae0e3f61c
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, linux-nvme@lists.infradead.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, axboe@kernel.dk, sagi@grimberg.me, 
	iommu@lists.linux.dev, Leon Romanovsky <leonro@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 15:29, Keith Busch <kbusch@kernel.org> wrote:
>
> On Thu, Jul 03, 2025 at 11:30:42AM +0200, Christoph Hellwig wrote:
> > I think the idea to reconstruct the dma addresses from PRPs should
> > be considered a failure by now.  It works fine for SGLs, but for
> > PRPs we're better off just stashing them away.  Bob, can you try
>
> s/Bob/Ben
>
> > something like the patch below?  To be fully safe it needs a mempool,
> > and it could use some cleanups, but it does pass testing on my setup
> > here, so I'd love to see if if fixes your issue.

I have tested it on my system and can no longer see the regression.

Happy to retest when the patch goes through.

Tested-by: Ben Copeland <ben.copeland@linaro.org>

Thank you!


Ben

>
> Thanks for confirming.
>
> While this is starting to look a bit messy, I believe it's still an
> overall win: you've cut down the vector walking in the setup path from 3
> to 1, which reduces a non-trivial amount of overhead for even moderately
> sized IO.
