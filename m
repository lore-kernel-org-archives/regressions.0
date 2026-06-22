Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE048397B02
	for <regressions@lists.linux.dev>; Mon, 22 Jun 2026 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130941; cv=none; b=uYlBaFlv4cWhElTSPwX5s4Was44eafJJzCk8yLFqjytfRaU7z2E5YP5hkcEblSePrQbyTl4VmLGnQ054qwjCrp0khvGSITCAovL+7IAyxYTvAXiGA02Mf62PrM336gDvu+QAY49XrNhBco6+68JGZifjH0fFWBAHPqblMqMKrEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130941; c=relaxed/simple;
	bh=ROjtMhAJVqAplE9ZCKI+gepuDwCOm8vYUnpYF87scYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tQLydMSqxdNV8GPegTTWotUCBLpz8om57PT/i71y5v0gzXZrtGtpmm+rUP4eaS5m2q/VCXE9nR4BnqTDkRKMfwirpiBEgoCvb/W1rWJf8YBtSuZDQ4ekk/RbKwA4gsFPt2mfQrb/MV6wOYdf2HdoTTQfmAktLLjhcx8hegCtk6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UGA/fVkZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UGA/fVkZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782130939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NE61WDsqzyH4+WIlfYLsAL+lHpKgDOSKscv3FLr3jxs=;
	b=UGA/fVkZuoG+nTf4hGUN13LAJ4FCpakLu6lVW6RJX6AbmO202MKS1JqsywVKn48gCqczJn
	cRxxgtIiGgM1GYjTfc4HCTnBd++eYdG0qlxDfpDDgJgdQdHVTsC8EB+uEs2yNLETxb4LI8
	ZoKtgu9NZbOpaBoJqG+NhpAGH3Noonw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-XtNwgbcHMYe6esCH4N1F7g-1; Mon, 22 Jun 2026 08:22:17 -0400
X-MC-Unique: XtNwgbcHMYe6esCH4N1F7g-1
X-Mimecast-MFC-AGG-ID: XtNwgbcHMYe6esCH4N1F7g_1782130936
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490b5d2e394so28993185e9.3
        for <regressions@lists.linux.dev>; Mon, 22 Jun 2026 05:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130936; x=1782735736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NE61WDsqzyH4+WIlfYLsAL+lHpKgDOSKscv3FLr3jxs=;
        b=kbzzeh1TY3WJ0zMefrEdDq3useEtD7oqDL/sXq9VE3glrtrVNTmm28BZ9Pg623F2+r
         MFqwCDgjawk/okjJG/+Z+fCcbmDZfr8FOiUSdyDeVUK4CsUsXTV4PQzckWH8zjvy1O0a
         HFAB/X6+CZ1+bxLOnORu0RZ2P4ZwKa9bDM4/n1EH3lUh+9Yr7ptrxk7+yok5eZTryfuQ
         JMjRqNpC2PL7/0IVBHthYwlgCqHWfS/aFfXOZlArLleihsKf5Y16pVCeeTGLrUhA6J7s
         iMHg3IgR5VzihENAmpS3UqRGheKfYfkmZyy4yHWoRIAZLVfk0N3KD9Pdx0t58RK+EzEL
         N/5Q==
X-Forwarded-Encrypted: i=1; AFNElJ//BdgowQW8HT1/wO0ZzuXRa9BqnJlW1Hej6/FA0GAm1L7Zx+Ii5zr/h/3S47xKloVrwKKOXxK0uZAa9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+247LZcOGWTvVGAyyjTf+DYv0Gqgzl6LwnHtxasOSdBz2focg
	Kg4Q6WMFT5AXwkxs26ouad08KSDocyX2G4ZD1nnS8Pwm+yaHQx3vYGddrAyTg1M7reoeedotDx0
	tAaqxvG4Kc95JX7NejuXNXKrnVTFged6+/hALQ2suKh3EzZ6r7r4WnMgpK0SkEfaO
X-Gm-Gg: AfdE7clu/dXSJFJPWhmzxxjDNrz+m2z9D63Hoz6S7Z2Y22rqS4DI13RpGVaAY6j8Fyd
	t13wR/5SiTXqqvMQIdnr8zD14MdXICdc/ciUbarCBFudpyBYuuPvEv+I5Rj0070ZHc5FfY91CcS
	GrCAYaWPHD5tKzR9qDl6O2g6fuWk2gq/Zy78juQvX8njkK9SAy047L0Mrq1AAn+SeBfwhVDXf5n
	QIPP2qClf5gm38TKGlMPxNQGOyCcH05dzRMYMRKxLBkI/EFr7d9KD5Yevwu/v+JmOnibjr3Xvrj
	LGPrb/2ayC1XbUtNnG4QwR9Tm6MDP+mfY4qqgAIK72gwuZYGuVFjHnk5HRJgcNfEjnRZ3LpZxDf
	geC+qj3JiSU3BEy/ppmnUpOimw5TuIcUDbVxVqWRm51qSN/kHzy4bSvOZlhk8
X-Received: by 2002:a05:600c:1c1c:b0:490:b724:507d with SMTP id 5b1f17b1804b1-49240e40a01mr263798045e9.11.1782130936114;
        Mon, 22 Jun 2026 05:22:16 -0700 (PDT)
X-Received: by 2002:a05:600c:1c1c:b0:490:b724:507d with SMTP id 5b1f17b1804b1-49240e40a01mr263797255e9.11.1782130935490;
        Mon, 22 Jun 2026 05:22:15 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-135-12.retail.telecomitalia.it. [82.53.135.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466667881bfsm27415740f8f.22.2026.06.22.05.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:22:14 -0700 (PDT)
Date: Mon, 22 Jun 2026 14:22:10 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Brien Oberstein <brienpub@gmail.com>
Cc: netdev@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [REGRESSION 6.12.90 -> 6.12.94] vsock/virtio: large AF_VSOCK
 transfers reset under backpressure
Message-ID: <ajkmjgGdJp9Dj6em@sgarzare-redhat>
References: <467b01dd017b$733792d0$59a6b870$@gmail.com>
 <ajkAlpiyPWmNPWfx@sgarzare-redhat>
 <618701dd023e$063de350$12b9a9f0$@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <618701dd023e$063de350$12b9a9f0$@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V3ROJeVcOLW6Dr_9ewxowIiId0aAvf37MNDn2L2OC8g_1782130936
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Mon, Jun 22, 2026 at 07:55:30AM -0400, Brien Oberstein wrote:
>Hi Stefano,
>
>Thanks, that matches what I'm seeing: large transfers reset mid-stream
>instead of the sender being throttled (reliable above ~1.5 MB, fine below
>~90 KB).
>
>The bind for me: it's not just this mail bridge -- I use AF_VSOCK for a few
>host/guest services, some of which open their own sockets, so the per-socket
>buffer workaround can't cover them all. That leaves pinning 6.12.90 (losing
>the DoS fix and further kernel updates) as the only blanket option.

Okay, but in that case did it work?

>
>A few quick questions:
>
>1. Is a -stable backport of the merging fix likely, and roughly when?

We don't have a fix yet.

>2. Could a smaller interim land in -stable sooner (e.g. more default
>   headroom) without reopening the DoS?

What we've merged so far is the best we can do for now, but anyone who 
wants to help improve the situation is welcome to submit patches.

>3. Will the fix guarantee backpressure for any packet size, or just widen
>   the margin?

It should fix STREAM sockets for any packet size.
SEQPACKET/DGRAM is a bit different since we need to keep boundaries, so 
it will come later if needed.

>
>Happy to test any patch

THanks, I'll ask you to test.

>I have a solid reproducer and can turn it around
>in a day. I'll also file this as a tracked regression so it's not lost.

Unfortunately, it's always been partially broken, using more memory than 
specified, so I don't know if this is actually a full regression, but I 
understand.

Thanks,
Stefano

