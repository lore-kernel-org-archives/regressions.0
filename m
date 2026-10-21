Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601090;
	b=PdkzBR7fL2Sswt0Wb7vBbMQFeMaRjaKWCd+bTOoHHt97DMq6onnfIf5Rmq7CyIf9PUnn
	 FEKvf7r+gEB7M1fNuCJ6J7UlIB6LGTD8c4Hl7qHRWRnAL4xKW68P+fHHIux/xdN7Iiv/u
	 +uJHi1P1rPsCZn/i3WvJJevFih+KsX9Ofx7yvpmIEyQU1GdinR9H51NyOcc9W36vm2XaX
	 KY3PlvttZGEVn3iPvgf9MkLbKLLLGCT8ujS/2wTDNAY/+WmqLUlNK0c56dhBU5yKE5Esh
	 vmt6R/gD9qsxsDmJ/AG7P35qT4TQZAm1ITqtkOp08sJQLf1t0A+WU2dN0m1MidFWBAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601090;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=sF2WgK8kQja2/TCLOQWF9mZEvN3dP13/o7DoaVwiz+E=;
	b=rLMqCE24Kw8ED2bwESzOODinuL/mmJcunSljCc37dvjPsKzJQ5MgK0WX4HKxnO7WqQ45
	 ny4rofMYVpQurFxvN7mi6LPCws9I3Ucj7lGiiqqGz+muHVhFY+00NaLaRYlKTkDo9L11M
	 aPEIWQZF62jLQIndJaG+5IkKvn9EQ8rEac/2IfhZIsvLwW4oHGHv3jqC4eNWLvqlq9f9F
	 pBgU7qDbLOVfZ1IDuUkgl3Fiqn87K8dzcAeQCyj0MDbTGzNliGHFbrcUv/SpZS+mK49tc
	 hmUlvVxPh13vFfehWXqAey45mdwnSDGMWTpROcHAJPrjU5julMsxqmp/PVf6yGicK9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=eAGI52zg;
	arc=none smtp.remote-ip=79.135.106.30
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D96C606A319
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 16:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D96C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=eAGI52zg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1792601081; x=1792860281;
	bh=sF2WgK8kQja2/TCLOQWF9mZEvN3dP13/o7DoaVwiz+E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eAGI52zgXiCnFEdHpLNEetEFydnXmAkH3srKqtDjzkdi4u7+QkyLFd3WhcH6rFyzr
	 hYM194XuN4D5HgldWHzVF8Sc1bXVK+RtcstbS2GaR8nhC9p6/72136AsjqEjVH15Tn
	 9vkR8a7a5pMOgTkaEEMDDZ8Mr8W6bsPiSzV4f3oiwJ78ehDEo6NagBk6fm8RWJTHQs
	 Z9cHetvTx2vFniPZy+zX7QUhQcZbiOg5luxOczrbXzQWZcZX14sDx9yRWcJJBvdjPY
	 f1Cwwo5HeENkSOSx2vFDr5XS/tV7nfsL+KBdvuerLkl8o2wtuP9jBvEVsmqAmfA2Ao
	 GC9tcqq8bxRAQ==
Date: Wed, 21 Oct 2026 16:44:35 +0000
To: Thorsten Leemhuis <regressions@leemhuis.info>
From: Mikkel Sejdelin <mikkel.sejdelin@proton.me>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "rafael@kernel.org" <rafael@kernel.org>, "sashal@kernel.org" <sashal@kernel.org>
Subject: Sv: Re: [REGRESSION] 6.18.57: resume from s2idle triggers poweroff and hangs when tiny_power_button is built as a module
Message-ID: <725HsmAf_bFINWdMxvCiH7SJLNdQs2iY1BiueqlOgIFrbkyv0Anc_2XPYLlkH_l0UVA5IueS_SeZFAe78qbvO-DjcR38vtRixBZTK_jmf1U=@proton.me>
In-Reply-To: <e8e153c8-2c09-4b86-8991-a8eed56526cb@leemhuis.info>
References: <1kU98bgDqqEMGUcpGahaBYlaPiP2ssSCZj1uIKq1MEaGpNv2exGeJc3VWzXxB8-VJQ1Uk62W19oByt2KC-v1bSA4Sux9fBhnlA_IHWjV2Zw=@proton.me> <e8e153c8-2c09-4b86-8991-a8eed56526cb@leemhuis.info>
Feedback-ID: 151291767:user:proton
X-Pm-Message-ID: dd500dd4ad8dbdc1d41ebb52ee9dbacf3c24a56d
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

On 10/21/26 15:53, Thorsten Leemhuis wrote:
> Maybe your request to pick up f4203ec64e1155 ("ACPI: tiny-power-button:
> Convert the driver to a platform one") is enough to make the stable team
> pick this up for 6.18.y. Ideally you would try if this really fix this;
> or have you and I missed this in your mail?

I had not tested it yet, now I have: f4203ec64e1155 alone on top of
6.18.57 fixes it. It applies cleanly.

6.18.57 + f4203ec64e1155, tiny_power_button loaded (not blacklisted):

  /sys/bus/platform/devices/PNP0C0C:00/driver -> acpi-button
  /sys/bus/platform/drivers/acpi-tiny-power-button/ -> (no devices)

  3/3 suspend/resume cycles OK (lid close, systemctl suspend woken by
  the power button, systemctl suspend woken by the keyboard). No
  SIGRTMIN+4, no poweroff, no hang.

With both drivers on the platform bus they compete for PNP0C0C:00 again and=
 only button binds, as it did in 6.18.56.

So please pick up for 6.18.y:

  f4203ec64e11 ("ACPI: tiny-power-button: Convert the driver to a platform =
one")

6.18.58 is still affected (no ACPI changes in it).

Thanks,
Mikkel
