Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857EB22EF8
	for <regressions@lists.linux.dev>; Sat,  6 Apr 2024 07:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.15.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712389503; cv=none; b=PsORO+LL8i16QAs9JK83feaA03AJ3rnroRN2WIuYi6zYm1TtNsDK2AoA0qkoiJ5HBv/XQ6Iq4JpknRCcSuYjjjVvdXsfNP0BHqxPU/17JMJQg0GN/bm9Iokd7/+5ms2OSCwCH62o3Rsxa5rTu9JOujrGA8I3mR+yF5dbp16YZQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712389503; c=relaxed/simple;
	bh=bv00TIb4GiZh1yN2UePLDExfIIgWKvhzD46SDHmzgHc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hVdP2Kd0LB8h4SQg5Zposa+HBEf31kgf1n2fUMv01l3zXo3E68xk8s+BG9QEfzv3VZTzFrhlGlmQSJvhDJhcSZ+pPMdM9cP4gd9IWlLT2xJcGnEg7SGQGZ1NVTm86W/KpkSX1qyr53cgSh/yc8MBrKxVi6z3sNmEGMEfH5sqKVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz; spf=pass smtp.mailfrom=tesarici.cz; dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b=AGXSoiWO; arc=none smtp.client-ip=37.205.15.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b="AGXSoiWO"
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id F3FD11B18CE;
	Sat,  6 Apr 2024 09:44:49 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1712389490; bh=mNp+ImAS7xB+lsKKsyoHRq0t1TQ5mzQI20TvQDfDTZc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AGXSoiWOgQ9Z1Q1I65hFjuaFWQTHBWCAF1mH9+oPFb35QTZGCAAgUthWBAGqKGrsD
	 4BBjDnW0GD35OwDn/fSg9eO5d7vKIgtj7nri26v3gOXGWdBrFTPgCRallgol9sxGsy
	 hAEwt0nX9vVtCTOMs8F7HsFMBjrowJk3Yr/GOPvcjW/ZjEXL7XFeX7RZBXNVhEn9FT
	 jGPEyN7mNdhzJKbg65V/HXzZkoMhOg7RcZ8pMC2YozAlxGPpHzZbp4IxEIS/q9DFvj
	 MgeVpvijPdXbyQx8ScY88IoI31hNXxtpquWkFKIjV8Frql87nYcZTb28fZ9Kc8m1Gl
	 W4mLkM0pzGLsQ==
Date: Sat, 6 Apr 2024 09:44:49 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Eric Dumazet <edumazet@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, open list
 <netdev@vger.kernel.org>, Linux regressions mailing list
 <regressions@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Subject: Re: [PATCH net] u64_stats: fix u64_stats_init() for lockdep when
 used repeatedly in one file
Message-ID: <20240406094449.1ac182d0@meshulam.tesarici.cz>
In-Reply-To: <CANn89iLZ9rkSpT6crP89RV-GPSnSxhUkjPSSh3PmiLNDH103yQ@mail.gmail.com>
References: <20240404075740.30682-1-petr@tesarici.cz>
	<CANn89iLZ9rkSpT6crP89RV-GPSnSxhUkjPSSh3PmiLNDH103yQ@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Apr 2024 23:08:58 +0200
Eric Dumazet <edumazet@google.com> wrote:

> On Thu, Apr 4, 2024 at 9:58=E2=80=AFAM Petr Tesarik <petr@tesarici.cz> wr=
ote:
> >
> > Fix bogus lockdep warnings if multiple u64_stats_sync variables are
> > initialized in the same file.
> >
> > With CONFIG_LOCKDEP, seqcount_init() is a macro which declares:
> >
> >         static struct lock_class_key __key;
> >
> > Since u64_stats_init() is a function (albeit an inline one), all calls
> > within the same file end up using the same instance, effectively treati=
ng
> > them all as a single lock-class.
> >
> > Fixes: 9464ca650008 ("net: make u64_stats_init() a function")
> > Closes: https://lore.kernel.org/netdev/ea1567d9-ce66-45e6-8168-ac40a47d=
1821@roeck-us.net/
> > Signed-off-by: Petr Tesarik <petr@tesarici.cz> =20
>=20
> I thought I gave a Reviewed-by: tag already...

You did, but at that time I didn't know which tree should be used to
merge the patch, so it appeared as a stranded patch on LKML. Once we
agreed it should go through net, I sent it again, but the resend didn't
have it.

Thanks for your assistance!

Petr T

> Reviewed-by: Eric Dumazet <edumazet@google.com>

