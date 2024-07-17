Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAF117F393
	for <regressions@lists.linux.dev>; Wed, 17 Jul 2024 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721231754; cv=none; b=U84QhzQTGW3cJ4N6sBtA0HUVqXDeYKPggPpR4l4c7AzdENUUZZMvqNZLDjn636MlA2IRXSbP832WcDjpPAFlxXceiTski5XRc5lRDNbhHy+SiowZwS8TJ5huYnF+ILKBuVsMFnhL/eHyuMOoBp1gP4TmQILBKK+Wdeg9AjHowLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721231754; c=relaxed/simple;
	bh=uiKEdGoexll45DRaU3oXeZYrykV3MoE0dbEkV210rTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7Qa3yxyibnHewvrnvGLNSkrzFPOBhunFJHj/HYGOp86qo8bY9/rvv0zcODl9ciol8jTMPH6SNaqAMQ9UoAiBHLgqmOrcexvK7EjGynhd6rdQu0SJhiBuKSrNXfz7I+PyPI2+hN/7pBeltfS/9v1uq7QDXtoCupo3vWv0uZark4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Op3SJBC3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Op3SJBC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11FAC2BD10
	for <regressions@lists.linux.dev>; Wed, 17 Jul 2024 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721231753;
	bh=uiKEdGoexll45DRaU3oXeZYrykV3MoE0dbEkV210rTU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Op3SJBC32xWhm0GQiXTfjQnd5KXnzeZhcPPasFCGztXSNMZFo9aWLEVqET4lbK6yO
	 K7SjwVJBXPsoy0+w4MwpT1NbDVyYcqjCm5idFLyW+5ud7Of0snB/oNx8JJcyfHUKJB
	 Ln3DpEYFcXypG1yAFTYyzsmB4LFs7ZsRIZOONXwNpAbWL/vEOcSzZy3Mbc6BXfU1ld
	 0R1iWtF8W5YPJmSGFqkp6TYNPkgX9rkvJQu+v/lYilQ8LkWtsG+9dethiUTw1M+39G
	 4l8rdLiXBBPlgOj9gX6VOQ7TuVPYujr/bRCkvSJ0faIy91+NkZL2FZ5UqOO4XbKMA/
	 eywV6NANYARMA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eede876fbfso57183351fa.1
        for <regressions@lists.linux.dev>; Wed, 17 Jul 2024 08:55:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWu868XcXW1huUouuuncuCYbur3zxvPzulpkXjfgVOpAaJgB1OmFsOEdASJ4gj7aq5AIk40dsmzHkJkPd+kuMTJRoppKv896jBlpIg=
X-Gm-Message-State: AOJu0Ywhqe/Oy38tP2uLHGf9ot8ieekqaTwHWoymUvJVA6knka/OBU9U
	dpGTmmdEHrcoiv0xxxzZZr0ZMDwy3/XKUMrONvICz9nNZ5EAzyZoTZIw0ezvbRCuPRqeLZ5+2Ua
	zvmX3OIXQ7c1RSGj49Y744v+4Qdk=
X-Google-Smtp-Source: AGHT+IH/6MbGHfOrJK8/Ni5WWF5W+nEmLGIJ2NZSEVTxtwX2eJWro0B6uB7XaUGWhrcBb7c9V+nw1O6/mz/yuOrWSl0=
X-Received: by 2002:a2e:be8b:0:b0:2ee:7c35:d88b with SMTP id
 38308e7fff4ca-2eefd04a9a5mr17782841fa.3.1721231751857; Wed, 17 Jul 2024
 08:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <172096653882.8.16813493378478071178.379356753@simplelogin.com>
In-Reply-To: <172096653882.8.16813493378478071178.379356753@simplelogin.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 17 Jul 2024 08:55:40 -0700
X-Gmail-Original-Message-ID: <CAMj1kXG9AjvChj9O6LR+2bFVUoa225phaXndYvQ_f4X4bKioaw@mail.gmail.com>
Message-ID: <CAMj1kXG9AjvChj9O6LR+2bFVUoa225phaXndYvQ_f4X4bKioaw@mail.gmail.com>
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
To: mavrix#kernel@simplelogin.com
Cc: Radek Podgorny <radek@podgorny.cz>, regressions@lists.linux.dev, 
	regressions@leemhuis.info, christian@heusel.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, 14 Jul 2024 at 07:15, <mavrix#kernel@simplelogin.com> wrote:
>
> Hi
>
> My system appears to be affected by a regression originating with commit =
8117961d98fb2d335ab6de2cad7afb8b6171f5fe as well, with the main difference =
being that the current fix does not resolve the issue for me. What I don't =
know is whether it's a different regression resulting from the same commit =
or if the core issue is the same and the patch only fixes it is some cases.=
 I decided that replying here would be the most efficient way to bring this=
 to attention, but if I should start a new report altogether, please let me=
 know.
>
> Here's the story so far: After updating from 6.6.9-arch1-1 to the next re=
gular kernel version, I had an unbootable system where I could still select=
 the systemd-boot loader entry but then the computer became unresponsive wi=
th a black screen, where not even sysrq worked anymore. For a while the Arc=
h LTS kernels still worked as a fallback after that, but eventually they re=
sulted in the same behaviour. I recently posted on the Arch forum about the=
 problem - https://bbs.archlinux.org/viewtopic.php?id=3D297453 - where Chri=
stian Heusel, who I CC'd in this reply as well - helped me bisect the first=
 bad Arch LTS kernel, i.e. 6.6.18. This lead to the aforementioned commit. =
Mainline unfortunately does not fix it for me (as of linux-mainline-6.10rc6=
-1). I also have other machines with a similar setup as far as the operatin=
g system goes (but on different hardware) that work fine.
>
> I have an otherwise up to date Arch system that I've originally set up we=
ll over 5 years ago on a Dell XPS 13 and that has been regularly maintained=
 and updated, mostly without issues. The information requested so far in th=
is thread in my case is as follows:
>
> bootctl - https://drive.proton.me/urls/P1TKZPA98R#YHmvPFBCRy7v
> dmidecode - https://drive.proton.me/urls/GXTZVVSTK0#43CCvNy1m6dh
> dmesg - https://drive.proton.me/urls/6DSXK4R2D8#8TFGkw6yvFfx
>
> I hope this all is of some help; if you need further information, please =
let me know.
>

Does it make any difference if you boot with 'nokaslr' on the command line?

Another thing you might try is applying the hunk below, to try and see
whether the placement of boot_params in the binary is causing the
issue.

I can also provide a partial backport of the offending patch, to
figure out whether it is the allocation that triggers the issue, or
the way the boot_params data structure is populated.



--- a/arch/x86/boot/compressed/vmlinux.lds.S
+++ b/arch/x86/boot/compressed/vmlinux.lds.S
@@ -55,8 +55,7 @@ SECTIONS
        . =3D ALIGN(L1_CACHE_BYTES);
        .bss : {
                _bss =3D . ;
-               *(.bss)
-               *(.bss.*)
+               *(SORT_BY_ALIGNMENT(.bss*))
                *(COMMON)
                . =3D ALIGN(8);   /* For convenience during zeroing */
                _ebss =3D .;
