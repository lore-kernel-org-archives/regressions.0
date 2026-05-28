Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6313AF677
	for <regressions@lists.linux.dev>; Thu, 28 May 2026 17:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779988913; cv=none; b=TCz4OaHS3GpGlCywiRJK4avkWyCklEiMnByOqKS6YGirm9o67liEYAw6XL8CcEaqDAzHU1QDP6aP9kEdMBNqJLo/8PbS69Cw5LkSrYsiQ9x56tjxhP0yU42Izr9PQxCloHACcdWO3KZkvdyYjted0M/MrNxdEc+RhHxQ0DJzb54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779988913; c=relaxed/simple;
	bh=dxjGa4Ml/1nUz3iyV2bVpKp0Bs3I+Oa92VnSJh4r/nU=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date:Content-Type; b=jg5G0e20pV8bKOoIVuFNRXNb08d+g3eUNBGiM1w0Sudr9xQ9aCfr7hKZJwF2+25AjWI1bSV8hfvO1189ENlKlHGm8heW4DzrUrvIcuWJ+kM91UixYN/grU3xSiwTJXxQU2swz2j1SJl2+7ow31Xk0kTNP0toQ5r3pZtH36+x/Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iGeObKDa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iGeObKDa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779988911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pywxf73FJiXqSIfDtx3gAd9zS23OPZ8h3KQxDbqt9dA=;
	b=iGeObKDakEC0a4XZlAHyexmWmhucoJBihTPj7sb3JiYHOngfLldB28uwg4nuNCKT4iY2I/
	U/Mok7YQMr+Xp/0g53e36K12RC9oneJeFQdr/Wthy7zJIrT0sBPycB+RzIjac8F1sep2D5
	tr0T3SBpxk9uWgAVyp6te8wwQDSv39k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-O1__4miaPfalbhoI23hNjQ-1; Thu, 28 May 2026 13:21:49 -0400
X-MC-Unique: O1__4miaPfalbhoI23hNjQ-1
X-Mimecast-MFC-AGG-ID: O1__4miaPfalbhoI23hNjQ_1779988908
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43d789cebcfso8711393f8f.1
        for <regressions@lists.linux.dev>; Thu, 28 May 2026 10:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779988907; x=1780593707;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0IAWVLrtIzQ5xVgTvqwLoqJOfqrR7MpH88SIQQGUoj4=;
        b=WLq+ljM6aOiFQ51RkH3CKMdyotvV3T9AA8Ke7MiJl35lYDuYChUhBcYVIpDfcVICBa
         +bso1OjbFWMYe1DYWH0aGSNNCUPsMdTx7SkRUhIhUPt/ytyzKRpKe4f/GBX+m6xPD6M/
         p2WSXh8wGkdCHr8gmpD0ZV2Z4WbSLUXaDABQwJGuRZVSkx1M3pUPvdXT8oEgKNrB/Pnc
         cwbOmycGyU+ocUWdfG4NWVXa9ItHjiaG7mVCDeyovfFOfsCR79sBMtHG41uplq7GXwvz
         j4YMeq1t65pgG6C4XXAWDU7h9b/usrw86kwBXdNSQhrpIz/64CHFfn2dFsaqG4IjKOq1
         0Cug==
X-Forwarded-Encrypted: i=1; AFNElJ8hoJpt+dwiWwYnVCm1TVspdaXwLEo4GtxSM5rnA2dg6BJTVbC8jSYW910/3sJN0pWcp3FQvy/gjiVe/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ/+0Vke4GwJL9n0d3G0Xs9bSQZoOthwVqxNE7wksqe2w9oVpC
	VB8ABZ6kHS8Pv8TLiH8/Pqy09ghMbZsOWNq31PyK/Q9zkBUKGGlfelwWCfRWrY+z167bQwfh51X
	Fi/CoQRaVxoOdZRBaFfDjZf0x2d1sF93JTWf+HWdgrEymg337PB1NhjXN4R3fdOXZ
X-Gm-Gg: Acq92OHlSqEHPeDXAk/ojL96HZ/DDZ0OBwePSUKiu6s0pWu5Wa0MFvzM9ryk8tph4G2
	+f3pSzXVz9PGZ8nWWe3kWq5AErZqEV81nUVo4gy641EpUz9xlMnemSzKHAhtzgwlARbw4A0h8Tf
	PN/qcIeJG+2uJZN2scIvDHrTS6s0LQk4beyqgmnTavcvUA5N3Ym5CAGmYm8WX9Zeg2+Q+xBxb/1
	3IR7Xs3UCiL8YQweJHwUYf2IBcN1R7UrlV+x6UEcbDdvTOb31L6OJyWca+84vRlcsEWIeWfsL/U
	0joUPHKFZU6yAZTjNNyUprB3Am3irwxxOYG6YaVXl4aNrjcvu4dcknBOXGxpKBkrj64eCmXoQ7x
	N9h3LhFgEI1tGTIujL0lqilFOMF4vC1As4Hr7oldCba0=
X-Received: by 2002:a05:600c:5359:b0:488:a502:8955 with SMTP id 5b1f17b1804b1-49094777acdmr30132185e9.4.1779988907504;
        Thu, 28 May 2026 10:21:47 -0700 (PDT)
X-Received: by 2002:a05:600c:5359:b0:488:a502:8955 with SMTP id 5b1f17b1804b1-49094777acdmr30131815e9.4.1779988907012;
        Thu, 28 May 2026 10:21:47 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [2a10:fc81:a806:d6a9::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b19aasm15998612f8f.25.2026.05.28.10.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:21:46 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Beniamino Galvani <bgalvani@redhat.com>
Cc: =?UTF-8?B?w43DsWlnbw==?= Huguet <ihuguet@redhat.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>, Fernando Fernandez Mancera <fmancera@suse.de>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Yumei Huang
 <yuhuang@redhat.com>, Ido Schimmel <idosch@idosch.org>, Justin Iurman
 <justin.iurman@gmail.com>, David Ahern <dsahern@kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>, Linux kernel regressions list
 <regressions@lists.linux.dev>
Subject: Re: Problem with IPv6 privacy addresses in 7.0
Message-ID: <20260528192143.31c9e9ea@elisabeth>
In-Reply-To: <ahhm1-XfnsWyIWDV@tp>
References: <675083b4-e015-4ff3-836c-798e0a971194@suse.de>
	<20260528073849.759da84a@elisabeth>
	<baba855a-7cc9-409e-9c20-6e50f35d255a@suse.de>
	<20260528131250.1352ab48@elisabeth>
	<b21c598b-879c-4f6a-9dc8-27e5c362803b@suse.de>
	<bd669eaf-64dc-4217-bae0-4a531e473762@leemhuis.info>
	<20260528153202.14900687@elisabeth>
	<CACT4ouf5ZqGgb=RO8_7NovLCvYKLKL4vD70dEe6xUODT1UEcSA@mail.gmail.com>
	<20260528165320.15b90ded@elisabeth>
	<CACT4oue2EMM9Kfsm9Jii2rG9ooi=D37PK=8886cpLuBkwhrOxw@mail.gmail.com>
	<ahhm1-XfnsWyIWDV@tp>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 28 May 2026 19:21:45 +0200 (CEST)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fwclA0E3gUFMsxK4G3GICB0BD_rt_0uYvY79PpSg9rI_1779988908
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 28 May 2026 18:01:27 +0200
Beniamino Galvani <bgalvani@redhat.com> wrote:

> On Thu, May 28, 2026 at 05:24:28PM +0200, =C3=8D=C3=B1igo Huguet wrote:
> > On Thu, May 28, 2026 at 4:53=E2=80=AFPM Stefano Brivio <sbrivio@redhat.=
com> wrote: =20
> > > I think what's considered UAPI in this case isn't so clear-cut. I gue=
ss
> > > it would have been pretty hard for anybody not familiar with
> > > NetworkManager's codebase to imagine that an application would rely o=
n
> > > IPv6 addresses (and only IPv6) to be returned in the reverse order. =
=20
> >=20
> > IMHO it's not because an application would rely on the order. It's
> > because the order matters, as the first one is considered the primary.

Yes, that's also the case, but:

> > This is not NetworkManager specific. Or I am mistaken? I'm speaking by
> > memory

...from what I understood of the issue at hand there's a part that's
specific to NetworkManager here, because NetworkManager replaces /
deletes the Privacy Extensions addresses, instead of different
addresses, because it relies on that specific (reversed) order.

Anyway, yes, I see your point about UAPI now.

> Yes, exactly. If you do:
>=20
>  ip addr add dev X 3fff::1/64
>  ip addr dev dev X 3fff::2/64
>=20
> then the old kernel chooses the address that was added last as source
> address for outgoing communications. With the new kernel it chooses
> the address that was added first.
>=20
> I think that any script or network management tool that cares about
> the source address selection is impacted. Indeed, the commit had
> effects on one of the selftests, which had to be modified to change
> the order of iproute2 invocations.
> =20
> > > > If the fix must be in NetworkManager, we only need to parse them in
> > > > non-reverse order like IPv4, I guess. =20
> > >
> > > But that would then require some form of detection, and, at least
> > > according to Fernando, isn't the most robust option anyway, as ideall=
y
> > > NetworkManager shouldn't rely on the order at all. =20
> >=20
> > True =20
>=20
> Correct, if the new behavior is considered better, there should be a
> way to detect which order must be used. Otherwise userspace tools
> won't be able to maintain the same behavior with different kernels.

My remark here is about whether NetworkManager needs to detect this at
all. If it used timestamps to detect recent / older addresses, as
Fernando mentioned, then you wouldn't need any detection at all, right?
Or is there something else we're missing?

By the way, if really needed, one could detect that with the equivalent
of:

  ip a a ::2 dev lo && ip a a ::3 dev lo && [ $(ip -6 -j a | jq -rM '.[] .a=
ddr_info[0].local') =3D ::3 ] && echo wrong || echo right

...depending on the application, that's not necessarily practical, but
so far we have no evidence of any application needing to do that at all.

--=20
Stefano

