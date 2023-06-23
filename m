Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45CC9449
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 13:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A415C433D9
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687528550;
	bh=zEXKg4D04kqdbyyTWW5DRUXDiwC4e8EXpdwFSzccEuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hHy5RgOcXbnR1um8hGteD29dzy788izMlTFOBQMhm9k8zIRp9EfXjnIFbkX7seBgB
	 l19P5bGJmi1nwwQPBQ6PD2dagdF0LkKRxxRWULZxEtZeFG59ZI+VjG4AW6R+wVXEpg
	 nqvxC1uUMaojKJVvlIbGbDbyZHAvruEm+Fs2eI17YyB91OWjk+X4uYabXA7OhEd+W9
	 vRQ3Gd9xRYCMDubYielzZSH7l2vqUPsnmYsDZWr6GOmZ38a8Vjv1vENYkDrC565o3i
	 jR2Y5XTmmPlMDADJ68b9b8oYpZIqe1mY+5qU3YOiT7gDKqmCKJFEVjd50uPDqXzjah
	 ATojH8YRkCnKA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f870247d6aso854851e87.0
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 06:55:50 -0700 (PDT)
X-Gm-Message-State: AC+VfDzLGa7KC89jyfV/P7HJujU6jVPNpM2ZES3VcGX5OCeOzJeH6qpe
	aZXhoE/NOWj+4Fr8w4P+tbn3TTG3HE+jKHHAVvg=
X-Google-Smtp-Source: ACHHUZ71FjXw4q+PMSISPbxfWarC1Zp3lytN0ixegKhs4Fj/KHfZm2XU2zOpJ2IMBv/OxC+qZV76kwX0dDpsrlU+E04=
X-Received: by 2002:a19:431c:0:b0:4f9:58bd:9e5a with SMTP id
 q28-20020a19431c000000b004f958bd9e5amr4618210lfa.27.1687528548308; Fri, 23
 Jun 2023 06:55:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=@proton.me>
 <ZHFaFosKY24-L7tQ@debian.me> <NVN-hJsvHwaHe6R-y6XIYJp0FV7sCavgMjobFnseULT1wjgkOFNXbGBGT5iVjCfbtU7dW5xy2hIDoq0ASeNaXhvSY-g2Df4aHWVIMQ2c3TQ=@proton.me>
 <ZIcmpcEsTLXFaO0f@debian.me> <oEbkgJ-ImLxBDZDUTnIAGFWrRVnwBss3FOlalTpwrz83xWgESC9pcvNKiAVp9BzFgqZ0V-NIwzBZ7icKD8ynuIi_ZMtGt7URu3ftcSt16u4=@proton.me>
 <e2ca75ef-d779-4bad-84a5-a9f262dbe213@lunn.ch> <FNzHwp9-AyweVwIMndmih6VuBD0nsyRp3OM72bmOxpeYszF680jFPJjENIknT32FeaqfVBtVSQFw-5mgE3ZXeksVD8VCFbxwojxP3mSZ9DQ=@proton.me>
 <9517bb70-426c-0296-b426-f5b4f075f7c8@leemhuis.info> <CAHmME9p2ZLJUMq96vhkiSgvJkxP5BxE778MhY5Ou2WdxLVEJyg@mail.gmail.com>
In-Reply-To: <CAHmME9p2ZLJUMq96vhkiSgvJkxP5BxE778MhY5Ou2WdxLVEJyg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Jun 2023 15:55:37 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHGkJsgArabs_mbzR3Y83s48qmf_aqb50k1LV1Hi5iNgA@mail.gmail.com>
Message-ID: <CAMj1kXHGkJsgArabs_mbzR3Y83s48qmf_aqb50k1LV1Hi5iNgA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Boot stall from merge tag 'net-next-6.2'
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: regressions@leemhuis.info, Andrew Lunn <andrew@lunn.ch>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linux Stable <stable@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Sami Korkalainen <sami.korkalainen@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Jun 2023 at 19:57, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> +Ard - any ideas here?
>
> On Wed, Jun 21, 2023 at 10:46=E2=80=AFAM Linux regression tracking (Thors=
ten
> Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > [added Jason (who authored the culprit) to the list of recipients; move=
d
> > net people and list to BCC, guess they are not much interested in this
> > anymore then]
> >
> > On 21.06.23 08:07, Sami Korkalainen wrote:
> > > I bisected again. It seems I made some mistake last time, as I got a
> > > different result this time. Maybe, because these problematic kernels =
may
> > > boot fine sometimes, like I said before.
> > >
> > > Anyway, first bad commit (makes much more sense this time):
> > > e7b813b32a42a3a6281a4fd9ae7700a0257c1d50 efi: random: refresh
> > > non-volatile random seed when RNG is initialized
> > >
> > > I confirmed that this is the code causing the issue by commenting it
> > > out (see the patch file). Without this code, the latest mainline boot=
s fine.
> >
> > Jason, in that case it seems this is something for you. For the initial
> > report, see here:
> >
> > https://lore.kernel.org/all/GQUnKz2al3yke5mB2i1kp3SzNHjK8vi6KJEh7rnLrOQ=
24OrlljeCyeWveLW9pICEmB9Qc8PKdNt3w1t_g3-Uvxq1l8Wj67PpoMeWDoH8PKk=3D@proton.=
me/
> >
> > Quoting a part of it:
> >
> > ```
> > Linux 6.2 and newer are (mostly) unbootable on my old HP 6730b laptop,
> > the 6.1.30 works still fine.
> > The weirdest thing is that newer kernels (like 6.3.4 and 6.4-rc3) may
> > boot ok on the first try, but when rebooting, the very same version
> > doesn't boot.
> >
> > Some times, when trying to boot, I get this message repeated forever:
> > ACPI Error: No handler or method for GPE [XX], disabling event
> > (20221020/evgpe-839)
> > On newer kernels, the date is 20230331 instead of 20221020. There is
> > also some other error, but I can't read it as it gets overwritten by th=
e
> > other ACPI error, see image linked at the end.
> >
> > And some times, the screen will just stay completely blank.
> >
> > I tried booting with acpi=3Doff, but it does not help.

Catching up with email after my vacation, apologies for the delay.

This ship seems to have sailed in the meantime, but I'll contribute
some observations anyway.

The machine in question appears to be Vista-era Windows laptop, and I
am not surprised at all that the firmware is flaky. In those days,
firmware testing was limited to boot testing Windows, and nobody
bothered testing for EFI compliance beyond that (as it is not needed
to get the Windows sticker)

However, the failure mode still strikes me as odd, and I'd be
interested in finding out whether booting with efi=3Dnoruntime makes a
difference at all, as that would prevent the SetVariable() all from
taking place, without affecting anything else.

Setting the variable from user space is ultimately a better choice, I
think. The reason it was avoided it here is so that we don't have to
rely on user space to set limited permissions on the efivarfs file
entry in order to avoid the seed from being world readable (which is
something, e.g., systemd does today for other 'sensitive' EFI
variables, whatever that means). But given that this variable is in
its own GUIDed namespace, we could easily fix that in efivarfs itself.
