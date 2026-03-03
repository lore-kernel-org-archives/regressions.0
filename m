Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DAB38643B
	for <regressions@lists.linux.dev>; Tue,  3 Mar 2026 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772521258; cv=none; b=Hojy8FqUTl1qrhx0BJj+Cub41K1QSot8eZBkpGHBoz13BIHTfRMA+eTCmCMBtqi2hCngmA8NCOOek6aULO1F/LtqYlX+4JtNFV2cwQ8eL6Lv6cEUaooQ2s8uJqP+NP9Zp+6NfRL3LafnGqcLMJrzzOvAUIYrvoGxxMJNXOMU7Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772521258; c=relaxed/simple;
	bh=b9rnqGy35VMSCkesVvriXCdG6dEJtwn33l1f7OgUDJ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vx+WP8VAx5hVInISB3MDXgAK7xQn0zQ65Vr5oIFXKCEQtnrFBI11nUisy9S5q9aqtSprKnjVCPUql1REflN5EQwQUGxWK8qWGE5I1hcDZTEpTjRxc4zJJ53X3OFIHNExMY0Q4JeVi84bQsN5CN97RVNAtkGlEQObrmia8A27y7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kY6r6YNz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kY6r6YNz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso44581125e9.1
        for <regressions@lists.linux.dev>; Mon, 02 Mar 2026 23:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772521256; x=1773126056; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8WrPNsxFmfZpCyYuZIoQyAgYSLblE5qZkSbhBEShgVI=;
        b=kY6r6YNzL62i9YJOx3kwfYqkck92GMRveq1+KO0TsVDhqiNdG/c4r4F7j1Q983YzpA
         oKfJS3hBQ+UBTjUKmEZ9GoMP/Bc2M/F68wNlG10RmwOZFi9GBvP4Wp9R1CGbSNwkJTWz
         Z1+DmbkO7BbSEBWZsRohnjGA7mXcGfqUZSK3QM7tkTaZJi/J3Lfx6sA16S6TJf7meFQ6
         CYl8XYNzCd1fSS6zfNRVnCOYY3hQ7xYisuq3IgCEcKVDvNqjsMVHrjnUfXGXSYWcFD/D
         SouKMcoyl2LUdX172YzpnB9IrUJQ/5emMVK8bdyei2uXHoYgcqTBeE7hWQUNNAb0OTuv
         leCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772521256; x=1773126056;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WrPNsxFmfZpCyYuZIoQyAgYSLblE5qZkSbhBEShgVI=;
        b=mbdkw287khrAELbmkO0BKUxopdZoJC0Wb43j1500oFec31c2N/H9o+AkhXIlE84zmu
         3Jz7T8IwIqXGbLi7eV13jSxkpcq8taI4iuyC5BXBRqbeztfZkl8wgvgsNms3ODtxVBat
         xScUncUCPppr9p2BoW+Q7PXai3nKlMteLdeYEQ5P5EYB41mBsbPEm4g4n5LyPGduKtxP
         KoW6dxmG4n7dlecDukgoYMyCOb/DchdK1OfRcmMykQ7Yb7sIaCoGS0MgY1RHxN6MChu5
         CuucHRqkbCv6sIANsB//JHbAiV7ESNzfxxj1F8NmOYK8big1TkKN2E0qKYHM3+edWwcq
         n5rg==
X-Forwarded-Encrypted: i=1; AJvYcCUVNd/o5+H4+wyQJRzdpu2Cbtx6ntZPKbxakDbbdx9dmSYE9aCtB8v+2IFhgoBBQfILGb+EH7JD1RKsfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz96keSLK6x8oeXus5I1wnhVuwyVkhMOBP4kDZtvNbrvL5IVpiD
	ZHAqTglmpqPtnF6w9eQOhX6tWAIP1Bq48Mc7EvfulxPlbde7rg90HU3vaubRITfk0S6RLw==
X-Gm-Gg: ATEYQzyA/QBtHl5ZmGQH9h1yVhosF3VieVzi9kw91CJCDYiT5V7LS4+CePqFSHQ3eiU
	+20U8zYRUBernjAhZrg/aPBkD9ULp9StA67QN8jPFnJiFj9CAC2WvIfuMBlI1Us/cWkUZQVGTB5
	WC6MOPCfSd4lG7/hNYZofY3EhMeJpsX567gH8fHdvINW3Wkdjdeu+/oOVSBVYlQIFaZ1D9SGn2x
	Lnjd/rm0+P7j2BYoigMuU5NirX3Yb8ogUwls8j1miZdGG4dw7Qd1RhwX8uQr0GHkcG79LKREn1g
	ozgJV1QUnR1fnqh85D5yde7Py3QvYn3LO2/WcfberfXHiUt+dI6JJz3gPrLwkff8ezkoKQaU+nf
	Sj/kGBCjuNxMWQ8b7zH+aW3FINgE5mo9uXCPEbYdymu+RmbCkVHJoCcFuEX4BLuIfnnZ0Lm3SYM
	+/5rxYg/nIBK225Z6SHKopW+Um1RNCvI2JqZBMoKyg
X-Received: by 2002:a05:600c:4592:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-483c9bad6femr255088915e9.12.1772521255334;
        Mon, 02 Mar 2026 23:00:55 -0800 (PST)
Received: from holly.home.arpa ([2a03:ab00:1000:1b60:331a:b316:78f6:effc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4a121sm321462435e9.8.2026.03.02.23.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 23:00:54 -0800 (PST)
Message-ID: <9d110d860c0c7e110d018ea53a7666eba275da20.camel@gmail.com>
Subject: Re: [REGRESSION] 6.19.4 stable netfilter / nftables [resolved]
From: Jindrich Makovicka <makovick@gmail.com>
To: Genes Lists <lists@sapience.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	linux-kernel@vger.kernel.org, coreteam@netfilter.org, 
	netfilter-devel@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, 
	stable@vger.kernel.org, regressions@lists.linux.dev, "Kris Karas (Bug
 Reporting)" <bugs-a21@moonlit-rail.com>
Date: Tue, 03 Mar 2026 08:00:54 +0100
In-Reply-To: <b231fcdb6c66a7b24dcef3ee5c35c5f612d5c1a7.camel@sapience.com>
References: <a529a6a9a2755d45765f20b58c5c11e2f790eacb.camel@sapience.com>
		 <45f03b0b-fe8f-4942-bad1-3fbde03d4be1@leemhuis.info>
		 <143e1a402ad78dd7076516a6ceb637f378310b16.camel@sapience.com>
		 <10537f2b74da2b8a5cb8dc939f723291db39ff84.camel@sapience.com>
		 <2026022755-quail-graveyard-93e8@gregkh>
	 <b231fcdb6c66a7b24dcef3ee5c35c5f612d5c1a7.camel@sapience.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-02-27 at 08:39 -0500, Genes Lists wrote:
> On Fri, 2026-02-27 at 05:17 -0800, Greg KH wrote:
> > On Fri, Feb 27, 2026 at 08:12:59AM -0500, Genes Lists wrote:
> > > On Fri, 2026-02-27 at 07:23 -0500, Genes Lists wrote:
> > > > On Fri, 2026-02-27 at 09:00 +0100, Thorsten Leemhuis wrote:
> > > > > Lo!
> > > > >=20
> > > >=20
> > > > Repeating the nft error message here for simplicity:
> > > >=20
> > > > =C2=A0Linux version 7.0.0-rc1-custom-1-00124-g3f4a08e64442 ...
> > > > =C2=A0 ...
> > > > =C2=A0 In file included from /etc/nftables.conf:134:2-44:
> > > > =C2=A0 ./etc/nftables.d/set_filter.conf:1746:7-21: Error:
> > > > =C2=A0 Could not process rule: File exists
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xx.xxx.xxx.x/23,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^
> > > >=20
> > >=20
> > > Resolved by updating userspace.
> > >=20
> > > I can reproduce this error on non-production machine and found
> > > this
> > > error is resolved by re-bulding updated nftables, libmnl and
> > > libnftnl:
> > >=20
> > > With these versions nft rules now load without error:
> > >=20
> > > =C2=A0- nftables commit de904e22faa2e450d0d4802e1d9bc22013044f93
> > > =C2=A0- libmnl=C2=A0=C2=A0 commit 54dea548d796653534645c6e3c8577eaf7d=
77411
> > > =C2=A0- libnftnl commit 5c5a8385dc974ea7887119963022ae988e2a16cc
> > >=20
> > > All were compiled on machine running 6.19.4.
> >=20
> > Odd, that shouldn't be an issue, as why would the kernel version
> > you
> > build this on matter?
> >=20
> > What about trying commit f175b46d9134 ("netfilter: nf_tables: add
> > .abort_skip_removal flag for set types")?
> >=20
> > thanks,
> >=20
> > greg k-h
>=20
> - all were rebuilt from git head=C2=A0
> =C2=A0 Have not had time to explore what specific change(s)
> =C2=A0 triggered the issue yet.
>=20
> - commit f175b46d9134
> =C2=A0 I can reproduce on non-production machine - will check this and
> report back.

I had a similar problem, solved by reverting the commit below. It fails
only with a longer set. My wild guess is a closed interval with start
address at the  end of a chunk and end address at the beginning of the
next one gets misidentified as an open interval.

commit 12b1681793e9b7552495290785a3570c539f409d
Author: Pablo Neira Ayuso <pablo@netfilter.org>
Date:   Fri Feb 6 13:33:46 2026 +0100

    netfilter: nft_set_rbtree: validate open interval overlap

Example set definition is here:

https://bugzilla.kernel.org/show_bug.cgi?id=3D221158

Using nft from Debian unstable

$ ./nft --version
nftables v1.1.6 (Commodore Bullmoose #7)

Regards,
--=20
Jindrich Makovicka
