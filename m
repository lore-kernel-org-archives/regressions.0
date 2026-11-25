Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647087;
	b=y20r3zqVGkKBW8HVHJSc2XRDzvzDjqxJI+SL0M55n2GDrdRh8MZi7oiPB7Wri+ywe+ai
	 1vPOcPFLtgcsZ8LL6KkA+nRgZkKcLUHu/C9wM2PuqfkGCQe0wOVHvWlYYx/BJ7UkSt6g8
	 x+VfKFkoiLmuZ0PzycQ5beS3jgi+kD4iqMLPf7+bppSddDZeM+eBcKJl4nxTv9vOW8w1i
	 V1TpP1jCAV3/XR9feAt5UndnpDaJU7X85RlPeiyG+JDmDqS3phPL5XxToYZXJgqe3mcwX
	 rLfnWjtucJ4Y7404F+RoLBRy2QMyIvO2BWlArMzYl33YnDvZSWULleQ/NbLdT4VlLiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647087;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=3j5SkbxY4BOP3inGkFuBdyIXvKZsu+lhioXKy5doAU4=;
	b=MkTo/qluJRFXt8qaVnPEAUcHaUGaLx31DB+D0ExxkyMwYWNWSSwY41r0Svp1xjwy4aSm
	 EzqFORFMC67c1W1jI8kfjYgHW8hGGxy/wXOvXA7FuSNa8vc1EcricMfpKNpPjLeDrSxRM
	 Z2mbiddwx5OsP0clum7uOmr8Y3uamfV+UZRKYIXtGe+HPno132PRMxSkfJ/wBHrWXa1Sl
	 gyznJF45MSG1igDGYYvf18+gMN36aohEab/W8w38nC6IJY2i7NH5DL48j/hkbqAsWbydx
	 vYgS4ioTNpZwoNpSELKiK0la4HKBgUgPdoUk5tZpryUfwh+YF+0dF1V3H4aF469MpPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=FazjHqoN;
	arc=none smtp.remote-ip=79.135.106.103
Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8529C606A69C
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 22:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8529C606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=FazjHqoN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795647084; x=1795906284;
	bh=3j5SkbxY4BOP3inGkFuBdyIXvKZsu+lhioXKy5doAU4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FazjHqoNQ48Yh1EjHqnL3SCgHm11w3wUtMcwVApXto5AN/ZW8LjC+PmEo2Z7/a9uj
	 B+/3RfL+fjx35zu7z0S9L/lm2o4RWVoUHox64lacvHgLlMqOIXiYz5hPSPLCoDXJ30
	 5Jc3MGOowbw6LaKatrf8N3usZZ9Y2ZKYPdPwqGO4C8xdSd/WJ8saWexUBvbgnT5t1J
	 x1/XocDls6IvCA+Q8zXjH0pd2ruZ+ci+laWtTp8BVvBdLvZh8nnTSOvU+kb3fEZFTL
	 DW+/cXuVLc0PTguBa+Bh0gjD3qwzjXf3olYjBrY+tlKVB8w95Kb7BY1obneYeXWsnU
	 Dep6jzuMG0Wxw==
Date: Wed, 25 Nov 2026 22:51:16 +0000
To: Laurence Oberman <loberman@redhat.com>
From: 70sp <70sp@protonmail.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Thorsten Leemhuis <regressions@leemhuis.info>, Tobias Laas <tobias.laas@posteo.de>, Damien Le Moal <dlemoal@kernel.org>, Jens Axboe <axboe@kernel.dk>, regressions@lists.linux.dev, linux-block@vger.kernel.org, linux-ide@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Niklas Cassel <cassel@kernel.org>
Subject: Re: [REGRESSION] DMAR fault by Intel H97 SATA controller since "block: Increase BLK_DEF_MAX_SECTORS_CAP" (6.17-rc1)
Message-ID: <uJluFNYGCCrdvnYT3MatN_4Om8UczTJX_dzxumJxyCAC7F-Ubrekb7LPwlRxhCW0J91UBf-TqeRoJQfgYIYBRvMsPmE-Qs1eAg5zbDP0s58=@protonmail.com>
In-Reply-To: <2adaf0ef9e1a2fa18590f7d8dbf203c0f7de2be7.camel@redhat.com>
References: <5ad27a97aafbc08a8702d5b90d09cd59@posteo.de> <awSs5Cw3hFkf4O4T@ryzen> <ec36d13e-e4c2-4bfb-8b50-69d4a1628839@leemhuis.info> <87b1bbd8-8113-4890-8623-738b19a9cc7b@leemhuis.info> <a0ff3156-add0-4f7d-8373-09f95bd7036b@acm.org> <2adaf0ef9e1a2fa18590f7d8dbf203c0f7de2be7.camel@redhat.com>
Feedback-ID: 144929603:user:proton
X-Pm-Message-ID: 71ab037c5ea6bb9141ba5150b2c0bfa808b46652
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

as I mentioned in the referenced regression thread I reported, the patch I =
sent out was basically an example to show that it works for my use case. I =
wrote that I don't think the patch is ideal (in fact, I think it's an absol=
utely terrible solution to fix this). This is also the reason, why I just s=
ent it as a snippet of code.

Please take a look at the code before the regression started to occur. It w=
as implemented universally. These vibe coded patches are horrible compared =
to the original code. We are literally making an exemption for a specific C=
PU in a place where it shouldn't be. The actual correct solution would be t=
o make a patch which works similarly to the pre-regression state.

If we are going to merge something that is made by a LLM we should at least=
 make it good. Ideally made by an actual human.

Thanks for listening to my opinion.

Best regards,
=C5=A0imon Posp=C3=ADchal
