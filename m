Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07903F164F
	for <regressions@lists.linux.dev>; Thu, 28 May 2026 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975134; cv=none; b=NdqWcWI7B1a2ecomg/zH8uM70NHi9m5gnltXlgbo7JnXw4EyysOR6c/A7l9PYFmYIf2v/rsygJpSWwxPV04RxmEi0vMwo/AKjo0N/l0xSRs3l3kY1GQEPM5rlaHWiT9YsfcZIrq7q8ADo3AFhkQ3MzcjHdqTpFoEagnSCo7m4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975134; c=relaxed/simple;
	bh=vPU45GJtVWhMcvje9QDFhnwGgFdKM2fePKG3Kcsn2hU=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date:Content-Type; b=PcYm4rW0bnAba2reaiCsBJS9xrZ0a5Yj+1AVpLZqt8uzJx9ZQADonDgzONzmR8NdMoj475ngYgoACwameRIfNWpDjfjynes/0cTlugLAuPX2t53Ma8Bel1M2W15W+nJ/TEfHRaSjLkiE/8QyczJ6IR2gRJLH64MPBGs8tK0XBVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PcbicaGq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PcbicaGq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779975131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPU45GJtVWhMcvje9QDFhnwGgFdKM2fePKG3Kcsn2hU=;
	b=PcbicaGqIW7Yt8Xs4yvUqPDdMaVlysoM33hiSDXKfP1pNTavKeqfAf+ngp/4JUt94OVq9A
	mt84EQql8lDOC2q1Wrv/4qY4I6pUZWybX4Pj83IIPf5E5HYBfd3N+nrtLl6gwEixv+s2ol
	2Qt23Xn0YH35X7CtRViS7NknaESCsqM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-lWCiWaENNYqbgldt-Tfl_w-1; Thu, 28 May 2026 09:32:10 -0400
X-MC-Unique: lWCiWaENNYqbgldt-Tfl_w-1
X-Mimecast-MFC-AGG-ID: lWCiWaENNYqbgldt-Tfl_w_1779975129
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4904bbc6094so49232135e9.3
        for <regressions@lists.linux.dev>; Thu, 28 May 2026 06:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975129; x=1780579929;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vPU45GJtVWhMcvje9QDFhnwGgFdKM2fePKG3Kcsn2hU=;
        b=YIiUclfyB2UZ2jPNkHutusApeCgpPseU+HrdWLf331xTFFTs1P18mQHxjrDKSGmIKJ
         ZKi4JmVWK1bBk/2K8P0XTSA8tQE5pja+E2pdpFPYiti5F3dTJvjl2qEVwaVX+U9HTya3
         8LNyvNkw/giSrReQFj1wZBeyOiiLROsDWWEcjLtgmWDa8jiGgsXwPVsO99UaL5XzTcAw
         //zlDMLg233tOpfakWp5TMSGnl/yk0xn7kmztgZ4xaq/J4Nix2F4sDo7JKF0/bugvb6p
         B0E2E/wCmk1cTiDHXGlALVkNlrdaMETvCFZsgANsLL9rwsfoqo+35nQiAkI/el6n24rM
         07Zw==
X-Forwarded-Encrypted: i=1; AFNElJ/5DytXewgTEHGgWTZj4Mlcq44xHTSp+bvjwDniCDRYlGC7K6aqYtB/O61rhOK1caoTpnGdaHciQi9iAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwD5AhpCQNaiZhrt+sPH0n3tdafSnsinqcywh7kj9D8vHyCgjWd
	00roQtm17js/vWOdwCsz7N30uF08VSWwrrqfpwydFJ0Ew3n6zkRZNIJES4CkYV3oDizQ66Z+xbv
	DFoAb+izen4n6WQLm2C05Sa/t+e3sG5A32bgZHAxZ4WtdjqRBYZFCMP54SK+uJ/FC
X-Gm-Gg: Acq92OEmUaPHchadbkGRGl5ayBYUkVJJ3JRC4lXsvs79UuK++QuQbVZPgCOZs546jwL
	fk7A2ALBec1f4dgmJikYS5k/LcVpbx/ob0DEvANaC6PoaE9WA3Or9j5yYTuzAFdajnVGxnASCYD
	w16Z9TN9LkcjOnQz+uwHMHyZDA1Ew3T+caX3qYsdwe0cFiEcneE1F4IOn/CrMFZMruSGXe8yX90
	ry+W3FhmjN1173LyU/DN1ToAv/mACXww16S4lFaKioOnOVOC7/sXD2oz3s0zGJsW4iMndU7V01F
	cfoxvQ3NO7fzKPr8u9bjJacqeP1rp9N6E+3DA5fv2SpHjm8T3gX9qTg1yeci9+KgmNpK4bM+0gr
	dXqxZ67VdRuBQTCcDAHpJqz77D8zAxOgZJ1HCXzGWn6ARqQcHIciFXlYV605b
X-Received: by 2002:a05:600c:35cf:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-490426bc737mr501349845e9.19.1779975129019;
        Thu, 28 May 2026 06:32:09 -0700 (PDT)
X-Received: by 2002:a05:600c:35cf:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-490426bc737mr501349195e9.19.1779975128387;
        Thu, 28 May 2026 06:32:08 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [176.103.220.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908f0980d7sm15200665e9.28.2026.05.28.06.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:32:07 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Fernando Fernandez Mancera <fmancera@suse.de>, Jakub Kicinski
 <kuba@kernel.org>, netdev@vger.kernel.org, Yumei Huang
 <yuhuang@redhat.com>, Ido Schimmel <idosch@idosch.org>, Justin Iurman
 <justin.iurman@gmail.com>, David Ahern <dsahern@kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>, ihuguet@redhat.com, Linux kernel regressions
 list <regressions@lists.linux.dev>
Subject: Re: Problem with IPv6 privacy addresses in 7.0
Message-ID: <20260528153202.14900687@elisabeth>
In-Reply-To: <bd669eaf-64dc-4217-bae0-4a531e473762@leemhuis.info>
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
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 28 May 2026 15:32:06 +0200 (CEST)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TYOQ_3PEsF8PFWsEsKnK-L8NHBDDqJwIV2x8MoGzeEE_1779975129
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 28 May 2026 14:29:50 +0200
Thorsten Leemhuis <regressions@leemhuis.info> wrote:

> On 5/28/26 13:29, Fernando Fernandez Mancera wrote:
> > On 5/28/26 1:12 PM, Stefano Brivio wrote: =20
> >> On Thu, 28 May 2026 12:46:05 +0200
> >> Fernando Fernandez Mancera <fmancera@suse.de> wrote: =20
> >>> On 5/28/26 7:38 AM, Stefano Brivio wrote: =20
> > =20
> >> - regardless of this, would there be a way to make NetworkManager
> >> =C2=A0=C2=A0 robust to the order?
> >>
> >> =C2=A0=C2=A0 I'm asking this because yes, strictly speaking, you might=
 say this
> >> =C2=A0=C2=A0 change breaks userspace (NetworkManager), but at the same=
 time it
> >> =C2=A0=C2=A0 fixes another part of it (pasta), and changing it back wo=
uld break
> >> =C2=A0=C2=A0 pasta again (in a way we can't really fix). =20
> >
> > Ugh, that is a mess. =20
>=20
> Well, yes, but one that happens regularly. :-D
>=20
> The problem here is that it was reported only some months after the
> culprit landed, as fixing the regression through a revert or so could
> now cause a bigger regression. Do we assume this to be the case here?

Not a bigger regression, but a regression definitely, even just for 'ip
address' or 'ip address showdump' which would now go back to display
/ save addresses in the reversed order for IPv6 (only).

> It
> sounds like pasta would "only" be broken about as much as it was before
> -- then a revert or something like that is the right solution to get
> back to the status quo. Or does pasta already depend on the new behavior
> somehow and would now break even more if we reverted the culprit?

It doesn't specifically depend on it. There might be users depending on
it because, if they choose to copy container addresses from the host,
they will be reversed, and also picked by the kernel in the reversed
order (if all other criteria based on scope and prefix length are the
same).

The likelihood of that breaking setups should be relatively small. It's
just not zero so if we had another sane option to keep this "fixed" I
would probably prefer that.

> Then it's really a mess. :-/

I guess not so much, it shouldn't be a drama for pasta and containers.

But then again if we revert this, how do we fix the issue later,
without resorting to any of the ugly things below?

> But there are ways to fix even this, it's just that most of them are
> ugly. Like adding some bit somewhere to /proc/ or so that a fixed
> NetworkManager (if it's the only affected app) could flip by default to
> change the things from the old behavior to the new one; and one pasta
> could check that bit and warn. Config options are also an option, but
> that's even uglier.

Actually, an eventually fixed version of NetworkManager doesn't need to
know the behaviour of the kernel: it can just order addresses by
timestamps instead, as Fernando mentioned.

And I'm not sure how relevant this is, but if we revert the fix,
current combinations of NetworkManager / kernel versions would be
anyway affected.

So at this point the only robust / complete fix would be changing
NetworkManager to sort addresses as needed. Are you suggesting that we
should anyway try to minimise the temporal impact of this with a revert?

> >> =C2=A0=C2=A0 Now, I suppose NetworkManager is much more universally us=
ed and it's
> >> =C2=A0=C2=A0 definitely a more mature project so it's a bigger userspa=
ce breakage,
> >> =C2=A0=C2=A0 but at the same time it's a ton of containers (Podman use=
s pasta by
> >> =C2=A0=C2=A0 default, Docker/moby optionally via rootlesskit) we might=
 introduce a
> >> =C2=A0=C2=A0 regression for. =20
> >=20
> > I think the main argument here is: while we know it is affecting
> > NetworkManager, we cannot know if it is breaking something else. The
> > kernel rule is usually "do not break userspace" and this is likely
> > considered a regression from my understanding. Cc'ing Thorsten as he is
> > an expert on regressions. =20
>=20
> From the mail at the top of the thread it definitely sounds like one.

--=20
Stefano

