Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B805F14290A
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 21:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710277510; cv=none; b=k5qFLehtKx75nLA8kXdr5s9Y31vX/C31ECwmG+xDdmN4yD+EynPzLvaHiq+sA99NZzFPTVXtdttn15lFISRIwXp4G/4/bvrr1sD++5ssv6pptZxe5VxCAEpXgeuVFgH4+DEWdODUbEMacBaDGFW1DtOd1fd2bhnLudlfBJIvgQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710277510; c=relaxed/simple;
	bh=WfE/uAaFmREWwyUPrLxnzVuIcIaKG6ipIYK+YCXdfyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bW9apQGQEt6Yixw1yjnVQCxNiCneiIdKIX9RnqHzUGIwx9KHekW38uNqorKi2ahhFmhnSLMg0XIu9K7+NJ/jmUXgx9KbZZMqvjjKWCzah5EN0DyWfNNfzCy/B9e4bPfmkt/jYP6W0LKCWZkxXJjch8wlliDua/HuIrgHvdPJsM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kuNtgBpa; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kuNtgBpa"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2ACFC40E0174;
	Tue, 12 Mar 2024 21:05:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id E-eCXMl_BKA8; Tue, 12 Mar 2024 21:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1710277500; bh=FI9DgqOlBD4Kzh7538wsgB73BfJuAM4PyTYvdWs6vdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kuNtgBpaa8wr2YS4sU0meMHEb5aWeVHvlzWBNoubfIj0fR666rVR3hMYMNUMS3ekL
	 RJojA7ExDhAt2b7oiZsUws4UEuY0Lfnw4tecHKtWy46JI2xsiLggwvjpeuKKtcodWL
	 iT+yf0efB+uRk4ofLKF+/bXv9xl3LKb1TkijqTK/SufselXSn8QxStIrV6ksyRSYiE
	 5usIf1s4djr3OlhIEF0OREeAFX4VPKeV5Tnb5hfBBa7yz6bXF0wbThynE1KnJNtK2v
	 l1mfTBgqojRERjCdvphX5uCo5ymA07LPAOMjnCTallDdRVkeHJHn1JvJFqeUZnX0D6
	 NFNcaIpVom18AnDo3DlDopj/LedL6P4dwqq2M3YjODkj2qqqjVmocaQQEYNOZopXM+
	 qgdyN2ZlMCOGLhXjfF+oCN8XijJtFvX+gG7prJRWdarAN1edo5xdowumDuYBgjPGZm
	 oyeClkidN3pE7NfhSZoU6p0fIOk8QeOVw+INxyPBVNBBPQ/oI++zHyFUkD2juCjFT1
	 pXaE/16CncKWyUm+dxQFDhge7g9DHy+5Xk0gYpGeyiQqWQP47KVLZZQ7ydWk7um4dU
	 ftdUCKq6gy9d/0U8CwpTQTQFt0DzdEPUTPsvyhX6QsdE8wZCeQWnGvk2Ly6/8ZIb3M
	 cE1nq+KJciaku/X+/+ShpqLQ=
Received: from zn.tnic (pd953021b.dip0.t-ipconnect.de [217.83.2.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B96E040E0028;
	Tue, 12 Mar 2024 21:04:55 +0000 (UTC)
Date: Tue, 12 Mar 2024 22:04:49 +0100
From: Borislav Petkov <bp@alien8.de>
To: Mahmoud Adam <mngyadam@amazon.com>
Cc: peterz@infradead.org, tglx@linutronix.de, gregkh@linuxfoundation.org,
	regressions@lists.linux.dev
Subject: Re: Regression caused by 'x86/returnthunk: Allow different return
 thunks'
Message-ID: <20240312210449.GKZfDDcQiclOTXBSB1@fat_crate.local>
References: <lrkyq5xxrz0gg.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
 <20240312200239.GIZfC033qDtEUZmwgV@fat_crate.local>
 <lrkyq1q8fyxm5.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <lrkyq1q8fyxm5.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>

On Tue, Mar 12, 2024 at 10:00:02PM +0100, Mahmoud Adam wrote:
> Borislav Petkov <bp@alien8.de> writes:
> 
> > On Tue, Mar 12, 2024 at 08:58:39PM +0100, Mahmoud Adam wrote:
> >> note: the regression is seen even with retbleed=off and also with spectre_v2=off
> >
> > Try with spec_rstack_overflow=off or mitigations=off.
> 
> No regression with these cases.

Works as advertized then. :-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
