Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4BF8BFB
	for <regressions@lists.linux.dev>; Sun, 24 Mar 2024 20:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711313641; cv=none; b=aukCNjjUt379UGSQBjobGS0dZ2YZMvn0HCgbH2faKLUtUHtS3aPTpfiFrtPsW8QcOcIFaeC7IrMewdy6483Dbzvxf6VPmTxT8ne6MBV7YbUPHGUZAf0wYAuMdyPAArnoBYO2vNeVkGjPz4OA9o92Rr7RN3jd4d86zgukizmLYsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711313641; c=relaxed/simple;
	bh=2sxR9gem4rOkDv3LJEJDqf4tBKN+JI2mEjl3swXxyuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PabSmtqoLr+FY5SScP6J2P5OsM0lmbP33DLOFw+unFXSWIzXornGGyzTGS59mV3nO+k5/ZrFwnl7u9qxVFk/8BTLGmHcfoZsvKOEe9VUFKIw/GeHXGzv2pjgQqmCUsohKTpzGfUvXqKPhaYP0B5gXlUovD64Wqw1teUf5v3o39w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovOhXdxf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovOhXdxf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE7CC433A6
	for <regressions@lists.linux.dev>; Sun, 24 Mar 2024 20:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711313641;
	bh=2sxR9gem4rOkDv3LJEJDqf4tBKN+JI2mEjl3swXxyuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ovOhXdxfjk5Ht36sjn3SLnoY5KoxbidxLBEHhlLqiSQTIx53YUJ2q36E6CJyy5wTB
	 XfEU+tHrwf9W3S9foGvqJ7Gy2EIFJ5F6gdYYrGVVAaA2xjz2PyWnLL+ZWl4DBplByH
	 NKViYuwg3oE0w97ImY/VI75mxnz11pwouUtFX7orW6VBVVZ5qw1unHHzoXkPPxWHxX
	 1cnd2Zl7VdDm1JlrR35ZpYgryxvw+q2k9HRg2yo7c+hT70wJF21ykMbtBdBYKES7zq
	 AEIure9RatI4bI/p0HAasYirS8Xk7AIQLfsU9324Mn5Q5WTexy7TaQEUfHfsT13ObO
	 RAsmAmrIMghFQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d48d75ab70so55812491fa.0
        for <regressions@lists.linux.dev>; Sun, 24 Mar 2024 13:54:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcp4laCY8kKvxd80Kl0x+h6zrRVJ2gqJBFTotNpCzavTJgk3/MqDfaie38K670wefn0xgXvQv0F+UCoPCogsPHuSWCStGQmNh5200=
X-Gm-Message-State: AOJu0YwpwLbQPhslY1nuyvtgyhSumE2HaXsKJhJM00hwfgY4l/+9Uwk5
	ikyyef+szEy43riVg5pg5cj0QezOJXO+MbgQ6Ng/XInSMHLga7zMggTYuu9FT5cknDQ9LGgVcF9
	kxPZP6F9q4mQDHMUjrvGf2RFb590=
X-Google-Smtp-Source: AGHT+IEI9gi+Y9xgxil9ULR4YqHb6Y06MvrPiPhmb1TymyhNk4w1g0FnkQvVCa7vNQCMMAJCGMPJ6dAChX6G+gAID5s=
X-Received: by 2002:a2e:98d9:0:b0:2d4:6c1c:7734 with SMTP id
 s25-20020a2e98d9000000b002d46c1c7734mr3124077ljj.26.1711313639873; Sun, 24
 Mar 2024 13:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240321150510.GI8211@craftyguy.net> <CAMj1kXGzH4TiwvSF3bZsJpuuWf04Ri_852fUMTdH8pLRaH3+Yg@mail.gmail.com>
 <a3aae375-5582-46e4-866b-6a81641998af@redhat.com> <CAMj1kXGrWGGv-aXabsn1oRwwMy-Ck1nz85QkEMqQ8LdQxyeBKQ@mail.gmail.com>
 <749b1cea4fd9e8d8debadc51cf3c0374d9878ae9@craftyguy.net>
In-Reply-To: <749b1cea4fd9e8d8debadc51cf3c0374d9878ae9@craftyguy.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 24 Mar 2024 22:53:47 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGyKdoLZ9t9_X4diiy9GsqxJ_NkHsm_t+cAJBxhHW7mAA@mail.gmail.com>
Message-ID: <CAMj1kXGyKdoLZ9t9_X4diiy9GsqxJ_NkHsm_t+cAJBxhHW7mAA@mail.gmail.com>
Subject: Re: x86_64 32-bit EFI mixed mode boot broken
To: Clayton Craft <clayton@craftyguy.net>
Cc: Hans de Goede <hdegoede@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 24 Mar 2024 at 22:46, Clayton Craft <clayton@craftyguy.net> wrote:
>
> March 24, 2024 at 10:43 AM, "Ard Biesheuvel" <ardb@kernel.org> wrote:
>
>
> > Thanks.
> >
> > I pushed another branch
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=efi-clayton-3
> >
> > which has a proper fix for the issue that you found.
> >
> > As it turns out, the compat mixed mode (with handover protocol) was
> >
> > broken from the beginning, and the change you identified just happened
> >
> > to trigger it on your hardware.
>
>
> Tested and fixes booting on my Bay Trail tablet and NUC. Thanks for fixing this!
>
> Tested-by: Clayton Craft <clayton@craftyguy.net>
>

Thanks!
