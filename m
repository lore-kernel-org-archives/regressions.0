Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3D1437463
	for <regressions@lists.linux.dev>; Wed,  7 Oct 2026 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371359; cv=none; b=MnUtFll1XRqTDZIpPg1mfuIg2bAhflwq7zPO/X8VT8wxe0Uht/2ddtvCl8wR99TwN/qkFP0iXP4FTYULhvUoVJ9IljkKVGgKpHqZ1blKX+GSWaPgGWtnd5CVMyGZlRqvLCW+LYpe+qmXDYbHB6aZToCOGBMYQP9KmsvtZw6UNIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371359; c=relaxed/simple;
	bh=8DMF6Po5NeZA8sUTTWo7qUUSIMLASB7Oi6OlVRLSVIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4BgoDiNNZiHULV26JLWYNGuzmQ0UA4bYdrCadkHalz1X5O0wUYm1hQ6YcRrOZjjmFo6VsVjAcXF5s73Gec0Ga3bYDO229EhfOvjq6OzfcXHv7SPA2X1uQx/kJSnxvyZX9TbyXagWsKpdzeOugxfnMNYSC0wkBWgxuFE9FP+Drs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDWbvclf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDWbvclf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF551F0089B
	for <regressions@lists.linux.dev>; Wed,  7 Oct 2026 11:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791371340;
	bh=8DMF6Po5NeZA8sUTTWo7qUUSIMLASB7Oi6OlVRLSVIw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KDWbvclfgqqRaRvntjLO8Bl5sSejANcOLLH4Ge87Qj/mQDCUSi6yWPo2isQxTzBW5
	 Yw865/HOmj+BkvHrrmEUy8GWwxKDtzJr4tYc3Uue1ncGUi/OdeHzbwPYj71S0PajKu
	 fW0zuuQvawygbCnFKEnxkzSk+kxzJdRydFZGpQpmzStruWI5AaqJjL+VjfXntmOUVY
	 dsny9ClY3FzKEc2BJ3bwO61oabVQprioKPrShqkzyKEIVB+JTLlPyG7LAMKiRh1q2d
	 5iiJi51FCWu25lz2ntoLnWfdDBzGeRGa75wPhYU5PC8BHEYh+sfxux+1dbepfRXs8X
	 5eDWeYpQcG3KA==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4911df1e196so1870418fac.1
        for <regressions@lists.linux.dev>; Wed, 07 Oct 2026 04:09:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByc3YNMDTcW+HFCABX1Pwyo6LjBsocfG6E8HqvVad2i4wqeEyEYILuv67qUAbiy3o9Ypx8CcVImIbOEQA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJE2amD9r0VIHSsJfpa6jEswU25ClbAYlIGUiGNHyU3CC0909vX
	TW/lAp4Ng0ErPnXYiDAqBpZ5CUuQ2efEKFUhVViXVsepqoQds6brJP4aU7qo9MgIafEKhTU2WzI
	Li6GAYQGeM9wq3gn5/N6gaH1r6Sjo0JQ=
X-Received: by 2002:a05:6870:6127:b0:491:4a20:8ab8 with SMTP id
 586e51a60fabf-4a259504734mr1896973fac.28.1791371339997; Wed, 07 Oct 2026
 04:08:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005145430.12777c2c@nargothrond> <2026-10-06-1-daily-reply-0020-bnxt-en-vlan-447cbe95@kernel.org>
 <cce34174-a70a-4e59-9c35-fd74309b0fb5@leemhuis.info>
In-Reply-To: <cce34174-a70a-4e59-9c35-fd74309b0fb5@leemhuis.info>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 7 Oct 2026 13:08:48 +0200
X-Gmail-Original-Message-ID: <CAL4WiiqSoLb9kdXwdJHH2P55+9214aRRcP-61tdKBhRTK7z70g@mail.gmail.com>
X-Gm-Features: AclHuK_Mya-mXIp8BY93pJkwUEfPaM34qzfLZGG1BzLxjhDODa9HqPyHdCQr-2k
Message-ID: <CAL4WiiqSoLb9kdXwdJHH2P55+9214aRRcP-61tdKBhRTK7z70g@mail.gmail.com>
Subject: Re: [REGRESSION] Commit 447cbe95ebb9 causes IOMMU DMA faults on
 macvlan/vlan with bnxt_en
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Sasha Levin <sashal@kernel.org>, =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
	Michael Chan <michael.chan@broadcom.com>, Joe Damato <joe@dama.to>, netdev@vger.kernel.org, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, regressions@lists.linux.dev, 
	stable@vger.kernel.org, Stefan Fleischmann <sfle@kth.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 7 oct. 2026 =C3=A0 12:35, Thorsten Leemhuis
<regressions@leemhuis.info> a =C3=A9crit :
>
> On 10/6/26 23:35, Sasha Levin wrote:
> >> I'm testing the patch on v6.18.55, and it looks good so far. 5 hours a=
nd
> >> counting without any issues.
> >
> > Thanks for the bisect. The root cause is the bnxt_en small-packet paddi=
ng
> > and DMA length bug Eric Dumazet identified, not 447cbe95ebb9 ("vlan: fi=
x
> > skb_under_panic and races when toggling HW VLAN offload") itself, so we
> > will not revert the vlan fix. Once Eric's "bnxt_en: fix DMA mapping len=
gth
> > for padded small packets" lands in mainline, we will backport it to all
> > affected stable trees.
>
> FWIW, better wait a little longer till a fix for another regression
> 447cbe95ebb9 exposed in another driver is fixed, too:
> https://lore.kernel.org/all/CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTB=
PgPG7w@mail.gmail.com/
>

Different issue, and already fixed.

https://patchwork.kernel.org/project/netdevbpf/patch/20261007073027.459868-=
1-edumazet@kernel.org/

This different bug fix will not fix the pre-existing bugs in bnxt_en.

> Ciao, Thorsten
>
