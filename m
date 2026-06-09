Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B5A348896
	for <regressions@lists.linux.dev>; Tue,  9 Jun 2026 09:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997375; cv=none; b=p6oLHBzBQqmmZPVpXLIW+0gLIsWid8dyINXQLkZjU++GXWp7l+XYhOV5/4EQ34e/MQ/2AhsLBrLg1zU/AsUMTC/q54thvfhJz/ebG+ZLroPHAeb5EKcpKRoNEu3t6HX/UXG2KG+eBJShitYXBL5iV4Nc55lYH8bHsQsTRzJUc9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997375; c=relaxed/simple;
	bh=V2pizV5FL3+v/pUXwob1d22DuXvbRGZ/QZQK4MiVfA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCvn364sHb6m1U5k9+LmKF8N5+sPJbEX+gdJkmEXX0cNhEkSjzbFFdC75thj98SUKL1Sq87NzFAnDhJEbG+AF/oxvBFSmZZAttcgC4TWIwIhPndwujcNAXExkTzQAx5r0iPHChUVVTXwD/A2xrgvCs2UOfwCAXIpG79kfIKeGwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGv/7TSF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGv/7TSF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81AD1F0089C
	for <regressions@lists.linux.dev>; Tue,  9 Jun 2026 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780997374;
	bh=0yKUatVn4kkXWaYGNElZeA4eFQRcGLv0dVl4gXBmTUU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HGv/7TSFLXkv/UDrmr8KL9JsjRwvks3xr7qylPz2QV+fW2anDe1xscw1d9TBpGhEr
	 MThGVi1PwiDVAq0yJwX9fMLAoNusLPt597I0BSZuy+MmWQhEhHj1VLyqfIn/gPUnSb
	 T1H3YMh7SW04NhxR5sRw3aNT1Kjl7ko6umhhjU2zZaIIevhyqVZ9Tw2KH3Ga5eKIDB
	 /4vS6qMHU3pbnwCoQiE09UfG65nqCodMSfuzFSsIxbsUzysoxTfxfS87R95FfGtDGI
	 x8XtW77PzRqCYF8YaG3/RtyLdbFX0SDflqS+ZhQomICdrOoRLQ1XDTjRHBNO+eDVqi
	 ldvnlbQK8y3BA==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-beb1bee8c16so689202966b.0
        for <regressions@lists.linux.dev>; Tue, 09 Jun 2026 02:29:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8jHp6W4LoKzlmJhppNhyUVjmvslLYgvBbC9wxsF2y/1YvmnDKznWf+0+bszZ9kHZyeBxhv95OcwwJOcg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhBiXhxroQPMU0tMIBoTTLYalSaERoxI+DUXTDNXjQTxlN4GU2
	mjAZlLA6+9ZWb/Jk+Vr6QNOaiBGJAUVsHRb5/xZpWNOynopbHuUMKYA+KP089nwjkv1gfRqFaj7
	zdmzwhH0EbizNNtwBhUAouLT4oqiEmQE=
X-Received: by 2002:a17:907:8d8e:b0:bed:15ff:5fe2 with SMTP id
 a640c23a62f3a-bf3a8c05094mr764622166b.17.1780997373174; Tue, 09 Jun 2026
 02:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKYAXd80+UfzKaCR9YRK8dAQq9S+kEp_VVwr_p3dj1tEeyqUQA@mail.gmail.com>
 <20260603131950.321858-1-japo@linux.ibm.com> <CAKYAXd-mLHaF6VeREroNfUXYYhqLObr=8Lmv9JqVZ7qu5XO0Dw@mail.gmail.com>
 <aibgj6XWdE2VIPiR@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
In-Reply-To: <aibgj6XWdE2VIPiR@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 9 Jun 2026 18:29:21 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8sB-a17A7AtfVm2BzoEU1oKUik1fu4=eeDCTq8T3r9tQ@mail.gmail.com>
X-Gm-Features: AVVi8CeFUWDyJyP1VKaY8-b928lSrvpleqBk47O2G1CtuvaRUlgm9xcCjiVRR2U
Message-ID: <CAKYAXd8sB-a17A7AtfVm2BzoEU1oKUik1fu4=eeDCTq8T3r9tQ@mail.gmail.com>
Subject: Re: [PATCH] exfat: add swap_activate support
To: Jan Polensky <japo@linux.ibm.com>
Cc: djwong@kernel.org, hch@lst.de, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	sj1557.seo@samsung.com, yuezhang.mo@sony.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 12:32=E2=80=AFAM Jan Polensky <japo@linux.ibm.com> w=
rote:
>
> On Wed, Jun 03, 2026 at 11:34:55PM +0900, Namjae Jeon wrote:
> > On Wed, Jun 3, 2026 at 10:20=E2=80=AFPM Jan Polensky <japo@linux.ibm.co=
m> wrote:
> > >
> > > Commit 614f71ca1bdf ("exfat: add iomap buffered I/O support")
> > > converted exfat buffered I/O to iomap, but did not add a
> > > .swap_activate handler to the address_space_operations.
> > >
> > > swapon(2) on an exfat swapfile then fails with EINVAL, which causes
> > > LTP swap tests to fail.
> > >
> > > Add exfat_iomap_swap_activate() and hook it into exfat_aops so exfat
> > > uses iomap_swapfile_activate() for swapfile activation.
> > >
> > > Fixes: 614f71ca1bdf ("exfat: add iomap buffered I/O support")
> > > Closes: https://lore.kernel.org/all/20260603110212.3020276-1-japo@lin=
ux.ibm.com/
> > > Signed-off-by: Jan Polensky <japo@linux.ibm.com>
> > Applied it to #dev.
> > Thanks!
>
> Hi Namjae,
>
> I think one line might have been missed when applying my patch:
>
>     .swap_activate =3D exfat_iomap_swap_activate,
>
> I checked linux-next (master and next-20260604 / next-20260605),
> and the issue is still present there.
>
> Link:
> https://lore.kernel.org/all/20260603131950.321858-1-japo@linux.ibm.com/
>
> Could you please take a look?
Sorry about that, my bad. Your patch wasn't being applied properly, so
I tried to update it manually and made a mistake. Anyway, I have just
fixed it. Thank you very much for pointing it out!
