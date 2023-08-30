Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508F03FFB
	for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 14:26:19 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-58d41109351so12511687b3.1
        for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 07:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693405578; x=1694010378; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLlVaxy3KfuD5SwetE5WNifV4FNYkcQjKz5YIqSHwgQ=;
        b=Aor//Huikr3DRSkzpz9Y6S1RngHiuKQIDypJfxKoGpswvo+sIjplLy9ysV45Ikc/Pe
         /GhIm68e6R2cmHM5xPgZNahqpnSf4TC5j7HMt/veDIzBWilPwiw+a6WYt3HXXR6+Cw1F
         0gSbMnW5FyJmKUoU3tRGG8sSSQKXVZ7v5G9uCkuUnnqLy8ej0rN0cKZhBFBpXq3uJB3C
         AXoBCubrzaii8MuIFNC98vog9SIG2S1IVeoE9P9o6mFmC1FPDteEMG0BHp9Hm1nei0sI
         IsLPNxilMsyEgq/PgJSlTh6WUOtt3xpTasxyDW5feOwffir6Io5KP90fONMOZCFTjo+r
         lsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693405578; x=1694010378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLlVaxy3KfuD5SwetE5WNifV4FNYkcQjKz5YIqSHwgQ=;
        b=Nod/0gUCHH1jixiYcKLiWEn5Jcab/1/zahaOKf6jcOKwgFrh/UQvUHujeMSQ19zjZn
         mT3EmXiUbFPPz0lOkyAkQcEEkRcCVkbwaWe6zBMqBcbCDeeU2DZuCGIDBAsfQbOXwCsz
         Iq6DUNaHmuQd06uyf6cykRAdFfKxVjNCSaa+58Ryyg7MZYiM29NbiXMmn2eiIVcJILun
         L97RXhOTDKQ3GHeEosMayql+TH0l53cnPsQwC8oUlrElNWazJ1g/TalhTmjnsAjx4z4T
         b4sc1uUxujkw+QjhmApUYRfK2y2XXBUQR1NU4+Sc/GIGGfONuCbNRAJXpMhfjpNkGIbL
         IS6g==
X-Gm-Message-State: AOJu0Yw6tYm95Fdn2vCcz552bNjgDs+laPWqQgBi4j11T44ZLCBuXBv8
	Rg9gmHt7W/O8Q8/CRvhC9WK2srzClABUV/xsgrPesn2YrMFk5lLT23c=
X-Google-Smtp-Source: AGHT+IGUf8QqADTpwZEdTaNjF8Lvb9rGB6XHTii/qiedK9o1jIuHzIXNKKQXjy5HSeGhfXoKYHBjPNSb7+VJXRQCMto=
X-Received: by 2002:a81:b40a:0:b0:589:a400:a046 with SMTP id
 h10-20020a81b40a000000b00589a400a046mr2247058ywi.14.1693405576575; Wed, 30
 Aug 2023 07:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANWZPgK2+9SCavsbSZv1DfJyhy0XUpJZ6+ebatM9ZGJPpAN1yA@mail.gmail.com>
 <ZNGdYCXOHRqWnoeT@debian.me> <CANWZPgKAtbNRUy0pyL7Zf-S-zLeMkJZ7fSWpFO8__YG0_e2Zgw@mail.gmail.com>
 <CAHQZ30AhngEgVR-Hcjcze2HyZOG=4fbfp_S2=Or7JUJUUxm4mQ@mail.gmail.com>
 <CANWZPgLcHa2x-Rdy6Hma39p-6E6_5UGUamjPZkKYqz_q0yKJ2g@mail.gmail.com>
 <CANWZPg+C4=U1khLJbvUb0nuDQq+ETULZdQyWDBhFhYN_3Wa=3g@mail.gmail.com>
 <CANWZPgKe6GRUBVyi9Ua0Ns=eQDHT2riSsUZ7gr2nGfXT+jM00w@mail.gmail.com> <a0b8cbf4-a3db-5b05-14ba-297fe24efd52@leemhuis.info>
In-Reply-To: <a0b8cbf4-a3db-5b05-14ba-297fe24efd52@leemhuis.info>
From: =?UTF-8?B?Sm9zw6kgUmFtw7NuIE11w7FveiBQZWtrYXJpbmVu?= <koalinux@gmail.com>
Date: Wed, 30 Aug 2023 17:25:40 +0300
Message-ID: <CANWZPgLpgPCFrnQwwzKf-u+Nf21F3bwDxi5pEn+whVu0diO=vg@mail.gmail.com>
Subject: Re: atkbd input regression
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Aug 2023 at 14:06, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
> So strictly speaking all this sounds a lot like this is caused by kernel
> regression that thus should be fixed in the kernel once this was
> bisected (which iirc hasn't happened yet).

    I'm afraid it may be a distro specific problem, if I'm not so mistaken
from the time Gentoo switched its default udev from eudev to systemd
udev, which also explain why I can't rebuild the good kernel nowadays,
test, and have the expected good results, because the new initramfs
will receive a copy of the new systemd udev, and not the former eudev,
and it acts as all my broken kernels in time.

    There is still room to be a kernel issue, since rethinking the issue, t=
he
kernel on early boot does what is expected, it configures the device and
with udev makes it work for the ttys, the problem comes when the wayland
seat comes available, where plasma or wayland needs to advertise the
kernel of the new seat, and the kernel then needs to generate the correct
event to makes udev populate the new information and tags that are
missing when the device doesn't work. This can be either a missing
implementation on Gentoo side because of using systemd udev without
the rest of systemd, or a kernel issue if the kernel is receiving the
information of the new seat and not generating an uevent to udev
to populate the new info. So in short, I may need to revisit this in the
following days.

> OTOH this afaics (please correct me if I'm wrong!) is the first such
> report, so the problem is likely pretty specific or might only occur on
> your system. In that case just looking for some solution for your system
> might be fine.

    There is similar cases in the Gentoo forum that eventually gave up
on Gentoo[1] and made a switch to Fedora to be done with this. I just prefe=
r
to look for a solution to the problem and fix it for everybody. So bear
with it while I dig into the code path that is propagating the seat info to
the kernel and udev.

[1] https://forums.gentoo.org/viewtopic-t-1161962-highlight-serial+keyboard=
.html

    Thanks!

    Jos=C3=A9.
