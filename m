Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A2A277C88
	for <regressions@lists.linux.dev>; Mon, 28 Jul 2025 17:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753725356; cv=none; b=Lp0jZd7AFlcWEh2fhbg1rJYnEb27Xm5s6r2PP2FGZJhzGV7QYe7bNfoo7Pv36A8deIq2lLHYqS3Q6sp44yawpmEMb8A67KQCZWgl8Px7s8MJsfrVsvY8YWH3BqBGNNqGz2fThlhXRRmtJR62ezU5g+AY6fVHXab9qjKqxjo1jus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753725356; c=relaxed/simple;
	bh=xblCDj0RCsFTuq9WZK/qP7W0pwWR0kB14FpwE2VUBHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYvRTnLxcDm2GYCho7wIxIWDYbmi7G/A3EQ1EVYyFHB1HOPUWu1jdAj2eNWiJuuX177kHAKJ7E2gVxMDtgYIRTtYZhFUr2/jRjmCYJK0jWi5xxUcJ0sFHBlboi7UbbUbho4PGU57DFbUT1vxZpj5xmn1WVsqZzf64gHzoV9kKEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqQyYwcj; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqQyYwcj"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ab61ecc1e8so37327171cf.1
        for <regressions@lists.linux.dev>; Mon, 28 Jul 2025 10:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753725353; x=1754330153; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aobxU+eSgbfZ9X4crn912/FDn8oN2UrA+EAoV9ASOEk=;
        b=HqQyYwcjpLdeCBgOEtZEJ/nO3ddDPwLhhmtCRvhmGkjqP7GLY6zhff1KoSZ+gDQrNU
         vdCtFMZeNwjh7mZal4eTKgqy7TAX7i6MA+5FadTzS9zDM9DpmrCQPIoa81/NnSZQBWh2
         Gc80M7ILxL9nyq8RevvEn8YUb0E2OSZJavHYk61M2Mh0dtP8M96sVR9m35vI81k73/n7
         ESfodlgBdySdvhn3s03E9VSIZ1RyTWqHLchL0ib0pkMgQNzJf5vmEKQoIxaU0xjujuBr
         F8Mi0KEmHhJ8rN6KOZG9kuvZanQyTNumRxnXSZiCawumodqPiTawE7Rw3atHbFjxVbGH
         gDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725353; x=1754330153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aobxU+eSgbfZ9X4crn912/FDn8oN2UrA+EAoV9ASOEk=;
        b=tFvihTMchxOw8hjc5J4YbT+tstUksbHcTLcMyV57leJ4W51FEsjYYK+hFKoy3cEDEA
         AudAE6WYcuys7iwhS/b+uL0COsklqeLm7eBkXfT4J5ybJbXxlmsqzj7U2tFq+nGrV1NB
         sYt07Pn7dPgMu0TMGKQDsIg3vLOUi7GkSQprNzfm9jC4dHMytU+sOjglmm5S4o3nFCwV
         klg4/vXOmbkQbB7G5FDTxiiqfMIWjfGYqvLkR+nrRJbr8KFGzbpocLFxsSIetPG8795N
         C1VIQdgZ7Xy+C7uYxxLPOnfLnO8vHB63jIQGytGoYgRtArj+yXBxBc9F/XYxLJiN6rf0
         aZBw==
X-Forwarded-Encrypted: i=1; AJvYcCXVFMlBOX4cxtjgFzLCdnQ4SoIjI+BZ3qMOx2x0nJebBgA0R4RiHWkeYDgYkLcUGMvu1t0CBLF9F7j67A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4zxSwWE23exehXBzp+hCnx+Pg4GfFCnVdoDpByS2SgG6bDnaf
	Z/GQYyzJZfxxv8CN98EY0OyEpRO2/kr9GdFOk9AwtMKp/OAQa4g0OCPPB9A5UNz7whwI8uQaNk+
	JvlWR0EryGFSu/jY+OEEwTbYTtws+Uq0=
X-Gm-Gg: ASbGncsxZd8CYVt6hV9Ojdq6I556FKP+pdjllR0gaQe7tIjxrd8SLODmUhq5NeI0DQu
	oy/At6Nb6LwV+TlJIi2n1x0kp+BRMtweqyyTJN7+kCoZzJXUL2tIeM97trTdIfOsZAmLQuqdI2m
	SndgVS++uCIjn/8Sed6WxpTRO6wwjFCM4DfOY/rl/+ZVUyxMIrmjtiBEmEaMC+ForXmkwV7MUJ4
	/RdcXU=
X-Google-Smtp-Source: AGHT+IFeHGuxtySi7CtxaGpGpFO7wyl1QhTknE5mS9v2TjN9AvzGwL7VxfaXPQJETF58ke+oTluka4/SUlAIU2Zvi+s=
X-Received: by 2002:ac8:594e:0:b0:4ab:ab99:4de with SMTP id
 d75a77b69052e-4ae8f065189mr200798841cf.26.1753725353322; Mon, 28 Jul 2025
 10:55:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYs5AdVM-T2Tf3LciNCwLZEHetcnSkHsjZajVwwpM2HmJw@mail.gmail.com>
 <20250723144637.GW2672070@frogsfrogsfrogs> <CAJnrk1Z7wcB8uKWcrAuRAZ8B-f8SKnOuwtEr-=cHa+ApR_sgXQ@mail.gmail.com>
 <20250723212020.GY2672070@frogsfrogsfrogs> <CAJnrk1bFWRTGnpNhW_9MwSYZw3qPnPXZBeiwtPSrMhCvb9C3qg@mail.gmail.com>
 <CAJnrk1byTVJtuOyAyZSVYrusjhA-bW6pxBOQQopgHHbD3cDUHw@mail.gmail.com>
 <CAJnrk1ZYR=hM5k90H57tOv=fe6F-r8dO+f3wNuCT_w3j8YNYNQ@mail.gmail.com> <aIe0ouF9tsuIO58_@casper.infradead.org>
In-Reply-To: <aIe0ouF9tsuIO58_@casper.infradead.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 28 Jul 2025 10:55:42 -0700
X-Gm-Features: Ac12FXyI95ILYrO-ngDWtex6vWFELuWEcDgcFbDIGZdP_N1ojOFhNj_bSwihkWo
Message-ID: <CAJnrk1aXvVf7jaK9_2PamK5X+1b+crT+kmn8vktv0nxqCtcW8g@mail.gmail.com>
Subject: Re: next-20250721 arm64 16K and 64K page size WARNING fs fuse file.c
 at fuse_iomap_writeback_range
To: Matthew Wilcox <willy@infradead.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	linux-fsdevel@vger.kernel.org, linux-mm <linux-mm@kvack.org>, 
	linux-xfs@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <liam.howlett@oracle.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 10:34=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Fri, Jul 25, 2025 at 06:16:15PM -0700, Joanne Koong wrote:
> > > > > > Also, I just noticed that apparently the blocksize can change
> > > > > > dynamically for an inode in fuse through getattr replies from t=
he
> > > > > > server (see fuse_change_attributes_common()). This is a problem=
 since
> > > > > > the iomap uses inode->i_blkbits for reading/writing to the bitm=
ap. I
> > > > > > think we will have to cache the inode blkbits in the iomap_foli=
o_state
> > > > > > struct unfortunately :( I'll think about this some more and sen=
d out a
> > > > > > patch for this.
>
> Does this actually happen in practice, once you've started _using_ the
> block device?  Rather than all this complicated stuff to invalidate the
> page cache based on the fuse server telling us something, maybe just
> declare the server to be misbehaving and shut the whole filesystem down?
>

I don't think this case is likely at all but I guess one scenario
where the server might want to change the block size midway through is
if they send the data to some network filesystem on the backend and if
that backend shuts down or is at full capacity for whatever reason and
they need to migrate to another backend that uses a different block
size then I guess this would be useful for that.

fuse currently does allow the block size to be changed dynamically so
I'm not sure if we can change that behavior without breaking backwards
compatibility.
