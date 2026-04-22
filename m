Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2229370D53
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 19:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776887553; cv=none; b=NTUYSvNh1fokEdx6Zsz8YpFtADI9vObG8fqadN97d8a/+9s3OtgjNlGUrYhhzv/TCcI3uRseGf0M9VIFmOY/Yr6dJeVc9Llut5drrRVA3IOdmsWz+WPS7Tp2RIpbL1bL8+1O/5kvuLo9i08Pcd9hB70tt8du7nNywAQtMd/mIJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776887553; c=relaxed/simple;
	bh=xVBGF+nbrhf38KaRbyHp2NMIEb9Bubh5xq3tZt2H+ww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JrihdmzYvgUR5ZMdgytsc40V67mzVaLLhXNHeMft7i9k4G4Vs/q5n5tYGeLMUJo9dxOIHqfvyPo3D2UGKSpFWjwN0Zw13h4O/mgzpBc8s0qfVKG9kq1vljSFX6MNhkSINgAJXI9RIRKo+5tpacR+8WwysT2yzp0kOv5d2LloHZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CjYuzCCN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ECOitHdO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CjYuzCCN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ECOitHdO"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776887550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVBGF+nbrhf38KaRbyHp2NMIEb9Bubh5xq3tZt2H+ww=;
	b=CjYuzCCNzWOFRouWPMxwzPcG+9qwZESG3C2DlUTOe9FoOj556OGIc90Koi11uaFyUcYZpN
	IuhwHT3deFgXCFsHHWrxMr56LTdJ/Z65jdOygnlmheY4DV9Ei0VA/yUrhgUhHarQ+6cOUi
	lmhisUi2Rs1eMjFnU9OQWJCjfEQbgn6SpG0d/vkgxCG4UF+ZHup9JDSgC6nBY4yvgswckU
	LRPv4xzwtLYWossanAQrZgM7+2NOnu2uyAjc07YYy4r0MPky2KuGKjPU1bOqWW5OWa4k7Y
	0TxWyyZ3JstuKzMcpxGSqzxy05eusGimts8Ds3qCdX9QXmMBxvNwyqyPwi+ndg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776887550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVBGF+nbrhf38KaRbyHp2NMIEb9Bubh5xq3tZt2H+ww=;
	b=ECOitHdOwdqGpRWFbnVAF2GY5zTBTplF1N7YyPEhtObX3/qQ3o8e4eeRAErkoOlr7PiUtv
	AokkrK80QRHIm4Cw==
To: Thorsten Leemhuis <regressions@leemhuis.info>, Uwe =?utf-8?Q?Kleine-K?=
 =?utf-8?Q?=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Anup
 Patel <anup@brainfault.org>, Sunil V L <sunilvl@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Bjorn
 Helgaas <helgaas@kernel.org>, 1127635@bugs.debian.org, "Aaron D. Johnson"
 <debbugreporter@fnord.greeley.co.us>, regressions@lists.linux.dev
Subject: Re: [Patch] PCI/MSI: Handle lack of irqdomain gracefully
In-Reply-To: <30a50474-a2e4-4b0e-be8c-8050b0356db9@leemhuis.info>
References: <20241213115704.353665-1-alexghiti@rivosinc.com>
 <87v7vn917f.ffs@tglx>
 <CAHVXubiNMp9chdUdvYjiQC2LMhNMMaGEiLMWZ-4RSV54jakP3g@mail.gmail.com>
 <87ed2a8ow5.ffs@tglx> <abE_QoS5DM-ZltaV@monoceros>
 <30a50474-a2e4-4b0e-be8c-8050b0356db9@leemhuis.info>
Date: Wed, 22 Apr 2026 21:52:29 +0200
Message-ID: <87tst222o2.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22 2026 at 10:50, Thorsten Leemhuis wrote:
> On 3/11/26 12:22, Uwe Kleine-K=C3=B6nig wrote:
>> Control: forwarded -1 https://lore.kernel.org/lkml/abE_QoS5DM-ZltaV@mono=
ceros
>>=20
>> #regzbot introduced: a60b990798eb17433d0283788280422b1bd94b18
>
> Thomas, in case you missed it: this is a change of yours: a60b990798eb17
> ("PCI/MSI: Handle lack of irqdomain gracefully") [v6.13-rc5]

Yes. That fell through the cracks.

>> #regzbot from: "Aaron D. Johnson" <debbugreporter@fnord.greeley.co.us>
>> #regzbot monitor: https://bugs.debian.org/1127635
>
> Thx for forwarding the regression. Nothing happened since then -- or am
> I missing something? If so: is that okay for everybody, or should we do
> anything about this?
>
> BTW, did anyone check if this happens with mainline (6.13/7.0) as well
> to rule out that this is something that only happenens in the stable
> series it was backported too? If it's the latter I wonder if reverting
> it there might be a easy way to resolve this.

Let me have a look.

