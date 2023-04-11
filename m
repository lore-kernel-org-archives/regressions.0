Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AAA8BEE
	for <regressions@lists.linux.dev>; Tue, 11 Apr 2023 12:17:14 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id n14so32754920plc.8
        for <regressions@lists.linux.dev>; Tue, 11 Apr 2023 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681215433; x=1683807433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw6PqzG6tN+gJZF2vp8mnC8V38zVasvKXmv3BeRQmUw=;
        b=YcQRknhJyvQ8I8Eeife8EJNFYcH6szLtmLSXvLmMZZncwL34JGXXTDFsP9binVVaxw
         z9EnMXuA/IARgEDZvra33FFN06pw7he/ZjuwpLzPPAuXsLOfl3xddZ3tyMZZzobt4Jnw
         2e00LUbqpCKjRjCeB9vblEFkZxtwG8jnTl4qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681215433; x=1683807433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jw6PqzG6tN+gJZF2vp8mnC8V38zVasvKXmv3BeRQmUw=;
        b=wWfBrsd1lVf3ThEn+QqSN5r/7Ps0ncRB8Yl8T6Hi6LslpnK789nW0nsROQY4WqvtJU
         eaIxGDESF+WRkVUUNPTz9g5ZTUqK8IbI8ymgGQs+XBugFJDfvkk3ALpQBMSGSURyuQlB
         ys8810NQYm8EcT/Dvt+py0SvfmlWFovwZRcO3tPJgo4h/WZU7C56LRFGdTkDPVC0+Cds
         K5fnQqYHsb+xJ27+0k3ZWqQtl+icoKgofA/BUIhupBzAGKUb/yZDCXHeo98PbPeGNohF
         7YXFyOg3U6rsPklGX+H1pHTJuceKegU61FoSic6u5gD4Gfx2jgHGEC3VF7RRnVviJoLP
         mhEg==
X-Gm-Message-State: AAQBX9coQZJ9DRHVrTntxzMvudlRU+t9IyihZf5SNhy/03TtZoKnDeR+
	QbAKEasXtKsd/QjEAkkXGHhvOavgsH3vHNJo+Bs=
X-Google-Smtp-Source: AKy350b7AcDdePyz8MXDp+hnPc4uNWE3n9dEQv6Vp87yvksZ+uX41gzGL3t/U3Groi1fLguliYIKYg==
X-Received: by 2002:a17:903:2282:b0:1a5:2da5:b1f9 with SMTP id b2-20020a170903228200b001a52da5b1f9mr11776444plh.26.1681215433353;
        Tue, 11 Apr 2023 05:17:13 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com. [209.85.214.177])
        by smtp.gmail.com with ESMTPSA id y3-20020a170902864300b001960706141fsm9565873plt.149.2023.04.11.05.17.12
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 05:17:12 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id w11so7636987plp.13
        for <regressions@lists.linux.dev>; Tue, 11 Apr 2023 05:17:12 -0700 (PDT)
X-Received: by 2002:a17:90a:94c6:b0:244:9b8f:c3bf with SMTP id
 j6-20020a17090a94c600b002449b8fc3bfmr3284326pjw.7.1681215431866; Tue, 11 Apr
 2023 05:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl> <e66fceb5-6621-54bb-cffb-66889941cf17@leemhuis.info>
In-Reply-To: <e66fceb5-6621-54bb-cffb-66889941cf17@leemhuis.info>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 11 Apr 2023 14:17:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCs9sTG0pUy3jZiz8JzVArMbRaZ5j7psb-_iCqi2R1NyDg@mail.gmail.com>
Message-ID: <CANiDSCs9sTG0pUy3jZiz8JzVArMbRaZ5j7psb-_iCqi2R1NyDg@mail.gmail.com>
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown pixelformats
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, regressions@lists.linux.dev, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten

On Tue, 11 Apr 2023 at 13:51, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 29.03.23 14:28, Hans Verkuil wrote:
> > If the fcc is 0 (indicating an unknown GUID format), then fill in the
> > description field in ENUM_FMT. Otherwise the V4L2 core will WARN.
> >
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
>
> Thx for working on this.
>
> Would be good to have Reported-by and Link tags for any reports about
> the issue; I'm aware of the following two, maybe there were more:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=217252
> https://bugzilla.redhat.com/show_bug.cgi?id=2180107
>
> And a Cc: <stable@vger.kernel.org> # 5.15.x would likely be good as
> well, as the culprit was backported.
>
> But I write for a different reason: how urgent is this fix? Is this
> "just" fixing a kernel warning, or do users notice this as some apps
> crash? The bugzilla.redhat.com ticket's subject indicates it's the
> latter; and I think I saw someone else mentioning that this leads to
> crashes, but maybe I'm mixing things up.

I think it only a crash if panic_on_warn is enabled.

>
> Because if this fixes a crash, it afaics would be good to get this fixed
> rather sooner than later in mainline, so that it can be fixed in stable
> as well.
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
>
> > ---
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 7aefa76a42b3..2f1ced1212cd 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
> >               } else {
> >                       dev_info(&streaming->intf->dev,
> >                                "Unknown video format %pUl\n", &buffer[5]);
> > +                     snprintf(format->name, sizeof(format->name), "%pUl\n",
> > +                              &buffer[5]);
> > +
> >                       format->fcc = 0;
> >               }
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 35453f81c1d9..fc6f9e7d8506 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> >       if (format->flags & UVC_FMT_FLAG_COMPRESSED)
> >               fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
> >       fmt->pixelformat = format->fcc;
> > +     if (format->name[0])
> > +             strscpy(fmt->description, format->name,
> > +                     sizeof(fmt->description));
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 9a596c8d894a..22656755a801 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -264,6 +264,8 @@ struct uvc_format {
> >       u32 fcc;
> >       u32 flags;
> >
> > +     char name[32];
> > +
> >       unsigned int nframes;
> >       struct uvc_frame *frame;
> >  };
> >
> >
> >



-- 
Ricardo Ribalda
