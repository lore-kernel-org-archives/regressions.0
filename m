Received: from smtpauth.rollernet.us (smtpauth.rollernet.us [208.79.240.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E1E1624D5
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 15:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.79.240.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776870995; cv=none; b=aCedaTzBczVrSfrI1ZDZMG+wKDu4QPZxpI4DMdsl14sWyUD8rU4Ji8dXBRXcI+32ZFcX2sTfL4YrKaawEiEUixhbvWgEckUfomFPT6bXN/rz6C3IxvpOl5ZZVbjXYl97NCZCzOedz8V+Af0EWozX5ixavWveDKPQmNuLyRcXr/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776870995; c=relaxed/simple;
	bh=FxHHjvqT4q6tQb+ec6phehnEvdVlk/9Eems8FcXzsdU=;
	h=From:To:cc:Subject:In-reply-to:MIME-Version:Content-Type:Date:
	 Message-Id; b=jipzv8GGNR+kZEpFDImfwvWP8VGryNAC7y2vq3TG8jpAgWQyt2QG/leoNQXg0gLpESRnlqf8peZwzujxv/dn0w47e8JIWeNSnHqvV+iY9PSSKY1STE1Cgw1vz8OUp9TXzH76zdW8hDGHXuvHD7uSHEpj57M/vDzRSl8+Vyrgad8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fnord.greeley.co.us; spf=pass smtp.mailfrom=fnord.greeley.co.us; dkim=pass (2048-bit key) header.d=fnord.greeley.co.us header.i=@fnord.greeley.co.us header.b=KCDobQN6; arc=none smtp.client-ip=208.79.240.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fnord.greeley.co.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnord.greeley.co.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnord.greeley.co.us header.i=@fnord.greeley.co.us header.b="KCDobQN6"
Received: from smtpauth.rollernet.us (localhost [127.0.0.1])
	by smtpauth.rollernet.us (Postfix) with ESMTP id C75882800041;
	Wed, 22 Apr 2026 08:08:26 -0700 (PDT)
Received: from mailhub.fnord.greeley.co.us (mailhub.fnord.greeley.co.us [129.146.138.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtpauth.rollernet.us (Postfix) with ESMTPSA;
	Wed, 22 Apr 2026 08:08:08 -0700 (PDT)
Received: by mailhub.fnord.greeley.co.us (Postfix, from userid 10)
	id 654BF19; Wed, 22 Apr 2026 15:08:07 +0000 (UTC)
Authentication-Results: zarathud.internal.fnord.greeley.co.us; dmarc=fail (p=none dis=none) header.from=fnord.greeley.co.us
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fnord.greeley.co.us;
	s=2024q2; t=1776870466;
	bh=FxHHjvqT4q6tQb+ec6phehnEvdVlk/9Eems8FcXzsdU=;
	h=From:To:cc:Subject:In-reply-to:Date:From;
	b=KCDobQN6T9yX51VLkPf7uF1VrdU11Ll2J1iDUuK/hO0vbFfIDflIi7pzojBD57+hb
	 7Zytarkzll51ePp3vTEdto+nx2HV9Qr2P/9/GMrFgdQMP35STRPN3R5ZDd4PzLeotr
	 R3PyZQ/LiWfLZXZfIiGpi/4pWX0AMt3l2I72d29O0xUw65vUUQWExqVsgyeiCVVctV
	 4Njpbueh+GBgrpqBq26ezV4S2JBbZ1odr+ol+YAbBsc7CtmhNqbLcCXmi1SQepRG4k
	 zh0NMLicqNolWY5LUevPTWYpP3cOLMxj1xm8kmXGnexohq0drDgXVNFUmsl4Y1u0/P
	 wZz+th8zMbd2A==
Received: from zarathud.internal.fnord.greeley.co.us (unknown [IPv6:2001:470:3924:1000:50c6:bdff:fea1:ac49])
	by zarathud.internal.fnord.greeley.co.us (Postfix) with ESMTP id 399923A9C;
	Wed, 22 Apr 2026 15:07:46 +0000 (UTC)
From: "Aaron D. Johnson" <debbugreporter@fnord.greeley.co.us>
To: Thorsten Leemhuis <regressions@leemhuis.info>
cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
    Thomas Gleixner <tglx@linutronix.de>,
    Alexandre Ghiti <alexghiti@rivosinc.com>,
    Paul Walmsley <paul.walmsley@sifive.com>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Anup Patel <anup@brainfault.org>,
    Sunil V L <sunilvl@ventanamicro.com>,
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
    Bjorn Helgaas <helgaas@kernel.org>, 1127635@bugs.debian.org,
    regressions@lists.linux.dev
Subject: Re: [Patch] PCI/MSI: Handle lack of irqdomain gracefully
In-reply-to: Your message of "Wed, 22 Apr 2026 10:50:22 +0200."
             <30a50474-a2e4-4b0e-be8c-8050b0356db9@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3383917.1776870446.1@zarathud.internal.fnord.greeley.co.us>
Date: Wed, 22 Apr 2026 15:07:44 +0000
Message-Id: <20260422150746.399923A9C@zarathud.internal.fnord.greeley.co.us>
X-Rollernet-Abuse: mailto:abuse@rollernet.us https://www.rollernet.us/policy
X-Rollernet-Submit: Submit ID 102c86.69e8e458.52238.0

Thorsten Leemhuis writes:
> Thx for forwarding the regression.  Nothing happened since then --
> or am I missing something?  If so: is that okay for everybody, or
> should we do anything about this?

I have not seen any discussion.  As the initial reporter, I can accept
that it is a very niche hardware platform and may well go unfixed
forever.  The machine in question has left my possession.  It may come
back in the future.  Or maybe not.  The next-generation newer ppc64
machine I have (an IBM 8205-E6C p740) does not exhibit this behavior.

> BTW, did anyone check if this happens with mainline (6.13/7.0) as
> well to rule out that this is something that only happenens in the
> stable series it was backported too?  If it's the latter I wonder if
> reverting it there might be a easy way to resolve this.

I didn't check mainline specifically, no.  All bisection was done
against the stable git repo.

Thanks!

- Aaron
