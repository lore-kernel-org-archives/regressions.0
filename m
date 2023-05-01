Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5442020F8
	for <regressions@lists.linux.dev>; Mon,  1 May 2023 13:08:53 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-441134c09cdso1829242e0c.0
        for <regressions@lists.linux.dev>; Mon, 01 May 2023 06:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682946532; x=1685538532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NYwDNlVM38PNhi3rHJukoiDrX1975QXxtjMJh6hnqI=;
        b=igYd+zxsDMC2pbUwaH1pDL/17El8SJgJz5Y1isRIhjL3J6yPK3BaflkxoUT2MMmsFI
         1WPUiOtaHwxL7u7o8Bt7vwZZjObRZGZL3XZP0//Kd0pjQae6lRhxhTdxac3lAFfHCQRL
         Xm124kW3xTawS+cnKPq2KR5HTXDdrOa+brw4K1EOgSwzuBAdDPu8aZX6sXfM73cpYQXe
         WFk5feuWxnRymiC9ZEBfkH/YuUk6cQyivJghvTWOnabuK477T778iUamf1oV97En/UU+
         1GHcoUyhpwzcIjAyBGXFcNXFuG+4BjeckMao1sbPQix2+4T1VCFY3CTrscH0oyEu89MW
         ifCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682946532; x=1685538532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NYwDNlVM38PNhi3rHJukoiDrX1975QXxtjMJh6hnqI=;
        b=W9yLXsP8fep6icRiSZIMwwXXyrmaThDmXLLkO6HPd3aRpmm+1SpZt7XgtZJ34mI24L
         TmKLJRKZmXjeDoGSSAPJUp0KOFYsKVB5A54hYovbRFKARF4FxIqxNEvA4WGvYLfMoKhp
         zxrvE5VGRUegxt02gNf5OGsofP/phg624kHfdqPwZSo2vh8jeohONEIG3ZiC0jJkaAtK
         t+GSGDOl3LpUXZAVjknF6F5y5xYDdMmXkvr2pjOS95dMq9i8wcYj+2NahXfS4KAULMSJ
         mQ7wsXFKJ/LSaMJRTb7UDezjhP55/anOevJ4DnKbN1rOD2XpMNYPA9gNbecD6YVSYYP3
         +sow==
X-Gm-Message-State: AC+VfDxtyUEa51/j4udWXxUejDA9p/tBmRoTpGP1xcFVn+PICV7p7yc8
	wxB6QN9pF0qwrUGvg3MnJlXw606DgDnacGlyFZs=
X-Google-Smtp-Source: ACHHUZ7RW1jtGkDqZVkU9kZMJFBhSI9gSf13aBqrcgKZJhCwwsRQKbtUClZoXLWHjHFT3DZFKPe8IFWhIFEEMDveLgk=
X-Received: by 2002:a1f:3d43:0:b0:440:39a5:6c6b with SMTP id
 k64-20020a1f3d43000000b0044039a56c6bmr5041041vka.8.1682946532092; Mon, 01 May
 2023 06:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>
 <ZE9B4avbDtIXOu4O@debian.me>
In-Reply-To: <ZE9B4avbDtIXOu4O@debian.me>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Mon, 1 May 2023 21:08:41 +0800
Message-ID: <CAAJw_Zt2G8RLG_+ak3c34v-PCsc2A235qQxa74EUa5ObzRmCsg@mail.gmail.com>
Subject: Re: linux-6.4 alsa sound broken
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>, Takashi Iwai <tiwai@suse.de>, 
	Jaroslav Kysela <perex@perex.cz>, 
	Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>, 
	Linux Regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 1, 2023 at 12:36=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Mon, May 01, 2023 at 11:59:12AM +0800, Jeff Chua wrote:
> > Latest git pull from Linus's tree ... playing a simple sound file will
> > resulted in a lot of echo.
> >
> > Running on Lenovo X1 with ..
> > 00:1f.3 Audio device: Intel Corporation Alder Lake PCH-P High
> > Definition Audio Controller (rev 01)
> >
> > I've bisected and reverted the following patch fixed the problem.
> >
> > commit 9f656705c5faa18afb26d922cfc64f9fd103c38d
>
> Thanks for the regression report. However, where is your dmesg and/or ALS=
A log
> when the regression occurs? What is the playback test file?

There's no error in dmesg.

Test file is /usr/share/sounds/alsa/Side_Right.wav

>
> FYI, 9f656705c5faa1 ("ALSA: pcm: rewrite snd_pcm_playback_silence()") is
> originated as [1/2] of patch series that pokes around the auto-silencer. =
The
> other patch ([2/2]) got NAKed since autofilling buffer should have been d=
one in
> alsa-lib (still to be discussed) [1].
>
> Anyway, I'm adding this to regzbot:
>
> #regzbot ^introduced 9f656705c5faa1
> #regzbot title Much echoing when playing sound files on Intel Alder Lake =
PCH-P Audio Controller
>
> Thanks.
>
> [1]: https://lore.kernel.org/all/bb342e84-b468-8adc-6688-88da2c857da1@per=
ex.cz/
>
> --
> An old man doll... just what I always wanted! - Clara
