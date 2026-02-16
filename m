Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E63A1EDA2B
	for <regressions@lists.linux.dev>; Mon, 16 Feb 2026 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232464; cv=none; b=GT+Hx3nw3r5iP054FUdTt6Fp6rWEh67CUwF5xhr99zUQUI08GrsaQQDeLnuVHNOz9PRktcENco5yl64N3u5jJqGD+4n5dGkvsUY7AwHj5RFt5qYWMTK2olZG4SAMWG7NCD/RzSg5cwmN7BBmEiiDfOam8CuBKJOeLxoWOaTyJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232464; c=relaxed/simple;
	bh=G1XKDnA1Pp+L2xvNGMAFEx1FJW9MZknDmsm840sEdpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BoZpoFSXC5B0WwPhvsZdDMZFNdtjGOBqpM+EBxUrt9i/5udPs5Hr9x3B1/txzRq3x7z+z3ijz52PhSI+j2fR57M/smhWXtboG7jRZgkUm7sLqLL9pzFHq02MEqNheuemoJREUriR/91BGrfmUMU4o1nJO69U9+UC/BklBPhFrqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-567543b8989so1251478e0c.2
        for <regressions@lists.linux.dev>; Mon, 16 Feb 2026 01:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232462; x=1771837262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kge8JOhnejw0JLwZ79trJtM/bgRZ8RfiXwLb+ldmjbA=;
        b=oWlOxhDi6o4nwTRuC+rqNbsuF7cfbvp0x72HwwXL5LrdiTiSGeT1MR9e1PwGvnRK+y
         JBDUEVlbiLWiVt649wNT+Z7HXN6tMPgtRQrItmWBoJCF3tIedoB3SRuXwr5uuzv/iyAq
         pi8wLQu2qtbWuGU553uUUZbngWRDs7mWPYEnS70zJcZtWhbHw4VvL4vvyi8YtNzMrR0H
         g7lAhhUdgIP2k8wAIRDhJR8o77LyQmGgXpof+A1gPFfoMyM1k8+xRXXyKHsio+y4BTL5
         P/HTQMhJgkxmFdIMrMjjQnrl3041YlPlW2/U1wEHoS5yzijyas9+wXX8VMtlIZf3WVDJ
         92FA==
X-Forwarded-Encrypted: i=1; AJvYcCXSMNEplaqQuoJdWtoR+KKp5avBq/1K4qZdCLj5xTV07QKEhaJL0lddWzkrKsClqS8+LKI3UwQuqaE/CQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyF7NeSKuQ0A0knKJeT6mm2wDgmSiNNH/cH3QewRhzbiAFF0Z8Y
	7YP+uAPnAEroShgLLTYp83wdcNcdYLU3HtUKux8kPUIvLaZn+cHXlZ9RoW+SQykA
X-Gm-Gg: AZuq6aKPy5FhqymRhkVaFSm73oXgqd3pez52MQI6qZWhNLrPjNfw86A7q0c92G9qp/b
	be+6ZQsdJAlVL+38/zdVhGj1tGAK3KXGCOqkEo6WgXqQG1Atqm28zXYKBCGqCgu7m2l9s7Z5yq+
	ejvzZhynqoDVd5Cp4z83M5BLVLcCIr6YOPn3fU98LXlqr69dWuba0Mt8GoO/yAS1Xhz24uWvKjd
	N4zBJ1g9UBfLUBToU/ciKNzGkvPQNZZNZP/vUpkeMlrVIm0Y5tj2Dflvt1/hgUVYcfXsvXdaQbD
	y90MizZ6whtcs+AhX2mkpkdo6ba3DpsVXl5YK+dZ+j/dhaloFN/zg9s13YiUJG56cVwdjONnuMg
	JbmbenPJkwyVPVNBWprSUr85d3xZPPVGszGq6rzqpfcfl650tyn05WcGAtAD+a2EwR0jyzR9jKT
	WX5AcYlQa8vZakXqUcZ9otgf+C58xHNPHzwtrNarn6WLYrVWUEaDVKmhEMuWqC
X-Received: by 2002:a05:6122:4d84:b0:566:2711:d8ab with SMTP id 71dfb90a1353d-567681c18ecmr3277385e0c.6.1771232461887;
        Mon, 16 Feb 2026 01:01:01 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5674c24aed4sm7131937e0c.19.2026.02.16.01.01.00
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 01:01:01 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5fac15a7b88so470656137.3
        for <regressions@lists.linux.dev>; Mon, 16 Feb 2026 01:01:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXataJxkoYmVtkwlkCgFjF9smKytRgS0AElLiphUg0colZFJrI4+tu/2ncR4h+0i7VwAYZZdsQ3j5N2JQ==@lists.linux.dev
X-Received: by 2002:a05:6102:2913:b0:5f5:2638:9f3f with SMTP id
 ada2fe7eead31-5fe16c0367amr3303732137.8.1771232460393; Mon, 16 Feb 2026
 01:01:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com> <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
 <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org> <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
 <f5d3dde6-edec-42f4-93cb-459c8677245a@mailbox.org> <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
 <fcf5ab75-029e-469e-8b2a-51fa5c2a2374@mailbox.org> <95fd3f52-c3ed-40c5-920f-11e8767f701d@leemhuis.info>
In-Reply-To: <95fd3f52-c3ed-40c5-920f-11e8767f701d@leemhuis.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 10:00:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-g+3kTaG6Ost4iHo1Tdi_H=qscLBkBRWuR+6DG5c=SA@mail.gmail.com>
X-Gm-Features: AaiRm52WVbXjwZzPHyB6pXVlpVbl_Xj9ZkKfZnmmR7eryStWwzhYeOW7DeWViQM
Message-ID: <CAMuHMdV-g+3kTaG6Ost4iHo1Tdi_H=qscLBkBRWuR+6DG5c=SA@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: Convert to dev_pm_domain_{at,de}tach_list()
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Matt Coster <Matt.Coster@imgtec.com>, 
	Frank Binns <Frank.Binns@imgtec.com>, Brajesh Gupta <Brajesh.Gupta@imgtec.com>, 
	Alessio Belle <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten,

On Sat, 14 Feb 2026 at 13:38, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
> On 2/13/26 23:52, Marek Vasut wrote:
> > On 2/12/26 4:56 PM, Thorsten Leemhuis wrote:
> >> On 2/12/26 15:38, Marek Vasut wrote:
> >>> On 2/12/26 10:00 AM, Matt Coster wrote:
> >>>> On 11/02/2026 19:17, Marek Vasut wrote:
> >>>>> On 1/23/26 2:50 PM, Geert Uytterhoeven wrote:
> >>>>>> On Fri, 23 Jan 2026 at 14:36, Matt Coster <Matt.Coster@imgtec.com>
> >>>>>> wrote:
> >>>>>>> On 22/01/2026 16:08, Geert Uytterhoeven wrote:
> >>>>>>>> Call the dev_pm_domain_attach_list() and
> >>>>>>>> dev_pm_domain_detach_list()
> >>>>>>>> helpers instead of open-coding multi PM Domain handling.
> >>>>>>>>
> >>>>>>>> This changes behavior slightly:
> >>>>>>>>      - The new handling is also applied in case of a single PM
> >>>>>>>> Domain,
> >>>>>>>>      - PM Domains are now referred to by index instead of by
> >>>>>>>> name, but
> >>>>>>>>        "make dtbs_check" enforces the actual naming and ordering
> >>>>>>>> anyway,
> >>>>>>>>      - There are no longer device links created between virtual
> >>>>>>>> domain
> >>>>>>>>        devices, only between virtual devices and the parent device.
> >>>>>>>
> >>>>>>> We still need this guarantee, both at start and end of day. In the
> >>>>>>> current implementation dev_pm_domain_attach_list() iterates
> >>>>>>> forwards,
> >>>>>>> but so does dev_pm_domain_detach_list(). Even if we changed that,
> >>>>>>> I'd
> >>>>>>> prefer not to rely on the implementation details when we can
> >>>>>>> declare the
> >>>>>>> dependencies explicitly.
> >>>>>>
> >>>>>> Note that on R-Car, the PM Domains are nested (see e.g.
> >>>>>> r8a7795_areas[]),
> >>>>>> so they are always (un)powered in the correct order.  But that may
> >>>>>> not
> >>>>>> be the case in the integration on other SoCs.
> >>>>>>
> >>>>>>> We had/have a patch (attached) kicking around internally to use the
> >>>>>>> *_list() functions but keep the inter-domain links in place; it got
> >>>>>>> held
> >>>>>>> up by discussions as to whether we actually need those dependencies
> >>>>>>> for
> >>>>>>> the hardware to behave correctly. Your patch spurred me to run
> >>>>>>> around
> >>>>>>> the office and nag people a bit, and it seems we really do need to
> >>>>>>> care
> >>>>>>> about the ordering.
> >>>>>>
> >>>>>> OK.
> >>>>>>
> >>>>>>> Can you add the links back in for a V2 or I can properly send the
> >>>>>>> attached patch instead, I don't mind either way.
> >>>>>>
> >>>>>> Please move forward with your patch, you are the expert.
> >>>>>> I prefer not to be blamed for any breakage ;-)
> >>>>>
> >>>>> Has there been any progress on fixing this kernel crash ?
> >>>>>
> >>>>> There are already two proposed solutions, but no fix is upstream.
> >>>>
> >>>> Yes and no. Our patch to use dev_pm_domain_attach_list() has landed in
> >>>> drm-misc-next as commit e19cc5ab347e3 ("drm/imagination: Use>>
> >>>> dev_pm_domain_attach_list()"), but this does not fix the underlying
> >>>> issue of missing synchronization in the PM core[1] is still unresolved
> >>>> as far as I'm aware.
> >>>
> >>> OK, but the pvr driver can currently easily crash the kernel on boot if
> >>> firmware is missing, so that should be fixed soon, right ?
> >>
> >> Well, drm-misc-next afaik means that the above mentioned fix would only
> >> be merged in 7.1, which is ~4 months away, which is not really "soon"
> >> I'd say. Or did I misjudge this?
> >
> > The PM domain issue here crashes the kernel, so I think this would be
> > material for drm-misc-fixes .
>
> Yeah, sounds a lot like it.
>
> >>> I added the regressions list onto CC, because this seems like a problem
> >>> worth tracking.
> >>
> >> Noticed that and wondered what change caused the regression.
> >
> > I think this one:
> >
> > 330e76d31697 ("drm/imagination: Add power domain control")
>
> Thx; FWIW, that was merged for v6.16-rc1.
>
> >> Did not
> >> find a answer in a quick search on lore[1]. Because if it's a
> >> regression, we maybe should just revert the culprit for now according to
> >> Linus:
> >> https://lore.kernel.org/lkml/CAHk-=wi86AosXs66-
> >> yi54+mpQjPu0upxB8ZAfG+LsMyJmcuMSA@mail.gmail.com/
> >>
> >> [1] I guess this was the initial report from Geert?
> >> https://lore.kernel.org/all/
> >> CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com/
> >
> > It is.
> >
> > I think there are other SoCs which depend on the power domain commit, so
> > revert is not so clear cut anymore.
>
> Well, it's a judgement call. 330e76d31697 was merged less then a year
> ago, so I'd not be surprised at all if Linus would revert it in a case
> like this. But it seems it doesn't revert clearly anymore, which
> complicates things.
>
> > But SoCs which have hierarchical
> > power domains and which manage to probe this driver without having a
> > firmware available for the GPU will simply end with crashed kernel,
> > which is really not good.
>
> Does the patch Matt mentioned fix the crash? His "this does not fix the
> underlying issue [...]" (see quote earlier) makes it sound like the
> crash or some other problem (theoretical or practical? regression or
> not?) remains. If that's the case and no quick fix in sight I guess it
> would be best if someone affected could post a revert and then we can
> ask Linus if he wants to pick it up.

I don't think that patch would fix the crash.  The Adreno and Panfrost
GPU drivers do similar things (explicit multi-PM Domain handling),
so I am wondering if the issue can be triggered with them too (e.g. on
unbind).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
