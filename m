Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B9A13ACA
	for <regressions@lists.linux.dev>; Fri, 10 Nov 2023 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="wHEDBtfK"
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D02C240C52
	for <regressions@lists.linux.dev>; Fri, 10 Nov 2023 12:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1699620780;
	bh=rQz1XEF+09FV0wYKQEHG4CRIbx1Q7DTh+y5gnO8WcbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=wHEDBtfKxP8I4v1PPlFHdc57CXNQ5DLTw0Abf49NrAjma5acjL1es+d0TwvCo1ooJ
	 JtJLYUkXAZTSGV+6ZN0MjfNL6mjVsRYxgsqgym7P9ft9i9p1GKZWWljXEi29xuVdiF
	 iKZGo2HkB2XwDVSBzJyEbVIL39wR+bNqhis/Krep6/iv4jF0+qd83oNi1IGolHWbNl
	 cJQXva9akeoGdCPCotu5jfoOTVcJ5lm/gFAwYsRvBKFvliA1t62rimlyq3Z0pErMGb
	 1jcZI9mcySEwsMnZ9nIPbDi7wgyqXBwmpsQ4ybI2FqhntQ50Q3ksiWCHiuZCxbxLto
	 Cgf+RsCNQqN4g==
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5b7fb057153so2165805a12.1
        for <regressions@lists.linux.dev>; Fri, 10 Nov 2023 04:53:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699620779; x=1700225579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQz1XEF+09FV0wYKQEHG4CRIbx1Q7DTh+y5gnO8WcbM=;
        b=X4a2AxyO4WbfDMNO+C7MXwRmJuQ54QdYjkUaQx7h7qTR1ShlrE+t2MKduLZoXAgQfk
         kfGA7b87REoZSuksBmX+2xhicNV4h53eh4yqL+hgotTT19gXDtK4S46hhs1MIuJnb5Eo
         akjUtx87r9pBTpdm+ZWkvoUOnPkqmGQBVFyk80COM4hMFHJh8/md5XOIDikVoQAziNqK
         Bhohg3/QW1U9DlpnJX8a0Lxdhp9o6rcm35XMAqBd3IHckSndBvwLsYN/1nU6RWUFptuz
         PLeaA8B1/IFtXi+GdsmB0M3bYWPo6+AFg5DWDCQjely5dvlr95RYhZbO1Uh9a9XOpD+J
         g0MQ==
X-Gm-Message-State: AOJu0YzDFxX25sBTCu80UQy5Uhst9nlAQLS/f8IMlE/hLk6e0b+HmjMU
	TmbtOYQss7tPri9wsqOcxdOY0PIhhRr/r9eyKRu8iHhtVUQQcgPGAu6u85dPK4xivvo8qXEXgSv
	OKMDh+ot7KXeyxotUIQAOEpNbjI67QTPIIi+Jldk67u05d6Nh4vJQJkc5
X-Received: by 2002:a17:90b:1d03:b0:280:4799:a841 with SMTP id on3-20020a17090b1d0300b002804799a841mr4829842pjb.38.1699620779361;
        Fri, 10 Nov 2023 04:52:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnczUq1VC3lW8Z/p4H5gQI8h4wKRWrRJatMYBw6a+WKwY+ovLUCuSr/qS2Bo2wOsiAR0FM2aGrvUeOcuVrw2E=
X-Received: by 2002:a17:90b:1d03:b0:280:4799:a841 with SMTP id
 on3-20020a17090b1d0300b002804799a841mr4829828pjb.38.1699620779062; Fri, 10
 Nov 2023 04:52:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9f36fb06-64c4-4264-aaeb-4e1289e764c4@owenh.net>
 <CAAd53p7BSesx=a1igTohoSkxrW+Hq8O7ArONFCK7uoDi12-T4A@mail.gmail.com> <a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com>
In-Reply-To: <a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 10 Nov 2023 14:52:45 +0200
Message-ID: <CAAd53p608qmC3pvz=F+y2UZ9O39f2aq-pE-1_He1j8PGQmM=tg@mail.gmail.com>
Subject: Re: [REGRESSION]: acpi/nouveau: Hardware unavailable upon resume or
 suspend fails
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Owen T. Heisler" <writer@owenh.net>, stable@vger.kernel.org, regressions@lists.linux.dev, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Fri, Nov 10, 2023 at 2:19=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> On 11/10/23 07:09, Kai-Heng Feng wrote:
> > Hi Owen,
> >
> > On Fri, Nov 10, 2023 at 5:55=E2=80=AFAM Owen T. Heisler <writer@owenh.n=
et> wrote:
> >>
> >> #regzbot introduced: 89c290ea758911e660878e26270e084d862c03b0
> >> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/273
> >> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218124
> >
> > Thanks for the bug report. Do you prefer to continue the discussion
> > here, on gitlab or on bugzilla?
>
> Owen, as Kai-Heng said thank you for reporting this.
>
> >> ## Reproducing
> >>
> >> 1. Boot system to framebuffer console.
> >> 2. Run `systemctl suspend`. If undocked without secondary display,
> >> suspend fails. If docked with secondary display, suspend succeeds.
> >> 3. Resume from suspend if applicable.
> >> 4. System is now in a broken state.
> >
> > So I guess we need to put those devices to ACPI D3 for suspend. Let's
> > discuss this on your preferred platform.
>
> Ok, so I was already sort of afraid we might see something like this
> happening because of:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D89c290ea758911e660878e26270e084d862c03b0
>
> As I mentioned during the review of that, it might be better to
> not touch the video-card ACPI power-state at all and instead
> only do acpi_device_fix_up_power() on the child devices.

Or the child devices need to be put to D3 during suspend.

>
> Owen, attached are 2 patches which implement only
> calling acpi_device_fix_up_power() on the child devices,
> can you build a v6.6 kernel with these 2 patches added
> on top please and see if that fixes things ?
>
> Kai-Heng can you test that the issue on the HP ZBook Fury 16 G10
> is still resolved after applying these patches ?

Yes. Thanks for the patch.

If this patch also fixes Owen's issue, then
Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>


>
> Regards,
>
> Hans
>
