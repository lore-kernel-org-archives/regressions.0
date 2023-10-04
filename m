Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B431C3C
	for <regressions@lists.linux.dev>; Wed,  4 Oct 2023 06:35:32 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d8afe543712so1842684276.0
        for <regressions@lists.linux.dev>; Tue, 03 Oct 2023 23:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696401331; x=1697006131; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rV98O++0wueY4Se3RDk4FS6DnLpx+AEq9azMKtwZP3M=;
        b=MSzi8xJjY8I27/3CuOWnl/JsVDwG8RwmifDKfSCCjq2nyvulY+8KPY3Zv2RkWH+oau
         4Y/h65WShT7/qjNNXtx080paOX7HdAkFgbeTr7Ag6wSv3fL05xrxZF67dzS3MlXpryUw
         oyHbj6PTtA49a+aAew+IxKjzLkekfl/tqodOrmVbFABLh96o+yh7dsO1wf2fzUXbcmQi
         uFFcSpcK0dMVZNYXRrNxXwbYGMWsYtxe9mKjwEy4EBqx3Op0zeffDM49Q6N050YCgI+p
         HT6T3N5PRkHIfcqaa22FRFe2rfziAb0kHC9kJseiFsdC/bfA6OXvH76fZLFQwzHMbZeS
         YRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696401331; x=1697006131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV98O++0wueY4Se3RDk4FS6DnLpx+AEq9azMKtwZP3M=;
        b=SRmbLMI/nKQ9s8hFmGRONJvPft7+sFqUqzj5cQ3qF2JLcWKdRKhIIt56V00njg3FrJ
         wlIlOSG6LST/0Gu9ZC3EbntsW50DZ3ddbQXPXZWh9gnozVsoA9BbB/1vBWGL3w0hSIt8
         paASJYPswQU40shMcqJ0RXeNexkcFM080s8WcNc1Dra2rmDIiNZvyAuLyZ2H4WEZjLb+
         NNLpiv29Els2ktBBeJ6Lq9D74EDJvt5Ab2Vg8U5Shsy+mRk5j7EI026lIiMEa9wPjb2H
         urGC8G/Z50OvDb2jgaAV4wuie4mDJkIs74M0E39w7NcQvqZhMY12ry3WbpPzvFLRdajm
         X0rg==
X-Gm-Message-State: AOJu0YxwH4Yp14ohPmrhgW9gRUD35Lb8Z5vsm/SwV4FoWNf4QxagKpjc
	yWzn/8OqG0JQGHX70gwJ5s6CRTFHZ7K+bQPj7Cvax46oM3a9gQ==
X-Google-Smtp-Source: AGHT+IG7t8/D8MEUEDHRVj12H+fsSO3OXBRZh3THZje73nXUbViNRQLJzuIsSOZ8BZVwVH1m0A8ACfq2fRgIxM82ZRU=
X-Received: by 2002:a25:d18a:0:b0:d84:b0f8:90e with SMTP id
 i132-20020a25d18a000000b00d84b0f8090emr1303793ybg.5.1696401331543; Tue, 03
 Oct 2023 23:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
 <ZRtWcgiH5JhD5NU2@debian.me> <CAH7-e5uspavg_VBJxKLOKJfU3nAq-OrPqzihF2opffY-ReiC-w@mail.gmail.com>
 <834062302e6a98e773dc4b03d7ed568a0f1c44fc.camel@nordicsemi.no>
 <CAH7-e5uZzmnFJAJrG664G6_JbK--DfbKC50aeVN5gMMxDJ51UA@mail.gmail.com>
 <ba7aaaed859ea2c4f5aac597deb382cceab33d65.camel@nordicsemi.no>
 <CAH7-e5unq6ggNjVkSsriUAmpvk4s7-NCYJrZnLK_3BjFO_Dceg@mail.gmail.com> <3e86e69c-64bc-4776-9ee8-75b98be1bf3e@leemhuis.info>
In-Reply-To: <3e86e69c-64bc-4776-9ee8-75b98be1bf3e@leemhuis.info>
From: =?UTF-8?Q?Erik_Dob=C3=A1k?= <erik.dobak@gmail.com>
Date: Wed, 4 Oct 2023 08:35:20 +0200
Message-ID: <CAH7-e5vfhcsPiM4qqFdTxv4C=1An=y0uk1o44ryPc+FZ5wa=cw@mail.gmail.com>
Subject: Re: bluetooth issues since kernel 6.4 - not discovering other bt
 devices - /linux/drivers/bluetooth/btusb.c
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: =?UTF-8?Q?Tomasz_Mo=C5=84?= <tomasz.mon@nordicsemi.no>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Linux Stable <stable@vger.kernel.org>, 
	Linux Bluetooth <linux-bluetooth@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Mediatek <linux-mediatek@lists.infradead.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Oct 2023 at 07:20, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 03.10.23 18:10, Erik Dob=C3=A1k wrote:
> > Sorry Tomasz,
> >
> > that must have been a reality glitch with your commit (cant find the
> > page refering to your commit now). But yes it is probably a kernel bug
> > as it manifests kernels 6.4 and not in the 6.1 LTS version.
>
> Could you then please try a bisection to get us closer to the problem?
> You might want to try mainline (e.g. 6.6-rc4) first, with a bit of luck
> the problem is fixed there already; FWIW, a few BT fixes that might or
> might not be relevant for your case are heading that way and will most
> likely be in 6.6-rc5.
>
> Ciao, Thorsten
Hi Thorsten,

i was able to compile vanila kernel 6.6-rc4 yesterday and the issue
was still there. as it takes ages to compile i will try the
precompiled artix kernel 6.3.4 next to see if the issue disapears.

Regards

E
