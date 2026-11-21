Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.69.43.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795276875;
	b=MKeYTLLhvzI+UkctxY5yiM0Z3aKmNwlHhSZRgKg/LBiwFVvjrH1S1+0YNWmGgXPrPETG
	 HC3n+vIlvcXx6T7N5b2ZPnYBRVNBPipTHIF+O0Hc8n5JZ0MidvNiU9Ob281NjCitbyJAM
	 QML5nN8qcxrd1acWi79RktYTS135/UYWaAwhnesYL2bgI9faXSwBBYQHapd7Cu0BHDhBP
	 b6ksrtTS1nAY82Pbylwk5y6mBzek4iKEhU2t5FeGT25iHjum3t3DCYI+aP8RqpY3vWSU5
	 hVf2Wts2n15rlymUMyGl1QQoKF/HN8gvvJoWmWq+nq7LoPnd4b5ceUx41Ux3bNGKDHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795276875;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8XYYzlsh0f9rm3uChWU1Gi4MrlVoK3IXaYdzy7oKnec=;
	b=obRpGB7F6+uOO/VSiuT9CVRL3hVjI3v/HrIyvuA5TFVX+QjBPely5llRZIfXiyxKTLxB
	 ZLQLoWjyLQhw03B/XGpXzDomRd76wTq0UMU6fAOKrLmwhuBpfECSgeymr4oc5QNWnnUbe
	 UVvF1o2t+4O82c0V3aVW137jjQjg1C9g9+3V3Z6QK+kEj8v3vgoutbH7uG5y/upUKsqta
	 jFW0QCRCXEqJ1l9bEU22oQJvno3SCb/CL+tqGcKNjPy3LGNulXvMJw+x2aanzyULEHWqK
	 r3MMf0MoY7SdTdToGbZLTdtGG/U0wI4d+LnInkL2nStS+WyjO33qfHbSKBA+kg/2u4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vozeler.com;
	spf=pass smtp.mailfrom=vozeler.com;
	dkim=pass header.d=vozeler.com header.i=@vozeler.com header.a=rsa-sha256 header.s=max-2024-2 header.b=bLPy87fz;
	arc=none smtp.remote-ip=80.69.43.37
Received: from imap.hinterhof.net (imap.hinterhof.net [80.69.43.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BBE606A331
	for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 16:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BBE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vozeler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vozeler.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vozeler.com header.i=@vozeler.com header.a=rsa-sha256 header.s=max-2024-2 header.b=bLPy87fz
Received: from dp.vpn.hinterhof.net (i59F45518.versanet.de [89.244.85.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(Client CN "x201t.vpn.hinterhof.net", Issuer "Max Vozeler" (not verified))
	by imap.hinterhof.net (Postfix) with ESMTPS id C93098FB862;
	Sat, 21 Nov 2026 16:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vozeler.com;
	s=max-2024-2; t=1795276863;
	bh=HZ/nux6waLNVqMFB19TuqLUpFYE8MBoK+35ghV3BCb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLPy87fzLAZvA5+3BBFKQrEVf9Xs446er/eldHgEUX2v799dz/NlYkZ2J9yH4C3+C
	 58NJpHC+tCzJetqdZQ8Qtf+xcfbJHOV7SnwahCmPExG+wNQTYyp9Fu0qogevADF5OG
	 FQnbQ044AtOgd1wcR3LzAvxBy93b3dP08AJzCKxSZlPMoRGw2SuHm7HodnMYvwOsXa
	 +UpYNzrl83mFEOvubQp4kheb88WnMMkgZG+CMVIP+3IRaNPQTdX/nY9ySxFVJzaYzZ
	 3OtkkZ5hdRwLzT1MgE+OPPWJoOj6xTtxCPWuB/Kkfp3VyuWWTgktNlZvbDbbu4d+HW
	 L533VvkkGlZ4A==
Received: by dp.vpn.hinterhof.net (Postfix, from userid 1000)
	id 7475926018A; Sat, 21 Nov 2026 17:01:03 +0100 (CET)
Date: Sat, 21 Nov 2026 17:01:03 +0100
From: Max Vozeler <max@vozeler.com>
To: Sasha Levin <sashal@kernel.org>, Chuck Lever <cel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>
Cc: linux-nfs@vger.kernel.org, stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [Regression linux-6.1.y]: NFSv4 server: sec=krb5p mount fails
 with EIO in 6.1.192
Message-ID: <awHAP3VW5BgSI3py@dp.vpn.hinterhof.net>
References: <awFyZbQE8pDyOxUy@dp.vpn.hinterhof.net>
 <2026-11-21-1-daily-reply-0001@kernel.org>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026-11-21-1-daily-reply-0001@kernel.org>

On Sat, Nov 21, 2026 at 10:27:29AM -0500, Sasha Levin wrote:
> > Reproduced with vanilla 6.1.191 and 6.1.192
> >
> > Good: 6.1.190
> > Bad: 6.1.191, 6.1.192
> 
> This looks like 82cf21374fb7 ("SUNRPC: Convert unwrap_priv_data() to use
> xdr_stream"), which went into 6.1.191 as a prerequisite of 2188232509f1

That matches my bisect result, it points to the same commit.

> ("SUNRPC: svcauth_gss: enforce krb5 token minimum length"). On 6.1,
> nfsd_dispatch() still re-initializes the decode stream from the start of
> head[0], so after the conversion a krb5p call is decoded starting at the length
> and sequence number words instead of the arguments. krb5i isn't affected
> because its path wasn't converted on 6.1.
>
> I've reverted both for the next 6.1 release and re-applied only the token
> length check on top of the old unwrap code.
> 
> Could you check that 6.1.192 with 2188232509f1 and then 82cf21374fb7 reverted
> fixes krb5p for you?

It does indeed. 6.1.192 with those two reverted works fine.

Thanks!
Max
