Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0905B24E005
	for <regressions@lists.linux.dev>; Thu,  3 Apr 2025 13:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686091; cv=none; b=lKew8IO27hAdouv9J1Uk/GmBKlFHV5/XUKsrC2bz9FsD+kBcPSWBgSQZj/kMUufC0UxBuwD2JbolOeLD1SXCSNRwG4b1k03oaYZOoK7Q1MrEP0MN1TGe1VfPdsp82SUcCHtzMXsgQHiVdE2Pqenwo4AxIxc7/54piVhihO9YGNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686091; c=relaxed/simple;
	bh=bt6gJlRwPdO08tG7YpNnHL783vydCw6J7TOqDlJK4lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/WM7B33DOOLzqSiIu8jWnE4rB58kzHbW8w5++ehX06fgo5naCAIfDygiKuYoNDrStwyyyjLuKO0sgYOCR/PA02zSXBurG9nTOg/wOjf9JapKVdVfbXB/RN6yaZimAThDYMTLCE2N4wPuaMLfz3GRberuX8vOuAgpHd6/X/lw20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPN3Bu10; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPN3Bu10"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bf1d48843so7444131fa.2
        for <regressions@lists.linux.dev>; Thu, 03 Apr 2025 06:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743686088; x=1744290888; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqMLUJ3h8FzGpd/ZaU/PCx5lcDAym3sCL++s8q8O5tA=;
        b=PPN3Bu10RF9lxeiUSGmpBYVHi6PKbfQZ+TsfqUBtH4Ea9fYrXtESMzbSCNJQVPCS8t
         Ivh1Otydgdovsp9TQAcPYh+m18JNZOjrJVyP+ZOzDd9DzzRxXw83/rsS3Co3O77xNiuE
         ziBcsJ8beBML2EucfXO3s56xi0xLi7hxp0/9cef703Kxt1//96Fw64Cm5i1jrp1GNsPq
         NevOMyYzNilh9MImArY8xcFTKPO/Mln78urypGar5JT7531gra906cJfkpwAtOY195l/
         PAJuINg2z5tsKmqOPV2TyLBUIpEQeRExf7LzjrTacINT3Uxnq9EcGSAW7CZkrN+zly8y
         qLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686088; x=1744290888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqMLUJ3h8FzGpd/ZaU/PCx5lcDAym3sCL++s8q8O5tA=;
        b=TBFKcW0JriRHLtHTgMMT1Ybl98Q03VCImxhRogcLsD9CWrNitbcPeXwRWVbKwkOnv2
         Cxwa9DJ+xC2YBSLRvv40ZeEPYpmrDFwUL4IMI2uZLuglmF3J6yxjmJL7M6f3+3n6it4z
         QeMOyi3ihYTYK6Y/Bw0PQUrHBVi4oBaM14dLwNfHvLqaxlR/7Lm9rKpy185irCu292Yg
         VU4jAbWZR7bFYrvzDUZRV8uYYrO99otuiHq/U80UU5riliimgmiBDXeuS8TZoByB0nA2
         11S2c/nvKPjc0M1exUsZGYXxlm9uUGPo5mwe4d1sCGLJ7XzrfqefoMAbnzEerD6MJu3K
         qeQA==
X-Forwarded-Encrypted: i=1; AJvYcCXDIvQU/66kfowSOPmMkfyk18Gd6mi3fNPRgrc6k1mNgDQz2AORAfep4F+KVC8RCtO2SvFo8ewOWX7A3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlfF7h1u2SFqPYCJzY//SbrC7q/I0Zl1ItrdNRuJvhAB9Ou+xd
	FleW4knHWumk1q08yU6sWUaU2Awat3N7CPj6I46T0lHLRgsB6OyrRIEQ9kLJwLqCBPwO5N6Y3zh
	ITDS1reKiFJdojtzR3Q4kWD88W6m4Tq/i
X-Gm-Gg: ASbGnctv4iUR00Ba2bCPH+EbvhM7N8eGuuo2Q1CI1fA2gCGMBzEfwqkT8gsqmVzhBIm
	UybR3RcAavmgLoEvQnSKoHeosRDymCLjdA8Ft1PxKTCwTJdcbDrKfK01NT5bliAlKmPk7yTrwVQ
	JYDxE+0S8lA14O5zO37mC9JXxOuQ==
X-Google-Smtp-Source: AGHT+IH2kqjkmBjqUVw+MY6DzQ6KHWR2nn2MHZ+KZ+wf1sfvHxHjTtOFBN9OSvv16ji1RnKxxsfo9uZGmtKo39z6yEo=
X-Received: by 2002:a2e:a803:0:b0:30b:d35c:4754 with SMTP id
 38308e7fff4ca-30de023b4d7mr75558381fa.10.1743686088024; Thu, 03 Apr 2025
 06:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <81a25a60-de78-43fb-b56a-131151e1c035@molgen.mpg.de> <f8ab4b21-0afc-4956-a324-12c0c67bb5de@molgen.mpg.de>
In-Reply-To: <f8ab4b21-0afc-4956-a324-12c0c67bb5de@molgen.mpg.de>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 3 Apr 2025 15:14:35 +0200
X-Gm-Features: ATxdqUEKWFLktRli5xE5aIw6_0Thxu_wJ1HESz_7hFAvSvyvA3lIFGGomnedZ0o
Message-ID: <CAFULd4Z48Vh_UW6+Q-BJ3c42eo7QaKhAbhZRX+Eegx0Te4+z6g@mail.gmail.com>
Subject: Re: New warning `cryptd: no symbol version for this_cpu_off`
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev, 
	Brian Gerst <brgerst@gmail.com>, Nadav Amit <nadav.amit@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 2:30=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de> =
wrote:
>
> #regzbot ^introduced: 6a367577153a
>
> [To: +Uros, Cc: +Nadav, +Andrew]
>
>
> Dear Linux folks,
>
>
> Am 03.04.25 um 09:35 schrieb Paul Menzel:
>
> > On the Intel Kaby Lake laptop Dell XPS 13 9360, updating from
> > 6.14.0-11270-g08733088b566 to 6.14.0-12456-gacc4d5ff0b61, Linux logs th=
e
> > new warning below:
> >
> >      cryptd: no symbol version for this_cpu_off
> >
> > I haven=E2=80=99t bisected it, but could it be commit 06aa03056f90 (x86=
/smp:
> > Move this_cpu_off to percpu hot section). It says to have no functional
> > change though.
>
> `git bisect` led to commit 6a367577153a (percpu/x86: enable strict
> percpu checks via named AS qualifiers).
>
>      $ git bisect start
>      $ git bisect good 08733088b566
>      $ git bisect bad acc4d5ff0b61

Can you please post your .config?

Uros.
