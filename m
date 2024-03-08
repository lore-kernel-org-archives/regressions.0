Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9861DFDE
	for <regressions@lists.linux.dev>; Fri,  8 Mar 2024 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709912970; cv=none; b=oBDqRCfLe9Akvt5Es70lyKZ/uPfbWQrCpz87W5c/0RIuOhuSbDyY+TJFiKz26tuEbDjMeA0DwwbtSsQoWAyrgRGG8vfHUjetQnOFWI16PgtXK1hdmG3uRAdetPUJhQA51K0sgnIsmEFBkV1wrJeN7wdGHkjJouOkJ7VMohvtyO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709912970; c=relaxed/simple;
	bh=91DpN+5jqCtFxdFAdJyx2F5lCUgsbaBUIGnQ7cQW6Vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugm6K51lnGuAVj/QuB3VESIxpYdW8qNFnVBugAnpCfhTBNRYGblALjCsaCLI50YIqiC+q/upoT7rOkCWTWkRi5i5Gtt8j17uxf9NbeXZQNNvoHDM2PyXJXjlLiur+s/vofrSQDm/gDw5bDUIq8kNGjnfAM1+bQQLl4TFwYLF9xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH0Njf64; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH0Njf64"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d3f4fef377so29738911fa.1
        for <regressions@lists.linux.dev>; Fri, 08 Mar 2024 07:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709912967; x=1710517767; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld+4cFJiCUpIgeEmlpcazZFkXkoYjxiqrgcd7maZMKE=;
        b=SH0Njf64RCWePec7s0X2de6tnUDYLVJywNU6RA9wiRg5bIHJhnem5OxCy0fHZ7qZ7B
         ztNp8xdsnsZ5gK4RN39M1bOczTNnm09FJNh/7A6TkkP5mLT/IpHshEJ9lOt8ufwQP0ki
         TwqGxrhJVkgR3TUFswtKdXqhtgd9O/BdChuKPxVMgXsT5mb1aRffQsi4CUzcf4/5I5+k
         6YYHjyN41ok324M9kUTwlVOgkHgqd/3Xh9+mwpyvx2Rp7Bcs6L/5tbhLbxRtftDstl4l
         18XonRyC3KxtecSzsB/AUya/OMFoBgCVwTorGQ4pK09F6rXCM2YslvIMqdPHY3GsRtdL
         GLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709912967; x=1710517767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ld+4cFJiCUpIgeEmlpcazZFkXkoYjxiqrgcd7maZMKE=;
        b=fA2aDgFzRCKrlVPbKOvL0TuOXpXyPz3earV/3DQNL/zqz8WB3327VTTz8K+UVpa+g5
         dpMUbmS76bj0csoGBWoZdZjyBgSd9ZxfPzlpzQ0IKpc6uaJ7U+rTErCYU3TWPlSJJ9KR
         qpWR/5BciUT4BAvyrVXR7J3z3xmZRJ6KtZPkfpbS6IxpvQkdAeOIn1Dzj3EXj8/2UhjC
         9XPp8WEHpXbsut5DTYodJArVdpml9kVtqEIPBhNZkP8MJiUCSjh+2vdkJVmH34TrQrfQ
         uXVeFmK6DWnj3mpkhsDwy0O5wXVK90f9vScqqmuK5tpJu1Qajlms0eoxVpJx8uXizZwz
         cGJw==
X-Forwarded-Encrypted: i=1; AJvYcCV6sB9flUdjnnUAYaWV5U8RouLIMZ4VDKgigqrV0YhQjStcfhsiJTB0F8KWiHl6nXfh4AiYcHOi1EebV4vXGmgaDyu0yGbmQ4FL9fs=
X-Gm-Message-State: AOJu0YzdPVBsYPQBLYwZxlYoQo0ZO/Nak4hqPOhM0THtdPGA9LhAHL78
	i7Ba8azRcdv36rIg7LMRABk7NebJk/bZYrnM/PueCXIXgKYgDanTs7225AznRYE5GIEEHRvPHKx
	oV/g1ClUlGK3os1xLhPIWtiAQGtk=
X-Google-Smtp-Source: AGHT+IGPyssiDhhfcu2ArxzuzahLXmqh8jRRtzzOKzL6wiSwUy7U9ClXjqn4LMqSqv3rNw24PwXN+9uNqUZrMxSzDL4=
X-Received: by 2002:a05:6512:3d09:b0:513:3309:cc62 with SMTP id
 d9-20020a0565123d0900b005133309cc62mr4774260lfv.47.1709912966304; Fri, 08 Mar
 2024 07:49:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsVni7x6AuP97i10oxcusUrB4+m2wpM4Z3mTzWsnMz-Mg@mail.gmail.com>
 <8f69d1f2-0ce3-4851-a784-c76b274dd9ff@app.fastmail.com> <CA+G9fYvhxJ_Tokrc3zxgP4UNjrRXjhxjfqMtSbMOoURCF1GjmQ@mail.gmail.com>
In-Reply-To: <CA+G9fYvhxJ_Tokrc3zxgP4UNjrRXjhxjfqMtSbMOoURCF1GjmQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Mar 2024 07:49:14 -0800
Message-ID: <CAADnVQJLhKPA1MGtpqDwAnSDrCXBd1dxoCor2RwD22a-VLpiKA@mail.gmail.com>
Subject: Re: arm64: WARNING: at mm/vmalloc.c:315 ioremap_page_range
To: Naresh Kamboju <naresh.kamboju@linaro.org>, Christoph Hellwig <hch@infradead.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mm <linux-mm@kvack.org>, 
	linux-next <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 8, 2024 at 6:24=E2=80=AFAM Naresh Kamboju <naresh.kamboju@linar=
o.org> wrote:
>
> On Fri, 8 Mar 2024 at 17:34, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, Mar 8, 2024, at 12:53, Naresh Kamboju wrote:
> > > The following warning was noticed while boot arm and arm64 devices.
> > > The below log is extracted from arm64 ROCK Pi 4B while booting and
> > > another issue is kernel oops noticed while testing selftests:  kvm:
> > > memslot_perf_test.
> > >
> > > 1) WARNING: CPU: 1 PID: 201 at mm/vmalloc.c:315 ioremap_page_range
> > > 2)  Unable to handle kernel NULL pointer dereference at virtual addre=
ss
> > >   Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> > >   Kernel panic - not syncing: Oops: Fatal exception in interrupt
> > >
> > > Please find steps to reproduce, logs and config file links below.
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> <trim>
>
> > The warning was added by commit 3e49a866c9dc ("mm: Enforce
> > VM_IOREMAP flag and range in ioremap_page_range.").
> >
> > This indeed uses a special memory area at a fixed physical address,
> > but I don't see where the vm_struct comes from.
>
> Thanks for your explanation.
>
> > No idea here, but it seems unrelated to the first one.
>
> I will reproduce this issue a few more times and get back to you.

See the proposed fix:
https://lore.kernel.org/bpf/CAADnVQLP=3DdxBb+RiMGXoaCEuRrbK387J6B+pfzWKF_F=
=3DaRgCPQ@mail.gmail.com/

but Christoph believes a different approach is necessary:
https://lore.kernel.org/bpf/Zeso7eNj1sBhH5zY@infradead.org/
