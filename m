Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336793;
	b=kFsyZ2visVkwPSt901quK0AnRt0IJ34+++LILM0zkNV73IhzpkC/6XkI2MJ77SLF64BZ
	 0XoSgNFXapZs8KefdamN5E0wzahwZim/vrM64xZf5VgwrV2xN/GK6Nqh9ie0VD5XDFDUU
	 LRV1pknorJ/a5ssUZsC6Sz5fkMPq/RoTZDLvg3/2nomx5AWiV6LKBzKWWEo9zWqJ5BwCN
	 ZO5kk0T5rbEatfg0goHDHuW3igdCHsa9au2jOtFkmK+8U36fBRWlro+RHsEFT+NRcJ+mi
	 E09oLx8JqzKZm/uRvzqjjw+ZKM13uKa/yb0xjFxuDq9Q2szy0z0H7hczxXLXDYZQl8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336793;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qCtHkLQV1QPmcRdOglLIVfj2T2vVGmdYJSqGUnXVjnI=;
	b=cIuDMZXlLeEDThmM7kmNCYVLoGx1cElKNULyaTFF+WKoOua9j7MdUF1d8ierxFIANRJF
	 tpg7rp+ZOdYNdpyNz8YhNvsTpgnOw2UhBEdC7MFUXBvfho0WLEdbdrYhJIVZlMPXRvBk9
	 E/sVf46+ZiBT/vtMtCTdJDsDGw2adz6ECQ6OCF8W5Ajj0bYZiuLoRTbJ/RKFFDWdLxAoe
	 Lwv3Hmq9Z9nn5jqKTyKRtADucvsLtiAw7+MeFJOaUKNsiFsXL8dgd3s5glYuwyoh2AgsI
	 JC4M0co4C2DXI+7f6QGI64k2QP1tNcGYR+7U3lkODjHLduzpnb1zceXh1OpXc22duuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=DRj0zqli;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E439B606A334
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 18:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E439B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=DRj0zqli
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AAAEA40E04D4;
	Tue, 10 Nov 2026 18:53:10 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BVIe70Ns5zVT; Tue, 10 Nov 2026 18:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794336787; bh=qCtHkLQV1QPmcRdOglLIVfj2T2vVGmdYJSqGUnXVjnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRj0zqliS66Eb31ZeCh4V0hQ6sP33FUElB30wto3pwImbw9OFPXFXqvt4cLaA7+c9
	 tifrFqiQ2Iwth11SQ3CuQjV3DBHRQMvp7N+WoyftT9sQJG6S+o1RNBCOut2fKDQ2G/
	 lBpxKpIf7fuS4KsjEjan5fOltL61CMEZIAo7FsdYQ+2PMOT8HSG6ZDtMN4hz7uzs1c
	 LvQjF1O3Eo0SCD1cVNs+8CD6JP+yPcWftXhTqziPu7xUN+psThIw/ZLfTHdqoHvc0q
	 oK3F88RTw6+3VdoOM1pwqoZmv3zr5ohGoazOoYrg+EaeqxgYVbOGi3ePDSrs0pzsXq
	 b0DZjx+s3qUrFdffCFffrCvbGwcB+0qHKVQmrgNkX0xRANruJNsPisJSUYdG467KyP
	 hF43Tv+xwpRhyFdZz71+WxX039a9rEpo4zKvT1ytpGzTRB/lzR5aa8JAECdHGJEkgR
	 QvWWxbB2LL6IfyLUtE6qp7HuRHa00zjbhTMk5+gxv6VKwV2v8eM5+NFIPQY514dgGB
	 Z9n2hwM8RgaKKGVA8Lr3xE8OSu2MVEjiBCMH+93ttmOvu/yWk1rcgwcpDBUoShKtvB
	 Gh5yanL7hoFmfzHgzN5qEhzYOEXHIWesPdeVrHBvZbQ12wlyFLbs0BaAfGd2BszjCP
	 b82Cez0www3lcd3ttoQ+JIe8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 186E640E02A0;
	Tue, 10 Nov 2026 18:53:00 +0000 (UTC)
Date: Tue, 10 Nov 2026 10:52:57 -0800
From: Borislav Petkov <bp@alien8.de>
To: Dario Ackermann <dario@darioackermann.ch>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	x86@kernel.org, tglx@kernel.org
Subject: Re: AW: [REGRESSION] x86/microcode: boot hangs bringing up first
 secondary CPU on i7-6700HQ, avoided by dis_ucode_ldr
Message-ID: <20261110185257.GFavNoCWszSXhRkaOV@fat_crate.local>
References: <mw9nsyuj.70b4b79c-e987-49da-abe1-0164defd8d5a@darioackermann.ch>
 <630330232567670562275469.6204.202611921938@darioackermann.ch>
 <8a0a9e63-54c2-4e5d-9479-1e39946328c4@leemhuis.info>
 <691747894523180440145931.1352.2026111016821@darioackermann.ch>
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
Content-Disposition: inline
In-Reply-To: <691747894523180440145931.1352.2026111016821@darioackermann.ch>

On Tue, Nov 10, 2026 at 04:08:17PM +0000, Dario Ackermann wrote:
> Sorry for the thread-mixup.
> 
> I tested v7.4-rc2 (7475ea8b5861). It still hangs while bringing up CPU1,
> with both default AP bringup and cpuhp.parallel=0.

Ok, so I don't understand: which kernel did work fine, without any cmdline
switches?

Pls send full dmesg from that one. IOW, did any kernel at all load microcode
successfully on your machine?

Also, send one from 7.4 with dis_ucode_ldr on the cmdline.

Also, check whether you're running the latest microcode packages by updating
your distro blobs.

And put your reply under the text you're replying to, like I just did.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
