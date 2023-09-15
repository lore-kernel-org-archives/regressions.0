Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB3A18E1B
	for <regressions@lists.linux.dev>; Fri, 15 Sep 2023 23:04:33 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5308430052fso1504676a12.1
        for <regressions@lists.linux.dev>; Fri, 15 Sep 2023 16:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694819071; x=1695423871; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/dxG2q7F6Mkp+vlHGfUkxcAXUqWVC7Xr/x4rCnTi+nw=;
        b=lVy+Vsz6QROV8l3ocmXZz2wFw/ytuUcos8Pwh/H9b6xOWRW8DB5c3ec3Aqyi59Z6uA
         MDgW8YDjOmqoJxoBQaDOgCf6GoZcdsChE7pkMPFzfogba56ZMRu5lBu0vGC9DCxsA6QQ
         z/hxKKeJKhrW6RbPvAA6zY9jK/tukVCYHV/7SQG64BdcEMRpvSCDt2TllzHJ45FlfJJD
         2jokLF5w9yr+nIBDgPiEfd22PisS7iA0d2x4V4SLdzLC5YNuBpCmlyxaJBJg+OzgueXx
         UpCqw4eqyDjJYvrcIOHFMjOJaxZyRNk9Nm6vRrZt81F/OYGPbPa9ws8zzhVl6pQ204ds
         qWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694819071; x=1695423871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dxG2q7F6Mkp+vlHGfUkxcAXUqWVC7Xr/x4rCnTi+nw=;
        b=wHzJCZR2E8FkZ/BEjKzALlkWBwfF+ap5YsUAl6zT9CAzyuu9oJ2AqX02mVUIhcheTX
         eIIMtbm8MnL5WO6aDQkjvP/UViZ6ISs2BTAwxXxCXx3zPqXsT4dE4Oj82B/HpGVlcaKa
         WYTsAfJjYW/UVmvO+CZs9yvd6hmrSRRY7pcUWGQR/9+Pxop1Kba//JTCxTLFqH+Z9BWl
         ak1sk7SXeRAAGxFPSJGNWCgSY+dgp4XYjRBrYyI61ZBMNTjd0EiqfmAcihsOaIv9672h
         NscbwsJEzAfN2br6CwEQUiIX4qipgliy/3S0TCOGMST5TBCWwf96RhHdq5+O5U2ssQnn
         evuw==
X-Gm-Message-State: AOJu0YyuTXnwVdvbFwcj6AE+FoaQc5hmndLzpV2glSeyoqKXKJamNwnr
	6Ux1Lkxjr9CTQeuD6qqBj6MduJoRjFcaDeTLdfHCX8kMJ30=
X-Google-Smtp-Source: AGHT+IFk/4QQIsJh5pUlO7CGZk+/3wXfyCvaMWmuJ3//r/dMlCJwaGmfCc9vG36qHgaiFk9OzPuixZAzv6zA93Qcl9c=
X-Received: by 2002:a05:6402:344e:b0:525:6772:1595 with SMTP id
 l14-20020a056402344e00b0052567721595mr2291463edc.6.1694819071151; Fri, 15 Sep
 2023 16:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5a7f2a6e-46a4-a5c8-fe6a-c2581496b5cd@gmail.com> <c7e70f54-9696-4b39-aa17-576987ffce85@leemhuis.info>
In-Reply-To: <c7e70f54-9696-4b39-aa17-576987ffce85@leemhuis.info>
From: brett hassall <brett.hassall@gmail.com>
Date: Sat, 16 Sep 2023 09:04:19 +1000
Message-ID: <CANiJ1U80VNiLGKEmgYpGjUQ2poREN9uGnv2QXM_GtzjgBtUSWQ@mail.gmail.com>
Subject: Re: Fwd: 5c8a79e8e12b ("wifi: rtw88: correct PS calculation for
 SUPPORTS_DYNAMIC_PS", 2023-05-27) increases CPU usage usage for irq
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>, 
	Kalle Valo <kvalo@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi

I'd suggest that there are actually 2 regressions
(https://bugzilla.kernel.org/show_bug.cgi?id=217841 and this bug). Bug
217841 masks this bug as it prevents the laptop reaching package C8
and I'm assuming this bug shows when in C8. The patch for 21784 only
affects devices connected to a VMD controller so I wouldn't expect it
to affect the 8822CE.

Options that I can see are:
1. Park this bug until 217841 is resolved
2. Try to test on a laptop with a Realtek 8822CE but not a VMD
controller. I have access to 5 different laptop models but none meet
those criteria.


Thanks for the reply
Brett

On Mon, 11 Sept 2023 at 23:29, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 27.08.23 04:37, Bagas Sanjaya wrote:
> >
> > I notice a regression report on Bugzilla [1]. Quoting from it:
> >
> >> This commit improves power saving - it enables the kernel to
> >> achieve package C8. To achieve package C8, 3 Ubuntu VMD commits
> >> must be applied as well. [...]
>
> To me that sounds like there is no upstream problem, hence this
> shouldn't be tracked as a regression. Please correct me if I'm wrong.
>
> > #regzbot introduced: 26a125f550a3bf
> > https://bugzilla.kernel.org/show_bug.cgi?id=217828 #regzbot title:
> > correcting SUPPORTS_DYNAMIC_PS calculation for rtw88 increases CPU
> > utilization #regzbot link:
> > https://bugs.launchpad.net/ubuntu/+source/linux-hwe-6.2/+bug/2025040
> >
> > Thanks.
> >
> > [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217828
>
> #regzbot resolved: invalid: seems to only be a problem with a patched kernel
> #regzbot ignore-activity
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
>
