Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05771EA3
	for <regressions@lists.linux.dev>; Tue, 21 Jun 2022 18:52:22 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id t24so11658058lfr.4
        for <regressions@lists.linux.dev>; Tue, 21 Jun 2022 11:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LyC2xQZ/J7P7EEp9bZtR/lqMCT8LU/RUU5bcVNVOJp8=;
        b=p9X9UxNP81FAxeV9hvfPvi0M1iZP1ZeRtYmFuwVS+IkfswgT2N6ure1O+4nZotEKvi
         GodnVRPsPpulB/oqanX1HtbY3ONqc6zD1WY2WcJfuSGlCdeyH2qjJ2KlMMe4deX4ovrf
         QaJJJrw+8ATGO11sXcMaXgPb6tEP/XJ4+vRCWcJ91f8NvXxpmXpT3RMOkQScZ4LlWzVG
         P8TSSHhFY1FcVrInXyd79UctirOH7+JnnM4RfDeEsXzaW4qGxw7OYe57lv5BvbjVgZbC
         Bo+pWU0Vww/QfSsArHVnSaA6o67fqVw85FJVhHpcEpmaL91y0ElPuBH13bvvvbikeOCV
         acLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LyC2xQZ/J7P7EEp9bZtR/lqMCT8LU/RUU5bcVNVOJp8=;
        b=2RwGPmERoHhkNmBkJi3odDXUXQ8d+aBpj36Wy3wgDQMq87Cw0vkmJMCQ8i5kXtsi1l
         4McUM+q+FJVK4ntf+7a7BWkDVCR2gjRl4fNI85VUd0Q/TgC+j8llI+koakQunyFeg1XE
         7j5Pe7CcshEaTbyl9dsia2I4n2XsZaDHXvgH1A/VXWyo2cBth+EL4NACZVi4mmKcyp8q
         tj8lrvcNf/wadOT1cRDZxf6I1BwzANGEWhQm0Jkj4qT9nfBLe2pJPVWqCH6Z7rExy9Lg
         dXgHBZpp8OZnQoJRxThjV9zk3Y8JroZoeFJ8XJhSt32z+tNr+0YwVUb7pv4cMWaPuMTI
         YvCw==
X-Gm-Message-State: AJIora+m5LSj88Dh7tQpTQnnW2o3mLdW5wjBtgTIxrhrhrsFYsPUdZa/
	QOSwHtiQ/jGQrwMbwqlVHkzZKITa/CpqD646rAo=
X-Google-Smtp-Source: AGRyM1vrSETpNBNYgiA6t5lW29KptH6Dy4G7OT1APqy5yr60iKZqS6cUjPDHL+SrRcQZhQ0Oc3NRbdezaLcximMa+jU=
X-Received: by 2002:a05:6512:1307:b0:47f:67ab:4064 with SMTP id
 x7-20020a056512130700b0047f67ab4064mr8780904lfu.106.1655837540974; Tue, 21
 Jun 2022 11:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a1ce1743-e450-6cdb-dfab-56a3e3eb9aed@pengutronix.de>
 <CABBYNZ+z8kBUKGXbZSfb0ynJaTnPQRp0wFDUb12AW1ymbNx1eg@mail.gmail.com>
 <CABBYNZ+zsuggTpaUSPsZKeL=qqvM1=sgMWzdWEqaS_oh6dhY2g@mail.gmail.com>
 <8d5c4724-d511-39b1-21d7-116c91cada45@pengutronix.de> <b0cb4fb0-6b89-b9df-9ae6-421ac52b0100@pengutronix.de>
 <CABBYNZ+ubN2rc=zoN_53Pmp6kt3L5UcY3knbtjhhVOjPBpJv4Q@mail.gmail.com>
 <d5654901-6b1f-a1fa-0101-8b52b345af7b@pengutronix.de> <CABBYNZ+8dpPBqaQMr-Hz_DJRxT-0ucCjgAJH50FUaN7Sn9H6rA@mail.gmail.com>
 <1d1b76cf-df6f-3935-5cd2-c45ea78f2c33@pengutronix.de>
In-Reply-To: <1d1b76cf-df6f-3935-5cd2-c45ea78f2c33@pengutronix.de>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 21 Jun 2022 11:52:09 -0700
Message-ID: <CABBYNZLdy-rndKczoG_WiWXQmacX+vzCbftQKvzJ3B6imtZopw@mail.gmail.com>
Subject: Re: [BUG] BLE device unpairing triggers kernel panic
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ahmad, Tedd,

On Tue, Jun 21, 2022 at 1:32 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Luiz,
>
> On 20.06.22 22:18, Luiz Augusto von Dentz wrote:
> > On Mon, Jun 20, 2022 at 3:06 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >> Disconnect of connection #1 being processed after new connection #2
> >> concluded sounds wrong. Would I be able to reconnect
> >> afterwards or would all connections, but the first, be directly
> >> disconnected...?
> >
> > That depends on the order you have queued the commands, it will be
> > processed in the exact order it is received, that why I said it is
> > single queue design, and it is done like that to prevent messing up
> > with states since we know the exact order the commands will be sent.
> >
> >>> otherwise we need a
> >>> different queue to handle command that abort/cancel other already in
> >>> the queue.
> >>
> >> Is the revert an acceptable interim solution or are there issues
> >> I am missing?
> >
> > Afaik there were problem with concurrent connections request, so what
> > would really help us here is to have some tests to emulate this
> > scenario with our CI, in the meantime please check if the following
> > fixes your problem:
> >
> > https://gist.github.com/Vudentz/b4fff292c7f4ad55ca3299fd5ab797ae
>
> Doesn't help unfortunately. First pairing works as before.
> Second still fails:
>
>   Bluetooth: hci0: Opcode 0x200d failed: -110
>   Bluetooth: hci0: request failed to create LE connection: err -110

Can we try to add a test in mgmt-tester to reproduce the error above?

> Cheers,
> Ahmad
>
> >
> >> Cheers,
> >> Ahmad
> >>
> >>>
> >>>> We've been deploying the revert for a while now and I just posted
> >>>> it to the mailing list[1]. There have been other reports
> >>>> of this issue with different hardware too and fixing sent_cmd
> >>>> would likely be too complicated/time intensive for me.
> >>>>
> >>>> I am happy to test future patches that fix this properly though.
> >>>>
> >>>> [1]: https://lore.kernel.org/linux-bluetooth/20220616092418.738877-1-a.fatoum@pengutronix.de/T/#t
> >>>>
> >>>> Cheers,
> >>>> Ahmad
> >>>>
> >>>>
> >>>>
> >>>>>
> >>>>> Cheers,
> >>>>> Ahmad
> >>>>>
> >>>>
> >>>>
> >>>> --
> >>>> Pengutronix e.K.                           |                             |
> >>>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> >>>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> >>>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> >>>
> >>>
> >>>
> >>
> >>
> >> --
> >> Pengutronix e.K.                           |                             |
> >> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> >> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> >> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> >
> >
> >
>
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |



-- 
Luiz Augusto von Dentz
