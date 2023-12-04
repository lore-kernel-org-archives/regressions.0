Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D0D25757
	for <regressions@lists.linux.dev>; Mon,  4 Dec 2023 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9BP6mJb"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3b8bb35cbc3so840553b6e.3
        for <regressions@lists.linux.dev>; Mon, 04 Dec 2023 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701699258; x=1702304058; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0I6C4lHtAjdDOgBRB1tna7Hi6HkljA5Ej+x6ZNqkNO8=;
        b=N9BP6mJbY50bmHnSN/RX2KuyJk0YdA0tdEGgBmbKxRALUqOjJCEHmDgFnJuoJ/rV2i
         2TpbRnEXa1sSsPjwMZVOQIx5jJkfSCZCZ/IryFU2a+UM2GSrqx1ntif8FIM/oj6EA29X
         ftA3jJNDGpisT+buBX5L9rDrqqCEf71q72wOcvx6zlBOHBlBU5I3wNY9ypjLN6Jqfx8i
         AP+xZprPqAepRP7EAQzvPm4OFcJKOcO55fiYFrHZ6AIzcWYNcrcTty8MwPesGtMXl/+E
         Qe0XxrD43fzF4VGwIUnU7z0L1p1Wenvh2i9BemeeJvPQeq7mTZG5wYJpN3FbEr4bYI84
         jH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699258; x=1702304058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0I6C4lHtAjdDOgBRB1tna7Hi6HkljA5Ej+x6ZNqkNO8=;
        b=ktpdK6CAZ6V+CFGkMsIQudHLlplsM/ESO8LW0JYrNaWFs2wArGNLhGjB4VM0gdrJyO
         vHGJ++Dav3XYpGeNC7MNbAnAm6ADZOudYkJ55ICAqrElWlUChVcOAnz5mXqvSWTV4RsA
         ww9s+JjFhd0WnuZ1wteWyyQ5xgahhGw31kF69h4goavudnTQVjXh8wDla+pe538e/m+4
         QPJtsMbyBotj707eoBNOUsbUW9z2JXa/+Xb3NycpvV4u8zpeZz6iCpMhZDSH4JF1I7fa
         APFYqYZn08XSyYF+IeQSCy3fXisFTa7cWIfvDib4RghGvwY2UxHmThKn27U/8J2H2G/C
         zRgA==
X-Gm-Message-State: AOJu0YzVhtQoyxVZS/iDhwzswVyulqtkEs3n+ukRGm7U17siEHVKxjCh
	mq+8M5YagbnTzxSD2DIWbjN6e8CkgB+qrh+m6Bc=
X-Google-Smtp-Source: AGHT+IFEu8TprTdadCbPaDT3i4fWi2XekDqfyNrrQK6RXnb0qoLqCmgcb28e4hgbpi0Bnkuu5MH6XObjr5/U/0yDe2g=
X-Received: by 2002:a05:6870:d3cd:b0:1f9:fa57:f72a with SMTP id
 l13-20020a056870d3cd00b001f9fa57f72amr7540705oag.38.1701699256359; Mon, 04
 Dec 2023 06:14:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net> <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com> <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com> <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87jzq2ixtm.fsf@vps.thesusis.net> <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
 <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com> <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
 <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
 <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com> <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
 <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
 <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
 <CADnq5_Oy6RMyJ52TbsxVjZ=0p=wYJHduE4X8B3DiYnqHYJUAvw@mail.gmail.com> <87edg3koka.fsf@vps.thesusis.net>
In-Reply-To: <87edg3koka.fsf@vps.thesusis.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Dec 2023 09:14:04 -0500
Message-ID: <CADnq5_PtSV1C6Up78XX8ejExqaiM-wzHVFhCRtxboS1Y4cF-Ow@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Phillip Susi <phill@thesusis.net>
Cc: Luben Tuikov <ltuikov89@gmail.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	linux-kernel@vger.kernel.org, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Danilo Krummrich <dakr@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 3, 2023 at 3:40=E2=80=AFPM Phillip Susi <phill@thesusis.net> wr=
ote:
>
> Alex Deucher <alexdeucher@gmail.com> writes:
>
> > Phillip,
> >
> > Can you test this patch?  I was not able to repro the issue on the
> > navi2x card I had handy, but I think it should fix it.
>
> I pulled -rc4 and it still had the problem.  I applied this patch, and
> yes, it fixed it!
>

Great!  I'll include it this week.

Alex
