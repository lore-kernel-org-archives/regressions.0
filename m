Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2317A2F6
	for <regressions@lists.linux.dev>; Tue, 23 Jun 2026 12:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219564; cv=none; b=bZyU2dnKh/0+PQN4UU9+s/gHx71gfZsiIDDwawOQaPbenz+J//KQ42IjC6AVkSdrx+UaMeaEEJ7taXFKpAFaijHKl3YznEnZV8n6beq9psxsCPj320RT50pWs6WBMBWoGuu6A/Q2G2SyEslN0nplG+BvmC3dsHHnCvHtlgAT08U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219564; c=relaxed/simple;
	bh=S6h+fX7PAvL7uR6y304gO9GWYWV9V4W6ZGBYM9Io+as=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yld8mnujCN4YSvbK65oO3Cy8waC5CWBNBG3+MW1fokI8Osvm0narFgmco5JYYX2KADerI8R8p2DV+Sg9Vb/qoF8cnY4T0Gjaqug/kHOE4m6uAzDv1EiWxL/SC2vG/UaO/nSXkyxPokXuHSH+6bZzoFZJd+5WWqjmSawYrXNAR50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQqFLhaL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQqFLhaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED01F1F00AC4
	for <regressions@lists.linux.dev>; Tue, 23 Jun 2026 12:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782219561;
	bh=2Wr9ntIo9qWPqFIaI2xUTp2rq4ClZjeldvIW4iN3ovQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bQqFLhaL33IN3KNUdiRW32qDWtGJu06iO9GrrZzM7G+1Be3lnrJBWNsEgpVVGe8p8
	 TqACRPd/tBvkPTaLGQTRwEmEu72MZs3nPhiwIR2aYabUQctEANki52wAVLXjtbtFCC
	 VIBIoEgCy843A9DuKtpZsT3LADNj+ASTZG/lJrhtjsBFb0qY+q0tQoICvkFMJ961ve
	 2PpwNeJjUeKd8diRSR0hP8madLOyvNGvb07OQdC7NlGTgOcojf8KaAZjdDbLY0whqP
	 qo64WTAiJPczALKXMpRBAQCo/Wi7nOBhD3SWgmYVkibdhfaOg9l7zdErrU1bNCoK/Q
	 CRVc0kVPCd78A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68d65d24so5795423e87.1
        for <regressions@lists.linux.dev>; Tue, 23 Jun 2026 05:59:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8x97ENnRbpYFLdM6dlc5XRlJtMJP8ANMzgmesPskjmenQ0Iy5HCgRHvZTYlho84pGCNhK8+8EAj+rj9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCcBT8mmKYVUs1ntDy6bKYy24+EqpJXDjBojF3Bvy77V6XbNAP
	Kk0DtoBY2tRb4UdtOTG8o/3073b22b85fCgdpaBTFuCqQgyfkEFK7/idXGFBdC4E/LepFLMyvLW
	w+0RCEmuZGrRcegU1m12cvF6npz/A1CM=
X-Received: by 2002:a05:6512:64e2:b0:5aa:6d11:187c with SMTP id
 2adb3069b0e04-5ad5be228b3mr3331657e87.8.1782219559446; Tue, 23 Jun 2026
 05:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260620081548.14143-1-scardracs@disroot.org> <20260620081548.14143-2-scardracs@disroot.org>
In-Reply-To: <20260620081548.14143-2-scardracs@disroot.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 23 Jun 2026 14:59:07 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jmOj0WBtMTvbnaD+2b0bTFowA=JWrqRzaaCYpHpai1Nw@mail.gmail.com>
X-Gm-Features: AVVi8CfIyzmDFGExuN9D-tRn-iXaKY9wSFOtVLygRht5SwtTlxUN7h-AsjElQsU
Message-ID: <CAJZ5v0jmOj0WBtMTvbnaD+2b0bTFowA=JWrqRzaaCYpHpai1Nw@mail.gmail.com>
Subject: Re: [PATCH 1/1] x86/power: only verify usable RAM regions during
 hibernation E820 check
To: Marco Scardovi <scardracs@disroot.org>
Cc: moravec@ukf.sk, rafael@kernel.org, pavel@kernel.org, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, crecklin@redhat.com, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@leemhuis.info, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 20, 2026 at 10:16=E2=80=AFAM Marco Scardovi <scardracs@disroot.=
org> wrote:
>
> On some UEFI platforms (such as the HP OmniBook X Flip), resuming from
> hibernation fails with 'Hibernate inconsistent memory map detected!'
> even though the usable system RAM configuration is identical.

That may not be sufficient for the image kernel to work after resuming thou=
gh.

> This happens because the UEFI firmware or bootloader (like GRUB) makes
> non-deterministic allocations or shifts reserved/ACPI memory regions
> dynamically across boots,

The boot loader has nothing to do with this, the memory map comes from
the UEFI firmware.

> which changes the CRC32 checksum computed
> over the entire E820 table (which includes non-RAM types like reserved,
> ACPI, NVS, and unusable memory).
>
> Fix this by modifying compute_e820_crc32() to only calculate the
> checksum over memory map entries of type E820_TYPE_RAM. Usable system
> RAM layout is still verified to ensure data safety, but dynamic shifts
> in ACPI and other reserved ranges are ignored.

Which is risky because the image kernel may access stuff located in
those non-RAM memory regions (for instance, ACPI tables, AML operation
regions, UEFI runtime variables, etc.).

Hibernation in Linux simply cannot cope with a changing memory map in
general, sorry about that.

> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D221569
> Fixes: f5d1499ae209 ("PM: hibernate: x86: Use crc32 instead of md5 for hi=
bernation e820 integrity check")
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  arch/x86/power/hibernate.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/power/hibernate.c b/arch/x86/power/hibernate.c
> index a2294c1649f6..752a490bc3d2 100644
> --- a/arch/x86/power/hibernate.c
> +++ b/arch/x86/power/hibernate.c
> @@ -70,12 +70,19 @@ struct restore_data_record {
>   *
>   * Return: the resulting checksum
>   */
> -static inline u32 compute_e820_crc32(struct e820_table *table)
> +static u32 compute_e820_crc32(struct e820_table *table)
>  {
> -       int size =3D offsetof(struct e820_table, entries) +
> -               sizeof(struct e820_entry) * table->nr_entries;
> +       u32 crc =3D ~0;
> +       int i;
> +
> +       for (i =3D 0; i < table->nr_entries; i++) {
> +               if (table->entries[i].type =3D=3D E820_TYPE_RAM) {
> +                       crc =3D crc32_le(crc, (unsigned char const *)&tab=
le->entries[i],
> +                                      sizeof(struct e820_entry));
> +               }
> +       }
>
> -       return ~crc32_le(~0, (unsigned char const *)table, size);
> +       return ~crc;
>  }
>
>  #ifdef CONFIG_X86_64
> --
> 2.54.0
>
>
