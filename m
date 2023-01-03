Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD5B8466
	for <regressions@lists.linux.dev>; Tue,  3 Jan 2023 15:20:18 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id j130so21687211oif.4
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 07:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ralston.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z8vVarhYQXZ9Qhz5mKvhwtmR7SHZZ/LNj7oEL18OVmc=;
        b=hyeNGChJOIyeBdeAor9LyYJDIbYuztx7eQPHqVLU/cYmveo63Dounjfo3BQ16he9mC
         H2PBFm462b6aeUnMdHKBadoPpjesWMEruUkoYYlOuMKBK+5N+2CD3+Wr5xhnwXRMPl4c
         mMdw5sImTu+yhVbE1H9hYFjKdg7u/cJfIJmPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8vVarhYQXZ9Qhz5mKvhwtmR7SHZZ/LNj7oEL18OVmc=;
        b=E+Gx7TdIoUKhfrqeMvEAn9rkTT9zSALp7fip8WWwSlDmYc4zlz23pzL5Q6zemVT0bU
         adpbn8Lv+2n3tP3WS5Tyn2AxoeYbWGkPk2endbVW8tTLfsk90ltzgJjV+60KGCTz+ySV
         BvwO1uZcyyDK652kdk/7Ew5FmeuIMemMXOklIwp5ITkcMwLNhDEfocmpdsaTbMd4/ktY
         Vi6d6FkKUrrXhrW1Qd5Y3E5fJ7lobp/ZHJapKi00OBjDVfXIClRfdN8ShZTNxWzJE+0b
         bQnp4xOnpP7V1POr5PHxdeMKYWCTMMW9mxbYWqE0wdzFJr3EIKOPSkKalOJl7U6gcn/m
         n4MA==
X-Gm-Message-State: AFqh2kru1nc4s72iGPke2TMj7JNSE4nVW16XDB0P0Rq12CGcvM1m/8S8
	VX9idb7Sbiyya68H4YO6YfMnZBjXi14BB4CzVxunNw==
X-Google-Smtp-Source: AMrXdXu0SPE09PX79YJPOiZzyF40E/NRTrYM3mQEXId4MTVPUHDeIvG66xX/A8ZFkefsBYcMYb0vO3fCepWpRm7CMVI=
X-Received: by 2002:a05:6808:48d:b0:35c:3327:ecf0 with SMTP id
 z13-20020a056808048d00b0035c3327ecf0mr2266171oid.220.1672759217823; Tue, 03
 Jan 2023 07:20:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info> <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de> <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de> <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
In-Reply-To: <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 02:19:41 +1100
Message-ID: <CAC2975LNYcsW1zAohijLtziXLbUyBjxHY3grD5=HjHcWBH_LPA@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, alsa-devel@alsa-project.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jan 2023 at 02:14, Michael Ralston <michael@ralston.id.au> wrote:
>
> On Wed, 4 Jan 2023 at 02:13, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > That's weird.  Is snd_usb_audio driver bound with the device at all?
> > That is, does it appear in /proc/asound/cards?
> >
>
> Yes, it's there.
>
> 0 [V49            ]: USB-Audio - V49
>                      Alesis V49 at usb-0000:08:00.1-3, full speed
> 1 [NVidia         ]: HDA-Intel - HDA NVidia
>                      HDA NVidia at 0xfc080000 irq 154
> 2 [U192k          ]: USB-Audio - UMC404HD 192k
>                      BEHRINGER UMC404HD 192k at usb-0000:08:00.1-4, high speed
> 3 [Generic        ]: HDA-Intel - HD-Audio Generic
>                      HD-Audio Generic at 0xfca00000 irq 156

Also lsusb shows this...

    |__ Port 4: Dev 5, If 0, Class=Audio, Driver=snd-usb-audio, 480M
       ID 1397:0509 BEHRINGER International GmbH
       /sys/bus/usb/devices/1-4  /dev/bus/usb/001/005
   |__ Port 4: Dev 5, If 1, Class=Audio, Driver=snd-usb-audio, 480M
       ID 1397:0509 BEHRINGER International GmbH
       /sys/bus/usb/devices/1-4  /dev/bus/usb/001/005
   |__ Port 4: Dev 5, If 2, Class=Audio, Driver=snd-usb-audio, 480M
       ID 1397:0509 BEHRINGER International GmbH
       /sys/bus/usb/devices/1-4  /dev/bus/usb/001/005
   |__ Port 4: Dev 5, If 3, Class=Audio, Driver=snd-usb-audio, 480M
       ID 1397:0509 BEHRINGER International GmbH
       /sys/bus/usb/devices/1-4  /dev/bus/usb/001/005
   |__ Port 4: Dev 5, If 4, Class=Audio, Driver=snd-usb-audio, 480M
       ID 1397:0509 BEHRINGER International GmbH
       /sys/bus/usb/devices/1-4  /dev/bus/usb/001/005
   |__ Port 4: Dev 5, If 5, Class=Vendor Specific Class, Driver=, 480M
       ID 1397:0509 BEHRINGER International GmbH
       /sys/bus/usb/devices/1-4  /dev/bus/usb/001/005

--
Michael
