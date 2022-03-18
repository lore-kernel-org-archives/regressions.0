Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC634C60
	for <regressions@lists.linux.dev>; Fri, 18 Mar 2022 14:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647612433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=maHIdBZx2FrOp6S6njvn7N4QHjRKBaOIDNVSSeHFgSg=;
	b=beLKAmJ1xTpVt45WyO+iG+LPRiveqm2ens3qDIrMDvXQJUJZD+j491UTUl3uE21zldbbXZ
	awtqRi91r7NkhJ6JrW5S+CfIyd6I/4WVM66s9L52FDpMvsQGPQJQajXrmDLgWPYO20+U7P
	h7vvlcEiedEHmGJn/pWKKJQSLstZVvM=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-t92_kNFYMmGNJQcdYYxD8g-1; Fri, 18 Mar 2022 10:07:07 -0400
X-MC-Unique: t92_kNFYMmGNJQcdYYxD8g-1
Received: by mail-pg1-f200.google.com with SMTP id e5-20020a637445000000b003822d8ddc10so1069104pgn.6
        for <regressions@lists.linux.dev>; Fri, 18 Mar 2022 07:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=maHIdBZx2FrOp6S6njvn7N4QHjRKBaOIDNVSSeHFgSg=;
        b=DPsUey3YEVML5oJSz0fCPkEp2VbrsgcclyWdSx4j7prUAStfkT0qkRDzldpmwNb4kM
         jnEXCxyrucNbuluyLWnaQ8LGDQns+QFImU151C/VnYFVHiNkBR9pdWJW1kTT8iSJaga5
         ew/jXd1pMjGk8YFysThsZ63mSsC+MdldPn/W8Ot+/uz2w6fPqvLogtzAhd6mfkflt4Vf
         BoblOPJDAI9spnRxZOdZf/qffVl/Yk7BJjwfT3hSK8YymF58fqXlizoVZndZT+oP3oBB
         lpNM1pkEPLNYv9ZfH4XJ8l861u2RWi5WHy+o38Ojt3bHNG3EaEx4t0MCSXUmWSHvI+Z4
         TP1g==
X-Gm-Message-State: AOAM533tclIgnNyJGPBB2ouyHcdk70X45D63wgFeOzpAjTh1rbjbdOY4
	N6lIPfw989tflaQoZnRQ3QvAW+BoU4KhJFkwXG3fJuktFFjqOKDiIztyLuU0JRrZqFhgulNAbb6
	awV1T9YZxxFNWXD98TIyZE2iLD6AGnunGnMM4qJY=
X-Received: by 2002:a63:5110:0:b0:374:2312:1860 with SMTP id f16-20020a635110000000b0037423121860mr8066234pgb.146.1647612426660;
        Fri, 18 Mar 2022 07:07:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsiQTQGZVaHbS7Tn5Fqv9XAuJAKJo9F201eDLflW91uRj7iaAEtvNd77z2x3tm4LR4I1PVYq8KYvCF3gqUmg8=
X-Received: by 2002:a63:5110:0:b0:374:2312:1860 with SMTP id
 f16-20020a635110000000b0037423121860mr8066211pgb.146.1647612426384; Fri, 18
 Mar 2022 07:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <s5htubv32s8.wl-tiwai@suse.de> <20220318130740.GA33535@elementary> <s5hlex72yno.wl-tiwai@suse.de>
In-Reply-To: <s5hlex72yno.wl-tiwai@suse.de>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 18 Mar 2022 15:06:55 +0100
Message-ID: <CAO-hwJK8QMjYhQAC8tp7hLWZjSB3JMBJXgpKmFZRSEqPUn3_iw@mail.gmail.com>
Subject: Re: [REGRESSION] Right touchpad button disabled on Dell 7750
To: Takashi Iwai <tiwai@suse.de>
Cc: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	linux-input@vger.kernel.org, Peter Hutterer <peter.hutterer@who-t.net>, 
	Jiri Kosina <jkosina@suse.cz>, stable@vger.kernel.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=btissoir@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2022 at 2:11 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 18 Mar 2022 14:07:40 +0100,
> Jos=C3=A9 Exp=C3=B3sito wrote:
> >
> > Hi Takashi,
> >
> > Thanks for reporting the regression here.
> >
> > On Fri, Mar 18, 2022 at 12:42:31PM +0100, Takashi Iwai wrote:
> > > Hi,
> > >
> > > we received a bug report about the regression of the touchpad on Dell
> > > 7750 laptop, the right touchpad button is disabled on recent kernels:
> > >   https://bugzilla.suse.com/show_bug.cgi?id=3D1197243
> > >
> > > Note that it's a physical button, not a virtual clickpad button.
> > >
> > > The regression seems introduced by the upstream commit
> > > 37ef4c19b4c659926ce65a7ac709ceaefb211c40 ("Input: clear
> > > BTN_RIGHT/MIDDLE on buttonpads") that was backported to stable 5.16.x
> > > kernel.
> > >
> > > The device is managed by hid-multitouch driver, and the further
> > > investigation revealed that it's rather an incorrectly recognized
> > > buttonpad property; namely, ID_DG_BUTTONTYPE reports it being 0 =3D
> > > clickable touchpad although it's not.  I built a test kernel to ignor=
e
> > > this check and it was confirmed to make the right button working agai=
n
> > > by the reporter.

Yep, I came to the same conclusion this morning with the reporter of
the libinput bug Jos=C3=A9 was mentioning.

> > >
> > > Is this check really correct in general?  Or do we need some
> > > device-specific quirk?

The device firmware is clearly wrong here. It's the first time I see
this failing like that and I hope this is just an isolated case.
The device advertises itself as a buttonpad, when it's not.

However, the fact that it passed MS certification (even if I doubt
Microsoft ever got that touchpad in their own hands) leads me to
believe that the certification doesn't enforce that setting too much,
and that we might see more devices coming in with that same bug.

To sum up, I am not happy that this commit introduced a regression
that we can not work around in userspace: given that BTN_RIGHT gets
removed from the device, all of the values are filtered out and
userspace can not resolve that situation by itself.

I wish I had a better way of fixing this than having to quirk the device.

> >
> > A couple of days ago another user with the same laptop (Dell Precision
> > 7550 or 7750) emailed me to report the issue and I sent him a patch for
> > testing.
> >
> > I he confirms that the patch works, I'll send it to the mailing list.
> >
> > I believe that your analysis of the regression is correct and I think
> > that we'd need to add a quirk for the device.
> >
> > In case you want to have a look to the patch, I added it to this
> > libinput [1] report.
>
> Great, I'll try to build and ask the reporter to test with the patch.
>

As noticed on the libinput bug, I think the patch is wrong (not by a lot).
We should base the class on MT_CLS_WIN8, not MT_CLS_DEFAULT.

The testers might say that it's working, but this might create some
corner cases where it's not leading to more and more headaches with
your users.

Cheers,
Benjamin

> Thanks!
>
>
> Takashi
> >
> > Thanks,
> > Jose
> >
> > [1] https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/7=
26#note_1303623
> >
>

