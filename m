Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E506F17E8E2
	for <regressions@lists.linux.dev>; Wed, 17 Jul 2024 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721236609; cv=none; b=pqNBfU199c3mLalquSftz5LYJdqJHnc7Oi4OdN/ix7I6vKreng+2OA3naoYfsQZMK6K8koVybB2WMb7HwVKwCeWp7FBlmwdp1CUaHDASV63gj+8CFZicvaKKGMTn8jHnt41pse9zZ5yDiVh4Q179fJWN8MaCXg6qDyrQd/WH9f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721236609; c=relaxed/simple;
	bh=Rzp1EW65kH8IM1UsXMFEq8foP0/z5SYhSlHAnh494WU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcpGw90/B04hFM+h130lTDLG4IAT0evbmzhDqvJzO0hyW+qzYXWblbbXfdPlEO6xhk8csM7r0p2ibb5GzTaLMkCxOMSSWqqvNvyjUuMUrh/hCeHyBq/GR8YAdoDEG19/+g0N+XTTdi6/YbwKJvcaKJHmZ00opB+xPyhFgxaHjIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtFt0kAf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtFt0kAf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C15C2BD10
	for <regressions@lists.linux.dev>; Wed, 17 Jul 2024 17:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721236608;
	bh=Rzp1EW65kH8IM1UsXMFEq8foP0/z5SYhSlHAnh494WU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MtFt0kAf+CTOwIGXUCiU3H3CiEOVNPIzdm53fTaS9aqCHu0djR8BdoCBx5Q6UAEnu
	 Cta8be200FQGVEXngz8u6CLdFFcbRlltmPYfDyo2O3nSOGr7cmE5SrxDp6uUgffrrj
	 q+4p7HKRn6fUYQ6juli6Xx5TonOdxl+fsdQCnwCVw2aZZ/RynQc5UvGocCNiZykyeD
	 Y04jZQGN3YwmU5ojLIDTwed1FldcKQLAYw0vwRbVXE+BfBe9OM3kwkTyKWOMHOOPwv
	 pIFnUvt2II1m61LwuDGrzM1EAZHV/YGWx8rV2KijAr5lAfw/bowjvEmGC+2JH9i/eF
	 4CeW/a83HJjgw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eea8ea8c06so124991fa.2
        for <regressions@lists.linux.dev>; Wed, 17 Jul 2024 10:16:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3jrXByS7t1pdx2bviM/cef4NKvRxo/pneeWq48ktCY5yXxnVbjUzK1V+hiNPLpUp/HZQURVIysk0cVv4kOSN0LPgZVQ98RDel27w=
X-Gm-Message-State: AOJu0Yx/vrWySG8hRWCxusCeLzOEcoYDskH0PGX+qKox0PEsxON1dFIv
	pyUyLNbGNO4OOg8VF1w1dxLm9XbXnHGyRlb/wf5dX688GFpeDvTI49918Paiasa3eIK9mMIwEeh
	2TwiSwo7ibvclKHfYqCSHG53xPK0=
X-Google-Smtp-Source: AGHT+IH+/DC0rI0PowrLhV8ouzSYW72gGVa0kcw7oLT277R387jjff93sQjNkAf8yBvsaGR1CAbzqFkt2gBwE7LVs6E=
X-Received: by 2002:a2e:a791:0:b0:2ec:5685:f06b with SMTP id
 38308e7fff4ca-2ef05c92308mr480621fa.27.1721236607068; Wed, 17 Jul 2024
 10:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <172096653882.8.16813493378478071178.379356753@simplelogin.com> <CAMj1kXG9AjvChj9O6LR+2bFVUoa225phaXndYvQ_f4X4bKioaw@mail.gmail.com>
In-Reply-To: <CAMj1kXG9AjvChj9O6LR+2bFVUoa225phaXndYvQ_f4X4bKioaw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 17 Jul 2024 10:16:35 -0700
X-Gmail-Original-Message-ID: <CAMj1kXHqJfw0_ZaE_xKy4PLScAZTzekrnZjsY+7SYv-YWn4Obg@mail.gmail.com>
Message-ID: <CAMj1kXHqJfw0_ZaE_xKy4PLScAZTzekrnZjsY+7SYv-YWn4Obg@mail.gmail.com>
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
To: mavrix#kernel@simplelogin.com
Cc: Radek Podgorny <radek@podgorny.cz>, regressions@lists.linux.dev, 
	regressions@leemhuis.info, christian@heusel.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Jul 2024 at 08:55, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Hi,
>
> On Sun, 14 Jul 2024 at 07:15, <mavrix#kernel@simplelogin.com> wrote:
> >
> > Hi
> >
> > My system appears to be affected by a regression originating with commi=
t 8117961d98fb2d335ab6de2cad7afb8b6171f5fe as well, with the main differenc=
e being that the current fix does not resolve the issue for me. What I don'=
t know is whether it's a different regression resulting from the same commi=
t or if the core issue is the same and the patch only fixes it is some case=
s. I decided that replying here would be the most efficient way to bring th=
is to attention, but if I should start a new report altogether, please let =
me know.
> >
> > Here's the story so far: After updating from 6.6.9-arch1-1 to the next =
regular kernel version, I had an unbootable system where I could still sele=
ct the systemd-boot loader entry but then the computer became unresponsive =
with a black screen, where not even sysrq worked anymore. For a while the A=
rch LTS kernels still worked as a fallback after that, but eventually they =
resulted in the same behaviour. I recently posted on the Arch forum about t=
he problem - https://bbs.archlinux.org/viewtopic.php?id=3D297453 - where Ch=
ristian Heusel, who I CC'd in this reply as well - helped me bisect the fir=
st bad Arch LTS kernel, i.e. 6.6.18. This lead to the aforementioned commit=
. Mainline unfortunately does not fix it for me (as of linux-mainline-6.10r=
c6-1). I also have other machines with a similar setup as far as the operat=
ing system goes (but on different hardware) that work fine.
> >
> > I have an otherwise up to date Arch system that I've originally set up =
well over 5 years ago on a Dell XPS 13 and that has been regularly maintain=
ed and updated, mostly without issues. The information requested so far in =
this thread in my case is as follows:
> >
> > bootctl - https://drive.proton.me/urls/P1TKZPA98R#YHmvPFBCRy7v
> > dmidecode - https://drive.proton.me/urls/GXTZVVSTK0#43CCvNy1m6dh
> > dmesg - https://drive.proton.me/urls/6DSXK4R2D8#8TFGkw6yvFfx
> >
> > I hope this all is of some help; if you need further information, pleas=
e let me know.
> >
>
> Does it make any difference if you boot with 'nokaslr' on the command lin=
e?
>
> Another thing you might try is applying the hunk below, to try and see
> whether the placement of boot_params in the binary is causing the
> issue.
>
> I can also provide a partial backport of the offending patch, to
> figure out whether it is the allocation that triggers the issue, or
> the way the boot_params data structure is populated.
>

Please also share your kernel build config and the output of

hexdump -C /sys/firmware/efi/efivars/MemoryOverwriteRequestControl-e20939be=
-32d4-41be-a150-897f85d49829
