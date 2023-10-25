Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E882D61E
	for <regressions@lists.linux.dev>; Wed, 25 Oct 2023 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AQnPwCla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698239848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IozGvl6ym7FtpXWIgUQGELou+dXeHqFgoLDxKjZILp0=;
	b=AQnPwClaSxBba1sYkuYv3B2Ltx86eSsWGKk73d6I5u1rdQjWmBnFaVM+Y7wuAf/kEp8VEB
	JfRpOEWmalTm/7LkxvrijAKQcdhjzz2MQK/LR7xDTqSnttnps0BBdA/Qivf4vUuZnJ9YXd
	y7Id0A1/IO1TwsJ41+/WqLsFoDVsJ1o=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-b6eJJBZ-NQmYxJZJ4KThWg-1; Wed, 25 Oct 2023 09:17:22 -0400
X-MC-Unique: b6eJJBZ-NQmYxJZJ4KThWg-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-27dd8d7d6c3so4291870a91.1
        for <regressions@lists.linux.dev>; Wed, 25 Oct 2023 06:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698239841; x=1698844641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IozGvl6ym7FtpXWIgUQGELou+dXeHqFgoLDxKjZILp0=;
        b=cCs7nybnNkLSE9j5JugzLdpDThMHZp2TqkSYGUZ1kK+4vfR6kf4x+ALbOm+eYUzuyA
         I3sXj68xZmaPPz9k2241d1x+s4kNlcw+En2BSTLexMJcfucANGyXM3rztEHheMbdg1Mi
         bsMPNl0/lh+MLU/YXQtsa0W47Nu1xpIhBM9CX8bl6o+Bzd8vmrn5awahN+1/nYGCBgGu
         sXOJwfRnrXih8YMdqkbBs6zsfWeCBWW0kH3FWrmyJxpF3It3Tcs6LHdw35U6c8eopr3Y
         W9l+dHwFieELw69q+mYAZ6sGKfKhF+n34/OnmfVT60KLg0V9sH6seaGtW/0avIXyUiVK
         FjWw==
X-Gm-Message-State: AOJu0Yzxwknht13cfCUPHl6Jtq2aXJKmT1FNO0lMqvPQdUtzA9KJwqvO
	SHft1Xe09p53YDs5lSLszaK+GGPfqPAbEBECrcC4DM6GlqwMO+SQWju+hp/bPdQsiyQ0Z8s599D
	PhonIzFrnmkhnY6kfd5xKgNhCuFkKobthY3Y4dYIJhHNtEBI=
X-Received: by 2002:a17:90b:4b8a:b0:27d:4282:e3d2 with SMTP id lr10-20020a17090b4b8a00b0027d4282e3d2mr11790034pjb.30.1698239841312;
        Wed, 25 Oct 2023 06:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBXLRdWrDOrQCF5FvsKobYfb7nyIu56I/K8W5F1yWLZe9klbEb/Sixm0+WmmNoJIkM4fZDAptKQq/7701Eamw=
X-Received: by 2002:a17:90b:4b8a:b0:27d:4282:e3d2 with SMTP id
 lr10-20020a17090b4b8a00b0027d4282e3d2mr11790015pjb.30.1698239841018; Wed, 25
 Oct 2023 06:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230904133321.104584-1-git@andred.net> <20231018111508.3913860-1-git@andred.net>
 <717fd97a-6d14-4dc9-808c-d752d718fb80@ddn.com> <4b0b46f29955956916765d8d615f96849c8ce3f7.camel@linaro.org>
 <fa3510f3-d3cc-45d2-b38e-e8717e2a9f83@ddn.com> <1b03f355170333f20ee20e47c5f355dc73d3a91c.camel@linaro.org>
 <9afc3152-5448-42eb-a7f4-4167fc8bc589@ddn.com> <5cd87a64-c506-46f2-9fed-ac8a74658631@ddn.com>
 <8ae8ce4d-6323-4160-848a-5e94895ae60e@leemhuis.info>
In-Reply-To: <8ae8ce4d-6323-4160-848a-5e94895ae60e@leemhuis.info>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Wed, 25 Oct 2023 15:17:09 +0200
Message-ID: <CAOssrKdvy9qTGSwwPVqYLAYYEk0jbqhGg4Lz=jEff7U58O4Yqw@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "fuse: Apply flags2 only when userspace set the FUSE_INIT_EXT"
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Lawrence <paullawrence@google.com>, 
	Daniel Rosenberg <drosen@google.com>, Alessio Balsini <balsini@android.com>, 
	Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bschubert@ddn.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 1:30=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:

> Miklos, I'm wondering what the status here is. The description in the
> reverts Andr=C3=A9 sent[1] are maybe a bit vague[2], but it sounds a lot =
like
> he ran into a big regression that should be addressed somehow -- maybe
> with a revert. But it seems we haven't got any closer to that in all
> those ~7 weeks since the first revert was posted. But I might be missing
> something, hence a quick evaluation from your side would help me a lot
> here to understand the situation.

I don't think the Android use case counts as a regression.

If they'd use an unmodified upstream kernel, it would be a different case.

But they modify the kernel heavily, and AFAICS this breakage is
related to such a modification (as pointed out by Bernd upthread).

Andr=C3=A9 might want to clarify, but I've not seen any concrete real world
examples of regressions caused by this change outside of Android.

Thanks,
Miklos

