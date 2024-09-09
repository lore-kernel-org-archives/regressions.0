Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BA81CA9E
	for <regressions@lists.linux.dev>; Mon,  9 Sep 2024 18:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725906873; cv=none; b=AOrQf5DkF9s+/zlsVCQn2J9TRWRpDB5QIHzYXQuVDR4f/ime1M987t5fUY30aL0jihOutJOPmIeocwvMTj4JrdN1ZYTjEciflrZyohpMvVP6WAlX23O9B1rQQT2WA/TGMn7b/irB1THX1cnCMyOtneB05aH7m8TR+pU+U9mUX08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725906873; c=relaxed/simple;
	bh=5FpeqcffHbuFPbLZAFra+rU2QpGr/V2j2bwD/blL1Aw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=k0SkNiI8n6yYlnh625LhhhIXuHcwl1+dJVs4NlstA09lUKxEqoGhfp7YySF3MsH7nX/189CNVE0omVRRKlJua/j1iuF3UJKZGMmy8+7b3AyTvpmcZQ+xb1sEBoRpF3HpGf+de81PweS5YdVUJRjGXjRuHm4Y/ZQYtXh3Ob18QqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSy+IsC9; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSy+IsC9"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6c35a23b378so31506916d6.2
        for <regressions@lists.linux.dev>; Mon, 09 Sep 2024 11:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725906871; x=1726511671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdd/WvhllQyialbBy7jzHPlYxUBg0YFMPfv6jJazvr0=;
        b=ZSy+IsC94SZ6/XJHU7RJSc3pNJpDqP/QYfNg0b1adbUXmUjlQZlKZTFelVTQ8cnLAU
         QPYL779K5Xr9FWKVQA9ASRn1UwDjD2HBm0Zcxh9NNbuA5SFW1aw5lWTLcB4HiRN3M1FV
         9EFGL3cpDW8bCDUFHCbioYfgRXAluSjLxfVy07HFuTHeLC2fPHtVY3iamaB94HmJIOsr
         6dQc/Hcik7swIwaMSjyZ3gThfeeLxeDqvW5cZbkJ0gBLLDVjXJnrA8eQnxSCAq7hogBm
         hH9S/i9KpdQA8jKyBl26/YuDgzjCEGO//wnrn+Lll9zW8n0+y0O6OCSNn1FnEUX363b4
         y9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725906871; x=1726511671;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mdd/WvhllQyialbBy7jzHPlYxUBg0YFMPfv6jJazvr0=;
        b=ENASMwJOWC8EqsIEWTw1EE/QNYFRp/fShw620NwVdUFBXd7wfDCBaLDwVCrLX/djYr
         7N5cgZxrQHM9lvwkSJRO3347rXKcXZGcFS7DkjutPBoIWA6Wvg4+OxNyichvnwEiFiBe
         PqWLCG/c29zQmuvRk+ahRVBCpIavuIB/8BAR5p+KhwFRwEWsb3N8kxBhJ0WJ+hU2l7jo
         2QGuiDLV/Cb7H/+GSlVKfWY2ugrp2c4q7+fJRSu90oEqE7mpvP00HMcweNEsmbq0ObSN
         Q5x1Q7iHvDRgJ4e1ABT3AxGLOo610fSgzTxc5HhWNNthaqBI2Ni47OMfLfc+2QZQUmB+
         fYig==
X-Forwarded-Encrypted: i=1; AJvYcCUzJ8LWZOM3VZ6tK+HkeSv5xIWFlgfufnGCVbu500Jcxbv1hOiNPEjSLkDpz0SNIxRuLGxRgkSt2pHD2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyM5r0auhOJHW04ls/rh36k2xuFyilaXEtzF3nECsPXZZo0jVtt
	p+fU2/CxiFtRYOL7bNvFvr4pfx7fykxmt+dejB2JtzjWZ7N7ayDc
X-Google-Smtp-Source: AGHT+IHua3rNhW3+BPIS2BfkhVPU2YV+akPqZsQHsuDdQlCF2nS2SXdDQwBQ0loWr9sr/KvZOSXqxA==
X-Received: by 2002:a05:6214:c9:b0:6c5:3338:4e34 with SMTP id 6a1803df08f44-6c533384f65mr101110816d6.32.1725906870794;
        Mon, 09 Sep 2024 11:34:30 -0700 (PDT)
Received: from localhost (23.67.48.34.bc.googleusercontent.com. [34.48.67.23])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c53433b98dsm23004016d6.46.2024.09.09.11.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 11:34:29 -0700 (PDT)
Date: Mon, 09 Sep 2024 14:34:29 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, 
 Willem de Bruijn <willemb@google.com>
Cc: Christian Theune <christian@theune.cc>, 
 regressions@lists.linux.dev, 
 stable@vger.kernel.org, 
 netdev@vger.kernel.org, 
 mathieu.tortuyaux@gmail.com, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Message-ID: <66df3fb5a228e_3d03029498@willemb.c.googlers.com.notmuch>
In-Reply-To: <2024090952-grope-carol-537b@gregkh>
References: <89503333-86C5-4E1E-8CD8-3B882864334A@theune.cc>
 <2024090309-affair-smitten-1e62@gregkh>
 <CA+FuTSdqnNq1sPMOUZAtH+zZy+Fx-z3pL-DUBcVbhc0DZmRWGQ@mail.gmail.com>
 <2024090952-grope-carol-537b@gregkh>
Subject: Re: Follow-up to "net: drop bad gso csum_start and offset in
 virtio_net_hdr" - backport for 5.15 needed
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Greg KH wrote:
> On Mon, Sep 09, 2024 at 12:05:17AM -0400, Willem de Bruijn wrote:
> > On Tue, Sep 3, 2024 at 4:03=E2=80=AFAM Greg KH <gregkh@linuxfoundatio=
n.org> wrote:
> > >
> > > On Tue, Sep 03, 2024 at 09:37:30AM +0200, Christian Theune wrote:
> > > > Hi,
> > > >
> > > > the issue was so far handled in https://lore.kernel.org/regressio=
ns/ZsyMzW-4ee_U8NoX@eldamar.lan/T/#m390d6ef7b733149949fb329ae1abffec5cefb=
99b and https://bugzilla.kernel.org/show_bug.cgi?id=3D219129
> > > >
> > > > I haven=E2=80=99t seen any communication whether a backport for 5=
.15 is already in progress, so I thought I=E2=80=99d follow up here.
> > >
> > > Someone needs to send a working set of patches to apply.
> > =

> > The following stack of patches applies cleanly to 5.15.166
> > (original SHA1s, git log order, so inverse of order to apply):
> > =

> > 89add40066f9e net: drop bad gso csum_start and offset in virtio_net_h=
dr
> > 9840036786d9 gso: fix dodgy bit handling for GSO_UDP_L4
> > fc8b2a619469 net: more strict VIRTIO_NET_HDR_GSO_UDP_L4 validation
> > =

> > All three are already present in 6.1.109
> > =

> > Please let me know if I should send that stack using git send-email,
> > or whether this is sufficient into to backport.
> =

> I just tried it, they do not apply cleanly here for me at all :(
> =

> > The third commit has one Fixes referencing them:
> > =

> > 1382e3b6a350 net: change maximum number of UDP segments to 128
> > =

> > This simple -2/+2 line patch unfortunately cannot be backported
> > without conflicts without backporting non-stable feature changes.
> > There is a backport to 6.1.y, but that also won't apply cleanly to
> > 5.15.166 without backporting a feature (e2a4392b61f6 "udp: introduce
> > udp->udp_flags"), which itself does not apply cleanly.
> > =

> > So simplest is probably to fix up this commit and send it using git
> > send-email. I can do that as part of the stack with the above 3
> > patches, or stand-alone if the above can be cherry-picked by SHA1.
> =

> Please send me a set of working, and tested, patches and we will be gla=
d
> to consider it.

Done:

https://lore.kernel.org/stable/20240909182506.270136-1-willemdebruijn.ker=
nel@gmail.com/T/#m0086f42d20bfc4d6226a8cf379590032edfbbe21

The following worked fine for me. I hope I did not overlook anything.
Compile tested only. But as said, the same patches have landed in
6.1-stable.

	git fetch linux-stable linux-5.15.y
	git checkout linux-stable/linux-5.15.y
	git cherry-pick fc8b2a619469
	git cherry-pick 9840036786d9
	git cherry-pick 89add40066f9e
	make defconfig
	make -j 64

Unfortunately, the key commit itself has a bug report against it. I am
working on that right now.

But as the existing patch that it refers to in its Fixes has landed in
all stable kernels and is causing reports, it is a backporting case of
damned if we do, damned if we don't.

I intend to have a fix ready ASAP for netdev-net/main. If all stable
branches have all backports, it should apply cleanly everywhere. Just
not ready to be included in this series from the start.
