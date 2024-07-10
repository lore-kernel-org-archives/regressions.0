Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2902413C685
	for <regressions@lists.linux.dev>; Wed, 10 Jul 2024 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720651025; cv=none; b=BqnHdmlmW2Nf3AvGPPh0uxuAKS07kS2PfXwUS5FxJPqEg9I4kGLwdpR4ZkGJnITk0tah5G8zx1kh4Y3RQ8bXZwEmLUNA4x7+TDdgDUjb78kA0sqsfAteiQV5fSFLCPfd1NDaQvYWsIFuzThB/m4T3HPxeSdY1JPBBG+saBiOASo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720651025; c=relaxed/simple;
	bh=Mh4agDdeooCAoHATqh3qSK0sN6arK1o+ThR7veVesGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBvKOAHe1I7ODzTYqFvR4RJgbLteYXiIp2COoJCcppGFzvsApwDc3eaROx66DMphAMta7keR5D5Rh1EW5pSf2ysoKDNiUeCG/E3o3GEhvaGV4iU/bJN2ZiNKtGx8rDett0uCzu7A23EEPeVLfQpTU0md56ycYisIr6nAaRI1xwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7HDiPYw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7HDiPYw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-367940c57ddso87657f8f.3
        for <regressions@lists.linux.dev>; Wed, 10 Jul 2024 15:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720651022; x=1721255822; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh4agDdeooCAoHATqh3qSK0sN6arK1o+ThR7veVesGk=;
        b=k7HDiPYwEbio2YIBBdE1NGIl43jd2gYvuaqEQbkyN/9+I3anB4R2A8gcOuw84MZfh1
         RJwobQzyi9TMQiPEkX1XPf4Uj7Cp3g3q3bV9thfjdKeQeQn9vyrvxUfwVeZXjgPBoFuq
         VZhjcZL5UBN2CFjmlp9ESLmnpq5CA1Irxk9CC0IA2RHFFZe9KYuPZhViFQkD8VLjigAd
         oj9Vh1emhlvKLmNj+O5hfXtCuM/QNM0UPbj5wEMJDOK94RU8882bIdANROxLCGQFu1hb
         7AhlVexZj/FKVSZvxRwnqe528S++fB7J51WMQI/stZKXW2gCBGFCb7hfjnWUuZ80qMU1
         Cg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720651022; x=1721255822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mh4agDdeooCAoHATqh3qSK0sN6arK1o+ThR7veVesGk=;
        b=TufuU/vB3EMO7YxGzI4OD/A15sxj4KIWYRdLXmU8f1A0oxGwp3iQk8HqDcDkeKy+C5
         KLNFAPEJ3Nl+rb0BrCPEgxtLXiysOA1POASMFaquk5olxNXzprALhQ3bomUKpwxSWzRb
         JlasLt24TzX/NS85NuZCYpe1TwBnDhM77EN3IZrmRe3mH+lb6jbx1DFxRQcmcaeFABRd
         QOTaPA4dhpvP3O2nhwMV7tMRkHDfFWMCi0xtS7fbN5wLiOc+OPoV0rZBLZxdPDubCsPl
         cl0oxOYN0ob4WXlbZqVVmHfxuvHBP+dwQ2EOCnF5FGO7mdQXZDa7sP+2zPW7tvAgorQP
         dktg==
X-Forwarded-Encrypted: i=1; AJvYcCUMwsQ7yIZbHpsaRkZ3JxNZzyiSGoPkOYkWJz1OJnlg7kXmpw7DA+AalxQjIyWBmVTwVhx+RLDU2ltYQAt4yoxNDCErKyzRuZKFsFw=
X-Gm-Message-State: AOJu0Yz/Sw9XXMLTg/UEpNcxPqps28HcsNkvr48P1vlkG5ujlSV+uPQy
	/8cI/Uf3S9Rkrp5OkOavCJ3JFiTkfuZOoxYI9JT6xqrSxhp2j0ZARTrjSXTk0zM/xebbVDY6K91
	DqH3baMj4U9BfK015rka1P2zGmfA=
X-Google-Smtp-Source: AGHT+IHbJuGUuNrZDPlW5QYnChWirnIGrxjLC+wxO5RXDs67oAqLtD9SPYa2NXgI4RPSLPdrl9DBfGLKm1t2O/aWdi4=
X-Received: by 2002:adf:e40b:0:b0:366:e31a:500e with SMTP id
 ffacd0b85a97d-367ceadb1a4mr3745646f8f.63.1720651022216; Wed, 10 Jul 2024
 15:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAADnVQK_ftwe5Dxtc0bopeDg2ku=GrFYrMOUWHLnXaK1bqoXXA@mail.gmail.com>
 <20240710100521.15061-2-vbabka@suse.cz> <d4e5caad-7a5d-863d-bf65-63978ff9a865@nerdbynature.de>
In-Reply-To: <d4e5caad-7a5d-863d-bf65-63978ff9a865@nerdbynature.de>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 10 Jul 2024 15:36:50 -0700
Message-ID: <CAADnVQKbpxFcfYcEgmeuUsHwsBLdiLcZAjYA+=H3+D7bohG1Bw@mail.gmail.com>
Subject: Re: [PATCH for 6.10] bpf: fix order of args in call to bpf_map_kvcalloc
To: Christian Kujau <lists@nerdbynature.de>
Cc: Vlastimil Babka <vbabka@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eddy Z <eddyz87@gmail.com>, Hao Luo <haoluo@google.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, John Fastabend <john.fastabend@gmail.com>, 
	Jiri Olsa <jolsa@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	KP Singh <kpsingh@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Lorenzo Stoakes <lstoakes@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	=?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@intel.com>, 
	Linux Regressions <regressions@lists.linux.dev>, Stanislav Fomichev <sdf@google.com>, 
	Mohammad Shehar Yaar Tausif <sheharyaar48@gmail.com>, Song Liu <song@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Yonghong Song <yonghong.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 3:27=E2=80=AFAM Christian Kujau <lists@nerdbynature=
.de> wrote:
>
> On Wed, 10 Jul 2024, Vlastimil Babka wrote:
> > Fixes: 6ac99e8f23d4 ("bpf: Introduce bpf sk local storage")
>
> Thanks for not forgetting about this! If this matters, just tested this
> against today's mainline:
>
> Tested-by: Christian Kujau <lists@nerdbynature.de>

Thanks everyone. Applied to bpf tree.
