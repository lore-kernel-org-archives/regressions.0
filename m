Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C86B2E7657
	for <regressions@lists.linux.dev>; Mon,  1 Jun 2026 08:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302719; cv=pass; b=dxF4wQipZieI1ac79y4VGCw9AoLfv3SuTyboWlMrbm9H69qAYuT2Qn5f7/HTS0slJyylPv9UkOYiH7rD4V5NwOJIrWztBJdOOX1gz3Y/3eegWl66ZfXd/bNu7h1AVwGUU4gnqvcHhqeTy7s7znLAK/DcaYZy7dutkJ6hDjZsF3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302719; c=relaxed/simple;
	bh=QOVrh1FbwZicINPjAxgtLi4dWQT7CNzOI6a3e85aE/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBvxl5j2FZPTTXW9VL9ez5fzWNvguq3fA2HGmXQ1X+ulaMykpEVbr32gbFHuMevbQUpIbrrckrBzRUZBBNBw22D0FwKU6czd8fYvbkrBOjMYbNTbrwX54V+4OKUyZ/46kWLpWxP0SghSgg+yZsvmkOsOCUy9NDEmjtj0MAzzO14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=bkLJADJs; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="bkLJADJs"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-516df7b256bso47670211cf.1
        for <regressions@lists.linux.dev>; Mon, 01 Jun 2026 01:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780302716; cv=none;
        d=google.com; s=arc-20240605;
        b=JryCUI9bsfDXT7P9llPtwZiv5BD6riJGdXs2Gf52zrPNcEO1t5kCupmJjlDpYci97c
         vJUW0d24M95nUX1fUlzO450/VsElNMtOVwsB/EAqnv8WNCsoVJ48LDvf2cLddQ3nunev
         U9GnG72ZY3GwZW90HXLVjyRL7IA683X41YXP6jT0AmrAMFVQkwBtle/Iqas1Qw/mh/3x
         UoUaUKGScP5EKzdvPBtHwGqe8+XPaSTfGkBvD16cBgfnNnMpYA65NwvFxg2poYMDg48b
         7ZENLlCH5FjVq4c/tn22AN88HaZdNBS3PjA2Fm0DyyObaMcH/ljdDkcwGexLQ0Vx0t3R
         Zsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9zCuIe74ELqugw1lXwosD6GadoLnKPFUrjvsZt3Tyts=;
        fh=GMzhUCOkiCgfiyulUGoR8ARYzq5B8QTrbIy2SGYeMkc=;
        b=gJuq0KniFMAizAV0QzT+XL6eKZIjDC6BtV2wBL6Stn1Af05yyKiZecnF/7PaRgnzrB
         MHuaF6l6RuhmrnqAeU7ndqcVmlMY2OdnmJVSi5nifgQBTkcNDGRW/rTOFp1t/uozYU8e
         x9pzAFdiRRbRGgSyTWhA8cZp+fwg4i6Vb+GtWO0WJWk0aL0DH5/tMNE30otD0gPc3bNC
         ux4jLu/abhPesxjKyz5awUkivqjrtvNl5DNXQgPlYv1S/cgDkZRoV4YHSdKxnA1Mj+TT
         pVRyiMb8fVHo2vD4EUZHfISRvPlC5kCHKXwtrnVOXhk/qjI+uxKGAjXoVaUkrBJmDB6a
         SdYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780302716; x=1780907516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zCuIe74ELqugw1lXwosD6GadoLnKPFUrjvsZt3Tyts=;
        b=bkLJADJsF8yIjFtX8PxvlLmsxnRvDKBa2f8G6IHs47ff8e2j4fS1aPHGH2F9E4fdDr
         j+equOpGDdOs/fUOoxJRYhKuL4rroMR6qRNHUttO79F9G/hQ5PQ2SEOdSJizLr8cDjZy
         YaGg0+mMPzzhqQY2LnSsq8lieACvF2NU5Ka40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302716; x=1780907516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9zCuIe74ELqugw1lXwosD6GadoLnKPFUrjvsZt3Tyts=;
        b=L7UrW76IC7vxmjjKqqE74ucJpis8QTc7zfReMejHZ7EhgYujR4wEXHJ2EothOcLnBf
         iV2qNlhZD5jhWBUGp+GB00X+E4RP98d2y/aKxdlLQ8xskfC1ilwRpE49e5bKauZF0k3a
         GfzjFWbyGHJKsZ6LbXU0ve9r2XMUWasHZY/gf2oEy2lEkWlE2vD3Fd5IeP0Eq0sJx1Zr
         cCVFyPtRatCrlt8yIAwel+h0hwg11HpHL8kRGg+6qP58pFStJqOYWfbm2vDyAKjFiUJu
         tGdHpzSuL54TNWwm0pksyXBsGwu9fLb9c/gebOvtGl4jQUXGw1AG69h9nM9rWRYv6AXt
         OP0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9jpXpWWHtsM0Oc42JdBPY7XH28cdm5EKcqcPVpv56O7g49RyldZG6grPsXGfpe6mZjttesSLgiQDEYtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXB4LoMyTnxpgrenXwFFqGk6IQGpzm1BpRWmGzPMuCrgZvlArz
	aOWkL41JJTscbAKjLosEmA9d84sggCI85kjG8W7Z97nHJ1qrGm1Oi9g1sg92e48n6vlwCuzyWXe
	7w6uzseZUwUeZP7gfxrT2RVredRv+ZxKtWzAfMawFYQ==
X-Gm-Gg: Acq92OFSmL/7j4QZNqwW4T0FM1KWr9g6RPn2lV7BkP9LJQNMzLvDKMK27yIyP60e5Ap
	D/NIR/eBoTFWVBagWGeIqnoyy8miaX5dipkzp0TW0RFhtQm0pN0HwvbMl1Qat7F+Gmor6S8Wr9E
	7Z0suGWkQq/wG/85APKp/+Zf2mV6vhfoUafIcCNR7w/lcI9I8ninqZ7gKwVZnXwRxiQT2NCRkWj
	qUT8NxgSryyhr6miZ+odusTGODdjwx9wr5/4CP/DQqSUlxxIjI8rksEguIfkh3eZv2B35aQqoWj
	2EEa5DwMRU9+EKauZHjOCjmBqUALPgZb/RUyoa1Hp5Mij0SMBw==
X-Received: by 2002:a05:622a:1e85:b0:50d:83a4:2995 with SMTP id
 d75a77b69052e-5173a734ea3mr136021221cf.21.1780302716350; Mon, 01 Jun 2026
 01:31:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFbF8N7++zopZuEcsKRxBV_sgOGCbzCY0hOyMw1SiGAtuzGhyQ@mail.gmail.com>
In-Reply-To: <CAFbF8N7++zopZuEcsKRxBV_sgOGCbzCY0hOyMw1SiGAtuzGhyQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 1 Jun 2026 10:31:44 +0200
X-Gm-Features: AVHnY4LE7eOT2gpMeRX9HfjuDk28txdWMk79He47NTx4XuEv3dO-iZ4wnJqEPwU
Message-ID: <CAJfpegsCJnMfn_BzzTK7m9ndCGVsnPit8ZsT0fzAhYoY+yOsKQ@mail.gmail.com>
Subject: Re: PROBLEM: FUSE_NOTIFY_INVAL_ENTRY leaves stale negative dentry
 after c9ba789dad15
To: NeilBrown <neil@brown.name>
Cc: =?UTF-8?B?0JDRgNGC0LXQvCDQm9Cw0LHQsNC30L7Qsg==?= <123321artyom@gmail.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Cc: Neil]

On Sun, 31 May 2026 at 03:12, =D0=90=D1=80=D1=82=D0=B5=D0=BC =D0=9B=D0=B0=
=D0=B1=D0=B0=D0=B7=D0=BE=D0=B2 <123321artyom@gmail.com> wrote:
>
> Hi,
>
> I am reporting a FUSE/VFS regression introduced by:
>
>   c9ba789dad15ba65662bba17595c0aeaa0cfcf1c
>   VFS: introduce start_creating_noperm() and start_removing_noperm()
>
> After a FUSE filesystem returns a cached negative lookup for a name, then
> later makes that name visible and sends FUSE_NOTIFY_INVAL_ENTRY for it,
> readdir() can list the entry while stat()/open() on the same path still
> returns ENOENT.
>
> Bisect result:
>
>   good: v6.17
>   bad:  v6.19
>
>   first bad commit:
>     c9ba789dad15ba65662bba17595c0aeaa0cfcf1c
>     VFS: introduce start_creating_noperm() and start_removing_noperm()
>
> Adjacent commits:
>
>   bd6ede8a06e89ca5a94a8b51cea792705d1b8ca2 GOOD
>   c9ba789dad15ba65662bba17595c0aeaa0cfcf1c BAD
>
> The bad commit changes fs/fuse/dir.c:fuse_reverse_inval_entry() to use
> start_removing_noperm().
>
> I attached a minimal libfuse3 reproducer. It does:
>
>   1. lookup("config") returns ino=3D0 with non-zero entry_timeout, causin=
g
>      the kernel to cache a negative dentry.
>   2. The filesystem makes "config" visible.
>   3. It calls fuse_lowlevel_notify_inval_entry(root, "config").
>   4. The test checks whether readdir lists "config" and stat("config")
>      succeeds.

Yeah, issue is that start_removing_* all work on a POSITIVE dentry.

FUSE_NOTIFY_INVAL_ENTRY works on both positive and negative dentries,
doesn't care about the inode (or lack of it) at all.

I've not dug myself into this work, so not sure what the concept here
is, or how this should be fixed, but this is definitely not (just) a
removal op.

Thanks,
Miklos


>
> Build:
>
>   cc -O2 -Wall -Wextra repro.c -o repro $(pkg-config --cflags --libs
> fuse3) -lpthread
>
> Run:
>
>   mkdir -p mnt
>   ./repro ./mnt
>
> Observed results:
>
>   Linux 6.17.0:
>     notify_inval_entry rc=3D0
>     listed=3D1 stat=3DOK
>     GOOD
>     exit code 0
>
>   Linux 6.19.0:
>     notify_inval_entry rc=3D-2
>     listed=3D1 stat=3DNo such file or directory
>     BAD
>     exit code 1
>
>   Linux 7.1.0-rc5-00426-g670b77dfebe7:
>     notify_inval_entry rc=3D-2
>     listed=3D1 stat=3DNo such file or directory
>     BAD
>     exit code 1
>
> #regzbot introduced: c9ba789dad15ba65662bba17595c0aeaa0cfcf1c
>
> Assisted-by: OpenCode:openai/gpt-5.5
>
> Thanks,
> Artem
