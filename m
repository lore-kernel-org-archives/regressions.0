Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C711369A0
	for <regressions@lists.linux.dev>; Wed,  7 Feb 2024 21:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707341286; cv=none; b=AyNFkvnIBBEIGUA/8vUZahceTfx0fBgXOzuatBxXjV6TRCw3YjVUdKydBKDPgsQApVYBaPDHJCk36IOdrHcOSswz0hBLcHY3plo8CE1UCaPg9MBH9M8F+UOLauauFOEcg9ZbLiOEgw5J8LLXcOLCP9AXTDwEKvy7lx7/RdOHwe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707341286; c=relaxed/simple;
	bh=TcuoTBYzJOyVKpA/NOdorcJZuoBN+Bx+mnRuQV92i2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RslXcwRlOQBo8M+nf7zFbUKHY17vaFZuSFQK2tiX8WZu7JZt/SoNu8eIX3shYH2iWIBwLAvw5s458r+SQ0bleMrPCbqEiBrJyAE0n6qxcfw84l3Usbe18i4hyHN6iPAgrbDI7cNs9RR2jL5Gz6B/uM/gv9C6ghxqKeE3KRuYJOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EKlnVZON; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EKlnVZON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707341283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rsF5scQbGC/NKEqVyzUdcfrlWaBsz3GB8A3Ix6fxwJM=;
	b=EKlnVZON0TRtxGa5MPgaos3JZDc7hRrDIi2Nk3LPiXqIfqTiTK02GnSCfyGGHQU4q4/1z5
	J+j5sckBlKpp50Lto5eisydXXIpZLO1eKGokwTHcogLISmbzhWdumY4rXO7iIaTssUDSat
	YcX70eTygfalCU2/cwDq/pq2swdENUs=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-Lse6kc41M2Wis1JhqgNnNw-1; Wed, 07 Feb 2024 16:28:02 -0500
X-MC-Unique: Lse6kc41M2Wis1JhqgNnNw-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2d0cfe644d6so4206491fa.0
        for <regressions@lists.linux.dev>; Wed, 07 Feb 2024 13:28:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707341280; x=1707946080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsF5scQbGC/NKEqVyzUdcfrlWaBsz3GB8A3Ix6fxwJM=;
        b=NTivwqrgemZ0MR0+EyUYeFSbBd63HTpRy6a/8maqQW3soitKrlBGBS2nSe6S6rEyMu
         NbMo1AbIMvXK2dEPCmap3TxKGZBWRZ/IQFE7vUTgZW/zDE8QE9mzi4Y3WgLY6Fq+jIzg
         pmudrV1E+1jVY4pfp1R2PmIVYn45DL2SHPe9KjJaA/zguvTIlx6wLgEVJQhWo+WtXpQP
         1If2QIARJdtnN31+WDxkX0DIKmb9iYkoypf62RxEam/JIpHi4AwvbNVSvupkm1BSHYYv
         mNEGJpAcyZnKFKmsbE0UZNvmAmOujT5rAHuuxFnpVticq6eQqLBF0evxTPoDsL71mQQq
         4HEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD+PnWwKfYz4enEwuwSABRuC7chpexZo77WrVmtYRldGk523wh3rGcplP6r4rC45K53eseM5EMJxDuRVMoY4b3RHOSk9cU/51MEeQ=
X-Gm-Message-State: AOJu0YzK9GyRhuyrMUeVU0aBTQQKetX/zMrIkpOmkaxaMzSrxylSfHqy
	lCIZEdJzHBX3ElWHnHSi8eH0k6lZR2TvR0L5SZr7RKWCVr8u9NXi+e1YRcXtH5fm5HRUiKv4k/s
	KGvrUVGpv8jdwmjlGvb/FoJ+WF/EqMtTRX6tAQGBP34L4Gwy7gntyIj0vjbjmpDdE80j+Q2wySV
	jPg3dggZyh7v5yiAGONMbDGSCf4HbxpRMC3FvqsMs1serXjA==
X-Received: by 2002:a05:651c:211c:b0:2d0:c176:ebcc with SMTP id a28-20020a05651c211c00b002d0c176ebccmr5145866ljq.18.1707341280233;
        Wed, 07 Feb 2024 13:28:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFn1f4xD8ODxbeXjM0ldAqf8jj+ZejpBEaAt+zqZ446U/CEMk1rYJTD5iEcL9px/pawkKbLVveasSpw7fcHSDI=
X-Received: by 2002:a05:651c:211c:b0:2d0:c176:ebcc with SMTP id
 a28-20020a05651c211c00b002d0c176ebccmr5145847ljq.18.1707341279916; Wed, 07
 Feb 2024 13:27:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <38f51dbb-65aa-4ec2-bed2-e914aef27d25@vrvis.at>
 <ZcNdzZVPD76uSbps@eldamar.lan> <CADKFtnRfqi-A_Ak_S-YC52jPn604+ekcmCmNoTA_yEpAcW4JJg@mail.gmail.com>
In-Reply-To: <CADKFtnRfqi-A_Ak_S-YC52jPn604+ekcmCmNoTA_yEpAcW4JJg@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 7 Feb 2024 16:27:48 -0500
Message-ID: <CAK-6q+hza9yXb5KpBS2VJMNHJa805nXqiYPTovnf9G-JFadBsg@mail.gmail.com>
Subject: Re: [regression 6.1.67] dlm: cannot start dlm midcomms -97 after
 backport of e9cdebbe23f1 ("dlm: use kernel_connect() and kernel_bind()")
To: Jordan Rife <jrife@google.com>
Cc: Salvatore Bonaccorso <carnil@debian.org>, Valentin Kleibel <valentin@vrvis.at>, 
	David Teigland <teigland@redhat.com>, 1063338@bugs.debian.org, gfs2@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	gregkh@linuxfoundation.org, regressions@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 7, 2024 at 1:33=E2=80=AFPM Jordan Rife <jrife@google.com> wrote=
:
>
> On Wed, Feb 7, 2024 at 2:39=E2=80=AFAM Salvatore Bonaccorso <carnil@debia=
n.org> wrote:
> >
> > Hi Valentin, hi all
> >
> > [This is about a regression reported in Debian for 6.1.67]
> >
> > On Tue, Feb 06, 2024 at 01:00:11PM +0100, Valentin Kleibel wrote:
> > > Package: linux-image-amd64
> > > Version: 6.1.76+1
> > > Source: linux
> > > Source-Version: 6.1.76+1
> > > Severity: important
> > > Control: notfound -1 6.6.15-2
> > >
> > > Dear Maintainers,
> > >
> > > We discovered a bug affecting dlm that prevents any tcp communication=
s by
> > > dlm when booted with debian kernel 6.1.76-1.
> > >
> > > Dlm startup works (corosync-cpgtool shows the dlm:controld group with=
 all
> > > expected nodes) but as soon as we try to add a lockspace dmesg shows:
> > > ```
> > > dlm: Using TCP for communications
> > > dlm: cannot start dlm midcomms -97
> > > ```
> > >
> > > It seems that commit "dlm: use kernel_connect() and kernel_bind()"
> > > (e9cdebbe) was merged to 6.1.
> > >
> > > Checking the code it seems that the changed function dlm_tcp_listen_b=
ind()
> > > fails with exit code 97 (EAFNOSUPPORT)
> > > It is called from
> > >
> > > dlm/lockspace.c: threads_start() -> dlm_midcomms_start()
> > > dlm/midcomms.c: dlm_midcomms_start() -> dlm_lowcomms_start()
> > > dlm/lowcomms.c: dlm_lowcomms_start() -> dlm_listen_for_all() ->
> > > dlm_proto_ops->listen_bind() =3D dlm_tcp_listen_bind()
> > >
> > > The error code is returned all the way to threads_start() where the e=
rror
> > > message is emmitted.
> > >
> > > Booting with the unsigned kernel from testing (6.6.15-2), which also
> > > contains this commit, works without issues.
> > >
> > > I'm not sure what additional changes are required to get this working=
 or if
> > > rolling back this change is an option.
> > >
> > > We'd be happy to test patches that might fix this issue.
> >
> > Thanks for your report. So we have a 6.1.76 specific regression for
> > the backport of e9cdebbe23f1 ("dlm: use kernel_connect() and
> > kernel_bind()") .
> >
> > Let's loop in the upstream regression list for tracking and people
> > involved for the subsystem to see if the issue can be identified. As
> > it is working for 6.6.15 which includes the commit backport as well it
> > might be very well that a prerequisite is missing.
> >
> > # annotate regression with 6.1.y specific commit
> > #regzbot ^introduced e11dea8f503341507018b60906c4a9e7332f3663
> > #regzbot link: https://bugs.debian.org/1063338
> >
> > Any ideas?
> >
> > Regards,
> > Salvatore
>
>
> Just a quick look comparing dlm_tcp_listen_bind between the latest 6.1
> and 6.6 stable branches,
> it looks like there is a mismatch here with the dlm_local_addr[0] paramet=
er.
>
> 6.1
> ----
>
> static int dlm_tcp_listen_bind(struct socket *sock)
> {
> int addr_len;
>
> /* Bind to our port */
> make_sockaddr(dlm_local_addr[0], dlm_config.ci_tcp_port, &addr_len);
> return kernel_bind(sock, (struct sockaddr *)&dlm_local_addr[0],
>    addr_len);
> }
>
> 6.6
> ----
> static int dlm_tcp_listen_bind(struct socket *sock)
> {
> int addr_len;
>
> /* Bind to our port */
> make_sockaddr(&dlm_local_addr[0], dlm_config.ci_tcp_port, &addr_len);
> return kernel_bind(sock, (struct sockaddr *)&dlm_local_addr[0],
>    addr_len);
> }
>
> 6.6 contains commit c51c9cd8 (fs: dlm: don't put dlm_local_addrs on heap)=
 which
> changed
>
> static struct sockaddr_storage *dlm_local_addr[DLM_MAX_ADDR_COUNT];
>
> to
>
> static struct sockaddr_storage dlm_local_addr[DLM_MAX_ADDR_COUNT];
>
> It looks like kernel_bind() in 6.1 needs to be modified to match.
>

makes sense. I tried to cherry-pick e9cdebbe23f1 ("dlm: use
kernel_connect() and kernel_bind()") on v6.1.67 as I don't see it
there. It failed and does not apply cleanly.

Are we talking here about a debian kernel specific backport? If so,
maybe somebody missed to modify those parts you mentioned.

- Alex

