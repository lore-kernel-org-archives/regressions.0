Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CC8233921
	for <regressions@lists.linux.dev>; Thu, 28 May 2026 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977755; cv=none; b=U+eL2JdVd6m0K4czXFqGop20HT8wvs+A4F3m9PVhZjhgSzdPecEty+TIFUbOLMR+3BB2p/XvXIMBQ7HKVAIcM7PuWohlPQnd2j1dYSpc2MH9+JUYZued1+usi0CJP4TOjzqeoQqDMWvx9oD+rObwHPVk9yQ42hG+EFQOzKtSli0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977755; c=relaxed/simple;
	bh=WCINTFxmfL3sU4xVFntMQBv/3/7s4jrtCmibfDtQPIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SETiUtwQjSNb1VCFG46pLbJRDugY57d/+dkvnzse829NNffsQFO8Vbga+M5qK7L3C38vSQX4tKoRdA+E5+t+YUkmPunXUckyHB3G5huxPlPqvjJtjPKX6oawh1g5cCElMrDxZEjWYo4yc67y2eyVQ6oEMNIQ/mQcVrouXbBkwAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d+obPDqz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d+obPDqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779977753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WCINTFxmfL3sU4xVFntMQBv/3/7s4jrtCmibfDtQPIo=;
	b=d+obPDqz1Y4NTAadRfX2Tb/TxSvYh5iSIC7zmebnRExwBdeGIYawyuXTbHAM2eaT+7bQjG
	epSfw9Ar5dblS4exG4dDYlSgfksBlc5epcodae3A9HsOIKrZmDfVgOjvNR4YCsblnb8b2T
	jtM1q4A4zLPDuzrvROdKZdIVqe3S7R4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-0se31xfdNvyxPb0d6XthUA-1; Thu, 28 May 2026 10:15:51 -0400
X-MC-Unique: 0se31xfdNvyxPb0d6XthUA-1
X-Mimecast-MFC-AGG-ID: 0se31xfdNvyxPb0d6XthUA_1779977750
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5aa4446ebfaso2219379e87.3
        for <regressions@lists.linux.dev>; Thu, 28 May 2026 07:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779977750; x=1780582550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCINTFxmfL3sU4xVFntMQBv/3/7s4jrtCmibfDtQPIo=;
        b=CDphbjPtRbBuNIcZhL+AaUQo9/r6CGTRfLSvKa9Jcdv7VNNtPv6xZJ/+CFs7FJebbS
         Ft8F4Gg6S1s21U5CyMXkpeiCHiuOESKDLBm3d3jXRGmUZkavlHGx18gimFBuMj8Sep8y
         BYGis5N8exCBC6S3txLWDdMJjhLlFK1zB30ZNQ0pchyHbK6kolhEpEEV5Zyl2lqDd7re
         pzD0MIICAJKUNiO83L8SNdVNKp/mfNF5/T9qZAnMds9KRmsXfpwjV6CF/pdt44h72IFT
         Z/UvhPPDXsXKXH+lFoto6nWlhRM5LPFj1ws1uEWtj1g1Fi4ieYoI1NOQWH637FGY/nij
         iLqg==
X-Forwarded-Encrypted: i=1; AFNElJ/A3/zW169beoinj8pyOo1nfgBoKK4Q3IBEKiMOfkHE4N1Mq1rQEl7GszFwfUsb2ImGfUZcPQ8KDqNzuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6wWzqG+fMWhql7M2m7H2xWwILmcbbJ/AMGT8yl3myKPeX7RSQ
	FmBX5wGH3j1jrhBEJ3OxbL431GPUGWKv/3YP5aI12jxNe/m/nA1+I+xMQDRWBnAKeoRpKb6KdOi
	yh1xQOy3JDiDWtKHaCcRla+a84aePl6fEaCZHZFXWnJ/ZJbYQco8eJa3V19jU8Km1jQCtlMjvPd
	WakZ19QGaFmWhPuYg2o1PZ2fHFPKR3vnY3wo4aelI=
X-Gm-Gg: Acq92OGYaNWldT8syaMDVNzua4xnDqCynuOeYH+JCPOQ5Qk4cETTosR931jl0dAYoFF
	wOPQSCoqoDrcsDg191Sq5z6FJda0pTzXOoFOQEpCmTgO81rZoU0IgW2wyYCXLOPOkXbDw6qUigT
	dWsHyOBlOISc+CKS5Qkp25NADLe/iM85xYhrIKsjPMNRTaIZaABGyKGLoJq19KvQqFlzgObvhQx
	2Q+dPOApkA5mHf3
X-Received: by 2002:a19:f509:0:b0:5a8:87eb:b118 with SMTP id 2adb3069b0e04-5aa323bbfb5mr5931499e87.22.1779977750292;
        Thu, 28 May 2026 07:15:50 -0700 (PDT)
X-Received: by 2002:a19:f509:0:b0:5a8:87eb:b118 with SMTP id
 2adb3069b0e04-5aa323bbfb5mr5931486e87.22.1779977749776; Thu, 28 May 2026
 07:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521135310.GC977@cmadams.net> <20260526175743.1f2c3761@kernel.org>
 <20260527010641.GA21073@cmadams.net> <20260526183122.348e44e7@kernel.org>
 <20260527215135.GB16443@cmadams.net> <675083b4-e015-4ff3-836c-798e0a971194@suse.de>
 <20260528073849.759da84a@elisabeth> <baba855a-7cc9-409e-9c20-6e50f35d255a@suse.de>
 <20260528131250.1352ab48@elisabeth> <b21c598b-879c-4f6a-9dc8-27e5c362803b@suse.de>
 <bd669eaf-64dc-4217-bae0-4a531e473762@leemhuis.info> <20260528153202.14900687@elisabeth>
In-Reply-To: <20260528153202.14900687@elisabeth>
From: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
Date: Thu, 28 May 2026 16:15:38 +0200
X-Gm-Features: AVHnY4IApP7IcvuHODparSrVLAjpWG5XbLoqDsjgPOZVg-TUUjj6l8XXpHkpmrQ
Message-ID: <CACT4ouf5ZqGgb=RO8_7NovLCvYKLKL4vD70dEe6xUODT1UEcSA@mail.gmail.com>
Subject: Re: Problem with IPv6 privacy addresses in 7.0
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Yumei Huang <yuhuang@redhat.com>, Ido Schimmel <idosch@idosch.org>, 
	Justin Iurman <justin.iurman@gmail.com>, David Ahern <dsahern@kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Beniamino Galvani <bgalvani@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cNnkVCoYreOyAhY582qFF4sFPXzIGRciv5bQHE3dbgQ_1779977750
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CCing Beniamino, NetworkManager maintainer.

On Thu, May 28, 2026 at 3:32=E2=80=AFPM Stefano Brivio <sbrivio@redhat.com>=
 wrote:
> Not a bigger regression, but a regression definitely, even just for 'ip
> address' or 'ip address showdump' which would now go back to display
> / save addresses in the reversed order for IPv6 (only).

One could argue that the bug had to be fixed in iproute2 and not in
the kernel, to avoid breaking UAPI.

> Actually, an eventually fixed version of NetworkManager doesn't need to
> know the behaviour of the kernel: it can just order addresses by
> timestamps instead, as Fernando mentioned.

If the fix must be in NetworkManager, we only need to parse them in
non-reverse order like IPv4, I guess.

> And I'm not sure how relevant this is, but if we revert the fix,
> current combinations of NetworkManager / kernel versions would be
> anyway affected.

Probably many, for who knows how much time, unless all distros
backport the NetworkManager patch. Many don't backport much except a
small bunch of security fixes.

> So at this point the only robust / complete fix would be changing
> NetworkManager to sort addresses as needed. Are you suggesting that we
> should anyway try to minimise the temporal impact of this with a revert?

I don't think it's the "only" robust fix. Normally one would think
first about not breaking UAPI. Kernel's UAPI is not great or intuitive
in many places, but normally it's never improved to avoid breaking
backward compatibility. Adding a GIVE_ME_THE_RIGHT_ORDER flag could
help too, but I agree that it sounds a bit silly to have an opt-in
option to force the right behaviour.

Then, the only robust fix would be to fix pasta and iproute2.

Here we know of 2 affected userspace programs, but we don't know if
more could be discovered in the future.

That said, it is true that this case is very unintuitive. Insertion is
direct-order for both IPv4 and 6. Dump is reversed, but only for IPv6.
Userspace programs won't expect this at all. Programs that do it right
it's probably because they encountered a bug because they were
initially reading in direct-order, and changed to reverse-order. I
haven't dug into NetworkManager's history but I bet this was the case.

In this case I would be in favor of not reverting the kernel change,
and fix NetworkManager, but I'd like to hear Beniamino's opinion, as
I'm not being much involved in NetworkManager any more.

--=20
=C3=8D=C3=B1igo Huguet

