Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.241.220.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326909;
	b=tTkTcCmCpWztZxq2StMWsxAujwxQ5xPX28b7UZ0MfcT3ZWK3IPcKee2WNr3ja10hkR8b
	 bb9e4wWIkHX2i3p9pM0FkpNe811L33U1t9janN12ALLx7Xh+sl0Jy9/6PwoJ5vPMUYWdg
	 Cb8GKsUgD09Wn6VizcE9UX9B+qkFcBkl4mnDvxKlZd8Mq0rFm4Qrprwwa5PEEgO8IPLiK
	 ylnZJA/c9f40olGW52yig6OBaKIBzEE4CA3MVfryZWQiRdBakJpvWWvpUjG/atO/MaRCy
	 c0TmU3pJI7W348yGxK4vShn+K4ykLdNFoP8o657fJkAUh8ZPmorw30UwPrhFgtyBwkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326909;
	h=DMARC-Filter:X-KumoRef:DKIM-Signature:DKIM-Signature:Received:
	 X-Maileroo-Ref-Id:DKIM-Signature:From:In-Reply-To:To:Subject:
	 MIME-Version:Content-Type:Cc:Message-ID:Content-Transfer-Encoding:
	 Feedback-ID:X-CSA-Complaints:References:Date:X-Tenant-Id;
	bh=YBGGeMD4iFIEU2mWym3FhOdzZclJ1seq6HyWVVamaw8=;
	b=iT3EuVSw3PchSujRYc5jPmK/PM4cFHF3evTHtkSCnOh2glD9i+zOHgeyOLptuPDbdV0E
	 lg55niiqg4T3KHHlgzlTdi2wXX+GkS+bGCwYkCXja6z959AmllajJFNbUMRVXuAV21+cW
	 qyziTKpAUJXRFERfyImzSaX4w1KsbJ0pCSeAnAaIXOuIpCD+9eS7qsxomUj/1am5874OW
	 YKyt5Dc/R5bNKndHLo8paq0+w+L7TSbvBhRvDYLwRG/kT8Ayg7IsmtF7TX/EdLBGkrTiq
	 +fsCZ0O1JPRJYsTuYY6Qsqg7TJw3t2U2DFtHYN7rXvAxTRdS1xV4TlBrtXspZWGHm6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=darioackermann.ch;
	spf=pass smtp.mailfrom=darioackermann.ch;
	dkim=pass header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=YL+92aF2;
	dkim=pass header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b="XLm/cI9r";
	dkim=fail reason="signature verification failed" header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b=l98FGin5;
	arc=none smtp.remote-ip=188.241.220.24
Received: from mta200.maileroo.com (mta200.maileroo.com [188.241.220.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917E9606A31C
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 16:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 917E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=YL+92aF2;
	dkim=pass (2048-bit key) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=XLm/cI9r;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b=l98FGin5
X-KumoRef: eyJfQF8iOiJcXF8vIiwicmVjaXBpZW50IjoicmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2In0
	=
DKIM-Signature: v=1; a=rsa-sha256; d=maileroo.info; s=mta; c=relaxed/relaxed;
	bh=YBGGeMD4iFIEU2mWym3FhOdzZclJ1seq6HyWVVamaw8=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794326901;
	b=YL+92aF2NqGur609tKD46UhmQRs/cGrOkJOr9bufx67QLNhs+4MmR8MiYmE1QI1tL3Q4XND4y
	PdvKB+KwAeXN0soOH7FgWcrM8Nb+L84a0lO8HJ0LaPb+S9lq4Axtc/VBzDm/JLUQkgjz+gZycXR
	E2YrnhlKCBQYh3UDhXuZjCM23Z5eiyIqiHhdnoRgR4Q9dsCrcCcSDcOSToeU+ItKi2ruwwlTtXA
	FSKschLCZrr1YopKlNbjmQV2Z57/kMH6mTdC83lQJxs6fysYt5303R29i5LsRGv3baS7ISL94A8
	cu7k26plGET5bpl/4hGOzLFLN1bu1R85Sp4xYipywEgA==;
DKIM-Signature: v=1; a=rsa-sha256; d=darioackermann.ch; s=mta; c=relaxed/relaxed;
	bh=YBGGeMD4iFIEU2mWym3FhOdzZclJ1seq6HyWVVamaw8=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794326901;
	b=XLm/cI9rqDbe+C0+jrBakfr6bmyXxCj8OueprWBrDtxRUNu84umC09AahXSluGHOonNulU3lM
	BlBI43MwgCIxIu9Ln2oSHT+C3MLYfFtbboLo5G/T9NlLpBFzCkO09qQJ/HBVso+ZEestj2iTvc1
	sEfmrdEe3QYgZfNkZlsjNRL4555749V6AkyWvdk2IaYkvaGSZ9xC54rYZ39LcguNLfYtySwJRhf
	c/OZlB4i/l2opMpTF/Jq785YDr/2fED5pYzK2I7izMhiw5mAPofkWWXbnYmAOkOfxGxPj/pgsJO
	g5u0Lc36eH20h5B3FotCdyocLRzoe3fXSRoQ4GdRKN3A==;
Received: from localhost (127.0.0.1)
  by mta3 (KumoMTA 127.0.0.1) 
  with ESMTP id f30e21eedd2011f1bfcc92000677b433 for <regressions@lists.linux.dev>;
  Tue, 10 Nov 2026 16:08:21 +0000
X-Maileroo-Ref-Id: ad04e3d67e7c60a2398b8375
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261020; d=darioackermann.ch; c=relaxed/relaxed; r=y; h=Date:Message-ID:Subject:To:From; t=1794326899; bh=YBGGeMD4iFIEU2mWym3FhOd zZclJ1seq6HyWVVamaw8=; b=l98FGin5/GesXHr4arpF77GeWGAlIy6ZFWCnTHsrTwuCDR3yAJ 4aYkwUl5JVnaMiaQWhnamA0OldYALQB910b7n6YqFN20zE5ql5F1DNfsWG+lv2aTv6zlfmFEppp baJf1JQkGWmAqnUI2NvN2MtwHrmU1UjJaUTR+NkINQ43wPr9mkNW4u0jdXq5C6xoxLLx6D4zBhL T8/foHme0fPO/haT96hc/u+q4mUDwDh8qWY6aQNZREQzbtNYa+B8s2Q1ZuhL0HGmyyPrenhW/NL H4akRFkMTk+jfIyWie1xfYhNY4m5WXrm25nPW+1YknAcegqvrLr8d3kwbqSK3OU6YxA==;
From: "Dario Ackermann" <dario@darioackermann.ch>
In-Reply-To: <8a0a9e63-54c2-4e5d-9479-1e39946328c4@leemhuis.info>
To: "Thorsten Leemhuis" <regressions@leemhuis.info>, <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: =?us-ascii?Q?AW:_[REGRESSION]_x86/microcode:_boot_hangs_bringing_?= =?us-ascii?Q?up_first_secondary_CPU_on_i7-6700HQ,_avoided_by_dis=5Fucode?= =?us-ascii?Q?=5Fldr?=
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: <x86@kernel.org>, <bp@alien8.de>, <tglx@kernel.org>
Message-ID: <882295593122258449212538.5447.2026111016821@darioackermann.ch>
Content-Transfer-Encoding: quoted-printable
Feedback-ID: u56201:maileroo
X-CSA-Complaints: csa-complaints@eco.de
References: <mw9nsyuj.70b4b79c-e987-49da-abe1-0164defd8d5a@darioackermann.ch> <630330232567670562275469.6204.202611921938@darioackermann.ch> <8a0a9e63-54c2-4e5d-9479-1e39946328c4@leemhuis.info>
Date: Tue, 10 Nov 2026 16:08:17 +0000
X-Tenant-Id: u56201

Sorry for the thread-mixup.

I tested v7.4-rc2 (7475ea8b5861). It still hangs while bringing up CPU1,
with both default AP bringup and cpuhp.parallel=3D0.

On upstream 6.18.55, I compared four images with the same config and boot
arguments (cpuhp.parallel=3D0, only intel-ucode.img as initrd):

  unmodified kernel                              hangs at CPU1
  skip Intel AP microcode loading               passes SMP
  skip the AP's MSR 0x79 write                  passes SMP
  do the write, skip the following revision read hangs at CPU1

The passing images reach the expected root-mount failure because the initrd
has no NVMe driver. This implicates the AP microcode write or its immediate
effect, rather than the following revision read (?) Moving load_ucode_ap() =
after
cpuhp_ap_sync_alive() or cpu_init() still hung.

With the unmodified image, microcode revisions 0xdc (one boot) and 0xd6 (tw=
o
boots) hung too. A first-parent bisect of v6.4..v6.5 tentatively points to
the smp-core-2023-06-26 merge (9244724f): its parent passed SMP in 4/5 boot=
s
and the merge in 0/5. Earlier kernels occasionally hang too, and tests with=
in
the merged branch were inconclusive.

Any suggestions for what to instrument next? I am new to kernel debugging,
but happy to take pointers.

Dario
