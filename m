Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96AF2F3A
	for <regressions@lists.linux.dev>; Thu,  6 Apr 2023 22:40:55 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-4fb2f8d7716so1642609a12.2
        for <regressions@lists.linux.dev>; Thu, 06 Apr 2023 15:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680820854; x=1683412854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFfBcibv+zKn0+T3VThsPYfN0XsCHJSgTIVTEgQwORM=;
        b=RQ5CvbQfeWPRZuRgMYa8TRlKB56nXVAm9C472p7dc2DKm2SY7IUoQXj8ZKlpYMaumI
         OVnPNiaUvRKLc8DKYyjInU3my3tcaptMC/vintswr0rjLQ/2oUlOugAaa9wnypnIM8Ox
         5qpj30bNcUOBqbQNbLpAor+nIlovOFAspbmcuyyO0VqYD6YSYqN8BEAgNYVBnLrH8tkX
         lhDepAJ/pVVlxt1A3hT6MlDB1JNn0FaR1EU736aku8kJtMY5JUfaGl40KRzAs8CXybIt
         fGm75PCNLzUWWRhhi/+g0Pk97x6FpTsM9L0QWOJKgEcBFeKfYf6D6SmNOcbXOHNn9w0U
         azbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680820854; x=1683412854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFfBcibv+zKn0+T3VThsPYfN0XsCHJSgTIVTEgQwORM=;
        b=FxUX5hT/zhDwdHCym45zho/8CEG6/arWoZuSVpvLKCD3GfY3q1fSStahmu4tz3lPt6
         nzYJ2j293/Nwt75E2GJX1S0+oHKuEBWu2GVIhY2CoMaAbCO41QABt/IVqVK6g4EMNmr5
         hdS3n817XgtRuVlodYsoQxjyVld4nVd/+nvSrRKfUQY/JtmHQjI4Cy0hCAByRv/VNmTI
         B8k2nrmTV1WgkSBV2C9i49Di8SYyjmXbLpIfsR9YpYHNyUL7ftu4a+pVGOMCm1+chbBM
         eMKdICYItpz0mk1oyezXNIUFxE7wHaGKHBqFXXgZLLr84q4hwcPT3iwzJ+3I0C79RGGi
         SYWw==
X-Gm-Message-State: AAQBX9cZ+fUJ2gyjJvkNISqFOGYJrEr7QsnWAf5qbWC7V31frQRxJbi1
	miU8qXB/vUq221RYdSJoDFP/FqAeOjeOD8I+5RM=
X-Google-Smtp-Source: AKy350ZU46g2BLFOK3mgQp2BpBZJ4ogsOm/M46stCnXrjvKTxV/wju5Uz1LZ+X1UkUK9cSVtF5+j7Jr5fNaDlCQQrAA=
X-Received: by 2002:a50:bb23:0:b0:4fc:8749:cd77 with SMTP id
 y32-20020a50bb23000000b004fc8749cd77mr569174ede.3.1680820853617; Thu, 06 Apr
 2023 15:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aa1fb69e-b613-47aa-a99e-a0a2c9ed273f@app.fastmail.com>
 <1334e2af-b55f-3bb2-6e1a-6ab0b0ef93f0@leemhuis.info> <20230406154732.GV19619@twin.jikos.cz>
In-Reply-To: <20230406154732.GV19619@twin.jikos.cz>
From: Neal Gompa <ngompa13@gmail.com>
Date: Thu, 6 Apr 2023 18:40:17 -0400
Message-ID: <CAEg-Je9EczN14CyTqb22Wtz8nUMty0OvwCBbq2RdXwBf3=pCAA@mail.gmail.com>
Subject: Re: LMDB mdb_copy produces a corrupt database on btrfs, but not on ext4
To: dsterba@suse.cz
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	boris@bur.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 6, 2023 at 11:52=E2=80=AFAM David Sterba <dsterba@suse.cz> wrot=
e:
>
> On Wed, Apr 05, 2023 at 03:07:52PM +0200, Linux regression tracking #addi=
ng (Thorsten Leemhuis) wrote:
> > [TLDR: I'm adding this report to the list of tracked Linux kernel
> > regressions; the text you find below is based on a few templates
> > paragraphs you might have encountered already in similar form.
> > See link in footer if these mails annoy you.]
> >
> > On 15.02.23 21:04, Chris Murphy wrote:
> > > Downstream bug report, reproducer test file, and gdb session transcri=
pt
> > > https://bugzilla.redhat.com/show_bug.cgi?id=3D2169947
> > >
> > > I speculated that maybe it's similar to the issue we have with VM's w=
hen O_DIRECT is used, but it seems that's not the case here.
> >
> > To properly track this, let me add this report as well to the tracking
> > (I already track another report not mentioned in the commit log of the
> > proposed fix: https://bugzilla.kernel.org/show_bug.cgi?id=3D217042 )
>
> There were several iterations of the fix and the final version is
> actually 11 patches (below), and it does not apply cleanly to current
> master because of other cleanups.
>
> Given that it's fixing a corruption it should be merged and backported
> (at least to 6.1), but we may need to rework it again and minimize/drop
> the cleanups.
>
> a8e793f97686 btrfs: add function to create and return an ordered extent
> b85d0977f5be btrfs: pass flags as unsigned long to btrfs_add_ordered_exte=
nt
> c5e9a883e7c8 btrfs: stash ordered extent in dio_data during iomap dio
> d90af6fe39e6 btrfs: move ordered_extent internal sanity checks into btrfs=
_split_ordered_extent
> 8d4f5839fe88 btrfs: simplify splitting logic in btrfs_extract_ordered_ext=
ent
> 880c3efad384 btrfs: sink parameter len to btrfs_split_ordered_extent
> 812f614a7ad7 btrfs: fold btrfs_clone_ordered_extent into btrfs_split_orde=
red_extent
> 1334edcf5fa2 btrfs: simplify extent map splitting and rename split_zoned_=
em
> 3e99488588fa btrfs: pass an ordered_extent to btrfs_extract_ordered_exten=
t
> df701737e7a6 btrfs: don't split NOCOW extent_maps in btrfs_extract_ordere=
d_extent
> 87606cb305ca btrfs: split partial dio bios before submit

At least from Fedora's perspective, we've shifted to the 6.2 kernel
series now. If it's reasonable to get backported to there ASAP,
that'll help for Fedora (where this was discovered).




--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
