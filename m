Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CD03DE447
	for <regressions@lists.linux.dev>; Thu,  8 Oct 2026 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463709; cv=none; b=RWmutNpe2kJN2A5DNCgJ3Ba7NA+yW1AV+8iMslofnNKf0r15z9W4msdVcqKXNxT42+CvDB78lkbeLdwnehOzsBO8nUiBXVqNdbp47BuIUIeMhuAZGCoPC9ZiTj8U2nDuBtW9MF1/K9RdVLV/srR0TQ024ui+gC+bDcybmp9F6XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463709; c=relaxed/simple;
	bh=0qVZtYkdvaSfqGduovy6JP1HIfFfoNJIptyO8s7H45w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uls0HaqPEiddyTlY/UE4vc7fTQOF5dI8ni2Y8gdbYbp1DiL+ihw8w1eMFh4R4n5TUtr/Bc0jogL2rKSf077ee1ZId669g3aPX3lFs/s4jVkmFdzYfB3vRHv1Jq2dhVCESLOnNvG97y2UbvMuZr/2kJmIoLLgJEKvo5/mTi6yrKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpV1eMLI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpV1eMLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5C31F00898
	for <regressions@lists.linux.dev>; Thu,  8 Oct 2026 12:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791463708;
	bh=0qVZtYkdvaSfqGduovy6JP1HIfFfoNJIptyO8s7H45w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LpV1eMLI0QnNGCXbQX9y50FCd+ZCJOzTO0NQioPZ/+pso267rsXVJF3x3LGehnYW/
	 K7kdTwX/eTK24wodE81ZTLSeiZcv82V+BYt56Wl5g1OlZr+cTTCQU2/lO24CPBat2i
	 YYPjV28cEbIq+mpkGjxOJ6AelcV1pZMspAxNEJm8SxcequbLBqa+qhyX+vS/TGO67B
	 XkBNLCRVFxuo4RlxqXFH9bqtEcWoiOIUzTnyNb9yKBD8aaM3STk9/21F0ZoFtfvbO2
	 MEccLa8o9NKsqS872XPuGLpIrFsBx2sIWrExRNxEBLGhP/5shAB6TTQV3+4xpissYK
	 qVD28ouH0cp4A==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-46556b9e02cso464913fac.1
        for <regressions@lists.linux.dev>; Thu, 08 Oct 2026 05:48:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByuQoF4zax11TMnT8sPGSQyUk5knaBBhj2DvRmJt8hCG3DM95oBQQAqOURmmZWKS1ZmiDhTKZ6eenR/Vg==@lists.linux.dev
X-Gm-Message-State: AFuF++mqKUyqbQiawftOkGP0rLkb/WKzQDBD24Zg/wWAh7jdOxzlag5Z
	3wPC8o/xEc+Q+kNbXoOXRHMLKnlECxQwDTjc2IBKPmizTxPu40TrhP1GA+R7kGfvoObyoRHqqfy
	uMrkvGPMnaYUDUyzTAKx/9Chf0ITYd+8=
X-Received: by 2002:a05:6870:e997:b0:48f:a8b6:19d3 with SMTP id
 586e51a60fabf-4a28045b5bemr1459726fac.2.1791463708287; Thu, 08 Oct 2026
 05:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTBPgPG7w@mail.gmail.com>
 <a6193df2-98f3-409f-b73f-5b91835a0107@kernel.org> <CAL4WiirwF6bZwocErCthJ+TUu7wipRfSibRBoKWjjkA2nVSrqQ@mail.gmail.com>
 <CAL4WiiqSmW093PDngLrUNiNA5GVKeM3+tAO7KMDJeyjYZ7GRzg@mail.gmail.com>
 <4c98eff5-c8c7-43ee-b59a-adb833978816@kernel.org> <CAPa5EdDk+HuVP0H1+iqOcHDHZnfdika5WOQcgSaMtfRFWzqZ+Q@mail.gmail.com>
In-Reply-To: <CAPa5EdDk+HuVP0H1+iqOcHDHZnfdika5WOQcgSaMtfRFWzqZ+Q@mail.gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 8 Oct 2026 14:48:16 +0200
X-Gmail-Original-Message-ID: <CAL4WiipSpufpdo-AWoNEJta-puLQ5hMyPn2xcjwg4vg67PNoyA@mail.gmail.com>
X-Gm-Features: AclHuK_D8yngICniNIB7imCy2NJMcxGSlGHrPp5HcoKJPk8-kK9ST_uLJsCbP9s
Message-ID: <CAL4WiipSpufpdo-AWoNEJta-puLQ5hMyPn2xcjwg4vg67PNoyA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] r8169: TX stall with checksum offload on
 VLAN frames with inline tag (REORDER_HDR off) since 1517d1996b52
To: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, nic_swsd@realtek.com, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 8 oct. 2026 =C3=A0 13:35, Jan =C4=8Cerm=C3=A1k <sairon@sairon.cz> a=
 =C3=A9crit :
>
> Hi Eric,
>
> On Wed, 7 Oct 2026 at 00:00, Eric Dumazet <edumazet@kernel.org> wrote:
> > Note to testers:
> >
> > My LLM agreed with the change in vlan_dev_hard_header() (above), but sa=
id
> > that no change was needed in vlan_dev_hard_start_xmit() (below)
> >
>
> I'll need the patch applied to 6.18.y for testing, as I can't test it
> personally and I want to provide testers with the same kernel/system
> version as before just with minimal changes. So do I understand
> correctly that the patch below is what you want to get tested, no
> changes in vlan_dev_hard_start_xmit()?
>

This is the current patch under review :
https://lore.kernel.org/netdev/20261008123812.554729-1-edumazet@kernel.org/=
T/#u

Thanks.
