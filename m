Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E97374FB
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1yLWwOL"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-694ed847889so1108553b3a.2
        for <regressions@lists.linux.dev>; Thu, 05 Oct 2023 11:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696529297; x=1697134097; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfEzaAYRoCM2oEhK3EPu0Hj+aznJeUYqKLfmZ+hOYv8=;
        b=d1yLWwOL3A3fH6p3HSrGX5PLSjAdNfPNOk/NJrHQ6ApSmX51aFcUNSC9PgW/VwsCzk
         KWB6gzOrBuOnSB+IiIemBSDNcMTkkDVgypO5m62ZpqISTcD01R1mTSY8aebfiyv/r/b4
         zxbkFAlhLxZO8KYR+MOllpookQX/EfPZj40ZvpObquBoSFyIFQ3X21I/hQyNnPav34uJ
         MSea7ZzwOQusjSt2QU0USDgaYlGhNkaY4I+ukA7WS+G4167USf1zGHfS0abUZI21S+nU
         6lNRPNZblunh/yO9uW6v7bYX79G630cA5LENsVJlxYBn9E6+KBO4vs1rSP+QPWm1vd1G
         ls5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696529297; x=1697134097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfEzaAYRoCM2oEhK3EPu0Hj+aznJeUYqKLfmZ+hOYv8=;
        b=I1ODLLBk73IpnEaX9tdpUB34V0jGKGRIQABjOQvNDdgKQY77nO/GgEeKu8DTWNsGDx
         oGuXzChoJc9D009AOySEib4yvSMhouD3abUPvRTz2ZvCQu07MPhrDokmO6xfS7XN2fBI
         fWIKAOkfp7XWoUs3g9av347Ox/X8eAwaAf7gRqEcueRKMObh4ZwBlttKGOks2sAaUbLy
         qH1N9d4YOkkXjl9jT0U0xvxBYeaNF8JYLYrmIrEdq+NqfbAVWcPf9ppXPfUfFumFsZce
         Prk+BwhQR2YTIfPr7A9imB3tpTK7OrEfEmjVyD1v+7cgzlTomrxSj9YaKsJhlKn5o+Ma
         r1Ng==
X-Gm-Message-State: AOJu0YzOyceA/6spMwoeqVaxoHjpJ/scgdiW/ygElt06qs87V66LDGVn
	Btmb21xzd9mkvlqUN8E1sxwz0gl02bPaTrk1DSg=
X-Google-Smtp-Source: AGHT+IFOG+VTMW5ABa9pOxr064JFqjVAEmKuoVs/Erlx9kb8Kl9x4XYI32ZOw4/gAlXpDkbzvX4OakRvWMT0o+RJRfw=
X-Received: by 2002:a05:6a00:10c1:b0:690:c2b3:e4c5 with SMTP id
 d1-20020a056a0010c100b00690c2b3e4c5mr6733619pfu.4.1696529297534; Thu, 05 Oct
 2023 11:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEXpi5Rd6Y4umKOWRsCjX0kit=W5ZrVhn=MuRkyvJPwmjjDVnA@mail.gmail.com>
 <ZRj_ovMi-Xbb8i-D@debian.me> <20231002185053.GB402943@wp.pl>
 <CAEXpi5StYwujiTaH2_5PE9Hg_cgzAEtBuFxfgVxEJvbqRNv_4A@mail.gmail.com> <20231004182826.GA411448@wp.pl>
In-Reply-To: <20231004182826.GA411448@wp.pl>
From: enc0der <enc0der@gmail.com>
Date: Thu, 5 Oct 2023 14:08:06 -0400
Message-ID: <CAEXpi5Qw8g2-=FPiSrmh4va22dg6jP8bT2bAcR5WnPUKMD5byA@mail.gmail.com>
Subject: Re: rt8000usb driver issue (maybe interaction with other drivers)
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Regressions <regressions@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 4, 2023 at 2:28=E2=80=AFPM Stanislaw Gruszka <stf_xl@wp.pl> wro=
te:

> Here is the issue. We send the frames with spin_lock taken, in such
> case no sleep (i.e. schedule() call) is allowed. Some function from
> tegra/nvhost is actually sleeping, hence the bug.
>
> As already pointed Thorsten, those tegra_/nvhost_ are proprietary functio=
ns,
> which are not included in the upstream linux kernel, so we can not fix th=
em.
>
> However I can advice you to detach those from crypto_aead_encrypt,
> this should be doable. At worst your will need to  recompile your
> kernel with those crypto offload engines disabled, but perhaps
> this can be configured dynamically.

Thank you Stanislaw and everyone else for your help, super
appreciated.  I will bring this back to Nvidia as this makes sense to
me the problem is in their upstream changes.  I suspect the person who
was trying to help me just wasn't familiar with all their own changes.

> Regards
> Stanislaw
