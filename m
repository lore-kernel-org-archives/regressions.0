Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E36C29B8DD
	for <regressions@lists.linux.dev>; Mon, 29 Sep 2025 05:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759124602; cv=none; b=QKpqyjOns4uniSjVtDm6Mnur77eEGJfR1ofq8S8Ci0Ruj0jMY6Mlmn7wC6qfKYPu8kG7npr19eWguI/0/uHnXYWviG6UUi+x7WLjr7K2vN5hk8a5WRx/MvgszmwYfak8Y+sYSh07v77mhhJ2oCIPda/dcfTXaNJdRFdNH31Ws6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759124602; c=relaxed/simple;
	bh=KkdQm9LnjT0oDZgSyvNFLyYVXfgAVdlyFZQg4ncaicA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GySYYEZHSw31umnqyRmGTbNGTDcXKmUSSPZ9wHVXlIzCIF9B7Gqj9FYR0CUw9AqrLFgEJowQ4RkFg+BHMqHKMWItUft8lFBp5e2Rw/56JHnxnGX3VGzrK5SQcmen65duL2N82BG75anu9wDtZWpjW0gtni0QV9ZMy2m8ZwbxwAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bq29YAo4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bq29YAo4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759124599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLDJM/v1GnCONjQIRc/rqkZtzK/nAlZhViXrPHYBAQ0=;
	b=bq29YAo4Scu78XCZbmXpy03GT6cUYzT1rHfgMEI5o6pwp8PVNs30DJSVC458G/6IyYg6Mh
	73e+Bm/pLmYjhrAA0y1l6EErQcM2TdO9qf/XAEXYyiarUd0tiEGlDEi9FssH9FtMX8RWOe
	oHy6ShZivLEcWJVCLkGBsXUgCvY/aWY=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-O4wN5-QuNDe2_Wqs_WLS5Q-1; Mon, 29 Sep 2025 01:43:17 -0400
X-MC-Unique: O4wN5-QuNDe2_Wqs_WLS5Q-1
X-Mimecast-MFC-AGG-ID: O4wN5-QuNDe2_Wqs_WLS5Q_1759124597
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6354174c1a4so5107221d50.0
        for <regressions@lists.linux.dev>; Sun, 28 Sep 2025 22:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759124597; x=1759729397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLDJM/v1GnCONjQIRc/rqkZtzK/nAlZhViXrPHYBAQ0=;
        b=TjrdEzc2hNJjhrFpVCrwRk4E8fifJG9eQkqTwvJjND6a0w8X8sya4t54QT+H6FSzUU
         kWlGnu+73i99xGkvMjdoHTAwPurjjJFQBS9letCuARqeZkKMJ86bkmHoFhLi6BueJmYZ
         ERy4NhilzBOVMtd9W9B+JH0YovthcOOI6k6M2VXmMc3pcYkJWTgaCiOZwMA+3pTBUesT
         zjsDPzlqwoCMgJRmm47B/i0uCRCYh4vZdcMwQ85USceOHN0t3Xd+ms13pduNZDALv1aW
         Ra5RErH65NglHrQxS2p1CWoWM9+aBbpZcTNxA56yROpPqskHwjjckpwSqKj8bBZgXI/P
         3Wfw==
X-Forwarded-Encrypted: i=1; AJvYcCUQNAyve8sDsKWa+vfeFBsH3psHbLYJkPVoVxoSIydTUkaatEA2xzIxbXT+CQLEZc223tFhk43CSAt+kA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyO/wpHqE7M2Z1Zr7wxT7IIAGnUITZ5uQBFz6GeUyLZAaIGevwN
	4wiIkuZyvAhwxU73icOo6MLcmZgrojo209a5MwkWFOODVG4awr1nKGJvJfwLZf65+2wr2yHZKK6
	/cnQBZs6vm1MnEpNtFMuXnr/+wQg7hJ7h2+oXYCgwLb1Ou7+xKnJ0W3dZsjGobwjOht9dFz2W84
	K4x74KRj4SEoSCg7znb801mS9oGEaKTIMawlGrUYY=
X-Gm-Gg: ASbGncs93rH8VvSFvRSy8hqNaZM1Z2ktd5Va+WNECsM95Yq8i5Xs/X0QM4b+oOwyu7Y
	JDtJN1+Kry3wpmGL+n63ldyjRNirSX6goYkKhFivnqJeUIWUFS33CV0jnFKwEZ0bpzKxi1X8Xqo
	LtJ5PIffnAuFaTL1JfJfL/Nx5D27sROL1v1WQAcyeNkc7blKRDJ9kcIdhwEvDnPP0FiNZ2mMD2S
	oArSc9f
X-Received: by 2002:a05:690e:22c4:b0:635:4ece:20ab with SMTP id 956f58d0204a3-6361a873801mr13564064d50.48.1759124596990;
        Sun, 28 Sep 2025 22:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZRprYWH3GKFK0J+/EVnsfKtUL40W8QVLXJUwLVUPi9R0BTd57XmXjDp56sXiMQ2Op70w6PccJcX5wX4kfJoA=
X-Received: by 2002:a05:690e:22c4:b0:635:4ece:20ab with SMTP id
 956f58d0204a3-6361a873801mr13564052d50.48.1759124596652; Sun, 28 Sep 2025
 22:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250925091335.1964283-1-eperezma@redhat.com> <20250925091335.1964283-2-eperezma@redhat.com>
 <3e5abb75-2192-46dc-a44e-d66fed87fc63@leemhuis.info>
In-Reply-To: <3e5abb75-2192-46dc-a44e-d66fed87fc63@leemhuis.info>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 29 Sep 2025 07:42:38 +0200
X-Gm-Features: AS18NWBlM_AwzI2-s0Otvy63KDuzlTLedZ6DoP5wCZ9FlMjm8eYezVLoJQUZ6gw
Message-ID: <CAJaqyWehjiVeq360A=1_+=eRSDjoF3zNsNF0Lf-45YeiT5Pk7Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] vduse: make domain_lock an rwlock
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Yongji Xie <xieyongji@bytedance.com>, Cindy Lu <lulu@redhat.com>, 
	jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	Maxime Coquelin <mcoqueli@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Laurent Vivier <lvivier@redhat.com>, virtualization@lists.linux.dev, 
	Stefano Garzarella <sgarzare@redhat.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sZKnV4kObHs1-EmC7bF8l3Yi7tXag5hkWH3DtcuiQF0_1759124597
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 27, 2025 at 9:01=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.i=
nfo> wrote:
>
> On 25.09.25 11:13, Eugenio P=C3=A9rez wrote:
> > It will be used in a few more scenarios read-only so make it more
> > scalable.
> > [...]
> > diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_use=
r/vduse_dev.c
> > index e7bced0b5542..2b6a8958ffe0 100644
> > --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> > +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/cdev.h>
> >  #include <linux/device.h>
> >  #include <linux/eventfd.h>
> > +#include <linux/rwlock.h>
>
> Lo! My daily -next builds based for Fedora using the Fedora rawhide
> failed yesterday on various archs. I suspect it's due to above change,
> as this was the error I got:
>
> """
> In file included from drivers/vdpa/vdpa_user/vduse_dev.c:17:
> ./include/linux/rwlock.h:5:3: error: #error "Please do not include this
> file directly."
>     5 | # error "Please do not include this file directly."
>       |   ^~~~~
> ./include/linux/rwlock.h:27:10: warning: =E2=80=98rwlock_init=E2=80=99 re=
defined
>    27 | # define rwlock_init(lock)                                      \
>       |          ^~~~~~~~~~~
> In file included from ./include/linux/spinlock_rt.h:153,
>                  from ./include/linux/spinlock.h:455,
>                  from ./include/linux/sched.h:37,
>                  from ./include/linux/percpu.h:12,
>                  from ./arch/x86/include/asm/msr.h:16,
>                  from ./arch/x86/include/asm/tsc.h:11,
>                  from ./arch/x86/include/asm/timex.h:6,
>                  from ./include/linux/timex.h:67,
>                  from ./include/linux/time32.h:13,
>                  from ./include/linux/time.h:60,
>                  from ./include/linux/jiffies.h:10,
>                  from ./include/linux/ktime.h:25,
>                  from ./include/linux/timer.h:6,
>                  from ./include/linux/netdevice.h:24,
>                  from ./include/linux/if_vlan.h:10,
>                  from ./include/linux/virtio_net.h:5,
>                  from drivers/vdpa/vdpa_user/vduse_dev.c:11:
> """
>
> For a complete log, see
> https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/f=
edora-rawhide-x86_64/09603789-next-next-all/builder-live.log.gz
>
> Reverting the series made things work for me.
>

I don't know how this error didn't shout out in my env, fixing it.
Thanks for the heads up!

