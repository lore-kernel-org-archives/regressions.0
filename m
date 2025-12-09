Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94901FBCA7
	for <regressions@lists.linux.dev>; Tue,  9 Dec 2025 06:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765260217; cv=none; b=Y78g9c28H6bdmxayG/uOWdlabQQ7tgS5X8bodX+tWbM7WwBzP0tMdrMl4FAV8gGe5uM8r69yzRBOYP60RxRMdH6dtZyuYoTrVZMnmxY+ZF91ZLkaav22O+QW+vXJWvWkMPCIAEWfurFQn5Y/6EAaleKv1X5xxXEpJSaPhJLCcTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765260217; c=relaxed/simple;
	bh=oBTZ2Ya3LFBT5ZFu+p8mzczZGzmeB6TLslS1Fe8miAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFyPlwpuvbssxbXdBYVvj0wEv9ylXtmEBri4xnQOkjXnDHw6+6YY7vI700wGoO+pHiJKArbemXerCIsvUB0f2d4pby37Ih2I5H9qb4ISEW0uYyX96LKlCERwZtCU7cQE6zTQ1buhurrUX04g8a8q+4mcAj+9uCHPQahkhRuYnV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MV3PsBzO; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MV3PsBzO"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-787ff3f462bso63352147b3.0
        for <regressions@lists.linux.dev>; Mon, 08 Dec 2025 22:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765260215; x=1765865015; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBTZ2Ya3LFBT5ZFu+p8mzczZGzmeB6TLslS1Fe8miAw=;
        b=MV3PsBzOaYmB+UOwpKbe4b+qw9K08uX6Bt1m+nfmm96aEZQiL8D9nH4h86kSuMGOU/
         8SjOa7SOgSFfVb5/tK2AnXkk6i3i4eCn87ruYf2Iq+YIB+Ju6O87hLCMTMxWBvEO90KL
         ShiScg7ZjOZDUxDixfJhOBbacDdcryVkzh8nGPcUV5mgLNLEioMmmcxw+h18qU/vttQn
         5nsOojUIpNMk2iYyDIlWKtSGcNnUs7E/vuZ/dcL10Ec57ZC+J1o6KkV/8yjzrpdyKsp2
         7kIgPgTSOT9Qw6vpS2kkEiMJmP98OwqH4tjXX916ExJrednZ2QgUd4C2DtUNn46fGRdb
         NTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765260215; x=1765865015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oBTZ2Ya3LFBT5ZFu+p8mzczZGzmeB6TLslS1Fe8miAw=;
        b=aYbQD4hRCYT53Qq/IHgUoS2b3A1EdaohCF8YLNWCwScZekgiY+EeTCQVkh97JLHzIc
         15JmK+IS0arRt0beQ6qAMveLq+F7vh5BXIJrkANfu3yEsBL++dwlwW9jchX0HF+5MM/b
         1Azqk/iutCZnjal+LRjIPLnj180hudf0ZGdyeOzivSxyRmWA+yA69hlTNoybrJWB7nX5
         WGW1WFLCWjgApHuTQbYoMzbfJDF0Y9i3y2iVmwU6SLKocOuRZXAjlb5KoxLZYSiHYJsX
         y7YhPtr4PXBv342I1m7h0SM/MBtjmhgJFy2m7Ynce3/hEea+toDYER5jgefhSj8IbtHC
         7pvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk9TxDQEzIznF9SMGtIif4JH+kcyzCGCDjLu8xrSLyle7lq/bFuAEvUqTMcZG6VldDpFfNAtvdNWUI0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgfvceyV4UOW7chz2ECVbbwibu2h4DXYqy0aOcyR43HAPPR+kV
	CUDdEcoMotAyNdJOf/HeID+CanShHim9KbHGYGtXpbRzgDLtv71EHZDOVoiHUouLqT5akavtGZ6
	h5g3MpDqZlWi0npMJkhWNDDzXyL2ch9M=
X-Gm-Gg: AY/fxX43lzNmq8xwJi1i0HNDeo10k5//Q9/5iFc84f7DEaYd+2fothjd9DMhyiH+FDl
	lM9OqITp2X7NHmItOclkzKw2O2OhHlvFTaayNOdVle+sDu8e+tUYQwGDqxNknVCsN4y2WSVc6QJ
	bk84VmJCdgvtFoXZpYLa4WRJBqS8RJXU1shO8PPQfVCITXSv841A72fT5RuHtxyWV5sSgtojvUt
	rjGqEVtsGk0uYJisBYJtd5aUsMM/+/s4SWzcbY3bsdxF+W/+eRAKEXsXXthLwSoiR/nYtQiZOJR
	NEx+DxQ=
X-Google-Smtp-Source: AGHT+IFWSk+Gx5Hu+GxhdC19MWzg6caPjziHbN4HkRYzRB5k+1atfCOQ1Mi8C0lPsAyjisE59nr9CN3RG++h3+fh6BU=
X-Received: by 2002:a05:690e:b86:b0:644:60d9:865f with SMTP id
 956f58d0204a3-64467a685ccmr282456d50.43.1765260214852; Mon, 08 Dec 2025
 22:03:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231213083251.186935-1-chris.feng@mediatek.com>
 <20251021125446.4384-1-safinaskar@gmail.com> <e27d0392-11c4-4b9e-8ada-9db73f47dddb@amd.com>
In-Reply-To: <e27d0392-11c4-4b9e-8ada-9db73f47dddb@amd.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Tue, 9 Dec 2025 09:02:59 +0300
X-Gm-Features: AQt7F2pBg8sUS-refhzV6U8KXOpDLQr9gIhi7WDltdVoC5E1oBVor853-rHhgg4
Message-ID: <CAPnZJGB2YAx03piGMLE=wLOQU9-gCpSdFZhBE5iECkDxwzYCFQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] "Wakeup event detected during hibernation"
 on Dell Precision 7780 (was "[PATCH v4] PM: hibernate: Avoid missing wakeup
 events during hibernation")
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: chris.feng@mediatek.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, chetan.kumar@mediatek.com, 
	hua.yang@mediatek.com, len.brown@intel.com, liang.lu@mediatek.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, pavel@ucw.cz, 
	rafael@kernel.org, stable@kernel.org, ting.wang@mediatek.com, 
	regressions <regressions@lists.linux.dev>, 
	DellClientKernel <Dell.Client.Kernel@dell.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 5:29=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
> To me it sounds like it's potentially the same root cause for the early
> suspend wakeup as well as the hibernate wakeup.

Adding "gpiolib_acpi.ignore_wake=3DVEN_0488:00@355" or
"gpiolib_acpi.ignore_wake=3DINTC1085:00@355"
doesn't fix this bug.

> Are you closing the lid
> and putting the laptop in a bag or putting anything on top of it?

No. I just click "Hibernate" button using touchpad in GUI, and hibernate fa=
ils.

I just did some printf-debugging. Results:

We call
https://elixir.bootlin.com/linux/v6.18/source/kernel/power/hibernate.c#L870=
 ,
it calls
https://elixir.bootlin.com/linux/v6.18/source/kernel/power/hibernate.c#L723=
 ,
it calls
https://elixir.bootlin.com/linux/v6.18/source/kernel/power/hibernate.c#L636=
 ,
it calls dpm_suspend
https://elixir.bootlin.com/linux/v6.18/source/drivers/base/power/main.c#L22=
65 ,
that dpm_suspend returns error, and this error leads to
"Wakeup event detected during hibernation" message.

Any further pointers? How to debug?

--=20
Askar Safin
