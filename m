Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2EC1B977
	for <regressions@lists.linux.dev>; Mon, 22 Jul 2024 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721637357; cv=none; b=eo+W4vR30NE1wSlHUW1nvJavjYgGtgeYdJQCSAr9hQJ/gdQY+HfLT28SE1CVpx5wn/mRD87Nk2ni9Nw61Tb3GZgFZ73Tjwrwc9kfTpjJ3J/ApqVG/TwtlB9s2+rDm/J4tYRTomk/LCzC8qPdSnbt956P0ENRI/l8hF6GwThK2Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721637357; c=relaxed/simple;
	bh=7v/EFZmoSbcmIaGzG3bWgy5wWp2UjKu4OKO13pGyiYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kudkn5nv5zfLXRA/1A7kxSmCQddX83tMBIN3FsP7UtVEHVMBb64i2OiaPOe5oFsxidXpzynJTIOL7tVvf5rhMh+DTXSrCeoRTxVLPgL3A2Mn2MDYqXy1dxcyvg8nWcE69VUWVk/+SfvCOhm0xV1xtG8Nnt6x6CO3Wj/vGFRFMrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ueezcu/o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ueezcu/o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28ED0C4AF0D
	for <regressions@lists.linux.dev>; Mon, 22 Jul 2024 08:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721637357;
	bh=7v/EFZmoSbcmIaGzG3bWgy5wWp2UjKu4OKO13pGyiYo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ueezcu/oVKx2GmTI/BJy6N+utVfg3rB3sze9V9K/v7CRlDjF39KtOs23ajo25LPCt
	 PK75lEOqGOMQljXvsdaFAxfhReu8LNx2sCnsbhSOVF4p1YYvC6R4rYBWvvgeuouGsN
	 mS6KBkpbonHUisteOj0jNAawlRF1swknxu/N30kwtuyzATUUsvyVmXaasWFLGPoPYb
	 X7/RjMJHt5d7xwXAeypyweERGQM3f9ASrA8xW9O1sLsWBQ6tKZVrP6otQLfef77TK7
	 xn66cP1MZGVrNS/wu6YI70hfWRELyuvZaJHdCQ4Pecpgjpw84s4KrelK+qP1OcJ6Hf
	 4u9R7F9FDaxag==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so11802471fa.3
        for <regressions@lists.linux.dev>; Mon, 22 Jul 2024 01:35:57 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz7W+UHrLp2xiz562xic/1rc1DYkqREtZe4FWlAa+YB7trxAO57
	FYfRf+ayUEd3izhRD+qmsehvs9LwZuMrGXCb5pECKQdyEomtR65AXOFzha/l0e20RIRx4KLmpR0
	fRvcghFZ7bv35YLtycVbO6jf9rWI=
X-Google-Smtp-Source: AGHT+IGCUWtDUrSLq9FUywisPB9ubGYpBGp5pqJFhGHITugCMNZBLgHhzSXLdVhRu72bTvFPeT/Snlu70QjEOJqI1sg=
X-Received: by 2002:a2e:b704:0:b0:2ec:63f:fe91 with SMTP id
 38308e7fff4ca-2ef16849d7emr44823171fa.38.1721637355474; Mon, 22 Jul 2024
 01:35:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <172096653882.8.16813493378478071178.379356753@simplelogin.com>
 <CAMj1kXG9AjvChj9O6LR+2bFVUoa225phaXndYvQ_f4X4bKioaw@mail.gmail.com>
 <172125357072.7.13007674265724826216.382402450@simplelogin.com>
 <CAMj1kXGYicoxQGsv=3uM2bgs99aXxPMFUwib5bTVa6U6OSxzUg@mail.gmail.com> <172133451315.7.8041341910867954609.383315718@simplelogin.com>
In-Reply-To: <172133451315.7.8041341910867954609.383315718@simplelogin.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 22 Jul 2024 10:35:44 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEk150dOFbAXAOD1=eJcS_9J5L5=GWJo97HneNyr+7kAA@mail.gmail.com>
Message-ID: <CAMj1kXEk150dOFbAXAOD1=eJcS_9J5L5=GWJo97HneNyr+7kAA@mail.gmail.com>
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
To: mavrix#kernel@simplelogin.com, "Shao, Marshall" <Marshall.Shao@dell.com>
Cc: regressions@lists.linux.dev, regressions@leemhuis.info, 
	Christian Heusel <christian@heusel.eu>
Content-Type: text/plain; charset="UTF-8"

cc Marshall, remove Radek

Link to full thread here:
https://lore.kernel.org/regressions/172096805546.8.15772688283210394474.379370367@simplelogin.com/

Hello Marshall,

Do you happen to any insights as to why this change breaks the boot on
an older Dell XPS 13 laptop? Do you imagine it might be caused by the
same issue you are trying to fix in

https://lore.kernel.org/linux-efi/DS7PR19MB570996A580C6F5D2C9CACCE48BA32@DS7PR19MB5709.namprd19.prod.outlook.com/#t

Thanks,
Ard.


On Thu, 18 Jul 2024 at 22:28, <mavrix#kernel@simplelogin.com> wrote:
>
> On 7/18/24 12:15 AM, Ard Biesheuvel - ardb at kernel.org wrote:
> > Thanks for testing.
> >
> > Please try the partial reverts in the following message
> >
> > https://lore.kernel.org/all/a99a831a-8ad5-4cb0-bff9-be637311f771@podgorny.cz/T/#mc9943f4fc27c2f4637d697a4d23e37d2c334d076
> >
> > and determine which of the two returns your system to a working state.
> >
> 6.10 mainline with 3-0001-Partial-revert-of-8117961d98f-1.patch works.
> The other one doesn't.
>
>
>
