Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8E72F44
	for <regressions@lists.linux.dev>; Sat, 31 Dec 2022 15:58:31 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id s22so24972089ljp.5
        for <regressions@lists.linux.dev>; Sat, 31 Dec 2022 07:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WUy8MlumuFBuUds4X4Alc2yUEpAudih0uPqgxXZ31yY=;
        b=VmCLsdHp5FVGa4aMOpf+2xOpkH03HW5kZZX7Aldr2S/CIMz37t70E8yxgY8JQQMVKe
         QcC1/N63Epb4uy3mm75BdEeIWBMJkr8l2hlzPeOd9L3bNtuzCUUNLhvOlunqLCi1Hyq+
         xA5L22TmOSYhSMho4tS+cKjX0JUQTFoU5mXKKRQFnqcrQn2C0VDuc5dpXxRR03LDBd5T
         MrB2kS2I/SlOOUbL1CncblEcynHXLAwapi6Cr7yIE/KXM74EP4nUR0sL2j9bXDbzz9Fw
         RQemzIrce+c68JzGQGf1JeGQQ3buYy6VwXghCvLe/m43wLBAPxha4SEis+YrL1cSdcAf
         gZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUy8MlumuFBuUds4X4Alc2yUEpAudih0uPqgxXZ31yY=;
        b=EMySOgfP3RA5G/xNNxESR0B0D1G1XNhuhAb65QG+mHeccbQ15a8OTFcmVMNT2Wef6A
         o0I2m8HZGmKH9d4oUs+8ejllbMre4EQS59/EnQbZZgheavLxfsAjdUHY6IyLml5Kh1js
         DpxDnCC1ovC/Wb28uYTshSE0RC0yxR4C5aaI6HYZOo0JCu2IjHaLybwxPj+I+9lo7+43
         FB/CfjuxvxyvRyWoUcu+Lkg8ouWnSZVoNye6h4J7nJQ6uCebF4trHARZepIkHBlKspM+
         MkqyaruBncjGcF2/TZEaEY8TPhLU4HzL9jjBGTIpBnCBTjEDFuXKm5Ztn7uB9beNPB9a
         6RmQ==
X-Gm-Message-State: AFqh2krrBiK1wNFtxP20jQwoacw+XCqPM9gJdjEfQWVx+v7FzuqeT0hx
	auhyM87VHYvTvAecFjTvVgCS2Mjs1miEjgm7OdQ=
X-Google-Smtp-Source: AMrXdXvLq28zMEy6QOelvnWOvV7pfsSm6FYI7meVVzRh3fwbKe7bx0MoNjzfBNr9vQDH0qEllDLWAE77h7N3nkPbYG0=
X-Received: by 2002:a05:651c:49c:b0:27f:e6b3:7775 with SMTP id
 s28-20020a05651c049c00b0027fe6b37775mr130651ljc.512.1672502310180; Sat, 31
 Dec 2022 07:58:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALeDE9O1+qgn_9z=zTVKbWx3FphEa4y8Dn9f5ORoQgW_gL1dqg@mail.gmail.com>
 <d88f4aff-45ad-db10-ada3-f7f5b34a6620@i2se.com> <CALeDE9O_qX_Gu1vwCLW_PbMdgnSoHTA5LhxYQrsUqwGHRwv-Eg@mail.gmail.com>
 <9229905f-e7a5-aa86-c3f6-887046b8e663@i2se.com>
In-Reply-To: <9229905f-e7a5-aa86-c3f6-887046b8e663@i2se.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sat, 31 Dec 2022 15:58:18 +0000
Message-ID: <CALeDE9OFbrf5x-3CRecXkYxb-2Z1YgH7d4Yk4RPv4Wn+zinhbw@mail.gmail.com>
Subject: Re: Regression in brcmfmac for 6.1/6.2-rc1 for SDIO devices
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Justin Forbes <jforbes@fedoraproject.org>, regressions@lists.linux.dev, 
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, 
	Hante Meuleman <hante.meuleman@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, 
	Arend van Spriel <aspriel@gmail.com>, "Ivan T. Ivanov" <iivanov@suse.de>
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,

> >> could you please provide a "bad case" file list of all firmware files
> >> for the Raspberry Pi 3 B+ which worked before Linux 6.1, so i can
> >> reproduce it?
> > What do you mean by the file list?
>
> if you look into the firmware directory which files for
> brcmfmac43455-sdio do you have? Just the bin file?
>
> I'm using the rootfs of Raspberry Pi OS which contains:
>
> $ ls brcmfmac43455-sdio*
> brcmfmac43455-sdio.bin  brcmfmac43455-sdio.clm_blob brcmfmac43455-sdio.txt

As shipped in https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/
either the Nov or Dec releases

The kernel supports compressing firmware with: xz -C crc32 "$f"

Regards,
Peter

> I didn't say please add some files, i only need a test scenario :-)
>
> >   We're running the latest upstream
> > firmware, we do used compressed firmware but that hasn't regressed
> > with any of the other firmware, this is very much brcmfmac. With the
> > same firmware it was working on 6.0.x and reboot into a 6.1+ kernel
> > and it stops with nothing else changed.
>
> Yes, i agree this is a regression and yes it's definitely brcmfmac, but
> based on your bug report i wasn't able to reproduce.
>
> Regards
>
> >
> >> Also OpenSuSE seems to be affected [1].
> >>
> >> [1] - https://bugzilla.suse.com/show_bug.cgi?id=1206697
> >>
> >> Regards
> >> Stefan
> >>
