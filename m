Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33531A45
	for <regressions@lists.linux.dev>; Wed,  3 May 2023 05:43:07 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4300ba45037so1758462137.2
        for <regressions@lists.linux.dev>; Tue, 02 May 2023 22:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683092586; x=1685684586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsAmWnHYdqf8PxIDTx7JVpNph88uEqYsba4Oi5M9pys=;
        b=ERzOwCN8Snpnb6R6BMPDcCWmrygLOdCFBKCPjPfmNrRa9r/Bde491tD+EBUO98Pr0p
         PcYay5OeQR1WNpFBwkdiaJIM3+7iqCOlKWMHHMJye7Atdu9Zb1AXDB2Npq44wRmcUwya
         fT9UCI9jNpd5nzKnTAiA4RiZ5eQKjVAkYXREU/mWQP0b6z00COHDWedWjnAIFXF1mG2g
         jVQTFpY3OSTck2RfgXgOJYWJFuIRizX2uecYY6kr6Rg/WxtYCl4mc669GUNBZa33AZM1
         BV8zqOBEt5IvAUNRKH1DuV38cIW5jEK3tCOuqPoQYxu82LJovSQ7MCSld2eA2GwZEAMP
         P8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683092586; x=1685684586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsAmWnHYdqf8PxIDTx7JVpNph88uEqYsba4Oi5M9pys=;
        b=RSWN3Fw1+PFQyo5akiUabkXmMk3kpag+sP6ONxebkQZfaKEuWi3O6dMVaWl/JxXpgh
         pG2vm1QPw38bZhiLPFJqbWT3kXdfM1t4WC7tfss/KoXFkT1lF9XpSny8q4psdxLZRepK
         8k0LVBbHOGoRQx1iYBbDvxjlPldqosqK79fsGL2nmopN+iSSXyeKf4yqhaL+RGvNAeIg
         Vz4bBW+eCJuGc3IUdIQQCBDbT/xT6AgPYH4F2UVzdzm7L4ODs6Y+xWnl4qd729dSC26b
         7XTTH0jUYgSzN24v+jBt3U4l11iiH/WXQPCvYUf4qP5sKl/8GJEXXbF8OjuAGRsBRST+
         OceA==
X-Gm-Message-State: AC+VfDw5MTWzUs46mE0Ad9fi6RN3DB1g0ZxtmTd89vsSSQ0nSTMLfYgu
	ss1lO3oupP9qcnblHklAg80XI/+PN1IA9N+kfyc=
X-Google-Smtp-Source: ACHHUZ7ykK9Pomy4WV89OB6bwk9/UoxMqZtNJrFwUkc6HainGydy65lfIkZPMMydRIzSTL7GURxd1oHI9zPRV9FHxyI=
X-Received: by 2002:a67:fb11:0:b0:42e:38c1:8a54 with SMTP id
 d17-20020a67fb11000000b0042e38c18a54mr942121vsr.0.1683092585868; Tue, 02 May
 2023 22:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>
 <ZE9B4avbDtIXOu4O@debian.me> <87r0s0pnim.wl-tiwai@suse.de>
 <CAAJw_ZsDdiB=b2PZydQWF2fjSULit3NWE-Bf1icBEryN-GuqUw@mail.gmail.com>
 <87fs8gp0i7.wl-tiwai@suse.de> <CAAJw_ZveoPfnBsSkHZqmLiVWATcOosR--6Ds4cdekdi=t1yV7A@mail.gmail.com>
 <b449cbf6-8286-e22d-ca87-b1bc3dce29d7@gmail.com>
In-Reply-To: <b449cbf6-8286-e22d-ca87-b1bc3dce29d7@gmail.com>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Wed, 3 May 2023 13:42:55 +0800
Message-ID: <CAAJw_Zur2fz7FnO-qyzd_mSoCcroCREcvHKo8sOMrrMDGxXv2g@mail.gmail.com>
Subject: Re: linux-6.4 alsa sound broken
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, lkml <linux-kernel@vger.kernel.org>, 
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>, Jaroslav Kysela <perex@perex.cz>, 
	Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>, 
	Linux Regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 3, 2023 at 12:40=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On 5/1/23 22:03, Jeff Chua wrote:
> >> There was no description about which sound backend is used.  Is it
> >> PulseAudio, pipewire or dmix/dsnoop?
> >
> > Just pure alsautils.
> >
> > arecord -D hw:1,0,0 -f S16_LE -r 48000 recorded.wav
> > aplay -D hw:1,1,0 /local/share/sounds/alsa/Side_Right.wav
> >
> > [recorded.wav] attached.
> > [Side_Right.wav] attached.
> > aplay: version 1.2.8 by Jaroslav Kysela <perex@perex.cz>
> > arecord: version 1.2.8 by Jaroslav Kysela <perex@perex.cz>
> >
> > alsautils, alsaplugins alsalibs all using latest git pull.
>
> Are you sure you build alsa tools straight from the git repo?
> Can you also reproduce with latest stable version of these?
> Otherwise it's anyone's guess due to moving parts...


All cloned from ...
https://github.com/alsa-project/alsa-lib.git
https://github.com/alsa-project/alsa-utils.git
https://github.com/alsa-project/alsa-plugins.git

arecord is symbolic link to aplay.

I just recompiled all the alsa-lib, utils and plugins, and retest and
it's the same issue.

GNU C Library (GNU libc) development release version 2.37.9000.
gcc version 11.3.1 20230315 (GCC)
binutils-2.40

Linux kernel is ...
commit 348551ddaf311c76b01cdcbaf61b6fef06a49144 (HEAD -> master,
origin/master, origin/HEAD)
Merge: 7df047b3f0aa b7badd752de0
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue May 2 15:40:41 2023 -0700


Thanks,
Jeff
