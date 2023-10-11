Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3583DA41
	for <regressions@lists.linux.dev>; Wed, 11 Oct 2023 17:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="XY68ZLvG"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a7dafb659cso1284957b3.0
        for <regressions@lists.linux.dev>; Wed, 11 Oct 2023 10:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1697045265; x=1697650065; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ux9l0w8MwnLT0igWhr7JaIiHQtbfOgsc08xSinU3ZPo=;
        b=XY68ZLvGYVpGIrn0dQl0CNN1bgRrBcSGp29YCE83rbgHlRsJ8vAMY4MaQkWuMYXVK1
         8rSwueHvr6b3D++vMh3/wwzi1PdgybjDxzK0ADHNqwqjSBOnEsv5oEtbjTZp/H8ZVbDE
         jkOxD+PhZLrHYTJf1igt0M9pvOIcx//2y3s0CoqyNaUySIFCcMwn+T6DQYC4Ph6Tasb/
         xd+E0aoW1YZ4w/8b1/gJi3tcb1BmCgCGA80Dl2v+V42ea08ccx7cKhXvHuxyGsG79pGi
         EoqRj7yqh9nJXqgSfiPS+l6MxTr+4Bt3NuH21o5EKSg8K9RGsEnTtpmZMQrm831fYIas
         /0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697045265; x=1697650065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ux9l0w8MwnLT0igWhr7JaIiHQtbfOgsc08xSinU3ZPo=;
        b=ZV2aIASwJtsZCmsAimIsajHwev+9OEiRKg4Pc0UhzPXMNvBzr9ulqWvhKjgTj7MNm0
         vYKC1II3QdYxFiC82ila11idj/M0wIvlrWXvgiDRXQRZQmQmRRV6m4UvM3DI9Avwelil
         ixwQxO6Sf84RpDsS1xQnzcPIMp+0RLtf3ryacBalhOer2LYzio/YxvHnVe4fLuYWC4MJ
         zy4CtVanzb67R7wFGvY5DvpAhykI24z1uYyIKJODJoxTyKcD5QZOmB/H5AQnpx5wUBVC
         nzPtOowFl8LkjhB0LetKpWZbVEx23ib8RXo1YZh55RbvddD6q/EcL46uuy/lc1gtmMZN
         u11w==
X-Gm-Message-State: AOJu0Yxt5+n4QipdNd3ahZ3JivvGAA9z5K9XHcxNQJwwOwKhnd0s42+I
	J8ONh835X80jXvn7sXVXfsEDASG8uv1sVs5mrNH6yw==
X-Google-Smtp-Source: AGHT+IEQBUxAGueSbmH/ftTAGlXE9A+ltpTRdTrDbTEhQBxV4DZ94J8BvpuSx30G8cixjCAWrpDqrGG06hOXwp1ztB0=
X-Received: by 2002:a25:938b:0:b0:d15:e204:a7be with SMTP id
 a11-20020a25938b000000b00d15e204a7bemr21213352ybm.8.1697045265167; Wed, 11
 Oct 2023 10:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <297D84E3-736E-4AB4-B825-264279E2043C@flyingcircus.io>
 <065a0dac-499f-7375-ddb4-1800e8ef61d1@mojatatu.com> <0BC2C22C-F9AA-4B13-905D-FE32F41BDA8A@flyingcircus.io>
 <20231009080646.60ce9920@kernel.org> <da08ba06-e24c-d2c3-b9a0-8415a83ae791@mojatatu.com>
 <20231009172849.00f4a6c5@kernel.org> <CAM0EoM=mnOdEgHPzbPxCAotoy4C54XyGiisrjwnO_raqVWPryw@mail.gmail.com>
 <20231010112647.2cd6590c@kernel.org>
In-Reply-To: <20231010112647.2cd6590c@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Wed, 11 Oct 2023 13:27:34 -0400
Message-ID: <CAM0EoMkKm4VcQB7p1abg9d-Pozz7fV-isexDtA1rGX+NuJEykA@mail.gmail.com>
Subject: Re: [REGRESSION] Userland interface breaks due to hard HFSC_FSC requirement
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pedro Tammela <pctammela@mojatatu.com>, markovicbudimir@gmail.com, 
	Christian Theune <ct@flyingcircus.io>, stable@vger.kernel.org, netdev@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 2:26=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 10 Oct 2023 11:02:25 -0400 Jamal Hadi Salim wrote:
> > > > We had a UAF with a very straight forward way to trigger it.
> > >
> > > Any details?
> >
> > As in you want the sequence of commands that caused the fault posted?
> > Budimir, lets wait for Jakub's response before you do that. I have
> > those details as well of course.
>
> More - the sequence of events which leads to the UAF, and on what
> object it occurs. If there's an embargo or some such we can wait
> a little longer before discussing?
>
> I haven't looked at the code for more than a minute. If this is super
> trivial to spot let me know, I'll stare harder. Didn't seem like the
> qdisc as a whole is all that trivial.

The qdisc is non-trivial. The good news is we now know there's at
least one user for this qdisc ;->

cheers,
jamal
