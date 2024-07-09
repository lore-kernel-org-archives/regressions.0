Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CBB17B044
	for <regressions@lists.linux.dev>; Tue,  9 Jul 2024 18:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720548733; cv=none; b=Tm8okdobl/fRKvTdXARIRcI6LX/D/hsZOMKZVkfE815pdI6XkXEwf31MGEOxRmAJYjKDtMxZQYxgcSY7c4MWm+KzaFiKW3YVJu5vWdkuGoKi29r/7tcXFWr0Bj9ANkcfg5D6ATY/tMMv2DOHX7wcoujtYdZTlCwQafzy5O/SBUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720548733; c=relaxed/simple;
	bh=158cZUlmlIr5dPwD52dAc3U5dHPzagtOg3XpKlSlH+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUsjJEne7nyp+pNXMpI5tH/D3HC8Wr/TYkugy0kFxA/SHdkiW37cIQjOioNz9OHyR4z5MjANWBBKVIWMJ8GZqlsuvyAXvS69vfKYxMUS6dudWhqoVKLIP0BYvs6ZrI/llMbvr9eZU25LtrEN+T7D9c1iK4fuS9qlNJcUyL5YFNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyeZCG0T; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyeZCG0T"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3679df4cb4cso14225f8f.0
        for <regressions@lists.linux.dev>; Tue, 09 Jul 2024 11:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720548730; x=1721153530; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=158cZUlmlIr5dPwD52dAc3U5dHPzagtOg3XpKlSlH+E=;
        b=EyeZCG0TMIUDxeR+SbntKTHq41bjbPu9JhuV7RrBNHfFbwzpPJq30ttKoAzw2aFM7d
         wXKvbJJfdvzLSiNsPyzft6ormuNb7m1UUe5FDlE/VtodKrv2rTnJtx0uXINOpPWQFjef
         LUA1h0VJw7Uofe0IaZmXhYZIy1wOrTGlHAx98z+T5i98ETU3RtqRf/tZjS29ZeObtZNN
         NYbswPLQIPB2Zr733d0STllXxlrkPN6z4VaMOpSpnj+EFhsbzH3UNesTxWQjoRBlNk1t
         6uFGu8uOaZTc40WRZLd3aHB+UrWdiVw2LFDIs12YvQOI+isrO/+uIqQSdhgv8pxGqig1
         dYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720548730; x=1721153530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=158cZUlmlIr5dPwD52dAc3U5dHPzagtOg3XpKlSlH+E=;
        b=DCjXGY9PA5JWbx9Q22+sMrKrhGHXvBpECke9v/9PMZOT5g22asSCLt8iiDPFDO/0Tx
         pDIJh1uy7WLGUWnrzqucflOfTEK6B1AJuAfSwv0YySWG89pMh0SI9NY/eZbPST7hQ3Mi
         IUbwS/BHjvOvE6qsycab6e4R9yVMSmtbxXb+TYItPPZzxcT5EDuJCJqWOGUPBRsurShW
         BUGihMNu8CQQP117oOkiK4hJCqyCtSLa1lgjK0E8dfDifZzN+kfgitNQIF7GWG6MvG+3
         cBfkSIwFAMLKhQH6LR1EAzwZhJAswiHglviVvu+XDzTBzED074M8DAUkMaZ4HD1LixIg
         8DAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9U1HRh5ZeME21Hkuad9MkqoNz+sEek9m7J38Hz288wSbyBNjEYWobukoexzbHNScs99NeYD8NaIpZRS47x/sBYsVvrczGaM+pNVg=
X-Gm-Message-State: AOJu0YzStY7oSqgwFWdohrEu5Bhj8uI2JnA9JdHD1XkNiPKtErUAMK80
	ehoxrdMp/l8cOdo/+eRLOOiqSZDKNn+H9dfv4lltnPYvRgaQ5c5Omb45MXJloTD1tlHUpdkKRqj
	gHGXg3GH2OdDsNitHJkg8r9vgfQM=
X-Google-Smtp-Source: AGHT+IGLVg2FRz2+w0XtmmxlRun9h4Ybp36gLJSCBUdlGaA1HiqJFnHDxXBSojzDhlUcoRgkZOmBeHW91MU0DR6KcDU=
X-Received: by 2002:a5d:4490:0:b0:366:e308:f9a1 with SMTP id
 ffacd0b85a97d-367d2d51899mr3022882f8f.23.1720548730208; Tue, 09 Jul 2024
 11:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240612-master-v1-1-a95f24339dab@gmail.com> <CAADnVQJLgo4zF5SVf-P5U_nOaiFW--mCe-zY6_Dec98z_QE24A@mail.gmail.com>
 <270804d4-b751-4ac9-99b2-80e364288c37@leemhuis.info> <2c9089c9-4314-4e4a-a7e2-2dd09716962f@suse.cz>
 <CAJuCfpFsKsA3vTZCPTCKL9-Xs9G+07b8vgr0PunqZzVSN1Lmmg@mail.gmail.com>
In-Reply-To: <CAJuCfpFsKsA3vTZCPTCKL9-Xs9G+07b8vgr0PunqZzVSN1Lmmg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 9 Jul 2024 11:11:59 -0700
Message-ID: <CAADnVQK_ftwe5Dxtc0bopeDg2ku=GrFYrMOUWHLnXaK1bqoXXA@mail.gmail.com>
Subject: Re: [PATCH RESEND] bpf: fix order of args in call to bpf_map_kvcalloc
To: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	Mohammad Shehar Yaar Tausif <sheharyaar48@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Christian Kujau <lists@nerdbynature.de>, 
	=?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@intel.com>, 
	Lorenzo Stoakes <lstoakes@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 8:39=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Tue, Jul 9, 2024 at 8:14=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> w=
rote:
> >
> > On 7/8/24 10:20 AM, Linux regression tracking (Thorsten Leemhuis) wrote=
:
> > > [CCing the regressions list and people mentioned below]
> > >
> > > On 12.06.24 16:53, Alexei Starovoitov wrote:
> > >> On Wed, Jun 12, 2024 at 2:51=E2=80=AFAM Mohammad Shehar Yaar Tausif
> > >> <sheharyaar48@gmail.com> wrote:
> > >>>
> > >>> The original function call passed size of smap->bucket before the n=
umber of
> > >>> buckets which raises the error 'calloc-transposed-args' on compilat=
ion.
> > >>>
> > >>> Fixes: 62827d612ae5 ("bpf: Remove __bpf_local_storage_map_alloc")
> > >>> Reviewed-by: Andrii Nakryiko <andrii@kernel.org>
> > >>> Signed-off-by: Mohammad Shehar Yaar Tausif <sheharyaar48@gmail.com>
> > >>> ---
> > >>> - already merged in linux-next
> > >>> - [1] suggested sending as a fix for 6.10 cycle
> > >>
> > >> No. It's not a fix.
> > >
> > > If you have a minute, could you please explain why that is? From what=
 I
> > > can see a quite a few people run into build problems with 6.10-rc
> > > recently that are fixed by the patch:
> > >
> > > * P=C3=A9ter Ujfalusi
> > > https://lore.kernel.org/bpf/363ad8d1-a2d2-4fca-b66a-3d838eb5def9@inte=
l.com/
> > >
> > > * Christian Kujau
> > > https://lore.kernel.org/bpf/48360912-b239-51f2-8f25-07a46516dc76@nerd=
bynature.de/
> > > https://lore.kernel.org/lkml/d0dd2457-ab58-1b08-caa4-93eaa2de221e@ner=
dbynature.de/
> > >
> > > * Lorenzo Stoakes
> > > https://fosstodon.org/@ljs@social.kernel.org/112734050799590482
> > >
> > > At the same time I see that the culprit mentioned above is from 6.4-r=
c1,
> >
> > IIUC the order was wrong even before, but see below.
> >
> > > so I guess it there must be some other reason why a few people seem t=
o
> > > tun into this now. Did some other change expose this problem? Or are
> > > updated compilers causing this?
> >
> > I think it's because of 2c321f3f70bc ("mm: change inlined allocation he=
lpers
> > to account at the call site"), which was added in 6.10-rc1 and thus mak=
es
> > this technically a 6.10 regression after all.
>
> IIUC the above mentioned change reveals a problem that was there
> before the change. So, it's a build regression in 6.10 because the bug
> got exposed but the bug was introduced much earlier. The fix should be
> marked as:
>
> Fixes: ddef81b5fd1d ("bpf: use bpf_map_kvcalloc in bpf_local_storage")

Not really. The order was flipped before that patch.

> > So what triggers the bug is
> > AFAICS the following together:
> >
> > - gcc-14 (didn't see it with gcc-13)
> > - commit 2c321f3f70bc that makes bpf_map_kvcalloc a macro that does
> > kvcalloc() directly instead of static inline function wrapping it for
> > !CONFIG_MEMCG
> > - CONFIG_MEMCG=3Dn in .config

Can somebody respin the patch with above details?

tbh I don't think it qualifies as a "bug".
Plenty of code places mix up size/n arguments to calloc.
Erroring the build in such cases is imo wrong.
Not sure what makes gcc-14 produce such warn/error.

But since the patch is trivial we can get that in quickly.
Pls respin with all details.
