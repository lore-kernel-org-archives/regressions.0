Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BAC344DBB
	for <regressions@lists.linux.dev>; Thu, 12 Mar 2026 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322577; cv=pass; b=YRgGTP34kwVyVJzVvp35xEA/3dwo7NhEQj08jdgarh+bwZavfnzxx/dIzYCQKJ20XcDisKrkbvWhwYHDmK0h2Vdh+CgjC84bRMtT/ggiYuGgopUz0UhSIM0NmKX9LLv1TxB81Re/T1HuQcAuLoqhKqWj3SOSMVkCXW7sy3GBvMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322577; c=relaxed/simple;
	bh=ZC1Agrejx07YScpBBr5bIbAkgOw32aKKzS+oIWVkVjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZocTb2HFx0iqaVskx7FrSCiX0JbWTwR+W21zR+Nd/to+pfjcsYBXiHR4wQcmt828xKcFjZz0BFZplItZOvzE8o06SMVpuGRwprYDVPCTybB89vqtTyw0QvgaZ+jTF+AFBO9jPEYmzpsDk8aZO5GglipcO6L5fIsDz9HIfdurDm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dtq6Wpe3; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dtq6Wpe3"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso1098442f8f.3
        for <regressions@lists.linux.dev>; Thu, 12 Mar 2026 06:36:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773322574; cv=none;
        d=google.com; s=arc-20240605;
        b=NTEpJBhuWpxirN5ptXQOLcuOnEUptiaUQQTzXWXHy58Lqehg6kZHyiRlcZSiPsDoxC
         qswVhHy4JeIBbqWd3XghmXHtcK1sqsP2YGgIgCsDkHYBf3SqeNfI5QPP44KkLN66iUsZ
         PcCYIbRSJI2awZh/3dlvJojw6e6qbYGJfDiS7b+j3TG1fLzylsdlW3ChKFW5ZZFYYpJe
         L0TWtPVwfqPMc8DwvCEa1I5XqW3zARFphmeUH55lY8SeBWPfOiLusN/qDEZKStjmg3a8
         5CWk7IviDIfQqSlkT1CSMolRBSLZZdSg7wkM9wQCaL1PmjJIgKxBdOX5wSQbo2XpR8fN
         piQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5LiNYEcPmVnhkTpDFLg9wRo5LV1cuPc+EdJpz7uAFmI=;
        fh=K2K+H9IwGzMlU32aJxju8+UcshlVooDt9tJVleJT/W0=;
        b=Bek0MvyJvMw2tZwCv0l2sQQiiC4wNjhkChFEJsh5gT3iSZFCkcvGtt5BHr7vwETvEW
         j0IOkBpaT9xiiQWm8uWo5aJQqHsjQkgpPkpJ8VrNpnFNR3Dv/pl/AGzdH2zrElUHuof8
         jvpdImvz5oOhMy53E9zZ1Ru9YDDI8qxFbK3In5SAOlDiPaNTrwTgdaAdFke9LtQldH/x
         w0Yz/niKp55L+DxVz/XMt4mHRbPo0/yKgZDn2Fm9613ttBp5FHb4O+1axI3u0SIbd7VX
         6oIIUjFv6XnzEjhVz/1wiIGAEAWcJdUDiRZl+2pAaWEO2JDxdEGC9jgADVGUqabw50cl
         9kqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773322574; x=1773927374; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LiNYEcPmVnhkTpDFLg9wRo5LV1cuPc+EdJpz7uAFmI=;
        b=Dtq6Wpe3GKPNtiz8jksnJyrfOyjR8ITHjyzc/PU2ZePh/jvMVYLwQxKamtmkzapLKd
         3hjjvvrK3bMcAHqu2Zkqn3TCiijSREMgIg30mmHdQ/uV3BFSH0Di/saGyb/CmJtmGMg6
         UITc9Molyj3p/GZIT90uPkWXc29yASP1RQAGA+/jS25CWQReWc15r33Tu8vzIaIMdAiV
         FYjfgQLEr2mx341tYXTEjFUxTEFYO3runs6BH9hUbsm21XMihplKZGktDPXaXZ7GinbH
         qngw+sm0S2VfpcD43GgS603eVyGcQSeCyi9bajIuOkWGetDjdKiFnuFdl9MlyPzHKJpq
         gAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322574; x=1773927374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5LiNYEcPmVnhkTpDFLg9wRo5LV1cuPc+EdJpz7uAFmI=;
        b=esOdaBX/F4eC0/R5UOPq1B9tNLQ4gUCbpcljnh2TDWEGaC2bXlv2Lig0GPQMq/ck/t
         Vy+Wl3nR573dnrUhcziBi1whnrBthLGG4f5NyuSIH23AGSrmfVUluJtiUkcU2nxfSeGG
         LQqNoFxPt8hGw0v3W2089KjkrW/1u7+nGcTA6nU3fqnvGT+qI9DkhgVwoeTOZQAWssB2
         V4zGdmdQPauJ87/9i2UazICrEXWeeqNAuNbdUHgbqMO+apo7yV0Y0hcEQkEehVSNMLIL
         zgCHBU3+0oAJ0Uycf0RCGqhoU4fVsQh8EIrPco3AaPwfuyXL/j/VmyzqG0fm/6tTqLX7
         WXMA==
X-Forwarded-Encrypted: i=1; AJvYcCV5KzqZks6sB7cijyL6H41QW4saEr96BpJ8IhZ+XFhuix4ysnTIZOmZk5Bnd2rNLgvGuzfbjNbPOirHSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzA8cbqQof+j84PfqqytS4vTZwyfMTXxIicbsBDQqehp34ODv7O
	s9QSXbX9KO00+Z8QRMN5gl8e2y1ZXkQeAJlECd9VhFHtMosaQ8RLjYapHEfolBj0daP5dK+CTbM
	h+DjANmBM6UiGWcUFYosCiNSG4wx3sUc=
X-Gm-Gg: ATEYQzwcKHEQPPlYqUJeKFpV5qOKv2YvKpOiCN65VCzV9Pe7s+IE7gk2i5b8/+WQWQO
	5Ksk/hYeaEkwtrHhaStgOJQEatdAmf2iIeVze98GWtPYiBtD81Vd2u76t7kHC3Ir6hfKzz4zF9R
	CZmatSCwNPwI7p+irqInkFPMdbTGbBt2cmmZ9zJuEyQjibSxq9ZFOm3yI79ZSOW1cmt7PXZgjgp
	y0c7E0JlEu0B1TDADX2ZrXH9fnr+8x4N3BeqUWn4+DKDzw2FpEEi0huueqDZypci0tO0nfav/v0
	M8KiqHLS1uTxncGOEu5URXf0sBKBiarJ44Lir+eU
X-Received: by 2002:a05:6000:1acc:b0:439:ba4d:bf40 with SMTP id
 ffacd0b85a97d-439f821fb27mr12938287f8f.43.1773322573935; Thu, 12 Mar 2026
 06:36:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com>
 <87ldgakvsc.wl-tiwai@suse.de> <CAOKSTBvbopXOuOfstmasijZgUnT9_qW_dsaeMcHUXhyjj3iRmw@mail.gmail.com>
 <CAOKSTBsWiwwwrmBt3dshrYYo3fQN9eF-gi2Z7BoX6c-Nb3ZoHg@mail.gmail.com>
 <CAOKSTBvND=d4Fq7mt=36p2Y+hKr6aDUbJ6zA4wDOWASwcWjmNQ@mail.gmail.com>
 <87h5qxl8tj.wl-tiwai@suse.de> <CAOKSTBtQi6ZmLmy6u5mP9_gLKZTZHmbb9S36hO99xSsk_EEbcA@mail.gmail.com>
 <87ecm1jii6.wl-tiwai@suse.de> <CAOKSTBtdt=enKSv4ZF7VxDD4QF8+ntyFM5CPJ1Y1QQ7M6TsiKg@mail.gmail.com>
 <CAOKSTBuOV0=1Y62sqf3QALgR+_He=tKLPQ7LZN+xFC6oGWEKVw@mail.gmail.com>
 <87y0k6whm8.wl-tiwai@suse.de> <CAOKSTBuUnS=stepHySGVYH4GbQytEQL45cLj4eV8u0KAsquF5w@mail.gmail.com>
 <87jyvlm6w0.wl-tiwai@suse.de> <CAOKSTBv102MCFnnm9JPp9Zaz_MQNBxu5OnWOCGw29MN7xLbXHA@mail.gmail.com>
 <87h5qpm67n.wl-tiwai@suse.de> <CAOKSTBv3meaMDrJ2tn-dX6agFbTwiEmUeDYu2NTVzc559zd2OQ@mail.gmail.com>
 <CAOKSTBv4GHxQGOhK2NR6QsJERsWSoh6RMp+yv-cV7QBsSgx9iw@mail.gmail.com> <f701e9c6-51d2-4388-9162-f02393d6e8b2@leemhuis.info>
In-Reply-To: <f701e9c6-51d2-4388-9162-f02393d6e8b2@leemhuis.info>
From: Gilberto Ferreira <gilberto.nunes32@gmail.com>
Date: Thu, 12 Mar 2026 10:35:37 -0300
X-Gm-Features: AaiRm51s_oFy66ESvTdjN2WKqy3d5UeJXzbU3KDSFxjaUudrSkvEvBMlQStow5c
Message-ID: <CAOKSTBtF9LPtFktAF-357RT_w2bWW9Xg7NimQsizn0VwmR1DJw@mail.gmail.com>
Subject: Re: No HDMI audio with Linux Kernel 7 rc1 or rc2...
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten

I think this is exactly the same issue.

Thank you...

---


Gilberto Nunes Ferreira



---


Gilberto Nunes Ferreira
+55 (47) 99676-7530 - Whatsapp / Telegram






Em qui., 12 de mar. de 2026 =C3=A0s 10:24, Thorsten Leemhuis
<regressions@leemhuis.info> escreveu:
>
> On 3/10/26 13:32, Gilberto Ferreira wrote:
> > I am sorry to reach you again, guys, but now I noticed that dmesg shows=
 me this:
> >
> > amdgpu 0000:04:00.0: [drm] Failed to setup vendor infoframe on
> > connector HDMI-A-1: -22
> >
> > This never appears in the 6.19 kernel series.
>
> FWIW, there is another report about broken HDMI auto with amdgpu here:
> https://gitlab.freedesktop.org/drm/amd/-/issues/5052
>
> Might or might not be the same issue.
>
> In the end the problem remains the same afaics: you likely need to
> bisect this (or hope that someone else that has the same problem does).
>
> Ciao, Thorsten
>
> > Em seg., 9 de mar. de 2026 =C3=A0s 11:25, Gilberto Ferreira
> > <gilberto.nunes32@gmail.com> escreveu:
> >>
> >> Oh! I see. Sorry about that.
> >>
> >> ---
> >>
> >> Gilberto Nunes Ferreira
> >>
> >>
> >>
> >>
> >>
> >> Em seg., 9 de mar. de 2026 =C3=A0s 11:24, Takashi Iwai <tiwai@suse.de>=
 escreveu:
> >>>
> >>> On Mon, 09 Mar 2026 15:14:47 +0100,
> >>> Gilberto Ferreira wrote:
> >>>>
> >>>>>> At best, please try git bisect.
> >>>> Sorry! I am complete without any acknowledgment on how to proceed in=
 this.
> >>>>
> >>>>>> Or if it can't work for you, ask your distro people who can help.
> >>>> I have tried 3 different distros! I don't think this is some distro
> >>>> related problem.
> >>>
> >>> No, no, I meant you can ask distro people to build a test kernel, etc=
,
> >>> instead of you.  And, it'd better to ask distros whether you are the
> >>> only one in the world who hits the problem.  If it can be reproduced
> >>> by others, they can help debugging or bisection, too.  Pinging
> >>> repeatedly here on the list doesn't help much, as you can't build and
> >>> test a patch, unfortunately.
> >>>
> >>>
> >>> Takashi
> >
>
