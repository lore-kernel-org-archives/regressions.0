Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EA518952C
	for <regressions@lists.linux.dev>; Wed,  9 Apr 2025 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209095; cv=none; b=RmJGCychCrhfS02n/05hBgW4TgCNVTdQooa1W60zuGEc0mZ0PoFnGgpweVrrc7c4DG9lI/SYUrZXhd/1i1LBmPX8Op38phYh5NV32t2NTJVhO5Lhm9JKRqXDJDuDRWnz4g9EHAb1MLbXrXx2GqgTSxpHgtH33EzqjxWbJeYrEf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209095; c=relaxed/simple;
	bh=OkMWtlaCHFz94VPXhhboq3VaT9gsh5ncKm1X+sD+RRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ia9YFgzmlbIk2ma9NOG1KMLpXPwQn7ov/VZOatZQqG9CLyxleOnWYd6an4nXOs0/JlBOFKb/1aKsDQ3tQBoAMCzR8F3BLXGMy8MgtusRbTr41BNnE0QuyWDCgfISC6tH/rwEXC+9GRVN4+WUyOM2PJtreZmiG/43IWDMfMPMdnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qb33MT4A; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qb33MT4A"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6feab7c5f96so66882347b3.3
        for <regressions@lists.linux.dev>; Wed, 09 Apr 2025 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744209092; x=1744813892; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oFEL98j0Nv64o0yCV8CrzqGFLc958Qmn2qWiAuOU8rY=;
        b=qb33MT4AXIvOPVY6736XQt1z3QAJ8Wp08JvDd/pHCpqu6D9f80kvF4VgzB0kQ0tTxd
         ByOWk9CG4x00ZIygmEqjW919JJlf0/pu6nhmdkEQk5UBY3vkgsrNorYUgVc8bGScB2qw
         awV+FPcX9BP2eo1HSmMZK87w365Ef1aLVJc2k9sZshnymX1mqctVgZbjIUmqx4H9ZF11
         NIej2hzP30rw9oFWLgpM4+CpQ6ikH8eeMco1SfV6SEiVbhjpdbasDZvsLRW5nWJX2GFk
         TOx4NWnE3/qq+JbzeehAsCPZQPf0rY6QzfjQhstjV7Am/S0kqXVq/of4Q95HDJeACb3S
         famA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209092; x=1744813892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFEL98j0Nv64o0yCV8CrzqGFLc958Qmn2qWiAuOU8rY=;
        b=phE8JNvVGiK6iowHhmD4rpzas6PfV1NCN+OKUql+JXx9NstHeG82GzmGZVnsmVLNzE
         Sx1iuo5OenyLmUXJRk2q5AUNiBoDM4Comy8mAoVj42NQ3ydGzUOMvV0QdSg8pEoTuwdh
         reniHWhQ4mp8Il9wZYmDejJAYwgW0AtC1aE8U/wuh23tqW78fhckGxfttQpvxe0ZEuzC
         g1iHyqQq/zY2O0qN9Czfk5pSPts7zSApLy26bfKRJ8E2XHr96Ku8T6hloYdNPZvOADt+
         zDzTyTrwtSHoMOx9TCHRC+7wVd81kvJsq93HPLleNHrsQ8Dkd6mDcaLBaA7/UgaqByO4
         /zdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeWBHDC3RNxHWbigFSlyYOWxjsIe25AbpRHrQfM8HoSJ1j0kprF34NaGDKOMiscspPHistQkw8zPOzSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsBZ+KZb+Q+lXVea6YyhAJkYwvg+ds78tsG9MPhVi8JKVv2umr
	IMamaNuK4hVQrJ/k8gjUTEkjlOLzWZ4rBThGVFs1FhVfSsmFxH9xm4pb7b6Qjl84m1KkJozgEjz
	c853bk+AYeKthX+5YsKROONlbGGoMh2PHWmmOng==
X-Gm-Gg: ASbGncvlggcVHoZmCgLLLiq111DN0UC/2kzmQc2GBOHW+QrOBC7egHUY6oF6x09qTGx
	7EhsvCAs54xHY0odBknKNxMabk5OvpF8DTzYugYM19MfVKkqy/Hkbja7YyBAfSFmwmR3r9nhPAr
	GSiOzrTQBsIH5Zxbhs3TpVwFCOnIEEAOg/Q/ahfBLuNJV53W9V2bQqYGA=
X-Google-Smtp-Source: AGHT+IF4v5ddVlhpl7XXkiqtBokzQ91W32mmENzyPvsi71Y4dYxLX5GlEjhKpMuyRO1Bkz53IVfT2sXx2EzFFMEWN8s=
X-Received: by 2002:a05:690c:9b07:b0:6fd:6589:7957 with SMTP id
 00721157ae682-7053ae8ca3bmr49692347b3.32.1744209092075; Wed, 09 Apr 2025
 07:31:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtdXHVuirs3v6at3UoKNH5keuq0tpcvpz0tJFT4toLG4g@mail.gmail.com>
 <CA+G9fYuHhz2YCafabKK+QMJiDuM65OcxpaW9TN-=u56r_kyGSA@mail.gmail.com> <2025040216-directive-unmapped-5301@gregkh>
In-Reply-To: <2025040216-directive-unmapped-5301@gregkh>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 9 Apr 2025 20:01:20 +0530
X-Gm-Features: ATxdqUGsFIk4VNkjjSv0a16kAsaDqgjo9GWyB8SFwTjeyfnGkilfWAombhlDVSY
Message-ID: <CA+G9fYsefOWiHbnnbOjjG4kaX3o4hKOkOtDpVfzQNd+E9ycc8g@mail.gmail.com>
Subject: Re: qemu-i386 boot failed on mainline master - no console output
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Vinod Koul <vkoul@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 16:57, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 02, 2025 at 02:24:53PM +0530, Naresh Kamboju wrote:
> > + Linus
> > + Greg KH
> >
> > On Wed, 2 Apr 2025 at 14:14, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > Regressions on qemu-i386 devices boot tests failed with defconfig on
> > > the mainline master no console output.
> > >
> >
> > The qemu-i386 boot failed with no console output and is still happening on
> > the latest mainline master branch.
> >
> > > First seen on the char-misc-6.15-rc1 merge 25601e85441d ("Merge tag
> > > 'char-misc-6.15-rc1' of...)
> > >  Good: [08733088b566b58283f0f12fb73f5db6a9a9de30] Merge tag
> > > 'rust-fixes-6.15-merge'
> > >  Bad:  [91e5bfe317d8f8471fbaa3e70cf66cae1314a516] Merge tag 'dmaengine-6.15-rc1'
> > >
> > > * qemu-i386
> > >  - boot
> > >
> > > Regression Analysis:
> > >  - New regression? Yes
> > >  - Reproducibility? Yes
> > >
> > > Test regression: qemu-i386 boot failed on mainline master
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >
> > > Anders bisected this to,
> > >   # first bad commit:
> > >     [eb0ece16027f8223d5dc9aaf90124f70577bd22a]
> > >     Merge tag 'mm-stable-2025-03-30-16-52' of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>
> But this is bisected to the mm merge, not the char-misc merge, right?
>
> And is this just on i386?  Nothing arch-specific in the char-misc merge
> that I can see, so I would place bets on mm doing something accidentally
> on 32bit systems.

The qemu-i386 boot pass with the latest mainline kernel with
clang-nightly and gcc-13.
 Linux version 6.15.0-rc1 (tuxmake@tuxmake) (Debian clang version
21.0.0 (++20250402105505+c57b9c233a87-1~exp1~20250402225526.1363),
Debian LLD 21.0.0) #1 SMP PREEMPT_DYNAMIC @1743981563


Links:
 - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/naresh/tests/2vUkJBr5vV419fzcTFDkOmiIkax
 - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/naresh/tests/2vUk3KcyEleDxVppDpZ1jeSIx0j

 - Naresh

>
> thanks,
>
> greg k-h
