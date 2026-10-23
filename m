Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792759840;
	b=XV2swwZjMU52u1jm3QiPVJESvHnpWlwRs5HdhCMtFnk4oi0Pgk3JBUsrKo4wsSy0i7d9
	 qxJcpYW3njnrXsJsHe79ZCD5pp8NnsCnBjRTrA9/sBDO+zyOSs2+9r+jcG93nycdPk045
	 bI1VtBEN4u0Ka+zoY/dDP4EcGMe9u9Q6Eb/J5IIcDp+tG5l1lwnMOdCuyXTCr5SqrI1Zs
	 Yt2kR/ZwUyrAi/yf1KgTIh68XFEfpByIbuUXsMKXl/QIYeF8777NB7q7LIfgJe+We4FX3
	 EdZFY+rtdMLAMR+sEwgWitjr1Tvum9C3aYm74n0NBcDY6piowB4NdPDigx5xMz7HjVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759840;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Mg+WfWQxC3P6qmiOqOVEseCpuAHnl8nyDeZIWySuY74=;
	b=Jhi2N3T+Hj57QktMA0NIIy7b4C0+KPHgsrGgxVgS7csJRe7ssAevoICCaaxOrBhShBgc
	 0QknV9WadUImZhi7a/w2HnlAXVpWH0DVAvDLT9iGC2YCWpENY58IwHBi+NgTx3ZvQyNZR
	 F13fNooPsMSyYBTFsKnUxxKAiYTblucpsBQmyrRVorfbQ0OuAb2pzGa3clrtjlJ2mrCR6
	 1uI8OrwdSNeRqGYzcxTjCqYaW/bKZvvzetXgNhW+qzfh1aOgAY2sp5YQSAH14vUamwdqV
	 WH6wgQh29eMMGj7jGz05ETrbsLD1ahEP7AK/itvqlpt+pjOg9bsmjjFklPumdl/MUXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=dkjDrj5n;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wFBoZAla;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6B8606A322
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 12:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA6B8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=dkjDrj5n;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wFBoZAla
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 487571D0014F
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 08:50:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 23 Oct 2026 08:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1792759838; x=1792846238; bh=Mg+WfWQxC3
	P6qmiOqOVEseCpuAHnl8nyDeZIWySuY74=; b=dkjDrj5nqXFh6E7pw9/ora8fSh
	DqhN5eF9qveCyBa0hNsU/5TS73cD50Jnokpe0RLjKNtrxQZFDuii0bWKhxQ2RZwu
	r9pU/SLT/r9FITfVJ/le3D6KtAwvoHgo4nh0CYxJkNBCbBbqNmjTIzC4OGdRkKDL
	zYYqu+GSzXDS1zuboIVSSpyYYNzvpfxJfYqkIBaoBueVXNZ9C+KkAoeaNMQvGz0M
	Gj1zhiw7B3V0Q3j1NRUdK+qy7FLLMRpFqyRsW/SNKdMBWPC/Tp8C1OvEYBCs/7FP
	4TioXwWQc7YIS9S0RvROy8rdzvRXoLs0E4gefCIej4rOhIoCtYnIkxnHe6VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792759838; x=1792846238; bh=Mg+WfWQxC3P6qmiOqOVEseCpuAHnl8nyDeZ
	IWySuY74=; b=wFBoZAlaaToNk+twrlvepttujUKeNPxOyqsoAYvFImdY6HPLySz
	hjEGhKeIMyAFlbI6AtmbDe6htH2seCS4ASu9d+7OJ56PrkPNtO9EJz3YJEgab8cB
	18wd6Vw02TX0pINc4FQQXCNAb17pJMotzSdIyo/DzbHiRQ7gZTpR9CLRGtX3BqXh
	ognpCXe+HOSG8SFc5EloOdzTBarvQKDlhX93LI2d4ojr4DhwnkKwywbngU4R+cHr
	ML9CcAI+wfrJG7BuyeZrT4FEEkj52/bdXHboA5SWgqFZ6UVqf4DoKrncDwEYu40T
	d9mmwInK1vbhjcuMGn1k9HE4pXIOx0gVN/Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792759838; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PHJlZ3Jlc3Npb25zQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:gccDDsQbOaIGmpLvCpGtweKpAyxirFLX1Kq5xMSoDlqCEdA
	n9dAWPu+2iny1uUb6RP1UxUDj8duHPultG7ih92dihi4DilDKKSt3sLbzgFdUUxt
	Z8Xu6zYfyiWJuIKbmny7DTurU78M8vCzThlTTmmCt1HcLjuXESSmxxZ+XDdnv0Ns
	AGgN9KBi0LDuCtQy4TMxAajd5UaZzxutfLh+2sxOqq/HMEZRRdUsldJaA9XkRJHt
	6w+kBSuxQ+iFMI3hjbU0nHE8O0vX8d7kOPBYq+Hh8/o9wn5h8DkXhR/gtlbp3/PF
	7krI70sIu7QGgkPt0tpA4QdkZZOl3aD8YsuUSJw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:N3Nk+7FQd+lBJg++i1EpNdmiDJRJy4qcTwjxDPN1J+A=:ipwzzHjBT5M/myEZnD8qNFj0WOxSydDev/u6sVP8buc=;
X-ME-Sender: <xms:Hljbapo4fYkAxbi7o1zF2IMtIcMTS7RjHdTiNQH0E2OG_KIYiv5OgA>
    <xme:HljbaoXBzdLX_UbUvPScJX_uBd8e0faQVIziXX3HHjYv6A3Dh1cIi4fNQwC4HoIH7
    9XUo765Wp5CChmuaVo63vB4VfvOf8Pwrh_CfCT2YqseMXkaPhw>
X-ME-Received: <xmr:HljbaqHGAtQlovp7FyqeFve5cfGMZQV5DVhlkwz2mzwAQMkCSfguIhA1pAaugQ>
X-ME-Proxy-Cause: dmFkZTGHCgoe/65dzJcn9v7kUqHotx0TXzvWX3NyhFo3t9TokUCxgTUa/4pyfSWI8vGfzn
    f4RWdTUE5ZjmRO4fisu5GDFroie350rJJDuGZtQKgqcTZpRl6ZtMgfXaEwa/KMwVeYnOGQ
    L45m0uVzbPvHXKoC48T5pdS8RGQ/oh7ru28XXYDJud76DV438EY2pEU4EaMyA8dim5Jyih
    5ac9LEI+fTuVIY8OIjO4m5KtiP3Cc1Pyd4Lmy+ozNnzyo5rfrBJb+jGwcW/I4xo6hFMe3l
    iLM/gTRr/u3MYPKp1W4BLiuY3RK3EhaEeXFK6Kvd6amTXJ1tN6h0QrXnbWGDWJIy16E8rl
    XTf/ck40bKdPD7FDNSAqsd9xcxGKM+l3i4nZdcQhissAMnAn75WfdP8iXGrV21WIe8Y4kI
    NTtyNrCG+KEWPLKVJE1t13rxicYmcxjSXV2VkCRajv5r7WzvQ4G8ZImoTU4CoTVd272NDL
    iVHAWICiFZFO6K5FIV00PancdeUizeVdhvwMgr6PVhXbydfHw3zNkxT05w2GpvSolqvIwF
    pTKyBTUklKmRHuU6Hb+8dwHau7JnoYD5kGmQw4gxgvjCZBr47G3xydosf4h0lIxCHLvnGo
    frs3MsDj10JzVMxuXXFfkxi6Snac81v+L7/Y5qOus5BJJKg4BbBeuB1lRsnA
X-ME-Proxy: <xmx:HljbavAr1Rs84CBNU9gtpakz4ggO3hrlvasMMz_pvKR2d6eK4zMDWQ>
    <xmx:Hljbasyi9Mf3bqX3Kc3jHirqra0V9SmNPBnm7LdZVilxFWc2-28u1g>
    <xmx:Hljbalfg_BndeT6Fz68mdszrx8nM_F08vSstIyHJ-mdSSlt4aRU-YA>
    <xmx:Hljbahs32KObaG3KU-5F3tOY7JsuaYF3bulZgWQfTKjLXsXyxPen6Q>
    <xmx:HljbaiZwdLTSvapq5O2wmNUKYBsKeSrLAFG9R5JUi63fMne4f2AFiwbT>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Oct 2026 08:50:37 -0400 (EDT)
Date: Fri, 23 Oct 2026 14:49:51 +0200
From: Greg KH <greg@kroah.com>
To: Connor Stevens <ooglie05@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
	rf@opensource.cirrus.com, broonie@kernel.org, sashal@kernel.org
Subject: Re: [REGRESSION 7.2.11] ASoC: sdw_utils: cs35l56-ot25 DAI not
 registered, no sound card
Message-ID: <2026102339-control-obsolete-df82@gregkh>
References: <CAF50T1myMs2LSPUsTAPKyJutxzqQihyxbY3=iVGpxenRbnXxKQ@mail.gmail.com>
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
In-Reply-To: <CAF50T1myMs2LSPUsTAPKyJutxzqQihyxbY3=iVGpxenRbnXxKQ@mail.gmail.com>

On Sun, Oct 18, 2026 at 11:41:55PM +0100, Connor Stevens wrote:
> Hi,
> 
> Since 7.2.11 the sound card is missing on a Dell XPS 14 DA14260 (Panther
> Lake, subsystem 1028:0db9, CS35L57 amps on SoundWire):
> 
>   sof_sdw sof_sdw: ASoC: CODEC DAI cs35l56-ot25 not registered
> 
> Fedora 7.2.9-200.fc44 works. 7.2.11-200.fc44 is broken. I did not test
> 7.2.10.
> 
> 7.2.11 has bf7a3ce1d563 ("ASoC: sdw_utils: Switch CS35L56/57/62/63 to use
> OT25 DAI"), but not the upstream commit before it, 86c8360c97f6
> ("ASoC: cs35l56: Add DAI for SDCA OT25 stream"), which adds that DAI.

Should now be fixed in 7.2.12, right?

thanks,

greg k-h
