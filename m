Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBB22C9D
	for <regressions@lists.linux.dev>; Fri, 17 Dec 2021 08:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639729802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+7AgiuEUoi3nQncHSqYFjntzFdXZczz/91mqmHMQafc=;
	b=DHQHdSWBWBr+082bqOtizyUb8CqSYL5h7R3rQW9BdrutaRbSuHpvU/FGKsvOh9ROCZXsWv
	LiKN9o1YsV+GdveC/HkO7Tqz67iM+K3d0jwoY4qa52BB09lQnswXdhSzpQnCoq/ZcfS4CV
	583+FoTmJwur88gXOePKLiNilx73jt0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-tzaRoLqQM1ag-KtIDg5ELg-1; Fri, 17 Dec 2021 03:29:59 -0500
X-MC-Unique: tzaRoLqQM1ag-KtIDg5ELg-1
Received: by mail-pl1-f198.google.com with SMTP id q14-20020a170902dace00b00148e2c4fe06so177379plx.15
        for <regressions@lists.linux.dev>; Fri, 17 Dec 2021 00:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+7AgiuEUoi3nQncHSqYFjntzFdXZczz/91mqmHMQafc=;
        b=z2+KI2VN0GiwMu2c2oWgLdCzcsMP+5GXVIbs6vMC2lB2aJvedLgY/+bsizrS2h+wim
         DyOl61E63PSRlQgJDVuZy5X4MaVWBBbI/Dc9/HJe2xxqYoAQayypTNm8MMbqfeZRz9v4
         cXq95PlJ4UkHHqdSF5s08CixRQlMBnt5l8t3LBmDR1PmNbgZZSPQR341yYC9XntZiQO6
         Us+0j1lV6/33TzUsd84EgkToy2Qtp+4SVCldi6ePFqtJ4ekkZQAmkNbQOApPOIe1tiTl
         GxslkzN5fN/UOruWHensx2iU5CCxO0hCijXz2M61ebraWujby5xXSnY+rRmHRQA6/76B
         rrjw==
X-Gm-Message-State: AOAM530oJzHU0n9ZmeXNJvH2K7AHLQvwdQ2whlcQWJ5zbxj/Kt5FTB5d
	tegfIUujOpORvCznviJksTtJhaGFRygcIW5E5Lc6XAOYw8bZMqsGUt5Sj2iF0mYSzpovhpzN2Ma
	c87pdvb+3u1Q6h82b62K+9avAvYAu1Dnw2B4ESoE=
X-Received: by 2002:a17:90b:224f:: with SMTP id hk15mr10957586pjb.173.1639729797887;
        Fri, 17 Dec 2021 00:29:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwg5R7B0aUAN0YIUa1Hf2hEt6R7jHQKtWA1O8bOq6EjVzzyR3CeyikpqpHci78L0ckbLUqhcPsgmPN3+aWIC7A=
X-Received: by 2002:a17:90b:224f:: with SMTP id hk15mr10957559pjb.173.1639729797470;
 Fri, 17 Dec 2021 00:29:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e4efbf13-bd8d-0370-629b-6c80c0044b15@leemhuis.info>
 <42903605-7e8b-4e84-fcd6-1b23169b8639@redhat.com> <YbxJm2d7NJKwmJJu@kroah.com>
In-Reply-To: <YbxJm2d7NJKwmJJu@kroah.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 17 Dec 2021 09:29:46 +0100
Message-ID: <CAO-hwJJ+iHo4pT4RqgoFVthHJxTYG0_cq=DA6-VGk9nFDqVa7w@mail.gmail.com>
Subject: Re: FWD: Holtek mouse stopped working after kernel upgrade from
 5.15.7 to 5.15.8
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, tlinux@cebula.eu.org, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=btissoir@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 17, 2021 at 9:26 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Dec 17, 2021 at 09:13:15AM +0100, Benjamin Tissoires wrote:
> > Hi,
> >
> > On 12/17/21 08:00, Thorsten Leemhuis wrote:
> > > Hi, this is your Linux kernel regression tracker speaking.
> > >
> > > I noticed a bugreport from Tomasz C. (CCed) that sounds a lot like a
> > > regression between v5.15.7..v5.15.8 and likely better dealt with by email:
> > >
> > > To quote from: https://bugzilla.kernel.org/show_bug.cgi?id=215341
> > >
> > > > After updating kernel from 5.15.7 to 5.15.8 on ArchLinux distribution, Holtek USB mouse stopped working.
> > > > Exact model:
> > > > 04d9:a067 Holtek Semiconductor, Inc. USB Gaming Mouse
> > > >
> > > > The dmesg output for this device from kernel version 5.15.8:
> > > >
> > > > [    2.501958] usb 2-1.2.3: new full-speed USB device number 6 using ehci-pci
> > > > [    2.624369] usb 2-1.2.3: New USB device found, idVendor=04d9, idProduct=a067, bcdDevice= 1.16
> > > > [    2.624376] usb 2-1.2.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > > > [    2.624379] usb 2-1.2.3: Product: USB Gaming Mouse
> > > > [    2.624382] usb 2-1.2.3: Manufacturer: Holtek
> > > >
> > > > After disconnecting and connecting the USB:
> > > >
> > > > [   71.976731] usb 2-1.2.3: USB disconnect, device number 6
> > > > [   75.013021] usb 2-1.2.3: new full-speed USB device number 8 using ehci-pci
> > > > [   75.135865] usb 2-1.2.3: New USB device found, idVendor=04d9, idProduct=a067, bcdDevice= 1.16
> > > > [   75.135873] usb 2-1.2.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > > > [   75.135877] usb 2-1.2.3: Product: USB Gaming Mouse
> > > > [   75.135880] usb 2-1.2.3: Manufacturer: Holtek
> > > >
> > > >
> > > > On kernel version 5.15.7:
> > > >
> > > > [    2.280515] usb 2-1.2.3: new full-speed USB device number 6 using ehci-pci
> > > > [    2.379777] usb 2-1.2.3: New USB device found, idVendor=04d9, idProduct=a067, bcdDevice= 1.16
> > > > [    2.379784] usb 2-1.2.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > > > [    2.379787] usb 2-1.2.3: Product: USB Gaming Mouse
> > > > [    2.379790] usb 2-1.2.3: Manufacturer: Holtek
> > > > [    2.398578] input: Holtek USB Gaming Mouse as /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2.3/2-1.2.3:1.0/0003:04D9:A067.0005/input/input11
> > > > [    2.450977] holtek_mouse 0003:04D9:A067.0005: input,hidraw4: USB HID v1.10 Keyboard [Holtek USB Gaming Mouse] on usb-0000:00:1d.0-1.2.3/input0
> > > > [    2.451013] holtek_mouse 0003:04D9:A067.0006: Fixing up report descriptor
> > > > [    2.452189] input: Holtek USB Gaming Mouse as /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2.3/2-1.2.3:1.1/0003:04D9:A067.0006/input/input12
> > > > [    2.468510] usb 2-1.2.4: new high-speed USB device number 7 using ehci-pci
> > > > [    2.503913] holtek_mouse 0003:04D9:A067.0006: input,hiddev96,hidraw5: USB HID v1.10 Mouse [Holtek USB Gaming Mouse] on usb-0000:00:1d.0-1.2.3/input1
> > > > [    2.504105] holtek_mouse 0003:04D9:A067.0007: hiddev97,hidraw6: USB HID v1.10 Device [Holtek USB Gaming Mouse] on usb-0000:00:1d.0-1.2.3/input2
> > > >
> > > > Rolling back the kernel to version 5.15.7 solves the problem.
> >
> > Oops, sorry. An overlook from a precedent commit.
> >
> > Can you confirm the following patch works? (and also tell me if the
> > links I put are sufficient for regzbot)
> > ---
> > rom 8f38596f2620c4b22ff9e2622917ac2b69aa8320 Mon Sep 17 00:00:00 2001
> > From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Date: Fri, 17 Dec 2021 09:03:32 +0100
> > Subject: [PATCH] HID: holtek: fix mouse probing
> >
> > An overlook from the previous commit: we don't even parse or start the
> > device, meaning that the device is not presented to user space.
> >
> > Fixes: 93020953d0fa ("HID: check for valid USB device for many HID drivers")
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=215341
> > Link: https://lore.kernel.org/regressions/e4efbf13-bd8d-0370-629b-6c80c0044b15@leemhuis.info/
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > ---
> >  drivers/hid/hid-holtek-mouse.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/drivers/hid/hid-holtek-mouse.c b/drivers/hid/hid-holtek-mouse.c
> > index b7172c48ef9f..7c907939bfae 100644
> > --- a/drivers/hid/hid-holtek-mouse.c
> > +++ b/drivers/hid/hid-holtek-mouse.c
> > @@ -65,8 +65,23 @@ static __u8 *holtek_mouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> >  static int holtek_mouse_probe(struct hid_device *hdev,
> >                             const struct hid_device_id *id)
> >  {
> > +     int ret;
> > +
> >       if (!hid_is_usb(hdev))
> >               return -EINVAL;
> > +
> > +     ret = hid_parse(hdev);
> > +     if (ret) {
> > +             hid_err(hdev, "hid parse failed: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> > +     if (ret) {
> > +             hid_err(hdev, "hw start failed: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> >       return 0;
> >  }
> > --
> > 2.31.1
>
> Ugh, my fault, you did warn me about the probe function, I should have
> noticed this was required, sorry about that.
>

Well, honestly, I should have detected it when reviewing. So we both
share the blame :)

Cheers,
Benjamin

