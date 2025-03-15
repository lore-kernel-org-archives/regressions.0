Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF417485
	for <regressions@lists.linux.dev>; Sat, 15 Mar 2025 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742051445; cv=none; b=lhgJqgayRkfFqF7PLYOktCoCrJr5AZNARStBgfD3x5xFRkCCQ8R64IktvJdCryc7Y76Wuxls06IsENI4oar7Tep58m+RLRy6pVd3qTl9ruW8b/KEWbgXw4ZkN9//EFSYaFPQYSZIc3kHbQhgAB0bkwWAx84N+G2FFIjXJfEPDN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742051445; c=relaxed/simple;
	bh=gyYwve5CzC9tvUDOcGXWEagc59fxFR9jVFJS3jytVvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HrDly3nxyTSpqNLnepOjXWj+zZ1xAm5Nw4YJgHyIxBviUacqqJs+IFvh8AyydsMO2hMd5xXN/nP1o8sQ9WqwNZMs9eRV1uLD2Jq+is+4BjrBNT2Kp2p7oHdVp6KgJRhuBGmSJdLfr0EPgbqAjGwGIjSCRbI4LpyRrzApjLmzt7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1qmum/a; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1qmum/a"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff80290e44so1329716a91.0
        for <regressions@lists.linux.dev>; Sat, 15 Mar 2025 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742051443; x=1742656243; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+diWQjLSEREzS7IygxNMJwTUXMI0PgtnZ0ptDwraZ4=;
        b=Q1qmum/avbSRYQhPPzqSNU9H+p/BzzF5pKP8nSnLl4jRSK3U8jIJ/2P1DwXD4Ci0Lv
         tkhmUM0As65KeB9Vcd7qOUlsYagB8GPeaXrh209O3ShnluH7GWQW7ehH8WtA2JwAaPKg
         1NqNImZUquS5CnYyOUA7tbGFie2ukioRSE4Kag4CJIRpDk0ABv4kdWK9h/GQutiZTTb/
         anhAB9CJaTyV5gu+cpICfsv7woCHRrfmoXs5xAagT3GYG6vezoAPpVOk88OiQzNF5LtO
         4pubcS1+ZTezpY6IgWpBsgCY+BC1VFNfH8iNoKKtKyht79ocjjxTQcYAdrjV8AvbAWjr
         Tdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742051443; x=1742656243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+diWQjLSEREzS7IygxNMJwTUXMI0PgtnZ0ptDwraZ4=;
        b=Unj7YPsTChf667qjeBswrPQZBsvQ6qvEdrd8qyvlPzDOdIWlcTrS05ekOSGA34w/EK
         S7+tN0ZbM+eLyldR1J9Si7lWeD9LR1fWDGat7eBBOjlMwXRcVgUBzER93hzlO06GDtat
         xyk9tTF6lXB7WpCxVf2RyZS07Z6HWtyLKNl/GOKSCw/NWow4CI4LS/jZpFb061kWBn6j
         cZjbTOnrVE8ipOIN2gfjCfn84XhD/Is74WyBXypYsJ9Yk/P4Bhs3bFbAPwQhoETS+8dw
         Ooml8Fpe23ENxMGt00zm3+rAnPAs9CKNBqhSiXAXb+25v7oZMr4YPQaLry1CcN4E8SP4
         1kGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMH+sSokiyGldsxJpomuQEULFJk1kJF2i9gSvScvUekpqlbtyNmCTzPohX/wbea3y2kZFXXJ7wcTjLpw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0czIZ4th31o2JV0kFBucqYZJRTWkxuNMBNPPBCzSKbzcrlEzU
	8lVAdRukMWyEsVIzUmJ2d1Q1HiTaCvf9R8d7y4FjFuxW/lVQHp3ooqdyxw/oo4KSyI7IRkKA+CS
	mfFlo9Z5Dl70+rAiRKScmJZK46PammWk8
X-Gm-Gg: ASbGncuyJcok4TEbU4bak3DFm5R6UZS7zyFI4oEcBUoU4xVZRIFwNU1v3aGkK262N8T
	g1PsRGb8cqMx44fg14zQ98ofZb9B1fNPAuGahWZv7JCMyTie1o2LWCdHGRDnXsDM9R1VJeLUGVs
	pj4fCIN8kU3uWOSgoH00Uk+0TA
X-Google-Smtp-Source: AGHT+IFRU6ILDNG7xALcxhhofLiM5KuaJ2dySnoU3bzd7frIB5Nv7kIfshn3rzx7f7RybhRpp3d+ftiifw+z76nXEis=
X-Received: by 2002:a17:90b:3ec5:b0:2ea:7cd5:4ad6 with SMTP id
 98e67ed59e1d1-30151d817f3mr7082719a91.32.1742051443319; Sat, 15 Mar 2025
 08:10:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG8fp8QvH71Wi_y7b7tgFp7knK38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com>
 <3f4758be-df0e-44f3-b259-af02a2d7b3b3@intel.com> <CAG8fp8S92hXFxMKQtMBkGqk1sWGu7pdHYDowsYbmurt0BGjfww@mail.gmail.com>
 <09401d9f-6a5f-40d7-ac3c-e149ef57bcfd@intel.com> <CAG8fp8R2HaU0XQDsnFG4CyF=XbqLV3sv=U7-52QKomDptQY1Nw@mail.gmail.com>
 <20250315134844.GDZ9WFPFK2TlHEoDzJ@fat_crate.local>
In-Reply-To: <20250315134844.GDZ9WFPFK2TlHEoDzJ@fat_crate.local>
From: Akihiro Suda <suda.kyoto@gmail.com>
Date: Sun, 16 Mar 2025 00:10:32 +0900
X-Gm-Features: AQ5f1JrrVEzjWzyISbQgxMuqP0p4UVaJB5NU68-piO0CsT5Du_he3oe3XvTrBso
Message-ID: <CAG8fp8R7t7waSbZ5KfF=WZNMNKTxkg3TNksFCAA464KEfPUFZw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] x86: kernel 6.12 crashes during
 get_xsave_addr_user on Apple Virtualization
To: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@intel.com>, Linux Regressions <regressions@lists.linux.dev>, 
	Linux x86 <x86@kernel.org>, aruna.ramakrishna@oracle.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Why is it so hard to add a cmdline switch for something which is clearly
> broken?

This is quite hard in practice, because there is no good tool that
mounts QCOW2 + LVM + ext4/XFS/btrfs/zfs/... to modify grub.cfg (or
whatever else) inside it.

Directly booting vmlinuz + initrd without GRUB is not an option,
because apt/dnf will not upgrade the actual kernel while it will wipe
out /lib/modules/$(uname -r) after installing a new kernel in /boot in
the disk image that is unused for booting.


> So if there are security updates, they don't want to update either? I gue=
ss
> their problem...

This might be questionable, as not every vulnerability is exploitable
on every environment, and an update may potentially have a regression,
or even have a new vulnerability.

Eventually they will have to accept installing the update, but it is
not always something that they must rush.


> What do we do the next time they mis-read the architecture? We add a fix =
to
> Linux again because the kernel is apparently the most flexible component =
in
> such a scenario? IOW, we wag the dog?

Actually we had already added such a fix in the past, for another issue.

36e4fc5  "efi: Bump stub image version for macOS HVF compatibility"
https://lore.kernel.org/linux-efi/CAHk-=3DwhKJoDVuUNhf3U7gPXKu4EeZRv-iwwhL0=
prQ=3DU3n8PHiw@mail.gmail.com/

2025=E5=B9=B43=E6=9C=8815=E6=97=A5(=E5=9C=9F) 22:49 Borislav Petkov <bp@ali=
en8.de>:
>
> On Sat, Mar 15, 2025 at 10:09:29PM +0900, Akihiro Suda wrote:
> > There is a huge demand in the macOS community to run Linux virtual
> > machines without modifying the kernel cmdline.
>
> Why?
>
> Why is it so hard to add a cmdline switch for something which is clearly
> broken?
>
> > Also, some users do not want to update the host operating system.
>
> So if there are security updates, they don't want to update either? I gue=
ss
> their problem...
>
> > So it would be nice to have a workaround in the Linux guests as well.
>
> What do we do the next time they mis-read the architecture? We add a fix =
to
> Linux again because the kernel is apparently the most flexible component =
in
> such a scenario? IOW, we wag the dog?
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
