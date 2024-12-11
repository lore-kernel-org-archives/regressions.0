Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22B6238E38
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733919862; cv=none; b=PcFtkaa17rxiQTzaKjupBU4j/DMQfkbrzqrv5LDKOlAUd/WqiA3j29bnCcYZRw8Tqgp6X03Gh/YPM1iI4VPALV0Vkw0CHHLALz2pjMf1D13gUXT6+Q4L1fbFjIfSqpfEK3OgYWvX7tzewD1FGeX/vIwWJH34IrbJFBzy96/bI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733919862; c=relaxed/simple;
	bh=DsXfp69fj2fRqzzDFgqUyNg8ViPXWlKIo43PfinZuFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0sr8UYIyocCWB56wVcFqOu++0vITucUw678at95sFAFRJyzgoLT/xdD3Pi2konq2rVsHmpEx16MKxaEkfz7xNelyV3qYR4o+b+gTxq/9ty8VNVbBaOyEUs5PcvjTxpi5BuD0AXMgTaSH5t+5ViUo/9FNeDTMZnpQeG+jHcWdK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbBGffLG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbBGffLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A5BC4CEE2
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 12:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733919861;
	bh=DsXfp69fj2fRqzzDFgqUyNg8ViPXWlKIo43PfinZuFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hbBGffLG09YowJve8o2b2lzExQfsrf3VQXWFB8Xtk06XrXMUwu8qfiY9DHU9o1848
	 VrsVvUN/EA7cvw933gACaa9OvZX6sqlLNIq02WNb1asVKkuwUbAFS1EnwzA93i4VZL
	 i6hqVluyEO9kH4saaXyezegM7E3n9Y0Ywd/Yd1ClCB4u95ZrtACPreUzpn094pVniF
	 weqU4p/6AhkK4jc/4tZvsMwG/X49rjFChcSz6Pj/ZJhbS8jEQXOCvAk6ogmNxGmidE
	 26PBXcIvNmFkd2z7ZDu9YX7SWwbd6ldzX1RtpMuc95BFC7YNZ2x6E4++8SPA59AWgf
	 LaSSkWlpcigtQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso5103493e87.3
        for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 04:24:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhlfh9Fn7YOOmx0jFBKPFHi2eMIC82ppF0LzBYyEq2uEy5EmCXJfoglsTmXS5cVxdLfpkPnlaqNf/GSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYr3V07HPChj+E/hyebOtUYMJ4vHst5YdJB0vbvkd8oscQiL62
	9PXmA88WYMbwnpdfTtvEUZBUgTslyplhAl5IId/WXd8v9jO7zMS3RtrgX6Xel/v8FJncK7PiFP7
	7Y4w5W9s3H531g0GULRdYIrbr4dI=
X-Google-Smtp-Source: AGHT+IGGcmOcREgNPBxszaP86ASREHMb1Gbb7UNcEMwpTi1i2aaMzaHU//SFUnwFwNZQnYbltrR5CTAM3YNBIp6px58=
X-Received: by 2002:a05:6512:3d18:b0:53e:398c:bf8f with SMTP id
 2adb3069b0e04-5402a5e5f9cmr849575e87.32.1733919859838; Wed, 11 Dec 2024
 04:24:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z1l6XbHP6BTTZSwr@mail-itl> <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
In-Reply-To: <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 11 Dec 2024 13:24:08 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHSiCo7FH0Mo-_R9HjxhthddPUZfgm5c8yj7vjGvgfTPg@mail.gmail.com>
Message-ID: <CAMj1kXHSiCo7FH0Mo-_R9HjxhthddPUZfgm5c8yj7vjGvgfTPg@mail.gmail.com>
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, regressions@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Dec 2024 at 12:53, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote=
:
>
> Jason, Ard,
>
> I guess there are some prereq patches missing in stable 6.6.y branch?
>
>
> Juergen
>
> On 11.12.24 12:41, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >
> > With Linux 6.6.64 I get the following crash on domU boot:
> >
> > (XEN) d5v0 Triple fault - invoking HVM shutdown action 1
> > (XEN) *** Dumping Dom5 vcpu#0 state: ***
> > (XEN) ----[ Xen-4.19.0  x86_64  debug=3Dn  Tainted:  M     ]----
> > (XEN) CPU:    4
> > (XEN) RIP:    0008:[<ffffffff82b64050>]
> > (XEN) RFLAGS: 0000000000010086   CONTEXT: hvm guest (d5v0)
> > (XEN) rax: ffffffff82b64050   rbx: ffffffffffe00000   rcx: 00000000c000=
0101
> > (XEN) rdx: 0000000000000000   rsi: 0000000003a00038   rdi: 0000000002a9=
bc98
> > (XEN) rbp: 0000000000000000   rsp: 0000000002aa0ce8   r8:  000000000000=
0000
> > (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 000000000000=
0000
> > (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 000000000000=
0000
> > (XEN) r15: 0000000000000000   cr0: 0000000080000011   cr4: 000000000000=
0020
> > (XEN) cr3: 0000000002022000   cr2: 0000000000000000
> > (XEN) fsb: 0000000000000000   gsb: 0000000002a9ccc0   gss: 000000000000=
0000
> > (XEN) ds: 0010   es: 0010   fs: 0000   gs: 0000   ss: 0010   cs: 0008
> >
> > Linux 6.6.63 works fine.
> >
> > Looking at the changes, I suspect one of those:
> >
> >      83d123e27623 x86/pvh: Call C code via the kernel virtual mapping
> >      f662b4a69e1d x86/pvh: Set phys_base when calling xen_prepare_pvh()
> >

The second patch shouldn't have been backported. It is unnecessary,
given that in the old situation, the kernel image needs to be loaded
at a fixed address. And it assumes  that %rbp is set to the physical
load offset, but those patches were not backported.
