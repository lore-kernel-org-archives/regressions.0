Received: from smtpauth.rollernet.us (smtpauth.rollernet.us [208.79.240.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C7919D89E
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 22:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.79.240.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776897327; cv=none; b=LhkTj7hLikGd949X5KIAmwxKo3P2JkGFUiQ9z4z4R6YYLLiXHPxhBibiJcKkXR7yJ4taVgyuVFDbV5GYsAGgel171FMPym8T2SatlQecRIzr6rFSfNO5c/i0QDIpLS9ccbAXU+VgUszM57tKeIjhxKQWQcfcrnsHs5/Qtipsj2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776897327; c=relaxed/simple;
	bh=GOiIbUMSW+shVQwKPptWwq3X3FqenNWCLHvQ3Gv9j8Q=;
	h=From:To:cc:Subject:In-reply-to:MIME-Version:Content-Type:Date:
	 Message-Id; b=JpgBHsJtpBCu8Ch+7akqo5rELq6Whf7AhJ03gbmD4j5wAUlwtyIGj+ANb7tT28Y6R1iVaX5faTOmZXjEDvXpLat5l5fFFP11jordCT5zzmieZArUVO+VoLUHg1SgpYuAB3PGjR1FcJBHM9aUzGxnLCn5jCluwaw0HiyO0+BV/80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fnord.greeley.co.us; spf=pass smtp.mailfrom=fnord.greeley.co.us; dkim=pass (2048-bit key) header.d=fnord.greeley.co.us header.i=@fnord.greeley.co.us header.b=E1rUsaNW; arc=none smtp.client-ip=208.79.240.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fnord.greeley.co.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnord.greeley.co.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnord.greeley.co.us header.i=@fnord.greeley.co.us header.b="E1rUsaNW"
Received: from smtpauth.rollernet.us (localhost [127.0.0.1])
	by smtpauth.rollernet.us (Postfix) with ESMTP id EBF502800405;
	Wed, 22 Apr 2026 15:35:22 -0700 (PDT)
Received: from mailhub.fnord.greeley.co.us (mailhub.fnord.greeley.co.us [129.146.138.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtpauth.rollernet.us (Postfix) with ESMTPSA;
	Wed, 22 Apr 2026 15:35:06 -0700 (PDT)
Received: by mailhub.fnord.greeley.co.us (Postfix, from userid 10)
	id C0B1B2DF; Wed, 22 Apr 2026 22:35:05 +0000 (UTC)
Authentication-Results: zarathud.internal.fnord.greeley.co.us; dmarc=fail (p=none dis=none) header.from=fnord.greeley.co.us
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fnord.greeley.co.us;
	s=2024q2; t=1776897271;
	bh=GOiIbUMSW+shVQwKPptWwq3X3FqenNWCLHvQ3Gv9j8Q=;
	h=From:To:cc:Subject:In-reply-to:Date:From;
	b=E1rUsaNWliTkrgWsGftpQYuHC/qeyuLHJ3Nh8WAHTD+UNuXbHD5QPCYahmwXWCjG5
	 ZvPujYddylcWE5r2w0LO3O4Uq0NrvXDc6H52DY3xFfDfYpH59bCjxYgrFPJWIFI8Tn
	 uRtOFwfqT3uclB4ENnEAnVO6kPu65k19K/FrEfHY9kSlXtb1AsfMKCqQEKpKjjJLPJ
	 O8Bh0Z9Tlwkr4r4XQ0a9oj/SkMGxmIjtt27zonDjLE2Ms+nhYHQXkB1fUxk+yGV6t0
	 se4Xll30z5jSHPb7zNHT2+1GtUv27pbRUBbFdcv5ckOWR26G13WTRp9gyNCjwqD4iF
	 Y46qDR4dwcm3A==
Received: from zarathud.internal.fnord.greeley.co.us (unknown [IPv6:2001:470:3924:1000:50c6:bdff:fea1:ac49])
	by zarathud.internal.fnord.greeley.co.us (Postfix) with ESMTP id AE2223B5A;
	Wed, 22 Apr 2026 22:34:31 +0000 (UTC)
From: "Aaron D. Johnson" <debbugreporter@fnord.greeley.co.us>
To: Thomas Gleixner <tglx@linutronix.de>
cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
    Alexandre Ghiti <alexghiti@rivosinc.com>,
    Paul Walmsley <paul.walmsley@sifive.com>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Anup Patel <anup@brainfault.org>,
    Sunil V L <sunilvl@ventanamicro.com>,
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
    Bjorn Helgaas <helgaas@kernel.org>, 1127635@bugs.debian.org,
    regressions@lists.linux.dev
Subject: Re: [Patch] PCI/MSI: Handle lack of irqdomain gracefully
In-reply-to: Your message of "Wed, 22 Apr 2026 23:22:11 +0200."
             <87qzo61yik.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3447710.1776897242.1@zarathud.internal.fnord.greeley.co.us>
Date: Wed, 22 Apr 2026 22:34:31 +0000
Message-Id: <20260422223431.AE2223B5A@zarathud.internal.fnord.greeley.co.us>
X-Rollernet-Abuse: mailto:abuse@rollernet.us https://www.rollernet.us/policy
X-Rollernet-Submit: Submit ID 10466d.69e94d1a.7a43e.0

Thomas Gleixner writes:
> Aaron, can you please apply the patch below and see whether it fixes
> the issue and provide the dmesg with the output of those
> pr_warn()'s?

I can build it.  But as stated earlier, the machine is no longer in my
possession.  If it comes back, (and it might -- its new owner is
having problems supplying sufficient input power in his apartment), I
will be happy to test patches.

> The other information which would be useful: When you boot a kernel
> with the commit reverted and look at that OHCI controller with lspci
> -vvv then you should see whether it has MSI enabled or not. If it
> has MSI enabled, then please provide the output of
>
>    /sys/kernel/debug/irq/irqs/$IRQNR
>
> You need to enable CONFIG_GENERIC_IRQ_DEBUGFS for that.

Noted.  And thanks for the time looking into it.

- Aaron
