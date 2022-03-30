Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463E363
	for <regressions@lists.linux.dev>; Wed, 30 Mar 2022 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648643453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EHl9Iys2fNo0cHL3L00P9uLCZVoH7/jMKcSWCaOEXSw=;
	b=Rk7ho4NzzZbUtDswKuPio9nfniido0z4WiivvCNno4vPSPYUxvi6ob6PJwI9MNc7hDwzww
	Sgd0ZIPEdwWawOzTC37NSKkQMigDu8cZ2bvaqJQQGQ9rRiLZkfnp7V39bnTTiw+9QIqyRQ
	Mq4PDUVnSQ3Wq13OURNGNAteX9q4vWA=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-1hR9hO_zMIiYwQvdVe7Z2A-1; Wed, 30 Mar 2022 08:30:49 -0400
X-MC-Unique: 1hR9hO_zMIiYwQvdVe7Z2A-1
Received: by mail-pf1-f200.google.com with SMTP id y27-20020aa79afb000000b004fa7883f756so11946773pfp.18
        for <regressions@lists.linux.dev>; Wed, 30 Mar 2022 05:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EHl9Iys2fNo0cHL3L00P9uLCZVoH7/jMKcSWCaOEXSw=;
        b=kmUzSrjR5RNwfvgaPMW616ut+paeEQvsRIKpMxjw2fEk09HZQ7Vrg7gZwaW1hQO+U8
         xahxJA+5850ZyrDlnYyenbKmcB1IUxEebnLEL2O2wJAUMeJGbL0yCz/74I4jBZRjBqzE
         haXK1jRKWi2u59DjkEAcGRiJK7XJepNvteM5qfZf+mPmSJDJ3HHdIQboKU2itQ2TAXdf
         06nO3JfWI7WYWyLyTFIChOssA98JdA7FwH18u8Lcr2CcxtWJ4Y7FNQAkME6QN1oF6MnS
         6oZo9MzRK+JHCrXJ8FXzDmqsZIOKu3a0+hGOYRztbflbRfy2nle8OrE4XpsGypMYqcRy
         TU1g==
X-Gm-Message-State: AOAM533owAKp6priYOybURljViWwLvk8PtqbwpYJoXsUHeXzbL5iWe5t
	c/PC3hfWCmcTigpD/+xIRbglYVKSp37WrVwNAHbBJXW2uuNWbOFujs6l0Zu6SjJVI+UGkofbaV7
	89E2x4ZzzcUQvLOME2ItY4FjWQdmwDa8Q+mmcgYA=
X-Received: by 2002:a63:416:0:b0:386:66e:33d9 with SMTP id 22-20020a630416000000b00386066e33d9mr6130720pge.146.1648643448700;
        Wed, 30 Mar 2022 05:30:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxekgq7KrEQL6DDoYa2FqMqNPIp9xe0b62gAYQ5LJDPH7bPsfl3FeLlM+UX3hqiOfixrB+XHzDe6gin6hyPK0o=
X-Received: by 2002:a63:416:0:b0:386:66e:33d9 with SMTP id 22-20020a630416000000b00386066e33d9mr6130693pge.146.1648643448387;
 Wed, 30 Mar 2022 05:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220321184404.20025-1-jose.exposito89@gmail.com> <44abc738-1532-63fa-9cd1-2b3870a963bc@leemhuis.info>
In-Reply-To: <44abc738-1532-63fa-9cd1-2b3870a963bc@leemhuis.info>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 30 Mar 2022 14:30:37 +0200
Message-ID: <CAO-hwJJweSuSBE_18ZbvqS12eX9GcS+aJoe7SRFJdASOrN3bqw@mail.gmail.com>
Subject: Re: [PATCH] Revert "Input: clear BTN_RIGHT/MIDDLE on buttonpads"
To: Thorsten Leemhuis <regressions@leemhuis.info>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	Jiri Kosina <jkosina@suse.cz>, Takashi Iwai <tiwai@suse.de>, 
	Peter Hutterer <peter.hutterer@who-t.net>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, "3.8+" <stable@vger.kernel.org>, 
	regressions@lists.linux.dev, lkml <linux-kernel@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=btissoir@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 2:27 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi, this is your Linux kernel regression tracker.
>
> On 21.03.22 19:44, Jos=C3=A9 Exp=C3=B3sito wrote:
> > This reverts commit 37ef4c19b4c659926ce65a7ac709ceaefb211c40.
> >
> > The touchpad present in the Dell Precision 7550 and 7750 laptops
> > reports a HID_DG_BUTTONTYPE of type MT_BUTTONTYPE_CLICKPAD. However,
> > the device is not a clickpad, it is a touchpad with physical buttons.
> >
> > In order to fix this issue, a quirk for the device was introduced in
> > libinput [1] [2] to disable the INPUT_PROP_BUTTONPAD property:
> >
> >       [Precision 7x50 Touchpad]
> >       MatchBus=3Di2c
> >       MatchUdevType=3Dtouchpad
> >       MatchDMIModalias=3Ddmi:*svnDellInc.:pnPrecision7?50*
> >       AttrInputPropDisable=3DINPUT_PROP_BUTTONPAD
> >
> > However, because of the change introduced in 37ef4c19b4 ("Input: clear
> > BTN_RIGHT/MIDDLE on buttonpads") the BTN_RIGHT key bit is not mapped
> > anymore breaking the device right click button and making impossible to
> > workaround it in user space.
> >
> > In order to avoid breakage on other present or future devices, revert
> > the patch causing the issue.
> >
> > Cc: stable@vger.kernel.org
> > Link: https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests=
/481 [1]
> > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1868789  [2]
> > Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> > [...]
>
> Jiri, Benjamin, what the status here? Sure, this is not a crucial
> regression and we are in the middle of the merge window, but it looks
> like nothing has happened for a week now. Or was progress made somewhere
> and I just missed it?

No, I think it just wasn't picked up by the input maintainer yet
(Dmitry, now in CC).

FWIW:
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Jos=C3=A9, please do not forget to add the input maintainer when you target
the input tree, not the HID one :)

Cheers,
Benjamin

>
> #regzbot ^backmonitor:
> https://lore.kernel.org/stable/s5htubv32s8.wl-tiwai@suse.de/
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
>
>

