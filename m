Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E362931EE
	for <regressions@lists.linux.dev>; Fri, 24 Jul 2026 01:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784855018; cv=none; b=qAV1e0vbE7xbcQbEYQ9caH8RmpyuWb21u99kV4gEt4osaG86JWsSq5637mxXIYpPhQtJuFXLUqtD2rkwGbutSKaUBTOqxf4WinmFShQxDWv0RYjAojtBZ1MaaSzGMozYDIY9lJHZR+3WaCsMBS8/EkM+V+BVaEeTH//hTHnK4bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784855018; c=relaxed/simple;
	bh=EYtGon2mOKRyQA+SWDxFLaacgRtfy4ZbfR/vRYaeE9U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rSj6srnsNPCalZnNSJUTJHgvI16JhG7f3W/4LTKiKgA4IvqJEeOv8HnTs3bydA6v+lH+DWJjPwqmpJ6KzfP3iuJ1b5kwGYTataZkvCMnKUpW8ShJFErF/FOgG9G57iLwp8EqitWNJj3MOCzaO1TvePRYNfncZ5+g+J7e38qiBfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhNEGgCb; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhNEGgCb"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so1429298b3a.2
        for <regressions@lists.linux.dev>; Thu, 23 Jul 2026 18:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784855017; x=1785459817; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EYtGon2mOKRyQA+SWDxFLaacgRtfy4ZbfR/vRYaeE9U=;
        b=DhNEGgCbTMNb4WZyjIcp7SkN/4pmnt2cB+yUtjA3tqBaJD+a1eVIGO16ES4FdR2MHG
         SltFUY5C4h1VTwbVyNJJ1FeAgRHuiV2P8mRc9xmFG02gR+D6WSGtN8Jq4Ke3iPJ4WWcY
         n+rp6EXZStim3lthXPTZGPZkmaOImM/Dz5w2iWdD6GzzHo10kYFzTriWREMzY5Od//RI
         Et3d1voggLk0xnYarzKRD5xuwvTLgsg6fXwoqJGQHZ85xEJbbTMwKi1IjxHLNMqJqHDo
         a1VR7UA5US0/ipl353EZyTriHs6qgvpKjErEvKvIZ7Y5kIvWThkYc/y5zvXVFyO8Cnnp
         VTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784855017; x=1785459817;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYtGon2mOKRyQA+SWDxFLaacgRtfy4ZbfR/vRYaeE9U=;
        b=NxoFl5PVQ+WhxxoKex/5Ylf9XBR+mRraGXCx7ZPK2OvhldHy4gb3zYvyjdB0APvk4q
         FlnY01LfeFAF86O7C7g6Je+/uSYRMOILEgXXjd6zmOTeXhp/EEbG2daCWs5jeBkD6wWf
         UIBsx+UYlI4RSJUc+me8DwECdNkiFJVYFvAXlJzF5GEeIyuAHAD7nD/GJxD/+MIxdS/e
         1DqbZOSpSJ3xyMd2663ZDv9pIeEmRkJzD0pkutBvbbTZIchninDagonVvK5GByky4Oiz
         wEYxkSyb8MKcpE6HpyH62rLPQFrZbiGfAdTCfUPCAKa22aiLmNyU/Oe6vBgyCwDYlJul
         55aw==
X-Forwarded-Encrypted: i=1; AHgh+RruV1wP81quZ+BcC9NK3LBTxRdAeG2f/AffPOh2vOOu7eW2FBLZ7RCPQr/M68kEU63khkrx8it1HGIoCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrOOo2m6fLFmhLjsrzBrAAjCRPlc7JrajeQooBOqnv5hscYRIx
	sp+fDmuJ6kFNuWLysdT9m7Vtdh25nvSIq8rWpXMpnqZRRgn7tgNkexr5
X-Gm-Gg: AR+sD13qtB81NRxieCos043LlmmGrvab3gq/ZkWBFkNRDHl4np0ASH7Kxrk52PeH4Uw
	AdCMoWnjF8PFAhgEUT7YxYLm7xewJ34nepsx8FxGsmiW5XjRO3XUsv8AYSHmrfU2XUpNAIDZ3DD
	EteBNeY2kH6SoIK4oLEvZp29mTE7WgwArFWuIAPqN5hEAVk5JUBYGkWoPyH5ToaRHrWUNMG/Oul
	ArhtVP8cgmvBr0456AMgQlemNOjK4DMJ8NTO0oDc9OpJ5AYgudrRslSLa0w9vjV0Oe735Yn51Ys
	LkxRE3mCQQ7vshpaSLU3bqnvlvrZJv10uMPNLLBO0RsiLtYdlB4BBReIDEDJJALkWpKgy07Dmb4
	kauB/vfkFVhTD9lcTRTo6elpVRgY4xkWEB7J+OcM2XlQ0f+tlkVD4bWlQhA5PZF61EJZRsTD9FJ
	sONT59BT/ZhfGN5PZleRoo9CqXtQjoMSbnsLaQcfxKH7Rdmr0t8PDWKxMWsLI=
X-Received: by 2002:a05:6a21:2d46:b0:3c3:83e8:c211 with SMTP id adf61e73a8af0-3c44b25397fmr6112121637.63.1784855016691;
        Thu, 23 Jul 2026 18:03:36 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:c221:d012:6e37:77f9? ([2620:10d:c090:500::2:8dac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9f2f0sm25307955eec.13.2026.07.23.18.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:03:36 -0700 (PDT)
Message-ID: <4fc7fef5d38839b5f01e80b05de908d95af8f3c8.camel@gmail.com>
Subject: Re: [RESEND][REGRESSION][SECURITY] bpf, s390: verifier/JIT mismatch
 allows unprivileged kernel memory access
From: Eduard Zingerman <eddyz87@gmail.com>
To: Min-gyu Kim <gimm78064@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Heiko Carstens	 <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>
Cc: bpf@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 security@kernel.org
Date: Thu, 23 Jul 2026 18:03:34 -0700
In-Reply-To: <71f6059ecc89d0b16f8542d73ad8b183a2a4db92.camel@gmail.com>
References: 
	<CAGKGUv=sOuqQtA1Ub-5JXfA4FPosJFYKAQE4B79cK+P1erxqtg@mail.gmail.com>
	 <71f6059ecc89d0b16f8542d73ad8b183a2a4db92.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2026-07-23 at 02:05 -0700, Eduard Zingerman wrote:
> On Thu, 2026-07-23 at 17:16 +0900, Min-gyu Kim wrote:
>=20
> ...
>=20
> > Root cause
> >=20
> > The verifier records an ALU32 definition in subreg_def. A later 64-bit =
read
> > causes mark_insn_zext() to mark that instruction for explicit zero exte=
nsion.
> > Before 107e16979905, a cache hit in is_state_visited() propagated the 6=
4-bit
> > read to the alternate path's ALU32 definition.
>=20
> Hi Min-gyu,
>=20
> Thank you for the report.
>=20
> > Commit 107e16979905 removed that propagation when register-chain livene=
ss was
> > replaced with static liveness. The static live-register mask does not t=
rack
> > read width or path-specific subreg_def information. In current states.c=
,
> > regs_exact() compares only fields before id, while subreg_def follows i=
d in
> > struct bpf_reg_state.
>=20
> Hm, the stack is tracked with 32-bit granularity and it should be easy
> to adjust compute_live_registers() to track the width. I'll give it a try=
.

I figured out the repro and am working on the fix.
The plan is to extend compute_live_registers() to statically infer
which upper 32-bit subregisters are alive and use this information
to fixup zero extensions, and drop the reg->subreg_def altogether.

...
