Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62F82E7368
	for <regressions@lists.linux.dev>; Thu, 28 May 2026 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980376; cv=none; b=V1BkRIBEZfYysS3BY1gTdxPrtywNPvBMwQL/7EkqClnRigGCBCcEXfl0/li+rlW4Alm85IPqBZKQN8NPF20r6tfoCOUdSWEzA54+H2o0VGDI9AYkuEVfSVixrnFnYccn3cvON8SAq9WmoMQt56cOexmuWhw1KIZ2ruzt/7el2v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980376; c=relaxed/simple;
	bh=xpY3ZijaXiuJOkFKvi2YUN/7pNpdMH0cGhSXkrJHogw=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date:Content-Type; b=m2kU6IkhWWikVJ7a8laMav8R3UMYHf9LX5b6A+AO5GxvxIOm7P1PNWDbadz9BmpdcOeFg5XZkRhAnrE83BVWEpGcf9ByyMilkU5PMZUqKe3Z77OMC7IU/tOEMUhxn9e/8umibyqdrKwwuSn3YxSIzYWE96cru3KA2rfAlado7Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CM95LQxR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CM95LQxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779980374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpY3ZijaXiuJOkFKvi2YUN/7pNpdMH0cGhSXkrJHogw=;
	b=CM95LQxR/GlA4FYUqDmtlXjWOqw9TvfQxCfEZN8FLhuPlUM6H8+P88jf9d1J+Es3SsrvPj
	nG1RRBR04K9Hrn2ony/E/Y1AiG35K9pqEg+Geq4md5mXT+zZdtiwLl2lm7EUMHhNvccVsA
	WMbtnkjPT17m0QXaJCpBbwPTnplfBCc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-O0gIvAajOjqjmI8rBCVoRA-1; Thu, 28 May 2026 10:53:24 -0400
X-MC-Unique: O0gIvAajOjqjmI8rBCVoRA-1
X-Mimecast-MFC-AGG-ID: O0gIvAajOjqjmI8rBCVoRA_1779980003
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48fdad6cce4so65200045e9.1
        for <regressions@lists.linux.dev>; Thu, 28 May 2026 07:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980003; x=1780584803;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpY3ZijaXiuJOkFKvi2YUN/7pNpdMH0cGhSXkrJHogw=;
        b=GyZdG10PynA1Yyrlop2a9KAXa8ZRNojxBu7OSX/zqV1VQTyEtDYfFAuh8zIzQ2Oe+n
         jhDryG0+4w6GD/Eruj9Wg0tWKCOyTVi2D8hPueXeUUIXLE7BVrsLldCTmQSQgQttDv/6
         OjFmgtiv6VVk5UjujpxoZHcPIMfv+MKtzKCWugKwlpvHrYMSnKs/iwRZE8emWZhGfMu7
         w4MS9Hj+qKhS2yOqRlL2y6yV76PdiXQoClrSK6o/17CV7xfT98YQTQJJIC/VtQ1GsDJN
         CnP9kjsAg8swUfmP4F3IhgEO6ySynMDg/upDTGfi02YSue0L7nxxr3LruDdUqqdhVw1r
         eB8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+naauTBNrcHYTI5sFQoSJy6EuRnjCpn+e2rOepEvtTSYWpH6TiaGse5Gwx1GNSgLMxjz0iWqJG+5NkRw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yytol50LTrBhPd67JUtDVJDudW1eh581mkLi5ln8Ykx4ICHDgUm
	P8Gr2j/9NjkHp1/lNO53dU5N3KjGohL+gZYTtzlbWI5N8y7nF0tdd3mQXpd4hzez2uwX8QR1YqD
	nRXuZVeE16Ny1tL92SnoKIlbmVVXlHW/khCSYW/n1t+OnqMXSkORHGWXKhnxAMeQc
X-Gm-Gg: Acq92OF9sHf/Bdk31vck0FHaCrH25/99GFtTRP3uCASJDtZx1A1Qm+Wns89uJrhXCAC
	lSdQiLLdPi+MmEDtj6spjf2sHbQCcRRKe/EA8q65Fm01r8wmHr3INSOggpP4WNt08isxuwgaWH9
	09YINthR7UYhsnlf+ewrePT14iUP1bMb1tx30YUF5szTFTyBqd7ToML6vrcMS3ayKiF7KE21Nd5
	pJERdKmyNYzBnaq9w1WTdKHurrs+rUdint/2saQ037bTg7lpz/M4HZXepTAHe6fKoUJ+041vbmW
	hGb7CRHNee3Uw0w3JaK7Jm2BxuALzSVaw4I4T3ctnLe6Bsej3dQ6gZ4l37t5HxGFKvchN0N7ejx
	3ORZwg7D65E1VstRtg8rILe4BQBCyeQRPdnmpD61u+eo=
X-Received: by 2002:a05:600c:3ba5:b0:490:8b0b:d3b1 with SMTP id 5b1f17b1804b1-490947b0929mr26757605e9.12.1779980003041;
        Thu, 28 May 2026 07:53:23 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba5:b0:490:8b0b:d3b1 with SMTP id 5b1f17b1804b1-490947b0929mr26756975e9.12.1779980002459;
        Thu, 28 May 2026 07:53:22 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [2a10:fc81:a806:d6a9::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490929652c9sm43245675e9.14.2026.05.28.07.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 07:53:21 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: =?UTF-8?B?w43DsWlnbw==?= Huguet <ihuguet@redhat.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Fernando Fernandez
 Mancera <fmancera@suse.de>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Yumei Huang <yuhuang@redhat.com>, Ido Schimmel
 <idosch@idosch.org>, Justin Iurman <justin.iurman@gmail.com>, David Ahern
 <dsahern@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, Linux
 kernel regressions list <regressions@lists.linux.dev>, Beniamino Galvani
 <bgalvani@redhat.com>
Subject: Re: Problem with IPv6 privacy addresses in 7.0
Message-ID: <20260528165320.15b90ded@elisabeth>
In-Reply-To: <CACT4ouf5ZqGgb=RO8_7NovLCvYKLKL4vD70dEe6xUODT1UEcSA@mail.gmail.com>
References: <20260521135310.GC977@cmadams.net>
	<20260526175743.1f2c3761@kernel.org>
	<20260527010641.GA21073@cmadams.net>
	<20260526183122.348e44e7@kernel.org>
	<20260527215135.GB16443@cmadams.net>
	<675083b4-e015-4ff3-836c-798e0a971194@suse.de>
	<20260528073849.759da84a@elisabeth>
	<baba855a-7cc9-409e-9c20-6e50f35d255a@suse.de>
	<20260528131250.1352ab48@elisabeth>
	<b21c598b-879c-4f6a-9dc8-27e5c362803b@suse.de>
	<bd669eaf-64dc-4217-bae0-4a531e473762@leemhuis.info>
	<20260528153202.14900687@elisabeth>
	<CACT4ouf5ZqGgb=RO8_7NovLCvYKLKL4vD70dEe6xUODT1UEcSA@mail.gmail.com>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 28 May 2026 16:53:21 +0200 (CEST)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A1FajNZJUMzawSDA044GOgev75BdewLDa5MvTQdgZb4_1779980003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 28 May 2026 16:15:38 +0200
=C3=8D=C3=B1igo Huguet <ihuguet@redhat.com> wrote:

> CCing Beniamino, NetworkManager maintainer.
>=20
> On Thu, May 28, 2026 at 3:32=E2=80=AFPM Stefano Brivio <sbrivio@redhat.co=
m> wrote:
> > Not a bigger regression, but a regression definitely, even just for 'ip
> > address' or 'ip address showdump' which would now go back to display
> > / save addresses in the reversed order for IPv6 (only). =20
>=20
> One could argue that the bug had to be fixed in iproute2 and not in
> the kernel, to avoid breaking UAPI.

I think what's considered UAPI in this case isn't so clear-cut. I guess
it would have been pretty hard for anybody not familiar with
NetworkManager's codebase to imagine that an application would rely on
IPv6 addresses (and only IPv6) to be returned in the reverse order.

Pushing this to the extreme, one could argue for example that if we
accidentally byteswapped the last 16 bits of some IPv6 addresses, and
NetworkManager started to work around that, that would start being
considered established UAPI...

> > Actually, an eventually fixed version of NetworkManager doesn't need to
> > know the behaviour of the kernel: it can just order addresses by
> > timestamps instead, as Fernando mentioned. =20
>=20
> If the fix must be in NetworkManager, we only need to parse them in
> non-reverse order like IPv4, I guess.

But that would then require some form of detection, and, at least
according to Fernando, isn't the most robust option anyway, as ideally
NetworkManager shouldn't rely on the order at all.

> > And I'm not sure how relevant this is, but if we revert the fix,
> > current combinations of NetworkManager / kernel versions would be
> > anyway affected. =20
>=20
> Probably many, for who knows how much time, unless all distros
> backport the NetworkManager patch. Many don't backport much except a
> small bunch of security fixes.
>=20
> > So at this point the only robust / complete fix would be changing
> > NetworkManager to sort addresses as needed. Are you suggesting that we
> > should anyway try to minimise the temporal impact of this with a revert=
? =20
>=20
> I don't think it's the "only" robust fix. Normally one would think
> first about not breaking UAPI.

Sure... I would just argue that in this case it was pretty hard to
imagine that as an established UAPI trait.

> Kernel's UAPI is not great or intuitive
> in many places, but normally it's never improved to avoid breaking
> backward compatibility. Adding a GIVE_ME_THE_RIGHT_ORDER flag could
> help too, but I agree that it sounds a bit silly to have an opt-in
> option to force the right behaviour.
>=20
> Then, the only robust fix would be to fix pasta and iproute2.

I was mentioning that we can't really fix this in pasta (unless, again,
we implement some form of detection, or something on the lines of what
Thorsten suggested) because we're just copying addresses to a container
and we don't know much about them.

We could add detection and swap them, which is rather complicated for
us because we currently don't store them as we copy them (we don't use
dynamic memory allocation), but of course that would be on us to figure
out, somehow.

> Here we know of 2 affected userspace programs, but we don't know if
> more could be discovered in the future.
>=20
> That said, it is true that this case is very unintuitive. Insertion is
> direct-order for both IPv4 and 6. Dump is reversed, but only for IPv6.

Wait... that's how confusing it is. That's also what I thought at the
beginning of https://bugs.passt.top/show_bug.cgi?id=3D175, but it turned
out that insertion is actually reversed for IPv6. Dump isn't.

So this is also inconsistent in the kernel itself: if everything else
is equal, address selection depends on the order of addresses as
inserted, which is the opposite compared to IPv4. Maybe this is the
most surprising fact in all this.

> Userspace programs won't expect this at all. Programs that do it right
> it's probably because they encountered a bug because they were
> initially reading in direct-order, and changed to reverse-order. I
> haven't dug into NetworkManager's history but I bet this was the case.

I guess so too, yes.

> In this case I would be in favor of not reverting the kernel change,
> and fix NetworkManager, but I'd like to hear Beniamino's opinion, as
> I'm not being much involved in NetworkManager any more.

--=20
Stefano

