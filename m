Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DAE2C82
	for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 14:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640009400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4SU/S7ImGGhUFPPtRruTF21SLhkjh6LbUDIj/NTEz5c=;
	b=OZ11t45UYlE0mLGsX/H6jFwqr8FNzzgrsnoNatqpbFS2flOT0Omt2i7v+e01XN1c9jJ0Lt
	Qas8MBz3wszFH4K5FqPKsqM6c4bWMJ7jDSjKJ06EaMuosJlzGgc8EY9LZsYTXhDCb9F6uI
	cOz0mxsHnHmBOD2j33Uy2iS0gYmKLfs=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-w7cZqhJ5PDatfHvFJ963rA-1; Mon, 20 Dec 2021 09:09:58 -0500
X-MC-Unique: w7cZqhJ5PDatfHvFJ963rA-1
Received: by mail-pj1-f72.google.com with SMTP id u21-20020a17090a891500b001b14cf69a22so6889545pjn.2
        for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 06:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4SU/S7ImGGhUFPPtRruTF21SLhkjh6LbUDIj/NTEz5c=;
        b=ZNspBYlj2FyQdaJl8BMJimK1HYU0BK5mElpM/tlrSAirp2TULY69mts9DRkPKI5Qjg
         MImuftPnQbIPLGSYisqfGoHRTCrG/HMtZ5tlTaw+InDiEYaDVPCRtXDO2mJGURMUwHP4
         gonwUm8ey1kggErXVIi/kQGfXpO+Q3KQQFekohZfFOC7kGpyO/IFwFiOPIDisVlchHU8
         RmJCB1m6L37iq2chWPs9bNNhUstpzT/FwU2qNWDpNAEt/uQZc0gumJ7x+44gidCO3kLu
         9TkaGtwrd78CYYmUSy6ARz/nB0DIdJlpHsM/B9+j4mbSNC2Y/Fv6HNsjRZHR3y0ux5Zh
         ejfg==
X-Gm-Message-State: AOAM533Qe8ex7vhbM0lSkgqMFQxcpPv9qVvPvMTvC4O4LgogCa6l3+7W
	BcqRIpmyMtClRb6UkcsEq51732jRK92qzs6gFky8wBf6hrImKGCEd9Ad0JYulDyefntnKBKBokk
	sBtVd7FfKwKt7EvxAJvi0pz+1EWKEOfpz3y805Do=
X-Received: by 2002:a63:440b:: with SMTP id r11mr2295439pga.363.1640009396962;
        Mon, 20 Dec 2021 06:09:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5rkAwf2w09eVva9jeeoZoh76LzeD6iApghZd6M8xndWZiAYVOJ/zZCbpNG3YM3a7+VGljuYeg6Ajax/60ZmQ=
X-Received: by 2002:a63:440b:: with SMTP id r11mr2295417pga.363.1640009396682;
 Mon, 20 Dec 2021 06:09:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e4efbf13-bd8d-0370-629b-6c80c0044b15@leemhuis.info>
 <42903605-7e8b-4e84-fcd6-1b23169b8639@redhat.com> <fc7e6040-b760-02f1-57ef-71aa4b88aea6@leemhuis.info>
 <4366861.LvFx2qVVIh@dell>
In-Reply-To: <4366861.LvFx2qVVIh@dell>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 20 Dec 2021 15:09:45 +0100
Message-ID: <CAO-hwJJxRETn3k0a_bXLMaD7rWNjWM8F9O0sv=jHtZuvJXa4aw@mail.gmail.com>
Subject: Re: FWD: Holtek mouse stopped working after kernel upgrade from
 5.15.7 to 5.15.8
To: "Tomasz C." <tlinux@cebula.eu.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=btissoir@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 18, 2021 at 9:39 PM Tomasz C. <tlinux@cebula.eu.org> wrote:
>
> Hello,
>
> I haven't had time to test it yet. But I see that another ArchLinux user =
has
> compiled kernel 5.15.10 with this patch and confirms that the mouse works=
.
> Details on:
> https://bugs.archlinux.org/task/73048#comment204441
>
> Is this enough for you as a test?

Yep, thanks a lot.

I have now pushed this to hid.git for-5.16/upstream-fixes with the
updated link, cc-ed stable and also added that archlinux bug.

Cheers,
Benjamin

>
> --
> Tomasz Cebula
> Dnia pi=C4=85tek, 17 grudnia 2021 09:37:11 CET Thorsten Leemhuis pisze:
>
> > Tomasz, could you give it a try please?
>
>
>

