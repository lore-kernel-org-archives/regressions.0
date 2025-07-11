Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB4027A105
	for <regressions@lists.linux.dev>; Fri, 11 Jul 2025 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752225681; cv=none; b=AiM8Xi4uQOvLaCr3Zu79GeyE0rwVAieG86MmpbOqcnJWvs3cM66ZkKGtGaJ1STtQFzEWb3ephjA9y/rxD1t3VkdhlBvXJwRswpMOxXQ3fdf7QB3Oj4Ey/CU7z51n/eed4jzWXiW6KnkIjA3IljevWvi0FAY2faUNvEkAPU0rnKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752225681; c=relaxed/simple;
	bh=v5skrjljMaiRznKR3++rcBMCio6TA4MIaU7O9AkkvO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjokoEkT5P0B+MWVfz78MpNikHuisoNfD+b5ODn9gECkRTqzGSLgq0L0W8RgBa57UXPe8+1RTl0x+of2TY3/L38CYM/RZhzruTT8li3FlMho6uqdnJY+amfb5D5AsfOf0FefsJKGgdCrHjwSspa28O2jxdOiK0M3x8AaYAl70E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVr1lzVU; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVr1lzVU"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so3492604a12.3
        for <regressions@lists.linux.dev>; Fri, 11 Jul 2025 02:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752225678; x=1752830478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5skrjljMaiRznKR3++rcBMCio6TA4MIaU7O9AkkvO4=;
        b=PVr1lzVUhTRr9EQuBiACKsXGUJSX77LfiVnZJkoquMiPPbn5iQ/w9fp2evNFcMkve/
         OXkRKtelxtOYfxChEaYPjQbRYZcYG/Yf0w0AGKT3jinyOhmTup3PZHyQ9PIYHNQWmoUD
         DaMkS+6u3tB2PBs3uEhRyQmUwT+oOJVxOSin+8DGG58Z6gdowuKNeS0L9a6LPWLJEYpK
         wh7IfGZh5q3K3HOQR2Ofafo46RzGWHTfXXASiSaR1EQQkms+8LJe4S5FTsgkfPkRMbN8
         pULaku0gMjTriX2OuLYjHxC8lMoHhN+aH6wQCT5BrL45wd3CEolIIiyS748ftb8b70Fb
         Oa6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752225678; x=1752830478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5skrjljMaiRznKR3++rcBMCio6TA4MIaU7O9AkkvO4=;
        b=Q6Qhuj3bTvxdgJhWHiQ2yiV969x+HAvkcSJ3Y8WOgwxd541IWkG9sGeFNf+sLHmZZ2
         hw6nOjqCSe7+q52JJxlOOB/lLccqiPEPAbQe0JiO2rQC0WED85B8phk8ZaUNw2iTN8o9
         ++/sgMa6TFFjc2Y7SllDkpfFf2gAXFazcVn/X9KMzmIIwSoGME+LXZVHRolfKNk+OE4T
         atWk4v/zeUy1/JKz62bF7wisjYpE+1qxEIdb90eS5nDlZVE9oZUECb3Ve6DQovoFQLlj
         q08KdxeA94Wd8f+T5uvsrWJuX/46I9iyqaPLIy6zBanFoqpMPDu59sIeD/fjmSJvdxY0
         hhuw==
X-Forwarded-Encrypted: i=1; AJvYcCWahEDQJxeszRVmO63rYup2u6bvbgCDzna9t3wx3LWPXJuGbBgbLLpjGa1uyioLuhapsb9NUk66OYmb+w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2ZPtTMloVOQX0wH2NikM6Uyh/hq/dBLgV61N/R0AE53f7dCTq
	9ty6dHUQqmgwHsGxwL+1aJ517YsNka2Wbkq7x8rs6b4HZ6HxvFycFDOI6J6E7liLayKxavMGDgS
	hLpXfqZHUgMzIkLdLQmujZ8dXlxHkp/E=
X-Gm-Gg: ASbGncsW8Nn2AG8fCTqc5ZEZHdkRCrV7iUWcPx6HkvWP2Fe4yJTamwlZ9ZVHAj7mqgl
	4XnElbeLFPSJoUqjCnW+48LLAA4X0tOJ4ExDiYpvtkO5r4HHIX72dMEPHxLj74abUW3oDJnv3g+
	zlVDH1unSCeslyJqmOWWxHr8r52lVXjX1KDWiMfA/WloqzpWVgroh6Xk7MMV8W5UFr5dR18BzVw
	1LC4ifVt/s3aTkLCb6xZCoOYeNxBlclm0ewA3PGAw==
X-Google-Smtp-Source: AGHT+IGaxamUHCv58lDZJx8LYdQFjQw/vvdayYy2xVYKdbyGDDDxQONMUPmrxQvmMYNkh8wFCp43zR+0OhbOW77dwW0=
X-Received: by 2002:a17:906:478a:b0:ae0:ad5c:4185 with SMTP id
 a640c23a62f3a-ae70131bae6mr153726366b.57.1752225677662; Fri, 11 Jul 2025
 02:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvcb-BAreFW=QS=DnWnXX1gK1EAX09tBQzopwH1Jd1d=w@mail.gmail.com>
In-Reply-To: <CA+G9fYvcb-BAreFW=QS=DnWnXX1gK1EAX09tBQzopwH1Jd1d=w@mail.gmail.com>
From: Neeraj upadhyay <neeraj.iitr10@gmail.com>
Date: Fri, 11 Jul 2025 14:51:02 +0530
X-Gm-Features: Ac12FXzUURrO7TVvQDfpHYXggr-im9yTZQ0aOXcB2YcIl5rlAM6oFaGWx2_l_Tc
Message-ID: <CAFwiDX8A=2N9iOOMRE_tzfPLDfsn70bhxDhiFMkyZ1pEMasXiA@mail.gmail.com>
Subject: Re: next-20250710: PREEMPT_RT: rcu_preempt self-detected stall on CPU rcu_preempt_deferred_qs_handler
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: rcu <rcu@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	"Paul E. McKenney" <paulmck@kernel.org>, neeraj.upadhyay@kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qi Xi <xiqi2@huawei.com>, 
	Xiongfeng Wang <wangxiongfeng2@huawei.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

On Fri, Jul 11, 2025 at 12:11=E2=80=AFPM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Regressions on boot failure observed in builds with CONFIG_PREEMPT_RT=3Dy
> and CONFIG_LAZY_PREEMPT=3Dy enabled on multiple platforms running the
> Linux next-20250710.
>
> Kernel stalls and RCU preempt self-detected stalls reported.
> Boot log shows CPU stalls and failure as below.
>
> Test environments:
> - Ampere Altra
> - rk3399-rock-pi-4b
> - x86_64
>
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
>
> Boot regression: next-20250710 rcu_preempt self-detected stall on CPU
> rcu_preempt_deferred_qs_handler
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>

Thanks for the report. We saw the same issue recently. Here is the fixed co=
mmit:

https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git/commit/?h=3Dn=
ext&id=3D2e154d164418e1eaadbf5dc58cbf19e7be8fdc67

I have pushed it to rcu next branch:

https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git/log/?h=3Dnext



- Neeraj
