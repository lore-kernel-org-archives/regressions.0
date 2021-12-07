Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578C268
	for <regressions@lists.linux.dev>; Tue,  7 Dec 2021 17:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638898340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Y9Pjga21aracwhJoyyvYrk6Lt9GN/KkUwQElqefsrU=;
	b=eEhZ6Y8+rpZh9k/MS6oDtyBg1xxEyo4Con6obxnLuUhWWV9UbDKlLOmhudczwXNWml+FvH
	LQMingx7upzwQbWY9iB3/r0o7EmWYdA5yxg87dAmQL+uiRoRnBnTUll2Rua7hXJ9S43HMt
	gck2rjLEgUd/k3HEaXGhXLR735C3120=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-G74YcJ2kPYiMkSVt-yaG4A-1; Tue, 07 Dec 2021 12:32:19 -0500
X-MC-Unique: G74YcJ2kPYiMkSVt-yaG4A-1
Received: by mail-wm1-f72.google.com with SMTP id l4-20020a05600c1d0400b00332f47a0fa3so1661237wms.8
        for <regressions@lists.linux.dev>; Tue, 07 Dec 2021 09:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6Y9Pjga21aracwhJoyyvYrk6Lt9GN/KkUwQElqefsrU=;
        b=ZSjTWr27Din4pZut59qM6VGWi0jZi0oGoLkJv8XOWryIFH6Kl4cFoennVuue2HwJf/
         PrzdSNvmsSrljGYxlLzv66tbvyErI1fFw4sFjEWCRkwDFXWOkMNFY4mlA2xq+bUCzZwt
         jWD6TGeWYqpYoJPLUkftlG2HRgNELdISyAFdWxqAVurIhhe0aesiqO3+Edsp6RYcibk3
         UwJWwUf8hseT2/5FkmntsnUWnX1HdeBcS8BYZYuA5mJV9QabfqBKT9M/XGIQG8rGwKPI
         t9epZASopUCACBmkKwTaVPCTZ7XajKF7Vjo4o79efz6QKFG6vC3Li/Z3M3dVr4e7IB3Z
         ex1Q==
X-Gm-Message-State: AOAM533EayqYiQ92NKL6GL2nVU9cstjVDGlHYG9yyTdk0rX2lYSYDQFq
	M74fvwtL+y2TCvzhN9HBfRuUUdCcYIwIpqMlJof4eG45NuFRqLJvb6QSOeZWOofyzcfmV7XL7dC
	FZUmyoYyBIB+owkNgc+JmeQb0sJKgcWu6PjBkfxI=
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr52950472wrb.42.1638898337275;
        Tue, 07 Dec 2021 09:32:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS4WAmTgmumrIvWu+yX9HvqjuLp/srHLtI+V5J5dSkPaRSMHjOSblueIsPVT3q2xJTau7CrGgKuwVb0YRj6pc=
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr52950450wrb.42.1638898337097;
 Tue, 07 Dec 2021 09:32:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5dafba25-5424-3fe2-5046-ae1d4320f9c1@leemhuis.info>
 <20211206183721.6495-1-dmoulding@me.com> <6f62bd8c-3a2c-e553-898c-d42fb1583208@amd.com>
In-Reply-To: <6f62bd8c-3a2c-e553-898c-d42fb1583208@amd.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 7 Dec 2021 18:32:06 +0100
Message-ID: <CACO55tuw2pwqUnknvZmSiuEaMcjArsgzLy9NYBqZPE6f9zPXsA@mail.gmail.com>
Subject: Re: [Nouveau] Regression in 5.15 in nouveau
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dan Moulding <dmoulding@me.com>, regressions@leemhuis.info, 
	nouveau <nouveau@lists.freedesktop.org>, sf@sfritsch.de, 
	Ben Skeggs <bskeggs@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	regressions@lists.linux.dev
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 7, 2021 at 10:52 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 06.12.21 um 19:37 schrieb Dan Moulding:
> > On 04.12.21 17:40, Stefan Fritsch wrote:
> >> Hi,
> >>
> >> when updating from 5.14 to 5.15 on a system with NVIDIA GP108 [GeForce
> >> GT 1030] (NV138) and Ryzen 9 3900XT using kde/plasma on X (not wayland=
),
> >> there is a regression: There is now some annoying black flickering in
> >> some applications, for example thunderbird, firefox, or mpv. It mostly
> >> happens when scrolling or when playing video. Only the window of the
> >> application flickers, not the whole screen. But the flickering is not
> >> limited to the scrolled area: for example in firefox the url and
> >> bookmark bars flicker, too, not only the web site. I have bisected the
> >> issue to this commit:
> >>
> >> commit 3e1ad79bf66165bdb2baca3989f9227939241f11 (HEAD)
> > I have been experiencing this same issue since switching to 5.15. I
> > can confirm that reverting the above mentioned commit fixes the issue
> > for me. I'm on GP104 hardware (GeForce GTX 1070), also running KDE
> > Plasma on X.
>
> I'm still scratching my head what's going wrong here.
>
> Either we trigger some performance problem because we now wait twice for
> submissions or nouveau is doing something very nasty and not syncing
> it's memory accesses correctly.
>
> Attached is an only compile tested patch which might mitigate the first
> problem.
>
> But if it's the second then nouveau has a really nasty design issue here
> and somebody with more background on that driver design needs to take a
> look.
>

Ben mentioned a few times that fences might be busted but we all have
no idea what's actually wrong. So it might be that your change is
indeed triggering something which was always broken or something else.

> Please test if that patch changes anything.
>
> Thanks,
> Christian.
>
> >
> > Cheers,
> >
> > -- Dan
>

