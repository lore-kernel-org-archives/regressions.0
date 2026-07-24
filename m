Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E038139A4A7
	for <regressions@lists.linux.dev>; Fri, 24 Jul 2026 06:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784876037; cv=pass; b=pfGdruG+BsA4x8z6ybt7h2EwOwuhmB/cOMxuwfclMtWeXPAZS1RfjXrab00h61cQK5s49+girsoVplFvuxy0wOyCGgnQp6c7BUul2FlO7jEz8WPPk+xo6ForxEtIsGJYNEXxi7LiG/iTCEC77N2YxqD2cZiMH7TZBSQ2qB74aMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784876037; c=relaxed/simple;
	bh=1qBivE5gHnpwRsnieTy4VVDr8iEogrx6wD8+ggW6J2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I089wtfdOE5ruB3WYL20yfDGRGynD7bJt6Fbv8vAp7KBActisQI6/OFzXSoDHAXFFpLIaoD4ma2wIHcv2O2c54lublaW9wOb+nBikkyhaWibatnAvCWJ6+7zo0cxDxM2e7xawXEzWhThraT+klhHHWIiTGzbRgA9fL/Tqx4d9nU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kq0yIyd+; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kq0yIyd+"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so71731a12.0
        for <regressions@lists.linux.dev>; Thu, 23 Jul 2026 23:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784876033; cv=none;
        d=google.com; s=arc-20260327;
        b=MhpdKDLX97QTCNDIQ9QlOmmZdPX2LVqtjFK4NoyYofStykg7AyhKfrYACBKtDJweOJ
         m1pR5cR9B+XIMgxfrq8EszR/+d/VzSeA21b701ACvnUFpu9v7w/f3HaT9qEtr+E5k9fk
         2MwGeWJjdnYXMReu9RF7L3avJ9xvv5yDG9jSEF+liyxdWPBHAfO1ilWVKH2fFoef40ys
         fUKT/CLd0GfRI1WDKh1F+ZOAWU8gM0fCLBBiMEZGJcO3nzMQrN29azt4tBAKQ1IEem9O
         asGg1+Lrr84jpXFlJFXGEhb/U9VBFROniV4+IA43b26HFwXP1b3Z7uwob7EJ2WCI9VC3
         jbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qBivE5gHnpwRsnieTy4VVDr8iEogrx6wD8+ggW6J2M=;
        fh=e6/uaBbfAYecK++b2dGrEFQXG/b8G/9BfZpYqao+o3A=;
        b=XDOZTmDJp3L8JSoJChzHGn09AuMSMiJYxtJnijfK1Nw80U7AiosDtxk8w9vooDY3DX
         aNvPeFNKn7aBshKj0xdT77XaWNtCslQqZymwdGjGbbTHXwZUpTsPU6WI8oD+hK35y3ii
         VWnOyI8JJSQ1/xNRn9wC+CDc3niQaCtbw/udFNeTWj8V7TZu74qpcVVQUWjwhO2koQAw
         oLmpW9yMxs3nKnOk1gxNfXUKmgUSHpkol9vEw/izFtXrg7znSlETRzEDLwLIz4sXopFs
         Ai4Z4lQOVTicWacM3OKyvQbSSmY+37sPTFXMAbjgysb+hWbyfAm232IUf6eUbkIrwKpe
         32Zw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784876033; x=1785480833; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qBivE5gHnpwRsnieTy4VVDr8iEogrx6wD8+ggW6J2M=;
        b=Kq0yIyd+hM4WENRZCINz/rMZAG41j4OhB3zI/5i/krbWFvvcPndcbFcJNysHPs6aXP
         GVXoOlkr7zn3m0c/PQ69151v20vYbOepELxl1in+FfUpNAWPTnYgSyQOWJeJQIR1OBpd
         m+9HKWT8RIs7WgE/B1fuP4c6wDfN0p2+Z46zRwx7S+shIKmq2eRzSbo5WB96kklHjmKi
         U/xr4yhc4JxbLach9boVn8hiAZ1ywPECDf6a8YSWMH/qCjyA+r20NN1H7Q5h9hh6sDTK
         xTH3Xr69XgLP/TQNfgSSJRW4CneMT8zcjFPHLsOc3vdoSdkXiFNw8Y/gu+KCsYHADE6G
         2fdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784876033; x=1785480833;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qBivE5gHnpwRsnieTy4VVDr8iEogrx6wD8+ggW6J2M=;
        b=qukl+G3KMrXrQOAbJmjCHRw+2PGnZ69eCdEcP5cclByBIcq0T5H69GyKbc+lDVhak1
         AmjsIhpuwUsROocjYe2nlj4mt5ofOXI4XlkDwC3RVaw6LHa8y2vd2iW27C2VNMxl77cP
         LZ1EN06zzJW9rea3XcUF/7ZDZd3sx95RSDgBkbB3XAIQVj3VIdKj49l6b+IJS7kgH8s+
         CUL/XNt80/58E2qANG+PMlRkF2Yhs5PfjbJ39a9Hv3xTmq8O6CHJh6iumilMJLq+4XhL
         nHUPCU0DPtBQItLmEMdEC9gnLsxufbvuQUmuRjGoGDRTX9OSnT89GqV/Se99+Mr3q9Ar
         DYOA==
X-Forwarded-Encrypted: i=1; AHgh+RoAmcK4HpSMTF00OKMTKcq5A1URPeq6H0g5aeiGwbBOk9CJqXMHOJMlYgLXyZbh9jYFb8cixqS2Gmh7TA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZsieTjSRVVOcoC32tOl0woLgCruqK5R16D25iq1F8AtANL1UR
	3rxZT1UnGNec0BuoIwMDpYU6nQJQzaKx453NL97Ynrs+zt8pznSH2H3tvCUssD8CpM5aTxihYft
	W7RqTSOwEWyzwxhvUmYnEO2g8ccFZlUg=
X-Gm-Gg: AR+sD12p8E2EKn0/X3NAQWntaDmc59FS2mj+jV6FkCOpq264y0MK6IU/B7DYU0Q+Hq4
	GmXugRfHMgJF2uTEsEzoDVeVzvXEL3hRw00cud/zCYXICGNJnutZrPcYW2Mv4trGiSQo5F6tqDN
	SCJU6+guuk3Po5R4J/SSFanwClXFxC3yZ+RWcgCEYM3VOKMhT3Kvxm9C/Lq2f7cx7hcDXSUJX7c
	Bd+191jJFiIxlq0auCgO/LnisXsbtLH1piF17G2OiYblzlImNxCDrFn14TSWn/277TBHl67AlM=
X-Received: by 2002:a05:6a20:6a1d:b0:398:76d4:c7e9 with SMTP id
 adf61e73a8af0-3c44ccfad68mr6602250637.35.1784876033443; Thu, 23 Jul 2026
 23:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGKGUvm6sC9ay98zsYJS1xwB9+qUwverqAsAAwpVOpmqFpEy5A@mail.gmail.com>
 <2026072436-carload-untaken-585d@gregkh>
In-Reply-To: <2026072436-carload-untaken-585d@gregkh>
From: Min-gyu Kim <gimm78064@gmail.com>
Date: Fri, 24 Jul 2026 15:53:41 +0900
X-Gm-Features: AUfX_my_818fZNEZbBLLr1Xn5hBLUxeeu8JcRW55Az57jmjGZCViGOAZ8x97MLQ
Message-ID: <CAGKGUvk6sOo4kMV0z20Vaq-eAAJn2t79Hgfhuc_sYLoC+rvqTw@mail.gmail.com>
Subject: Re: [REGRESSION][SECURITY] bpf, s390: verifier/JIT mismatch allows
 unprivileged kernel memory access
To: Greg KH <greg@kroah.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, bpf@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg, Eduard,

Thank you.

Eduard has reproduced the issue and is already working on a fix that extend=
s
compute_live_registers() to track upper 32-bit subregister liveness and rem=
oves
the dependency on reg->subreg_def.

Once the patch is posted, I can test it against my reproducer in
the s390x QEMU environment, run the relevant BPF selftests, and report the
results. I can also help prepare or test the regression test if that would =
be
useful.

I can additionally test older kernels to help determine whether the issue i=
s
triggerable before v6.18, as Eduard suggested.

Best regards,
Min-gyu Kim

2026=EB=85=84 7=EC=9B=94 24=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 3:37, G=
reg KH <greg@kroah.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, Jul 23, 2026 at 04:55:12PM +0900, Min-gyu Kim wrote:
> > I have not yet tested a patch.
>
> As you have a reproducer, please create a proposed patch that solves the
> issue for you for us to work off of, as our security documentation asks
> for.
>
> Also, as you cc:ed public mailing lists, there's no need to get
> security@kernel.org involved here.
>
> thanks,
>
> greg k-h
