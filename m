Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319F8332EAD
	for <regressions@lists.linux.dev>; Mon, 17 Nov 2025 19:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763406018; cv=none; b=TcbqaXBX/v4RJZAXW43JCfFp3L1MvipZBX/efYRsNRqZLUKLlKHBNoLNuEz/Q90ebumPldZRs6iHZiStA6o+IJ0fFS3sndDPe282VnXYfPg9Fc0tjhGiMWWXM6z+nEyPgXSXpg+c5FrkTNgnMOfGFXFHUyTYD4dfNaEptp15f6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763406018; c=relaxed/simple;
	bh=1Z71KeIGjHCvr4Yf1gqld1XX+2FDBVTZVKGrzjJbxxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3cP2kdNnypctsOcCEB14CwDQ5ZDyl2J0Wkcs4OHElfLwEX8SCOOEcPeOls8ZxgvWOqrQ3lg/3C3hFKRRuWS8+XofkLwliy1YKDPp84Sa/6c7f/wGn1zAF+ckMVqIrfo3jxA0uN51eH9/IW6z3LpdHArvr9FiiqcS32IGppaCa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVrZIF6S; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVrZIF6S"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ee13dc0c52so16208521cf.2
        for <regressions@lists.linux.dev>; Mon, 17 Nov 2025 11:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763406009; x=1764010809; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPjPkDIinNVZSYS3cmePjsoG53Y5Y+3flWptj/NxBh4=;
        b=fVrZIF6SSbkKGgHj6cqBNPxfbCSwa9lD6LtJl+1fED/v05xvtPFlSNPTg/vEXjsfHS
         78Ej+uy0sYp36EKQp4xLu2wBwLV9sk0cNrqSDJrOSw/W3845mBSRzf0+H7rugCGHucI1
         GaKE5UWytyDXjBsSHia+gKxNj2BobOEzOLYm1fzmanJRiV1jommjG2RVzf+foTutsRQx
         lzGJk1RpO8uZdJ0n+VlzAzzsx6MLF2k3LoX2LsD050sEzEYVXQd8qbIPJeyvRTlThqXy
         QvD9ycBoflOAq9Gjl3LhcXBjGB3r+VJs1s9lIFUx2nbwZInvaPn7KKJkFaid8HPTs8n8
         ktWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763406009; x=1764010809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YPjPkDIinNVZSYS3cmePjsoG53Y5Y+3flWptj/NxBh4=;
        b=v8+lGQj5ukydMFt44J4DwczEiYpG+hffFm1LOTIsy9STZcJpBwK2+fN9cHuvyJiq0n
         Frf/M8NYMMAcCR6EdSrjGwPlydi+Z4eSINOgJVaJ7xllIvTM5WR9PheoPQO16D0mmvx3
         rdjGCvaRhZsCoa1lsxsNCEtuLRZMzMWK1Icxu6r7xVqRGwWfO9fic9Qb0k3WmTi9xVf2
         l67qx7hb2+A4ECxt3jrq35hoEiTwhIBlx56VvP2EQV7lwlnWq4LM/i/Ctskg1kJzmKDW
         NZCnwpILTpaK83HDq42h6cAht/71RYph6lnj5g12w+GDguZsNS8tgU9v9AdiOONA1yN0
         h4Pw==
X-Gm-Message-State: AOJu0YwTrPfNGloOsAR+bnvc2f+eXuQLFtXx94VmdyeOLFlFNqmp9JfR
	Y6QHKgif5WT/D5WGQjIxy9UwI64Cnkpv5eMVFmMMQJENpTVDr28EDjXxhBLd6f4W7IfGtuu/6V/
	1AwbjDrvTvixMvbGsNeOH6Lccz/qHC8o=
X-Gm-Gg: ASbGnctNzIL0RjGP5LNHDuH6q1F6EMmAcX15fznTNPAs2QG86BaPfgQHgXnf4N9BmPB
	Ru8UI1dEixj2XektTzrbiIpH/BRxgaKc6MN8QcartOUitNX6CTH4hNwQ+8SuMqYdCeQ61+/A4UA
	FRlV1uhP3bKlUDJU0TBdhDwDfcdVcyErC2wkCqrm1vwBI7g2zV1b2aMcd6KjljjGLpG+ndQXyIR
	UEMCLVdwL6tU10mJdAs9QHoOV4zcWhfEnyceJTdBxSS2+5UNIGXqRRc+Bo=
X-Google-Smtp-Source: AGHT+IFK7ZfmITRiSusmw56dcan/vGgct1o01D0a9PkKApL8WeWgDO6Vt7EFQ+qZah2nB4fFuHSvko8809XF/ssfFEs=
X-Received: by 2002:a05:622a:91:b0:4ee:1f09:4c36 with SMTP id
 d75a77b69052e-4ee1f094ef4mr62494771cf.18.1763406008964; Mon, 17 Nov 2025
 11:00:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <mwBOip3XK77dn-UJtlk-uQ1N6i3nwsKticZyQdPYzQcsk0dsjXl4oOAh-Neoxv-0TlpKnt_FEJwx8ses5VJglGLJUW-bIG8KWchtoDwCnnA=@protonmail.com>
 <CAJnrk1ZDEszGbyP4cRh7+mEPu9BLmPrY9Xb-Q3HZnxXZOV7Eag@mail.gmail.com>
 <CAJnrk1aepU0y55FNG3zDHhK4iPo80MtD+tE_PT+ExhD9SDUS_Q@mail.gmail.com> <_Gt41eQ_dnFbfGcMH4LkwSqmCYBdQGfnPdQfBlAWwkohIUfDUwtdvpQa61Pk2FMD4B-ov2uVIG9FUCJu_GT67Qkde7e2oZdnnRMopuglZHA=@protonmail.com>
In-Reply-To: <_Gt41eQ_dnFbfGcMH4LkwSqmCYBdQGfnPdQfBlAWwkohIUfDUwtdvpQa61Pk2FMD4B-ov2uVIG9FUCJu_GT67Qkde7e2oZdnnRMopuglZHA=@protonmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 17 Nov 2025 10:59:58 -0800
X-Gm-Features: AWmQ_bk1uDZrDHZ5dXrtbkLaGrCql30nmH2DzYr6BumfQRP7AuSd-sVdoHd0iVw
Message-ID: <CAJnrk1YhZN9=M92dK6EtTTkuhQW_qco_ikwFHmVE0cgiiUnF8g@mail.gmail.com>
Subject: Re: [REGRESSION] System hangs on suspend after using distrobox container
To: Athul Krishna <athul.krishna.kr@protonmail.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "miklos@szeredi.hu" <miklos@szeredi.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 10:16=E2=80=AFAM Athul Krishna
<athul.krishna.kr@protonmail.com> wrote:
>
> On Thursday, November 13th, 2025 at 12:33 AM, Joanne Koong <joannelkoong@=
gmail.com> wrote:
>
> > On Wed, Nov 12, 2025 at 10:50=E2=80=AFAM Joanne Koong joannelkoong@gmai=
l.com wrote:
> >
> > > On Wed, Oct 29, 2025 at 10:47=E2=80=AFAM Athul Krishna
> > > athul.krishna.kr@protonmail.com wrote:
> > >
> > > > Device: Asus Zephyrus GA402RJ
> > > > Distro: Arch Linux
> > > > Kernel: 6.17.6
> > > >
> > > > Noticed this issue after upgrading to 6.16, systems hangs when clos=
ing the lid of my laptop. The issue is triggered by using a distrobox conta=
iner.
> > > >
> > > > Steps to replicate:
> > > > 1. distrobox create --pull -i docker.io/library/archlinux:latest --=
name test-container --home ~/Containers/test-container --additional-package=
s "systemd" --init
> > > > 2. distrobox enter test-container
> > > > 3. Suspend the system
> > > >
> > > > Bisected to commit:
> > > > commit 0c58a97f919c24fe4245015f4375a39ff05665b6
> > > > Author: Joanne Koong joannelkoong@gmail.com
> > > > Date: Mon Apr 14 15:22:10 2025 -0700
> > > >
> > > > fuse: remove tmp folio for writebacks and internal rb tree
> > > >
> > > > I was able to temporarily fix the issue on 6.16 by reverting 0c58a9=
7f and 7d0f0f06. Unfortunately reverting 0c58a97f on 6.17 causes huge confl=
icts.
> > > > Attached systemd journal logs.
> > >
> > > I missed this in my inbox until I saw Miklos's reply a few hours ago.
> > > Sorry about that.
> > >
> > > I'll try to get this set up on my VM and see if I can repro it. Does
> > > that distrobox command you wrote out in step 1) automatically run the
> > > fuse servers on the container as well? And for step 3) are you
> > > suspending the system with 'systemctl suspend' or are you doing it
> > > some other way?
> System hangs on either normal lid close or 'systemctl suspend'.
>
> > >
> > > From the logs, it looks like it's stuck waiting on folio writeback. I=
s
> > > there a stuck fuse server somewhere that's not completing the
> > > writeback request?
> >
> >
> > Athul, would you be able to test if this patch fixes it?:
> >
> > --- a/fs/fs-writeback.c
> > +++ b/fs/fs-writeback.c
> > @@ -2694,6 +2694,9 @@ static void wait_sb_inodes(struct super_block *sb=
)
> > if (!mapping_tagged(mapping, PAGECACHE_TAG_WRITEBACK))
> > continue;
> >
> > + if (mapping_writeback_may_deadlock_on_reclaim(mapping))
> > + continue;
> > +
> > spin_unlock_irq(&sb->s_inode_wblist_lock);
> >
> Yeah, this solves it.

Ok, then that means there is a buggy/stuck fuse server somewhere on
the system that is not completing a writeback request. If we look at
/sys/fs/fuse/connections/*/waiting  and see "waiting" stuck at a
non-zero value, then that should tell us which server is stuck.

Hmm, I don't think this is a regression because the bug is in
userspace and for a functioning fuse server, the new behavior is more
correct (eg sync() waits for writeback requests to complete). The
patch in [1] was dropped from the original patchset because a
buggy/malicious server could still hold up sync() / the general system
in other ways if they wanted to.

[1] https://lore.kernel.org/linux-fsdevel/20241122232359.429647-4-joannelko=
ong@gmail.com/

Thanks,
Joanne
>
> >
> > from [1] https://lore.kernel.org/linux-fsdevel/20241122232359.429647-4-=
joannelkoong@gmail.com/
> >
> > Thanks,
> > Joanne
> >
> > > Thanks,
> > > Joanne
> > >
> > > > Regards,
> > > > Athul
>
> Regards,
> Athul
