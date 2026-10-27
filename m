Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793133954;
	b=fkT2UKex26DpS0VHSnZcj2PQRI3l6yD5qsJL0lYbVnE29t7VvCf+L4kY4KeTWpskUBxe
	 fiRivy57b1HwTMXPLSIUKynY/OcfTtorhMV5PmXm7CAJu+EQU+37pq2yffVTMx1/LdVDD
	 rSJMz5pWF3yzyPnbNuxjHchM84wr8MYfxpsUrmsClMmSaVSexGMT9d1kbR8eQqnsNdFDs
	 4TF7/wwvcYaS3lPfnjnPAtrNPmXSJfcho/NKitG9GJ/Y1erc+o0sI5CSf6x7fwFgV4S9I
	 PcOpApYKBzKhHAvSEQ1Ogv7wXh9BaJpokGS3/O9HejhM5uvxQLOq1BxHzGS5xnu4neQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qh00ezH7qk6YhQbSVUDAycO8TgQqa9yC0VmKndI+OZI=;
	b=L5rj3ozBZl/W2/W9nh9r7Xant3aY2FU+RKCpYFdzj1cANCLGKZpNZAlA3uxiEX/kTtDP
	 YjiiHRO7T163gfjmvsnvbc5c6TDcN/LNBiziv3ef8CTzx//ukZZhBMDx6Rjqt9fP2yFvj
	 2SZouuhX1ZYUjfHii38jqyjzCCH7to33zPeXYfSRyKqUC6rKJSE1LUsNYPhIVWBEMdmKb
	 0kBaRrH1/5Jlkrf5GgYz9p7jKddScZAiFdnbIs042CJdX9V1o2Vi8aJ/W9Lve0nVOEihR
	 wvHJZ98kadnDkRdyVN/sSAzJ8jqm1Exs81pgQGSO+FWI99PQaqW0t5yfKEbwye/cswg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IkSsmNhR;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA1D606A321
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 20:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA1D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IkSsmNhR
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso2907245e9.1
        for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 13:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793133953; x=1793738753; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qh00ezH7qk6YhQbSVUDAycO8TgQqa9yC0VmKndI+OZI=;
        b=IkSsmNhRy1SFwrEVsiotaXVvwqvfmImojJfMhMoemMVpyRdQIUn2H9lXa7Bl0+y04Y
         CTA9V16IpAsgttHCSAPKvkCyAVrQSgM4ra85KvXx6AczXKHMWKLv3mvQQFedvx19XjJ0
         ebYBt27dLQ7sfRovP23AKUO+AapBH9cOLpToMyXqKYY+pJhO4MZqViPdeZsJMw/Y2d/f
         Wvt2gWtnsUA+VVcqTQXj7iQRUY+rtPfLWn9yJjwjJ5Xh64Glb8sTbIsnSAERU8gHzCG+
         vr5U/Yg0nh76izEaF3HOL6AQ09NO+GDcTGW9vJCgjcUicXCoHiftjXuJB1Ruqo34tYHq
         g/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793133953; x=1793738753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qh00ezH7qk6YhQbSVUDAycO8TgQqa9yC0VmKndI+OZI=;
        b=SxkmCv1nP0+z2cyZjwwZpdkit392Loiex9fXpjH3EersTIcMbqL/7Lrsn9L131hOQc
         7cMnSglJucvTR8dLAcHprmVD13t+LVEQ9Y5myr3nrpdSgNbKapiBsmO51VSOMhwAWVkX
         gucCJ56lkvo9JwZKvXXeNf/uJl4HN4S58wyUv6wrgtj1XEzuF8ToOEv7EJmRneHVp+9+
         S5PxcyYOG0QOVtjY0caQQM9QZOri8+FRaoWDu8YuYmPCRH9BDa23hFFGU1+0po59FwbU
         RDL1a7SMiIdD/ldzEHOyU6lKZtEZL/Z1+O8XsCoDLvBqkizDk7pcUdLqvd21c2T83ZNE
         94Rw==
X-Forwarded-Encrypted: i=1; AKwUvBwdJ/zRA/50LhG0afy5B8tMibNtkp68hqHpCVw1NmnRyw4p6nzIxmbB5i4Q90LLlw6o650EaGvOeVmDEQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLCrD9h7IDcN4X1zcJ8B6ajWZbdsxc/kJbGPR3FpI5CtPIyFxhw
	lvFUtxTkev8uTg8FwdYzrlb8uq8+7ndG0jEPzmCzI/JRh8um1RKUjxnEb8BGmxKBSdU=
X-Gm-Gg: AYBFou0iS8uNzcr3lCNFa1bgoBe3/OarJMvIsTPW37sbCgszVcnnM2/idXfx7xPSwUx
	wz4fkvP59QsV/jmzSZHU/cHXyP22KxxGz/FVAukvixY6asD+MGp7cwHon2WMgyp22V0alVFZKqN
	yNAdpjD8pfofqlxrWYzHsmEseU2a7a1ljsV+7HNK7Ama62IGvkrroN0p4kau86vOMKr+PLP9ebR
	fy8b/ndweOJjND8zkz9wk0Nb7cGG1B3YneFNDg7jh4dY9yW/oKCoNlY4t+XLMOv5c/6B/CfHbVd
	fQVVXQtBJA5JsLJMpetpkaAG0YLhEts0x4647BsPKzMYNLrveGasWTfM6GYJXUxhA3cd3rSNrsH
	Uwy4q6wjldUHh4s+NjklY6/naDyFGYf6vRdOxfBPIbJ5rkWts0ZQPS5+wOFC6+IHkIJhIFWyGMj
	+8McVdAPvBuq7+KgbaNqAIMzARtS7UexLDPacCzNdn3NSJp++NQL/TaOSq85jsyBuVkEs6nAVPw
	v+ANLcbMTtQfDziKuX/mHHh7OaUnbmozY3VFbysWiuywn3pqr6dHRy3gLHt5rZqy8GslyMbaynq
	+emQH9k6WbfqjX3Oln8XYfu9151KA2u4gdtZFpaae00E6/OpjUoWy1eRPEWAoxDhFpjZLCfpm3+
	H6FrfRU1Ys1/CpXHd1W93Xq9718T6DyCY7lgEJACnZjq6H8362e2MlqFZ
X-Received: by 2002:a05:600c:6208:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a9643d51b5mr2268405e9.2.1793133952638;
        Tue, 27 Oct 2026 13:45:52 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b2ac-9b01-21dd-e5b3-2a30-2e97.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:21dd:e5b3:2a30:2e97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm24338968f8f.39.2026.10.27.13.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:45:51 -0700 (PDT)
Date: Tue, 27 Oct 2026 21:45:50 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] io_uring: final close can hang on a stopped
 submitter
Message-ID: <auENFo-ONkpSYcNq@gmail.com>
References: <20261027043521.99446-1-kmehltretter@gmail.com>
 <b50196b6-cc04-4d3e-965a-28c4f75ef263@kernel.dk>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b50196b6-cc04-4d3e-965a-28c4f75ef263@kernel.dk>

On Tue, Oct 27, 2026 at 12:04:59PM +0100, Jens Axboe wrote:
> >   3. A unmaps the ring but keeps its fd. B drops its fd and mappings,
> >      then stops itself with SIGSTOP.
> >   4. After confirming that B is stopped, controller P tells A to close
> >      the final ring fd.
> >   5. P resumes B after two seconds so the test can finish.
> > 
> > B keeps both pipe ends open and remains alive until close returns. This
> > excludes pipe HUP and process exit as completion sources.
> 
> This is working as intended. With the change, close() waits for
> requests still in flight, as otherwise they keep files pinned after
> the ring is gone. If you SIGSTOP a task, then that task can't run
> the required work to complete it. A fatal signal will still kill
> it.
> 
> Unsurprisingly, sending SIGSTOP to something may prevent it from
> doing work...
> 

Good point. This is not a real regression.

Thanks,
Karl
