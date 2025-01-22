Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4EC84A3E
	for <regressions@lists.linux.dev>; Wed, 22 Jan 2025 22:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737585471; cv=none; b=MdbMDQRVwV3Ou/zmQILq97XRgu0R/57M+hryy8LvBC9i3sZxeZQaWR/dcmdg4kzF7n26fiY+ru/qwcFpmHarWihp7hziSC+DKuiFKzbHhsm6fHgvvvcBvWz4VTG6XNz/ISVkYDh3ur7sleg0DYaOMRp0YQHh37YPz0HxJwAd8TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737585471; c=relaxed/simple;
	bh=muQHKH+YtVhs47z/cQO4qQSWMU8f3qzDbgNESrFc+dM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTkHWn9MvybQoLtwIwMgLClOCtk3/MuiIyZiwCapC3iKqa0+/BM+PsALSx/yAwe+11N62jqJV396DDf0v9Is/F+XMAf5ppQNS7CyXV+GvrMkSiPep437NWfJHzfwTj5ErVn6A8pX8ChITA100SlDIuHw8aaVbiKvaokBDY1bOZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zC+S4Esf; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zC+S4Esf"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-467896541e1so97851cf.0
        for <regressions@lists.linux.dev>; Wed, 22 Jan 2025 14:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737585468; x=1738190268; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNWPmlwGRos1SZFW6JfxWy7NUgqHSwSZwtnxl8s4MEk=;
        b=zC+S4Esf5xA79GqXhL18/0gdi56R6uLmWdopzCG09oY20+1hTURoOq/yg1A4meZiyr
         4elkv3yrt8a2EUfUVndaf6LEFwXm31BdgV7DNGgej6NpQwIClR6J3voO9Nqpv17h4XWd
         jeeow+6om3VYLp5bNvANW5huUzjUYzJ/mm7KUN3wdsMqZQMW5UKifuFbHXQFGncSHK9n
         KlkAQ+cWXjSxlK4g37nr5M1oHB0nKHJG8mnjANPKjkaDX314Tb3XCFHOUJQJZ/773tcH
         RowHldhZmY32wsEHe9BhfPlmnc23iYJr6OBaCQydsU3/HMXBBEQsfQq+cOjWcdqly5ia
         DqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737585468; x=1738190268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNWPmlwGRos1SZFW6JfxWy7NUgqHSwSZwtnxl8s4MEk=;
        b=Lu4HeDLd1C2drDhdmYmGrVWdY7FXboR6587zEx6qV5Lgk/NoNvVPV+EIlhsQCu7p3B
         9kq7pspF3zS+QuH2rkXVZCP1fH0AtlOAbY2zgv+bgs1ZmAxpn19Euz/GhF1FwikelL6v
         gcvdJe9WwIneG7pnoPZC5Gai2KKXOWse+iFYDvM9rhuOgePlh2mFFuzbEG9ABB9YyMXy
         tAaKcVD2DHsqQRIPFXZSOMRO7XJh1U9a5OumDfIyPIOLowHlmvJE96Z40JqUu1SEG+Hs
         Si5xkvvlbbEjKhxMe3QTz9EoMQDB8ssoKJuMkLkX2JZWCTt/hpBDdNmyDQsG/SI3oUob
         jtCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwuw1akJ9h8Wm2PHCv1faXqnfhX5P6lMP2YpmtNwp0uX3ddBX7gZuf/OsoCVbo7a8Kv31d1xpsDBt38A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBJ5jWBsEK9vS8hlTC0f3+YzlRCDzuEZ8S7KnqLMpB+Wk5h+RL
	9mtZ4n9fKLZrsm1m/6I4FdjgVnY+h4PxV9MwQiXn+Cdb6S1Vtt/7OXBQq0amllDHxKsWeIzeNuY
	ruR7BYMHRY2ovO+LyAP2p3dcnb7uJfjNM5Moa
X-Gm-Gg: ASbGncuU8zJAPtirp2XKxLvafwrUugFah9OJo0Eoc5VUgz2IB++s8AFShzL7jbej5iO
	Wxyut4s/GMO5UMCihkeknHllxDGaTSg1pzokLz1stVSXk7RgxjIr77/iGa+coF2aHywvtLP0/dD
	N4ho8=
X-Google-Smtp-Source: AGHT+IE7sdb1UO7lPrISBGAhpx5JEvuTlWU+6OO+ygvNWlmkeAdywMg6ssKZ6NWKbxANm+Cry9tUm/RyIi756qhPSFI=
X-Received: by 2002:a05:622a:1b8e:b0:46c:791f:bf2f with SMTP id
 d75a77b69052e-46e5da99a74mr280031cf.1.1737585468033; Wed, 22 Jan 2025
 14:37:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120212839.1675696-1-arnd@kernel.org> <CAF1bQ=QFxE8AvnpOeSjSeL1buxDDACKVNufLjw99cQir0pyS_Q@mail.gmail.com>
 <c5855908-df1f-46be-a8cf-aba066b52585@app.fastmail.com> <CAF1bQ=SEybO_+UMDqspA+9OecYqJhE56D-zJyxEUiPcj+Af_fA@mail.gmail.com>
 <04db1d00-8801-4d29-bed9-54b2cc39e4fc@app.fastmail.com>
In-Reply-To: <04db1d00-8801-4d29-bed9-54b2cc39e4fc@app.fastmail.com>
From: Rong Xu <xur@google.com>
Date: Wed, 22 Jan 2025 14:37:36 -0800
X-Gm-Features: AWEUYZm3KSmYxfUanGEFArAdq_FoZxyzTMm-E5VEa9MroDn3oTe2JaMTTo7tTxs
Message-ID: <CAF1bQ=Q+FLu=RYT5tVT0Nrre72w-_sgXMw=sr0MBXhgudbJn4w@mail.gmail.com>
Subject: Re: [PATCH] [RFC, DO NOT APPLY] vmlinux.lds: revert link speed regression
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Jann Horn <jannh@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 12:30=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Wed, Jan 22, 2025, at 19:47, Rong Xu wrote:
> > On Tue, Jan 21, 2025 at 1:18=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> w=
rote:
> >>
> >> On Tue, Jan 21, 2025, at 18:45, Rong Xu wrote:
> >> > On Mon, Jan 20, 2025 at 1:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.o=
rg> wrote:
> >> >
> >> > Yes. The order could be conditional. As a matter of fact, the first
> >> > version was conditional.
> >> > I changed it based on the reviewer comments to reduce conditions for
> >> > more maintainable code.
> >> > I would like to work from the ld.bfd side to see if we can fix the p=
roblem.
> >>
> >> Makes sense. At least once we understand what makes the linker so slow
> >> and fix future versions, it should also be possible to come up with
> >> a more effective workaround for the existing linkers that suffer from =
it.
> >
> > @Arnd: Can you send me the instructions to reproduce this regression?
>
> My report had linked to the config that I saw originally:
>
> >> > Link: https://pastebin.com/raw/sWpbkapL (config)
>
> This is for a x86_64 build, and I used 'make savedefconfig' to
> simplify it, so you have to copy it to arch/x86/configs/test_defconfig
> and run 'make test_defconfig' to get the full file back.
>
> I have also uploaded a reproducer to
> https://drive.google.com/file/d/14xWdD_S51XBgV6kOajLvdtOef7tQTZQq/view?us=
p=3Dsharing
> but it's fairly large. The reproducer is from ld.lld --reproduce=3D, but
> you can simply unpack it and do
>
> x86_64-linux-gnu-ld.bfd  -m elf_x86_64 -z noexecstack --emit-relocs --dis=
card-none -z max-page-size=3D0x200000 --gc-sections --build-id=3Dsha1 --orp=
han-handling warn --script home/arnd/arm-soc/build/x86/0xA8B23FFD_defconfig=
/arch/x86/kernel/vmlinux.lds --strip-debug -o .tmp_vmlinux1 --whole-archive=
 home/arnd/arm-soc/build/x86/0xA8B23FFD_defconfig/vmlinux.a home/arnd/arm-s=
oc/build/x86/0xA8B23FFD_defconfig/init/version-timestamp.o --no-whole-archi=
ve --start-group home/arnd/arm-soc/build/x86/0xA8B23FFD_defconfig/lib/lib.a=
 home/arnd/arm-soc/build/x86/0xA8B23FFD_defconfig/arch/x86/lib/lib.a --end-=
group home/arnd/arm-soc/build/x86/0xA8B23FFD_defconfig/.tmp_vmlinux0.kallsy=
ms.o
>
>     Arnd

Thanks Arnd. I can reproduce the issue with your files.

The slowdown was caused by the following change in elflink.c:

commit fba1ac87dcb76e61f270d236f1e7c8aaec80f9c4
Author: Tomoaki Kawada <kawada@kmckk.co.jp>
Date:   Thu Jun 16 09:54:30 2022 +0000

    Fix the sorting algorithm for reloc entries

    The optimized insertion sort algorithm in `elf_link_adjust_relocs`
    incorrectly assembled "runs" from unsorted entries and inserted them to=
 an
    already-sorted prefix, breaking the loop invariants of insertion sort.
    This commit updates the run assembly loop to break upon encountering a
    non-monotonic change in the sort key.

I haven't looked closely into this. The fix is most likely valid. But
the code might not be efficient.

-Rong
