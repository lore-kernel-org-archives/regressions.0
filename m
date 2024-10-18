Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3615720E312
	for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729269954; cv=none; b=pbYoJaEw50WvDLTD/hElC+m6RK5hTz1XwVvDBecdn2kDVLY6tiPmSAPUTMyWXH7eX9NYcvfnPZx6Jx7zPjCY1NeNdJ6s4+RxatFsC+vKKB0qRkbFyS+Mvvn4UhCfgMlMrY7UflJGfONO57EXCWmPSOMXi6dJYfHqOTF7hzblflw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729269954; c=relaxed/simple;
	bh=mEmHWOFJnlNVRrzGPtM8wiJvYEeCp83Mvg3hZv5vczU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3umTOtZk5Be22XlUE4P+canr9TNmMxNnPmejCzilfc89RAEfUVb0TAaVBZEmzRXJZitOzuq7+N6I3KHi6HC4CVNs6Ocoo/DGZSd/hEs/NaTOFh8oYC7aUW2IWzc7DmvO06vh+XpWs37wA19s18cSES9isypjJyCE23glUM9qHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoVWno/d; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoVWno/d"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e30db524c2so1779064a91.1
        for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 09:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729269951; x=1729874751; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eW+JdpzpDhKq1E+9W/DDZ6XHIx5H2RDQb6mKUx2ZPN8=;
        b=PoVWno/djWtFYyo2WxDZ9gOXYX31DjA98BXCogntvtwXL2ecCHwrT4EtWRufNN2vxo
         ab9BG58bhoyanSWjao5CEOMH/a1uyxySy/UKXdkfDe/spy9o0K0VnHN49cS3ETS1MVjp
         rCLdiDrqhR8e+Da/boJwlEvrsJ7bGhZILFkm8CXXStiF3TB2Rww1hNQyAqNO0Vp/xkFw
         pfVwRvwx/YN6o25kBkxBpu3TsNV088AEUvP0XcVMDsX680Y4EIIVJ6h3JvgBeC5Yurhm
         Utw8UhI4v2HObOcvXU1X+LezIQ4zwBGFfJ47NOowgwf+K5+xza7BV3M1v3LmkoemIsxY
         GrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729269951; x=1729874751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eW+JdpzpDhKq1E+9W/DDZ6XHIx5H2RDQb6mKUx2ZPN8=;
        b=CCGvw6oA5jrMvlCl+4cwo8aKe+flkjlTn/pxEscOBo4emcymzE/fRyLufpxrfbdBSZ
         yj43WwFPmMtRDv1z2crGvn7mikNIy/ba5kKFOG4r246/yz+QNhSL0BONMFyqS6ui8yrE
         ErXJJLbN7/bdsKdZa3/DoJI1e7COp++gpuFKUayR86l6M/zv+pQLvy3Z00KUP8UFSsbb
         5ns1ZJUNrTae8G7aDN1sZ748VUaeuq64GTsnM0RenIWCMQfGwdu3pBmfMuinkIktBMEx
         vFqNKDoCAsGRDTzlOR6s/mxr97M4KYIINC0Zw5J6tZB10pUPC3hrioaI4y5pDjakYzWt
         JlBA==
X-Forwarded-Encrypted: i=1; AJvYcCWKtXMWV5Ct0K56zjERwM81HM7A0fkW8MdJHbwmUNzRK4CPgWT41XOCNUZBwYxbOZbVcwc0zWxFNwATfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiYHJ021BABi6vI8mkSjl5XvQzgSntYMsydWCrthqFP+oTIzFW
	sDq3MdS0W1sV1Y5svDoPkmgqnDaEbAUBip/4+ntr1UkDPe7+jtemWgektpgCTek6mSQQixU3hKL
	ew3fO38qUDF8jlnYlsT52b2Pz+Lk=
X-Google-Smtp-Source: AGHT+IFCkC/Szop37gwzLuVYwjJQCAuqwfvQYIv8W9hTRs9fQPgM0r19Iyr27uYVjr7zpLhKNALAHcVIIcbF7mi1Ruc=
X-Received: by 2002:a17:90a:ac06:b0:2e5:5e55:7f1b with SMTP id
 98e67ed59e1d1-2e5616c41f7mr3915649a91.4.1729269951137; Fri, 18 Oct 2024
 09:45:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241016204258.821965-1-luiz.dentz@gmail.com> <4e1977ca-6166-4891-965e-34a6f319035f@leemhuis.info>
In-Reply-To: <4e1977ca-6166-4891-965e-34a6f319035f@leemhuis.info>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 18 Oct 2024 12:45:34 -0400
Message-ID: <CABBYNZL0_j4EDWzDS=kXc1Vy0D6ToU+oYnP_uBWTKoXbEagHhw@mail.gmail.com>
Subject: Re: pull request: bluetooth 2024-10-16
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: davem@davemloft.net, kuba@kernel.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Fri, Oct 18, 2024 at 1:30=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> [CCing Linus, the two other -net maintainers, and the regressions lists]
>
> On 16.10.24 22:42, Luiz Augusto von Dentz wrote:
> > The following changes since commit 11d06f0aaef89f4cad68b92510bd9decff2d=
7b87:
> >
> >   net: dsa: vsc73xx: fix reception from VLAN-unaware bridges (2024-10-1=
5 18:41:52 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git=
 tags/for-net-2024-10-16
>
> FWIW, from my point of view it would be nice if these changes could make
> it to mainline this week. I know, they missed the weekly -net merge,
> despite the quoted PR being sent on Wednesday (I assume it was too late
> in the day). But the set contains a fix for a regression ("Bluetooth:
> btusb: Fix not being able to reconnect after suspend") that to my
> knowledge was reported and bisected at least *five* times already since
> -rc1 (and the culprit recently hit 6.11.4 as well, so more people are
> likely now affected by this :-/ ). Having "Bluetooth: btusb: Fix
> regression with fake CSR controllers 0a12:0001" -mainlined rather sooner
> that later would be nice, too, as it due to recent backports affects
> afaics all stable series and iirc was reported at least two times
> already (and who knows how many people are affected by those bugs that
> never sat down to report them...).

+1

I really would like to send the PR sooner but being on the path of
hurricane milton made things more complicated, anyway I think the most
important ones are the regression fixes:

      Bluetooth: btusb: Fix not being able to reconnect after suspend
      Bluetooth: btusb: Fix regression with fake CSR controllers 0a12:0001

> Side note: I recently learned from one of Linus public mails (I can't
> find right now on lore, sorry) why the -net subsystem is usually merging
> mid-week. TBH from a regression point of view I have to say I don't like
> it much, as bad timing with sub-subsystem PRs leads to situation like
> the one described above. It is not the first time I notice one, but most
> of the time I did not consider to write a mail about it.
>
> Sure, telling sub-subsystems to send their PR earlier to the -net
> maintainers could help, but even then we loose at least one or two days
> (e.g. Wed and Thu) every week to get regression fixes mainlined before
> the next -rc.

Yeah, that said I'm planning to switch to submit fixes more regularly
(e.g weekly), which appears to be the cadence of the net tree, that
way we narrow the window for landing fixes into linus tree.

> Ciao, Thorsten
>
> > for you to fetch changes up to 2c1dda2acc4192d826e84008d963b528e24d12bc=
:
> >
> >   Bluetooth: btusb: Fix regression with fake CSR controllers 0a12:0001 =
(2024-10-16 16:10:25 -0400)
> >
> > ----------------------------------------------------------------
> > bluetooth pull request for net:
> >
> >  - ISO: Fix multiple init when debugfs is disabled
> >  - Call iso_exit() on module unload
> >  - Remove debugfs directory on module init failure
> >  - btusb: Fix not being able to reconnect after suspend
> >  - btusb: Fix regression with fake CSR controllers 0a12:0001
> >  - bnep: fix wild-memory-access in proto_unregister
> >
> > ----------------------------------------------------------------
> > Aaron Thompson (3):
> >       Bluetooth: ISO: Fix multiple init when debugfs is disabled
> >       Bluetooth: Call iso_exit() on module unload
> >       Bluetooth: Remove debugfs directory on module init failure
> >
> > Luiz Augusto von Dentz (2):
> >       Bluetooth: btusb: Fix not being able to reconnect after suspend
> >       Bluetooth: btusb: Fix regression with fake CSR controllers 0a12:0=
001
> >
> > Ye Bin (1):
> >       Bluetooth: bnep: fix wild-memory-access in proto_unregister
> >
> >  drivers/bluetooth/btusb.c    | 27 +++++++++------------------
> >  net/bluetooth/af_bluetooth.c |  3 +++
> >  net/bluetooth/bnep/core.c    |  3 +--
> >  net/bluetooth/iso.c          |  6 +-----
> >  4 files changed, 14 insertions(+), 25 deletions(-)
>


--=20
Luiz Augusto von Dentz
