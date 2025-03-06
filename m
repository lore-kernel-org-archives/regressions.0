Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601341991C9
	for <regressions@lists.linux.dev>; Thu,  6 Mar 2025 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741277014; cv=none; b=rOheq48JycI1wsNd6zNXeX3WDPKIaPfQUQzT1uLGaUqgFaKDZ0BhONX7W2LKpt450nvsT2IRnZsmJVYCthJtPfx5Tz0+hWmzt9wSgh653+T8aitQ6WIk8xyuOp6o/1zj020hVrz7cIkIU3HDyZsh4cbp4sddZmmdne9Udm4Rhsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741277014; c=relaxed/simple;
	bh=5VVuGO9tYfNxrJyu4gKgEUyLMUq3DBGr/CP/vSYGTeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFav0vWS7THggWe2htFVyLZdpOz1y6bsEH+lVn9Sg01Q4Z20Vw/JlIM6IKm9iXm2y5wQylX2Vb7VnPN+HBdm0MWL2yIF7WDwim2BqhkdvegnAm7FyWuH8dQmNxFj/X8TEhqbXj11TlDcPHsmvV0glW60qsnUG5A7jjx7iHYyLj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCwyimvZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCwyimvZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA15C4CEEA
	for <regressions@lists.linux.dev>; Thu,  6 Mar 2025 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741277013;
	bh=5VVuGO9tYfNxrJyu4gKgEUyLMUq3DBGr/CP/vSYGTeg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jCwyimvZ1F6VhYjzi+WigXxHHIaC86oMop7SUezqtPl96ujT9UpS63UYc9XL/YVlW
	 d4uwFdy4v07dBrM9+8gifS3OOr/2GMbBLC68fJWMnUcvDYxYlj2dYJY2DNlTQQDyNl
	 GC+Zfi0eTX86080FuYICEjSzVRBg5DU0cFeJUjU83rO8Hl7HLzsJsrITiJzUU0VBnF
	 g3owElmovDVrrg04c8kvrt3iCeaOBPVKCnTQcrz/w14KAUfp8TW2bR6NuCNv4s5pF9
	 rHowV0tI4FA+nx/n7dwrnXaZJHXM9eODrt85rRNCRIkfqmWxtz7SfGu4Ysz8eYS7qW
	 XcXgx3GexxjPw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5498fd0bce9so123756e87.3
        for <regressions@lists.linux.dev>; Thu, 06 Mar 2025 08:03:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMJGBOhM1PbwB6tZN7C2NT7t2eFrLzs2K2/xlMStbu3L5D0NAhHfWFOIkzCgwnUFh//+c0E8MN+tfJQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxhR+znCY+KEQpjCIHOOJF6lww5OUgxxnWMl+GVRy+F704ExBW
	sKn1QAHq+Dvn9FEBYNCRn1o2t6rbkG2K4qIdGEWiJAeXZ1jMemsRKWOiHkDkKUx5go1NpJnj6bZ
	77uqXlvQ3traFCHbGvE+k+js2CeM=
X-Google-Smtp-Source: AGHT+IEgOuD3Je0Uzbe7awlBp1ZDNTfsGXtUzEZsKknL0hjg9tGAglWbZTckYVhJUzyCesU0FPjfSL54NFKXK97dWhw=
X-Received: by 2002:a05:6512:23a2:b0:549:8f21:bc07 with SMTP id
 2adb3069b0e04-5498f21bd0amr351412e87.26.1741277012086; Thu, 06 Mar 2025
 08:03:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202503041549.35913.ulrich.gemkow@ikr.uni-stuttgart.de>
 <CAMj1kXH-CDaQ0UFuwHWC2ERRmvo7tS+jcZcue00yReyAi5sVXg@mail.gmail.com>
 <F13ADA98-60CE-4B1A-B12F-2D1340AF44E3@zytor.com> <CAMj1kXE2APmDBoTWnDJBmEcU0-B6kKFARCpmN4kYrufy-TMwHA@mail.gmail.com>
 <87AE5E2B-4BD4-468E-ABD5-6E717FE925EE@zytor.com>
In-Reply-To: <87AE5E2B-4BD4-468E-ABD5-6E717FE925EE@zytor.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 6 Mar 2025 17:03:20 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFuC2_J9wUuJ-GnRRSBN6C2YbahxJ9PD9X26TX+smhBgA@mail.gmail.com>
X-Gm-Features: AQ5f1JoS7LmhwtWJ1Vn0tMWQgTbiuXqKPgARhyD1C9qpndPTmzYc-w6hoTV_RpQ
Message-ID: <CAMj1kXFuC2_J9wUuJ-GnRRSBN6C2YbahxJ9PD9X26TX+smhBgA@mail.gmail.com>
Subject: Re: Regression for PXE boot from patch "Remove the 'bugger off'
 message" in stable 6.6.18
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ulrich Gemkow <ulrich.gemkow@ikr.uni-stuttgart.de>, stable@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Mar 2025 at 16:23, H. Peter Anvin <hpa@zytor.com> wrote:
>
> On March 6, 2025 6:44:11 AM PST, Ard Biesheuvel <ardb@kernel.org> wrote:
> >On Thu, 6 Mar 2025 at 15:39, H. Peter Anvin <hpa@zytor.com> wrote:
> >>
> >> On March 6, 2025 6:36:04 AM PST, Ard Biesheuvel <ardb@kernel.org> wrote:
> >> >(cc Peter)
> >> >
> >> >
> >> >I managed to track this down to a bug in syslinux, fixed by the hunk
> >> >below. The problem is that syslinux violates the x86 boot protocol,
> >> >which stipulates that the setup header (starting at 0x1f1 bytes into
> >> >the bzImage) must be copied into a zeroed boot_params structure, but
> >> >it also copies the preceding bytes, which could be any value, as they
> >> >overlap with the PE/COFF header or other header data. This produces a
> >> >command line pointer with garbage in the top 32 bits, resulting in an
> >> >early crash.
> >> >
...
> >>
> >> Interesting. Embarrassing, first of all :) but also interesting, because this is exactly why we have the "sentinel" field at 0x1f0 to catch *this specific error* and work around it.
> >
> >We're crashing way earlier than the sentinel check - the bogus command
> >line pointer is dereferenced via
> >
> >startup_64()
> >  configure_5level_paging()
> >    cmdline_find_option_bool()
> >
> >whereas sanitize_bootparams() is only called much later, from extract_kernel().
>
> That is a bug in the kernel then. The whole point of the sentinel check is that it needs to be done before any of the fields touched by the sentinel check are accessed.

Indeed - I have just sent out a fix for this.
