Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AB93375BD
	for <regressions@lists.linux.dev>; Mon, 18 Aug 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755523171; cv=none; b=ZbFKu+PLSBHuwwTkcsTkpXuQ2oMjMIRhLSyTb4kVqkHBSPln40l1AroHKsroENov5FeToCepoPY9SJ3nSU/IXCdO1UQwahTjv/cACNjER8yXSod5KOw0TTRKcnvR3KDtCtCmvpljG/xzPK+YBDk3VcU9L3YLg37cQ8j4Ci2IFXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755523171; c=relaxed/simple;
	bh=d8H++LMNz1lxoCPsYGPyOhmw1eLBXRyF3ledLNsKlnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0osl3lLtsYjbtXIOboXsKkFvIuEOxPglBwNH1W6wNa1i/TqSkM6rTIToRTzU4szVfH1Z3kmLOSd2pL3haDNinUOryBtt/0lo+ldLRV24dIjvf7yKnP2o//Os/d6Z9p62Ce0FYR//hLJwvJvXEq9F5cXXF5L2ln14cHMEijj+nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjlhCwiN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjlhCwiN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b05a49cso29811965e9.1
        for <regressions@lists.linux.dev>; Mon, 18 Aug 2025 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755523168; x=1756127968; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkRhgj6u3LmpnQlstGfUBG2btp13oJgkyn6qmMW5F2s=;
        b=CjlhCwiN0QX2BRrwLNPUYYvIV/64KdkyLNSzSbzRzc0qaVa80VpYj8PwfkdTZRkDGc
         59uuWuQT5lskMlTpBwvP/667meDesaIUXT8UdZXnD3b+pC5ypatvgyFQZROdiZtIlhLV
         pcCPYdloFfVRJjPT/GtT7pWCj/FerYytuKqZJw6REwCPbRDPzMLMopftZvEuDmZueaIk
         NgKewSR6Q2YmaLGiTGLSQrazes0IhoBjehT/6Xir5VW1P3EaT1DVdmgzVavxut8DMRHt
         H7KhyEPxy1IhvpPzN+2U3RlDlIhgIvy4LlMTNGkr0CkgqGkJ0RoVihRiiwgnXj1PlfwT
         +Qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755523168; x=1756127968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkRhgj6u3LmpnQlstGfUBG2btp13oJgkyn6qmMW5F2s=;
        b=PSNwk0DIglQCJTlCsqnBHWZ1epbyUe3nwjawhH/POSIiEBznebXl4I8Puyidi4rYnC
         5zvW745//KnYJ02zIvGb/cGwxPoeQ5iam3ZD9e5zIinrHM34yHtBOgHNkL6vVo2cw5nC
         sQYXcvw4sWOdclLGfcYBSv5Af4XGYGh5bPfkU0kNh+MzHoto+9MWnB2iFivZt+5K6280
         5YV7K0yrqWZ4dBbL0oYFGUTFuzGPXTy/tXEjjhVGOftPKeJFlumXf2DMaM1n712+TZRL
         8/ERvO3vBOFb+awqR+dRu7wqoRX1Nid2Gpi5Oiz0+EWPzzdV/JMo6Llln2dl7h1SngK9
         a9+g==
X-Forwarded-Encrypted: i=1; AJvYcCU8L4A7TU15kkcHTtl4fTe3nsYdT8+vOwO/37ljJIBuS5jn1WO5K7LK5ANRirzFwo3V62UjpUuW8Hmjvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIQXE1WtRw3c8C5liOzc+Tn8frWfVzxf5LP7cKXhu1816+DCqA
	rfbTiy4Ev8dWlHb1uidbX6MQYPpwOccOn+Pmmei/JcK8Vn0Iqb0+0wYm7nM7UYcimblMOfLmExq
	Iw8l+2SOLm4/h5DYVV2conC/j9LIuNuk=
X-Gm-Gg: ASbGnctJkqQY0HgKzAiCNQ31LOw8eGYQlsmIMV5kJjWvDHRb5IPN62lg5fO4ega71GE
	ekBn1vHTEiVfLSEOrN330EyPMQUa0C/xTd15cqnluKQIrE2W0fc1TFedcv+BT++XKgqDe1mNGJ7
	Ft7lSO2JxSHmSMqh2eN0IhYli7NIT67MmgtBa9JUW02ijZXyE2Q/nn5LeYaoOh6d240qN+NC7LU
	W+w5V7Gz4FzzWs2yKR2TxR+1XRCZFOvEnDOPiLf0w==
X-Google-Smtp-Source: AGHT+IGNjevdxuEeCCQDuEyujDtrMHmT/jKR/Bp96iHsp/TRECkv5we1BEl2ldAO/E0rwgBF7RI8/FmaT28EriP98Ps=
X-Received: by 2002:a05:600c:1906:b0:459:d8c2:80b2 with SMTP id
 5b1f17b1804b1-45a217f71b3mr76250805e9.7.1755523167182; Mon, 18 Aug 2025
 06:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACBcRw+Fu1B+fXEFvhfsZFtPqa5G=AYSW0K3L2RBWh8YfkgUhg@mail.gmail.com>
 <2025081831-viewable-vanquish-e8bc@gregkh>
In-Reply-To: <2025081831-viewable-vanquish-e8bc@gregkh>
From: =?UTF-8?B?5Za15YWs5a2Q?= <miaogongzi0227@gmail.com>
Date: Mon, 18 Aug 2025 21:19:15 +0800
X-Gm-Features: Ac12FXyfyUVl5TZp3_bAB7947fWLUOKmM-rxcMVcmVIN9DO9KRz5xZIM_jnBCqE
Message-ID: <CACBcRwKcApHzYssnPj2YQht1yYicTALs03GYkyP88W-9Thmo3w@mail.gmail.com>
Subject: Re: [REGRESSION] IPv6 RA default router advertisement fails after
 kernel 6.12.42 updates
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, edumazet@google.com, 
	kuba@kernel.org, sashal@kernel.org, yoshfuji@linux-ipv6.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thanks for the quick reply.

This regression has been reproduced on Linux 6.12.42 as shipped with
OpenWrt. Currently, OpenWrt only provides kernels from the 6.12.y
stable series, so I was only able to verify on 6.12.42.

I am looping in the networking/IPv6 maintainers so the right people
can take a look at this issue.

Best regards,
gongzi miao

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2025=E5=B9=B48=E6=9C=8818=E6=
=97=A5=E5=91=A8=E4=B8=80 20:25=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Aug 18, 2025 at 08:03:00PM +0800, =E5=96=B5=E5=85=AC=E5=AD=90 wro=
te:
> > Hi,
> >
> > While testing Linux kernel 6.12.42 on OpenWrt, we observed a
> > regression in IPv6 Router Advertisement (RA) handling for the default
> > router.
> >
> > Affected commits
> >
> > The following commits appear related and may have introduced the issue:
> >
> > ipv6: fix possible infinite loop in fib6_info_uses_dev()=EF=BC=9A
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit=
/?h=3Dv6.12.42&id=3Ddb65739d406c72776fbdbbc334be827ef05880d2
> >
> > ipv6: prevent infinite loop in rt6_nlmsg_size()=EF=BC=9A
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit=
/?h=3Dv6.12.42&id=3Dcd8d8bbd9ced4cc5d06d858f67d4aa87745e8f38
> >
> > ipv6: annotate data-races around rt->fib6_nsiblings=EF=BC=9A
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit=
/?h=3Dv6.12.42&id=3D0c58f74f8aa991c2a63bb58ff743e1ff3d584b62
>
> Does this also happen on the latest kernel releases?
>
> Also, please always include the developers/maintainers/mailing list of
> the subsystem where you find an issue with.  Otherwise you are not going
> to reach the developers who can help you out.
>
> thanks,
>
> greg k-h
