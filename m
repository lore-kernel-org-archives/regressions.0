Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B08D20E4
	for <regressions@lists.linux.dev>; Mon, 21 Mar 2022 07:47:10 +0000 (UTC)
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D0B403F1D2
	for <regressions@lists.linux.dev>; Mon, 21 Mar 2022 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1647848820;
	bh=hE46fXwO5LIlT2wOIccXFBKWLT6OdjVGt8q3eXVFAlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CAszEkHa04rSMetYmf5M2x0ieSNBOfkPm55O/+1tA/TIN8bWWCRUZSJl/9lN4+1bJ
	 WATkSLhLa0yfu6yAN6u03m62mXdl5vpLlioAM9RynxWRxtk2/T9DjEWyyiZDVAfG/G
	 HdnFZsox9RX4gcwOz9zQUpyh+aHYcKuW+1i/AHDKqXctBCq+QIA8a4f56noUjqaVQG
	 TCOOS8a/pZ1urQmCe2o7n8gnLHzPaCFGq+O+ELAgadOYai5D/E93b7kcZwwZBs2IN8
	 8lKnq2lJlCjAfjkrGsBCcCVt5mbbdjD0LfDyJPkLwkPcZFLHhXdI16ZGBRQpaSBMLh
	 GvhOLZ9mSHoJQ==
Received: by mail-oo1-f71.google.com with SMTP id e9-20020a4a9b49000000b0032474b3ad5dso4168128ook.19
        for <regressions@lists.linux.dev>; Mon, 21 Mar 2022 00:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hE46fXwO5LIlT2wOIccXFBKWLT6OdjVGt8q3eXVFAlU=;
        b=O606k9hLQ06XDQvXbc/5xgi4aJST/M4bABk/wMySlXOI8UtIaUio5k3DRvnUB1rMU9
         pRQUMoeAblYz14Ou+uiQKHX3lNvK3GiAxcMB6EIg5oeV9U8jh+DSVdAIXHma4w5NUPI0
         Xe08Iwfsl+2R3lQvz/9Cj6J4qEjNumycI0S+Lpv5Hc3/qUsvBeuHBvzH5eaBKEeEHStq
         pcjpP8obVp9OhzCCUH+M27yC0kvkoMJAoK433cpFA3pFU2/Omz1dJKr3vkLyBn55hdlZ
         gGUBbTF27UPuDetLIHpoeofigayyzRr3+xFozgcjV5c1XOUCJZLo/z7mgRrl6Lti3bZx
         BzTw==
X-Gm-Message-State: AOAM533mGXc0cJbo53CtZVYX4zE2MdJ5Id9vO2yV9R6bznnGnowr20gY
	KOo8KSb25RvsOYWZozTlJP7LwEIMP8b4tfVi57QoWM65s7SIUM/6HT/Wb4M6Ex+g307NuC4ZV0Y
	ip85oY+AuqlcsnjsqIEiq2Kq6KWULaOFLJGFkzn+ldkXwpqSC3owfM+64
X-Received: by 2002:a05:6808:3012:b0:2ef:79c7:1342 with SMTP id ay18-20020a056808301200b002ef79c71342mr4135oib.0.1647848819456;
        Mon, 21 Mar 2022 00:46:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNw2oa86WnfvCAmgfO2ITM7xMIXoAkd6X77Q5Vvz8OywnQP1upsmm4U9u9/5EKa5AxbhNHL9S2RWuJfMrN7t8=
X-Received: by 2002:a05:6808:3012:b0:2ef:79c7:1342 with SMTP id
 ay18-20020a056808301200b002ef79c71342mr4129oib.0.1647848819115; Mon, 21 Mar
 2022 00:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <fbfbdedd-21b5-5b6f-c03c-80027acbe2f5@leemhuis.info> <420bd395-10e7-b5de-97da-56d90fb82654@leemhuis.info>
In-Reply-To: <420bd395-10e7-b5de-97da-56d90fb82654@leemhuis.info>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Mon, 21 Mar 2022 15:46:47 +0800
Message-ID: <CAAd53p4qmoRV1TjTG00vEmQmuiYWxQMjN9SER5i=1c_cB41d_A@mail.gmail.com>
Subject: Re: [regression] Headphone output gets unproperly powered down - Mi
 Notebook Pro 2020 (ALC256) (fwd of b.k.o bug #215484; starting with 5.14.14)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, itsbytebites@tutanota.com, alsa-devel@alsa-project.org, 
	kailang@realtek.com
Content-Type: text/plain; charset="UTF-8"

Hi Thorten,

On Mon, Mar 21, 2022 at 2:48 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi, this is your Linux kernel regression tracker. Top-posting for once,
> to make this easily accessible to everyone.
>
> Could anybody please finally look into this bisected regression from
> 5.14.13 to 5.14.14 (f8d3c17e1c37 ("ALSA: hda/realtek - ALC236 headset
> MIC recording issue")) that according to a recent bugzilla comment from
> reporter is still present in recent 5.16 kernels?

I just asked the affected user to test my patch. Once it's tested I'll
send it out.

Kai-Heng

>
> Ciao, Thorsten
>
> On 12.01.22 08:15, Thorsten Leemhuis wrote:
> >
> > Hi, this is your Linux kernel regression tracker speaking.
> >
> > I'm forwarding a regression reported in bugzilla.kernel.org to the list,
> > to make sure all parties interested in this are aware of it. The
> > reporter is CCed. Not CCing the stable list in this case, as 5.14 is EOL
> > already.
> >
> > https://bugzilla.kernel.org/show_bug.cgi?id=215484
> >
> >> With headphones (or an auxiliary jack) plugged in, the audio output
> >> is fine when anything is playing, but when that's stopped a loud pop
> >> can be heard after some seconds and if the jack is connected to an
> >> external amplifier it gets really noisy. Everything gets back to
> >> normal whenever audio playback is resumed, although with another loud
> >> pop at the start.
> >>
> >> This has been happening since kernel 5.14.14, whereas 5.14.13 is
> >> fine. I suspect it has to do with the ALC256 mute logic implemented
> >> in that version
> >> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/sound/pci/hda/patch_realtek.c?id=v5.14.14&id2=v5.14.13)
> >>
> >> OS: Fedora Linux 35 Kernel: 5.16.0-60 Vanilla Hardware: Xiaomi Mi
> >> Notebook Pro Enhanced 2020 (i7 10510U, ALC256)
> >
> > Ciao, Thorsten
> >
> > #regzbot introduced v5.14.13..v5.14.14
> > #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215484
> > #regzbot from: Emanuele Melzi <itsbytebites@tutanota.com>
