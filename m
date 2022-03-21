Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D286126
	for <regressions@lists.linux.dev>; Mon, 21 Mar 2022 18:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647886981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfY8Crr6Tj01OHCDabQLLo1k6K5pz09f+j9vIenvmF0=;
	b=DiXTPE49qp+SGVca2UWIC7rSYrL8VTGsLsOzgyzzzT29hS2LXKb28/00djyonSKp2gUhFY
	LM0+42dsaHzqql8w+dT2/enrHqypQAOjS/vDansPT0GkWRucRH86qjyW2m/TuHSqhFsxTO
	EjSLsRsxIAHAa/357hSGt4eH/AA8w9Q=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-BOLmiY-KMUCKBLbpgCxgHg-1; Mon, 21 Mar 2022 14:22:57 -0400
X-MC-Unique: BOLmiY-KMUCKBLbpgCxgHg-1
Received: by mail-pj1-f69.google.com with SMTP id mq8-20020a17090b380800b001c6f8962e95so19736pjb.1
        for <regressions@lists.linux.dev>; Mon, 21 Mar 2022 11:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FfY8Crr6Tj01OHCDabQLLo1k6K5pz09f+j9vIenvmF0=;
        b=1PlSFjjcq9TMnPYLC+OvXaVMJm+y0EUHbqySNUDTLr5U6cuL+JA6h8ygoiWGrIaVhQ
         SAqYLAroAMBNHl6Ui8P7ACGfTnaD65+P86qUv1zT6gDzXy/jDzN1Pz5mWE+5dQrg2KVk
         Drv5tZ9hc4FOSNmU/bo1l1SG0MxiV4MFuNIjIBJEPKFe+QAkk5ASFsBMnINBj9dnGX0t
         g4iiptTZEZAO/NhjfvUbN1r7ZrqZ+qiifhyYr2GtBnqErYdyKVyL6EQXuGlqi4qD3Iwq
         nhuho4WkR3Q10V1A8ODyk1OUK1ockTHouLeoZOGf4P2OOJSTI0zqT35CqnoOQPaS/DCo
         dP0w==
X-Gm-Message-State: AOAM532iN46D+UuMtqdSd+LyflAod/C2OG61XGusCANioW5XdmoN2u4f
	Q8Iz5OE1fB59jgKP19+tXkQVdOPwYdfEuyimivWMIKC/yyUE7VITg7nwNAF5sROTvKmNY+1a89i
	Tn5hRzfaBXQZfI8uQhSQmuuTmrvReIOoKH1lDZjs=
X-Received: by 2002:a17:902:9308:b0:14e:def5:e6b5 with SMTP id bc8-20020a170902930800b0014edef5e6b5mr14049249plb.73.1647886976220;
        Mon, 21 Mar 2022 11:22:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9aMQx7N8NzYKX/luZYTlxOSYv+dJ1fzKnlT1BrjqExeEXa8Ysv2lVcuOFuxnRhYWNJpFSmIX5GsyMlUX8Mt8=
X-Received: by 2002:a17:902:9308:b0:14e:def5:e6b5 with SMTP id
 bc8-20020a170902930800b0014edef5e6b5mr14049231plb.73.1647886975908; Mon, 21
 Mar 2022 11:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220320190602.7484-1-jose.exposito89@gmail.com> <CAO-hwJKZUSTaWUpE_vsvAs-MNoZ8UJLgxiCyQ6OzwHYFZszf2w@mail.gmail.com>
In-Reply-To: <CAO-hwJKZUSTaWUpE_vsvAs-MNoZ8UJLgxiCyQ6OzwHYFZszf2w@mail.gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 21 Mar 2022 19:22:45 +0100
Message-ID: <CAO-hwJL4=OGv34mXq3de4QEKW15tT4gZDOBxhkuXVh5AeSafeQ@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: fix Dell Precision 7550 and 7750 button type
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: Jiri Kosina <jkosina@suse.cz>, Takashi Iwai <tiwai@suse.de>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Peter Hutterer <peter.hutterer@who-t.net>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, "3.8+" <stable@vger.kernel.org>, 
	regressions@lists.linux.dev, lkml <linux-kernel@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=btissoir@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2022 at 10:25 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi Jos=C3=A9,
>
> On Sun, Mar 20, 2022 at 8:06 PM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@=
gmail.com> wrote:
> >
> > The touchpad present in the Dell Precision 7550 and 7750 laptops
> > reports a HID_DG_BUTTONTYPE of type MT_BUTTONTYPE_CLICKPAD. However,
> > the device is not a clickpad, it is a touchpad with physical buttons.
> >
> > In order to fix this issue, a quirk for the device was introduced in
> > libinput [1] [2] to disable the INPUT_PROP_BUTTONPAD property:
> >
> >         [Precision 7x50 Touchpad]
> >         MatchBus=3Di2c
> >         MatchUdevType=3Dtouchpad
> >         MatchDMIModalias=3Ddmi:*svnDellInc.:pnPrecision7?50*
> >         AttrInputPropDisable=3DINPUT_PROP_BUTTONPAD
> >
> > However, because of the change introduced in 37ef4c19b4 ("Input: clear
> > BTN_RIGHT/MIDDLE on buttonpads") the BTN_RIGHT key bit is not mapped
> > anymore breaking the device right click button.
> >
> > In order to fix the issue, create a quirk for the device forcing its
> > button type to touchpad regardless of the value reported by the
> > firmware.
> >
> > [1] https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/4=
81
> > [2] https://bugzilla.redhat.com/show_bug.cgi?id=3D1868789
> >
> > Fixes: 37ef4c19b4 ("Input: clear BTN_RIGHT/MIDDLE on buttonpads")
> > Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> > ---
>
> Thanks for the patch.
> However, I'd like to put this one on hold for a bit. I am discussing
> it right now with Peter and we are trying to see what are the possible
> implications of starting to fix those in the kernel one by one.
>
> So Jiri, please hold on before applying this one.

Giving a little bit more context here (and quoting Peter).

"""
The problem with [37ef4c19b4] is that it removes functionality -
before a clickpad was falsely advertised but the button worked, now in
the affected devices it simply no longer works because the button code
gets filtered. And user-space can't work around this.
...
So the main question remains: why are we doing this?

And the answer here is: because libinput can't handle clickpads with
right buttons. But that's not really true either, libinput just
doesn't want to, and for no other reason than that it's easier to
handle it this way.
"""

So basically, we tried to fix a choice on libinput assuming that all
devices are perfect, for the only sake of making it easy for libinput.
But the solution prevents further tweaks, and we then need to manually
quirk devices in the kernel which involves a slightly heavier
difficulty for end users than just dropping a config file or changing
a setting in their UI.

With that said, this patch is:
Nacked-by: me

Jos=C3=A9, could you send a revert of 37ef4c19b4, and add "Cc:
stable@vger.kernel.org" and all the other tags for the regression
tracker bot?

Thanks in advance.

Cheers,
Benjamin

>
> Cheers,
> Benjamin
>
> >  drivers/hid/hid-ids.h        |  3 +++
> >  drivers/hid/hid-multitouch.c | 20 ++++++++++++++++++++
> >  2 files changed, 23 insertions(+)
> >
> > diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> > index 78bd3ddda442..6cf7a5b6835b 100644
> > --- a/drivers/hid/hid-ids.h
> > +++ b/drivers/hid/hid-ids.h
> > @@ -287,6 +287,9 @@
> >
> >  #define USB_VENDOR_ID_CIDC             0x1677
> >
> > +#define USB_VENDOR_ID_CIRQUE_CORP              0x0488
> > +#define USB_DEVICE_ID_DELL_PRECISION_7X50      0x120A
> > +
> >  #define USB_VENDOR_ID_CJTOUCH          0x24b8
> >  #define USB_DEVICE_ID_CJTOUCH_MULTI_TOUCH_0020 0x0020
> >  #define USB_DEVICE_ID_CJTOUCH_MULTI_TOUCH_0040 0x0040
> > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.=
c
> > index 99eabfb4145b..f012cf8e0b8c 100644
> > --- a/drivers/hid/hid-multitouch.c
> > +++ b/drivers/hid/hid-multitouch.c
> > @@ -71,6 +71,7 @@ MODULE_LICENSE("GPL");
> >  #define MT_QUIRK_SEPARATE_APP_REPORT   BIT(19)
> >  #define MT_QUIRK_FORCE_MULTI_INPUT     BIT(20)
> >  #define MT_QUIRK_DISABLE_WAKEUP                BIT(21)
> > +#define MT_QUIRK_BUTTONTYPE_TOUCHPAD   BIT(22)
> >
> >  #define MT_INPUTMODE_TOUCHSCREEN       0x02
> >  #define MT_INPUTMODE_TOUCHPAD          0x03
> > @@ -194,6 +195,7 @@ static void mt_post_parse(struct mt_device *td, str=
uct mt_application *app);
> >  #define MT_CLS_WIN_8_FORCE_MULTI_INPUT         0x0015
> >  #define MT_CLS_WIN_8_DISABLE_WAKEUP            0x0016
> >  #define MT_CLS_WIN_8_NO_STICKY_FINGERS         0x0017
> > +#define MT_CLS_BUTTONTYPE_TOUCHPAD             0x0018
> >
> >  /* vendor specific classes */
> >  #define MT_CLS_3M                              0x0101
> > @@ -302,6 +304,15 @@ static const struct mt_class mt_classes[] =3D {
> >                         MT_QUIRK_CONTACT_CNT_ACCURATE |
> >                         MT_QUIRK_WIN8_PTP_BUTTONS,
> >                 .export_all_inputs =3D true },
> > +       { .name =3D MT_CLS_BUTTONTYPE_TOUCHPAD,
> > +               .quirks =3D MT_QUIRK_ALWAYS_VALID |
> > +                       MT_QUIRK_IGNORE_DUPLICATES |
> > +                       MT_QUIRK_HOVERING |
> > +                       MT_QUIRK_CONTACT_CNT_ACCURATE |
> > +                       MT_QUIRK_STICKY_FINGERS |
> > +                       MT_QUIRK_WIN8_PTP_BUTTONS |
> > +                       MT_QUIRK_BUTTONTYPE_TOUCHPAD,
> > +               .export_all_inputs =3D true },
> >
> >         /*
> >          * vendor specific classes
> > @@ -1286,6 +1297,9 @@ static int mt_touch_input_configured(struct hid_d=
evice *hdev,
> >             (app->buttons_count =3D=3D 1))
> >                 td->is_buttonpad =3D true;
> >
> > +       if (app->quirks & MT_QUIRK_BUTTONTYPE_TOUCHPAD)
> > +               td->is_buttonpad =3D false;
> > +
> >         if (td->is_buttonpad)
> >                 __set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
> >
> > @@ -1872,6 +1886,12 @@ static const struct hid_device_id mt_devices[] =
=3D {
> >                 MT_USB_DEVICE(USB_VENDOR_ID_CHUNGHWAT,
> >                         USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH) },
> >
> > +       /* Cirque Corp (Dell Precision 7550 and 7750 touchpad) */
> > +       { .driver_data =3D MT_CLS_BUTTONTYPE_TOUCHPAD,
> > +               HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
> > +                       USB_VENDOR_ID_CIRQUE_CORP,
> > +                       USB_DEVICE_ID_DELL_PRECISION_7X50) },
> > +
> >         /* CJTouch panels */
> >         { .driver_data =3D MT_CLS_NSMU,
> >                 MT_USB_DEVICE(USB_VENDOR_ID_CJTOUCH,
> > --
> > 2.25.1
> >

