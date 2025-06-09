Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2175120A5F1
	for <regressions@lists.linux.dev>; Mon,  9 Jun 2025 17:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749489406; cv=none; b=DseTYkC9ccVwAG8qzKrbDB2FYu3Nori/O0GQAOr88MpjFrMYKAw+Ku5JFZ/w32OMRH7+Zu3JpuDXidQ+yIDmblej23U2biDbMkYEN2QAv/iTKl1c6Ya16GfOiAomLSOM9CBXr6SWnJiJNUi7TpgNA88QhvcqruG5HR6XjKnRBI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749489406; c=relaxed/simple;
	bh=Mmv4D6m6HZ+ZCvrc/3Fib8VNrQQAmGDeQVCJzexSH1o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HHI/a7HmDcvD5KaRHtY0/jOv7ssCf0lGS1ctu4TRGavyxxY2w9TOqv+NX+f7nBIjjqL8iGQ8nahX9431MvxWg8jpZLTptajy6BCqew9GFUDNaPhAqcssz7AttOH/zDXZXz2iNXP5892AS4Ok0260BB7l7tAcfnZBC2sqOfRQle0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=r26.me; spf=pass smtp.mailfrom=r26.me; dkim=pass (2048-bit key) header.d=r26.me header.i=@r26.me header.b=Sp/sfUli; arc=none smtp.client-ip=109.224.244.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=r26.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r26.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=r26.me header.i=@r26.me header.b="Sp/sfUli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r26.me;
	s=protonmail3; t=1749489401; x=1749748601;
	bh=Mmv4D6m6HZ+ZCvrc/3Fib8VNrQQAmGDeQVCJzexSH1o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Sp/sfUliJPKaIXzhyIwSNHr07c8lSllRGAfnv0Us/I1R4BXWlM5ppZHIGf2APhns5
	 O6Py5r5qNTtNW2Dz6scY3VF0+7pP7uJuCjTUaa0rwNRaBaXiPMbCCV52KX0aILwaCq
	 D4ZGm3ocDCTL0wIcRUYmp3TsIVyoX0isX6388SfHO8Y3wHhgTPrPBYqMWsm/KSYuX6
	 9u8seYphZwyoSn1z5LghRI34dIUzY12awr1f7Yp4gdKm+5nrx1s59tH5Hs5KatvHea
	 EO4h3CtqlqwWijy8CRWy5YSupjkaNB1ULt+R4o7zjuA0kMJJ6uJ1j1oTf9JKvTDHE/
	 IUwP6lsLmdN2g==
Date: Mon, 09 Jun 2025 17:16:37 +0000
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Rio Liu <rio@r26.me>
Cc: Bjorn Helgaas <bhelgaas@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [REGRESSION] amdgpu fails to load external RX 580 since PCI: Allow relaxed bridge window tail sizing for optional resources
Message-ID: <onf2nAzOEySlZFoS5IQLCqqJAtiw3K7HmeH7CAghzunYBhYB8NqDT8UAfHHkpG_gWUbQp4flZFWsNyot9HGMELLXeM1oVu71lLB3GKL1AZY=@r26.me>
In-Reply-To: <21d41e66-d019-31c7-1e73-fed80cf54965@linux.intel.com>
References: <o2bL8MtD_40-lf8GlslTw-AZpUPzm8nmfCnJKvS8RQ3NOzOW1uq1dVCEfRpUjJ2i7G2WjfQhk2IWZ7oGp-7G-jXN4qOdtnyOcjRR0PZWK5I=@r26.me> <7a7a3619-902c-06ee-6171-6d8ec2107f97@linux.intel.com> <w3gGcmhWNmeGetzLnhgkjfx0JTEyIOKN5sDu-uShZ_7JWthMgGP6plgDuhDbkYyaA7vtGbdl1WbMTZ5zM80OyJoqUa69krqDpuhqDangkLY=@r26.me> <21d41e66-d019-31c7-1e73-fed80cf54965@linux.intel.com>
Feedback-ID: 77429777:user:proton
X-Pm-Message-ID: cff81bdc5bf1b863859f55e89e5955fe24437d45
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, June 9th, 2025 at PM 1:07, Ilpo J=C3=A4rvinen <ilpo.jarvinen@lin=
ux.intel.com> wrote:

>
>
> Great, thanks for testing.
>
> If you want, you can give your Tested-by tag so I can include it into the
> official submission of the fix.
>
> --
> i.

That sounds good, thanks!
