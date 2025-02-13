Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6D21EF08E
	for <regressions@lists.linux.dev>; Thu, 13 Feb 2025 08:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739436208; cv=none; b=nEUHA8J2GQUXVURjwggnlNvuFATDXjlqrYprRLrfNfXTICq0+TACtfgLV4vqBw3kE8vbD/wk2yGb8QGHmXzclPWx/Fcw4de5Sqj3eLiZnsZOcIrcLAT7etLuzqQpjN11JhmiVifMyutGXHypdN41fkvoRU82yai+aTH6aRrtI6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739436208; c=relaxed/simple;
	bh=E7GuVlbsAtqSiVuG5Xfjh7yj9/bwGZqjpH5YRkLKt9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYgq5fWbgOTgj/+i3wQjgd4ra7ARdWVFgSwmtN9EsO/OW5oSeqHBvAatgpklZEURTdoFoFenxy3JxkBV0wNyhSBVtYBG3SZgDOEhv61UARku/ZhK4IhFKfDRmWgMb3KggMug8AN7U1xBtxr3UYGD99lqGSUa/Wc8tAm08HGpGMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Lp1kYGXN; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Lp1kYGXN"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-5dea50ee572so810342a12.1
        for <regressions@lists.linux.dev>; Thu, 13 Feb 2025 00:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739436203; x=1740041003; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E7GuVlbsAtqSiVuG5Xfjh7yj9/bwGZqjpH5YRkLKt9M=;
        b=Lp1kYGXN+RpAUI/ZgBKPm5vYNzPzbVgNZFhGCRNOyO1I4WwZyp7EmwiOgtPQ8W5iJo
         BTGtROcaimHIZj98un39/itnL7bejhS6DPnHBv8yRdZc50oY1VnL1psCC8qZ7WgT828x
         xRqScG7PdsclBpoe7zDvFra3KkiDnk5NfH5ogJavqoYhq7cSJxgMIj0psc1nGYjUwzAd
         AAmhn6EFhpX66VgsPbhMh7E5PgJYEz18Z5LJJREJBPCr9KMUnhHMfh8FbzBXqfagO/Kh
         HhdN7C+mqnAQ8P/alUhQbw4a1v0TozFbavx+JgCKIkRLEjrla9X+3XJkZ/qQmcSCFkf4
         NfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739436203; x=1740041003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7GuVlbsAtqSiVuG5Xfjh7yj9/bwGZqjpH5YRkLKt9M=;
        b=YGjAllcIyH7BiHznxmIrcA1Ak0Ns6wsdNdnxzNRepprHBuNxRFNVDNb+L9HFK+GYCQ
         gh2a5UerHjXczuxVv7ZKDpV/a7MS2eR9ePshVgTvuuhf/5XpNpd6xcEy3KL8yAERz+27
         9V25lYUjHmz91ZdN9HYooEx+/77NSiAELYDbjL+pvaaV7jkc+hniJ4k50vgs2TepjSQb
         NYD1qTqDlf5Uhc8SH/k69DrSnvJQnyuvr8a3bAog+9mzzkv6a5ypTy8y5atI+sa6SNYn
         ZLGzkFTot1kPo69lunODfTlrjGL+TfMQqaou/fXz3a/IECDuHbQ5HANnicujlY/nAzZL
         6FAA==
X-Forwarded-Encrypted: i=1; AJvYcCV38XQnYkxA7YnjoWomXHEELGIZybhKvnZUmT9TidTnUFXtlEOjR9c8D+CmOBTj5xj+bImzn2cd5U9CTw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWCUnO6T76BhTTn3dsifo/AZDhA908/J3ZEF16g8ctlUqFFXl6
	7W+eczQYFaxa7bxCqaJ39dmfgD51ZZiT4Xwh5POhEAyVcc3mrTpTrrcJsRiAKW4=
X-Gm-Gg: ASbGnctL3FyRL3ZiMFWkK0Nn6xZXbGD44Ckb0LewvgNrwl7ZGwopt3iVNZMnTsq1A8B
	5qcNJJITQUBi/TDskrxHJc9Qb1ImC1sf6cGMaeBZyynhwRzizaLIC9NjWTDp8uJFilgq3FWasCm
	YD2WsCnblQj1btS+u9gdWZtta7iBB8NvHy8D5RoB/4kxS1ppJbkhgviHJ+BJOlZDM3TzkhGMkt/
	4c9bfpzU68THEBDPzaenWV3FiBTlYmMJg3MwoO87vrd7VufaAl9VnsbYW9azc1c6JYEwDyMHFfg
	wHG0n/eBh80A6kUf45dT
X-Google-Smtp-Source: AGHT+IFC4ljA8wwltB0xasz6EULC7geM5Zzr5NP5AJCPgvbCO/ID+phFeBvn+sF9xJWIxqJ2VVxENQ==
X-Received: by 2002:a17:907:94c5:b0:aac:619:e914 with SMTP id a640c23a62f3a-ab7f33b480amr740579066b.16.1739436202934;
        Thu, 13 Feb 2025 00:43:22 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba569dd835sm54108966b.57.2025.02.13.00.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 00:43:22 -0800 (PST)
Date: Thu, 13 Feb 2025 09:43:19 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Philip Yang <yangp@amd.com>
Cc: Philip Yang <Philip.Yang@amd.com>, amd-gfx@lists.freedesktop.org, 
	Felix.Kuehling@amd.com, Alexander.Deucher@amd.com, christian.koenig@amd.com, 
	regressions@lists.linux.dev, Dieter Faulbaum <mail@faulbaum.in-berlin.de>
Subject: Re: [PATCH v2 4/9] drm/amdkfd: Validate user queue buffers
Message-ID: <qyjwmvbvhb2jcxwu5ubf4asghcovkfc2rfnrhdbbxa6dos5q23@k6b5ftwcefgs>
References: <20240718210558.26340-1-Philip.Yang@amd.com>
 <20240718210558.26340-5-Philip.Yang@amd.com>
 <zpzehsckjz2bee6w5bsnfpmkvtlxf6jywijz7iroausghoh43i@nxr644rwjsb3>
 <315e27ab-f1d1-a681-a32f-1fc28cd81193@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="76qq4sekzudox6xn"
Content-Disposition: inline
In-Reply-To: <315e27ab-f1d1-a681-a32f-1fc28cd81193@amd.com>


--76qq4sekzudox6xn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 4/9] drm/amdkfd: Validate user queue buffers
MIME-Version: 1.0

On Wed, Feb 12, 2025 at 06:02:15PM -0500, Philip Yang wrote:
> [html-content]

Are you aware that your mail is hard for some people (e.g. those like me
who read their mail in a terminal, but also consider people who have to
rely on braille readers) to read and also isn't properly archived on
lore.kernel.org[1]?

Would be great if you could tune the settings of your thunderbird
profile to send text replies. The in-kernel documentation[2] might help
here.

Best regards
Uwe

[1] https://lore.kernel.org/all/315e27ab-f1d1-a681-a32f-1fc28cd81193@amd.com/
[2] https://www.kernel.org/doc/html/v4.11/process/email-clients.html#thunderbird-gui

--76qq4sekzudox6xn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmetsKQACgkQj4D7WH0S
/k6Rsgf7BXpuAXhdwSjIKCfK4LG/paS+Dc554ox30FWJASPPEW3Z6nYd+onK5aRm
fjfL2BYUyFQ838cxeUV6RuRDHUp8pi04o7ljfUchJbxLOxNp2RO2klKgN4JtebBP
qW5bTzZpi+Y6rV6yyieEm4CuMwR5L1o+lMxVPf/mh3mUX9aEI8XYX02ewDu7pQNb
921o9tmJnTznQ5r65bEazwPf06jKj/73KKGYUhKXOAyw7COTxnH6MDvDglsjEabh
XKt4ChTLA0PnFhnHecvgX9TyV8gzrqoWIZ+4LBE6zaInVw7MrkTUSApD6F9koAJZ
PjqHqcwSUYNcMDYra01MKTzOfHOcfQ==
=2y3A
-----END PGP SIGNATURE-----

--76qq4sekzudox6xn--
