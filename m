Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1827A14830A
	for <regressions@lists.linux.dev>; Wed, 25 Sep 2024 04:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727238970; cv=none; b=sEm/+Vnh+ydFQsqhevJ2NDYiDBT3AhcYvP0bSjGvMBHP1aQNLaWljOmceqas0xKO9ptL5hVo2J4FaVoNffzNYZQl+m4Bk9tdsp59SGAMOGuFCgh76S1D6pnlSlLpT0S5LQ3OpDrgAgkMy0BlhQy401LRukGaYAS6TUV9lIUnTUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727238970; c=relaxed/simple;
	bh=UOXQD3WUguasG8ga/rsJ7nniFs14EREwDyZsaOO+A7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXCYRuAlgrkunLrIfjRKmWLlRdVRgl/ovt/Vzom1BoxFWr6MOOmhNMHhjV/xKK9t0I0gyCAAYwiJ4+fJ0njpELVaaRaViugT3+GU+8LckXFXhGXTbOjCYkEkBAqu/cef8D2+kKPdFiC/8dV3JVhAMbQ4KFVTClKK3jqQvnSx5y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRd/F7cB; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRd/F7cB"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6dbb24ee2ebso56994537b3.1
        for <regressions@lists.linux.dev>; Tue, 24 Sep 2024 21:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727238968; x=1727843768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Dbh/snsTzDjwbA/EnAiRnMPe8l37al2ncHhcm3o1XE=;
        b=kRd/F7cBuUJs5u/vHH3fw8Jp3jGTtrmmbAYsnApIr8AfcUvL9a8F+HYa+bLhCPdicO
         C+pt5COhq+s8lUOZGiGHFvDwZJWMoObkKwPDi8GXffkr4PeVIymmv4ij6Qy6hmV7HPbA
         zxC+Ah4AtMCDYXwI8Rqx0lYBnQwP24V1OnS6ph8oZmMr9EuHGOAdV0j+PQkVEkw1Gbke
         TvbUSMFkWjqTfC6BH+ZA7AnmT2fBaiB4LJmt7YBR9e8IptpuUMdadVWm5YhpGYKH0DaQ
         uDncQ1qKd7c/kKxuzf+RxvnukdPEpqtlYq44nA/CVRtL0/yn+o0m3KlSDFuj1tUc7DQS
         BpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727238968; x=1727843768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Dbh/snsTzDjwbA/EnAiRnMPe8l37al2ncHhcm3o1XE=;
        b=dy41WBpBntoZm5ikeeAVWq2ix7vEJf8b2RDiESsIp9SJ2NvyKUU13XUEm4d1FMXOc3
         sIAnyR+VEv/eFP/tJwIb69DgF3RjjdP0YGDKmkKAT4dx1YC4lsozYQXFw1Bnb9jPVmts
         tFR79WKeaUp/I2jyzfeanOrDPY3XN9DoDS5QfMPo/k19tyFG0wIvalvnTh9ksELk5wKt
         4ViT+CGGvhtMlJTK7lGZ4c6OgxLRU4ZO1AXUbN0dzgNxhdGIWEU4qE0Ey9SRfiWS8tMa
         7Yz2VISH0oSy/owv/D9Dm65vIvFBo6veSwlEvLh9sJlbguQmTbQN4kU0CgdVvGp70k/B
         Drzw==
X-Forwarded-Encrypted: i=1; AJvYcCU9+3imxym/xCCp2M03c/zUyITNKr++mxJPtb094j6qxAcBPgvRgLaxkvxTxKsZ4gqXb4nC20ywbU3A7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YygB1X8m+Ake71P7KbPLm0l+cQmrZ2HoQoAUMRiJMRgj9dfvT4L
	lSIDyKzV4yfoLFwPKlOb8Zs/DTRD9RpT2//hgB5/J/CR8wctFVguUvxezovHmvTujFob5bu8+eQ
	OeR1TRyuWdOyOqNjP2UHp1yQmd98=
X-Google-Smtp-Source: AGHT+IEMCkbHJPjWTIbhuDjdTUp5YPgEbW71NF2008J32OEt7oceB/j1sGS7llDsqgOUP8IV1rk7HGWXxNapjOdZxwM=
X-Received: by 2002:a05:690c:c:b0:6d3:f51b:38a3 with SMTP id
 00721157ae682-6e21d9ffab7mr14155507b3.33.1727238967841; Tue, 24 Sep 2024
 21:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DFC1DAC5-5C6C-4DC2-807A-DAF12E4B7882@gmail.com>
 <20240923075527.3B9A.409509F4@e16-tech.com> <CABaPp_iqgUw3TffQHrVYUoVoh03Rx0UjvrNw0ALStF8FxufFrg@mail.gmail.com>
In-Reply-To: <CABaPp_iqgUw3TffQHrVYUoVoh03Rx0UjvrNw0ALStF8FxufFrg@mail.gmail.com>
From: james young <pronoiac@gmail.com>
Date: Tue, 24 Sep 2024 21:35:56 -0700
Message-ID: <CABaPp_hf8haF20YCipL0cdB6NQPMHue45n1fmEUvo_BL_Wuyfg@mail.gmail.com>
Subject: Re: [REGRESSION] Corruption on cifs / smb write on ARM, kernels 6.3-6.9
To: Wang Yugui <wangyugui@e16-tech.com>
Cc: pronoiac+kernel@gmail.com, stable@vger.kernel.org, 
	regressions@lists.linux.dev, linux-cifs@vger.kernel.org, 
	David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org, 
	Steve French <sfrench@samba.org>, smfrench@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On request:
* adding another cc for Steven
* I tested 6.6.52, without any extra commits: it was bad.

-James

On Mon, Sep 23, 2024 at 12:36=E2=80=AFPM james young <pronoiac@gmail.com> w=
rote:
>
> Hey there -
>
> On Sun, Sep 22, 2024 at 4:55=E2=80=AFPM Wang Yugui <wangyugui@e16-tech.co=
m> wrote:
> >
> > Hi,
> >
> > > I was benchmarking some compressors, piping to and from a network sha=
re on a NAS, and some consistently wrote corrupted data.
>
> > > Important commits:
> > > It looked like both the breakage and the fix came in during rc1 relea=
ses.
> > >
> > > Breakage, v6.3-rc1:
> > > I manually bisected commits in fs/smb* and fs/cifs.
> > >
> > > 3d78fe73fa12 cifs: Build the RDMA SGE list directly from an iterator
> > > > lzop and pigz worked. last working. test in progress: pbzip2
>
> This is a first for me: lzop was fine, but pbzip2 still had issues,
> roughly a clock hour into compression. (When lzop has issues, it's
> usually within a minute or two.)
>
>
> > > 607aea3cc2a8 cifs: Remove unused code
> > > > lzop didn't work. first broken
> > >
> > >
> > > Fix, v6.10-rc1:
> > > I manually bisected commits in fs/smb.
> > >
> > > 69c3c023af25 cifs: Implement netfslib hooks
> > > > lzop didn't work. last broken one
> > >
> > > 3ee1a1fc3981 cifs: Cut over to using netfslib
> > > > lzop, pigz, pbzip2, all worked. first fixed one
>
> > I checked 607aea3cc2a8, it just removed some code in #if 0 ... #endif.
> > so this regression is not introduced in 607aea3cc2a8,  but the reproduc=
e
> > frequency is changed here.
>
> I agree. The pbzip2 results above, regarding the break bisection I
> landed on: they mark when it became more of an issue, but not when it
> started.
>
> I could re-run tests and dig into possible false negatives. It'll be
> slower going, though.
>
>
> > Another issue in 6.6.y maybe related
> > https://lore.kernel.org/linux-fsdevel/9e8f8872-f51b-4a09-a92c-49218748d=
d62@meta.com/T/
>
> In comparison: I'm relieved that my issue is something that can be
> tested within hours, on one device.
>
>
> > Do this regression still happen after the following patches are applied=
?
> >
> > a60cc288a1a2 :Luis Chamberlain: test_xarray: add tests for advanced mul=
ti-index use
> > a08c7193e4f1 :Sidhartha Kumar: mm/filemap: remove hugetlb special casin=
g in filemap.c
> > 6212eb4d7a63 :Hongbo Li: mm/filemap: avoid type conversion
> >
> > de60fd8ddeda :Kairui Song: mm/filemap: return early if failed to alloca=
te memory for split
> > b2ebcf9d3d5a :Kairui Song: mm/filemap: clean up hugetlb exclusion code
> > a4864671ca0b :Kairui Song: lib/xarray: introduce a new helper xas_get_o=
rder
> > 6758c1128ceb :Kairui Song: mm/filemap: optimize filemap folio adding
>
> No luck: I cherry-picked those commits into 6.6.52, and upon testing
> lzop, the file didn't match the stream, and decompression failed.
>
> Thank you for investigating, and giving me something to try!
>
> -James
