Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4C560B88
	for <regressions@lists.linux.dev>; Tue, 13 Feb 2024 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707853096; cv=none; b=Ayzu8ADzi+nLJoj0yrpBOYdhMlTtdkLFlrFQ8MRhpw+dZj47S6V5WGkKmyZmaDx1Scjf7JtpNjkQcaEBQiI4hHJqDysvmF0A4avv21p2Cwq89vKPwskYSBrFimu2gPkXzxuw2zhTmogRloccM2EavP18fGLRDiCoGCttgP/qgko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707853096; c=relaxed/simple;
	bh=GjF/mMss2cis45pk3j/3jxQhna+tzPSvd6xll7mM5yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzboEt1oOw83oYodWdjmAdZs/YRiC9A4KFN7W8mtWa7efekwCW/mKjAC3tn/prW5NbC1yTcQLxo5Lzs3sa4SJoybOqCmbdsm+Dsbm0vUdF8sEFAXjFbI+DuAKffJ1Fgc3G9H583dQVDqbpm634jrb5OkX3NhO22TOzux+37zbwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LUmzCxlT; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LUmzCxlT"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-46d3a2901cdso517600137.2
        for <regressions@lists.linux.dev>; Tue, 13 Feb 2024 11:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707853093; x=1708457893; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7bxKZocdEiqoyhxdegqmhQihLPSri0Uq3BtRPxUJnFo=;
        b=LUmzCxlTvNcgFkYzLtF3f5wj1MxLSKVQReRyid+5dHKn718qGmRciYKqiMVn+BNR9S
         de17LwUYjkAnm4+z9rTbhgACay3GklvuBp9rPxX+bS2v+f9L3yY/AbJVQp+5b/yMP2Dk
         ilSZuSXbGZ18taQv9dx8uCDYZayDsuJhCV9nzugJANhCiJkE4kcb5NJPHJR4bMFCFztO
         OHsFt1bOO6R7B0PXDCJAoWRfyRYSl8TCKt6sH1shSinaPPemlSaugGI95C1bIobDpsTM
         gSTd4v1z4pcv27t2sLixuLa97ihyzJquaRGLQsJRy6LnoXdScJqRnhuyaFpdjo/FGy8V
         WpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707853093; x=1708457893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bxKZocdEiqoyhxdegqmhQihLPSri0Uq3BtRPxUJnFo=;
        b=jaPNcsfPnoM1eB0FswJT3UjLWfsRHLMwClGm7xND5XRQ+eehjRYcH/zHpjg2fPP9Ry
         BquQKfjCGGaz1vXuVsS8MI9br3S9TUBxQcboabIv8xw/97PhansmdWqtXPBQsTXFHhOH
         wBF6ShJnosQlIHwuPjzPQOFEs8SeJn0zh9tx4d6bk1/X3AtOSZWtXB7qs9RwBqDChh3T
         Qaw3kZe7UH+ruPtSVJ68GqprOKt58yIOUz8Sf0dbfKXFXH0urXoM+IjwM/wymSYmL9pF
         N2Zbjl1wzkjz/0tInrCyqMzYIVSs9igjQCySVi+5JjOPlXaOIeUrQ3MPVs8SzeEB+an/
         XhSw==
X-Forwarded-Encrypted: i=1; AJvYcCWzTavizl4usSNigbc4PUit8KV98VY5X+gxT3atnTEjfGJlKTJfXyuagxLpI20orWZx93SiRJO2lIVuEwS6AsCODdjGe9iHmN03J4c=
X-Gm-Message-State: AOJu0YyUDvw+lIOAHpjGhcboUdLROUJhiEuWtQ0DxUwApKf7BsEDbWGC
	S/hyl7kwcpRkVnC+KG8NOyGI9QLHkI3paRPif8y/ZVzT2IzS5SsMNbSXHlO+3IKovaOHq9xa6EU
	CtFNklFo6e2XqAsebwhJsQaoO1zaCNl6hUmHtiQ==
X-Google-Smtp-Source: AGHT+IEdlfV6LUGLmxeJdIsOn87Xgz2StdXTzYIr3pkT+5iQVS9dR3Oaf/T6ltRAqvQ6qbHi8ala38CuM7GKA3GMx+U=
X-Received: by 2002:a05:6102:12da:b0:46e:c42c:e24a with SMTP id
 jd26-20020a05610212da00b0046ec42ce24amr465112vsb.14.1707853093237; Tue, 13
 Feb 2024 11:38:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuVJ3DfmOR2GxbVmLqh_d=3y_wTXX-vQOUgp86uX-3oGg@mail.gmail.com>
 <87il2sw4tj.wl-maz@kernel.org>
In-Reply-To: <87il2sw4tj.wl-maz@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 14 Feb 2024 01:08:01 +0530
Message-ID: <CA+G9fYu-2x48SC6jYzuLVDsYt=FF8-9x9e0Nt0X2gb5G1PvdaA@mail.gmail.com>
Subject: Re: WARNING: arch/arm64/kernel/cpufeature.c:3369 this_cpu_has_cap
To: Marc Zyngier <maz@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Regressions <regressions@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Feb 2024 at 00:48, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 13 Feb 2024 18:21:23 +0000,
> Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > Following kernel warning notices on all arm64 devices on today's Linux
> > next-20240213 tag.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> What is the sense of this tag, and even of this email, for an issue
> that has already been reported, as outlined below?

LKFT building and testing Linux next tree and found this warning on
today's Linux next-20240213. However it is been reported by someone
else.

You may ignore the tag.

>
> >
> > [    0.038524] SMP: Total of 6 processors activated.
> > [    0.038539] CPU: All CPU(s) started at EL2
> > [    0.038588] CPU features: detected: 32-bit EL0 Support
> > [    0.038602] CPU features: detected: 32-bit EL1 Support
> > [    0.038620] CPU features: detected: CRC32 instructions
> > [    0.038650] ------------[ cut here ]------------
> > [    0.038656] WARNING: CPU: 0 PID: 1 at
> > arch/arm64/kernel/cpufeature.c:3369 this_cpu_has_cap+0x1c/0x70
...
> >
> > This issue has been addressed in the relevant email thread,
> > https://lore.kernel.org/all/0593516b-2419-49b7-83aa-fe189ffad0c2@arm.com/

> Correct link:
>
> https://lore.kernel.org/all/86bk8k5ts3.wl-maz@kernel.org/

Thank you.

>
> > I will test the corresponding fix patch and get back to you.

I have tested your patch and the reported issue has been fixed.

- Naresh
