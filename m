Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E677E2
	for <regressions@lists.linux.dev>; Sat, 14 Jan 2023 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673722578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AXHP4vmdSOTVVgF00Ub+U89drkXSQBR/JVMraYuO3x0=;
	b=Y6um8HballHZZLHgn7byIrHvtdQCidax4XUdKEC5ubqOmG9KcDthS11/VbjxAkHvthaBN0
	tujVVQ/uEl1+KN1stCvTIiUteYItehrG2/zqAM1IZWrcpbbip4UujOJNrDPutGTNujMjo0
	iAMU5t1eVMDOH7wlE1hcB3ZZCJLlVRY=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-QqlkYI4dMVSnH9dEecrcQQ-1; Sat, 14 Jan 2023 13:56:17 -0500
X-MC-Unique: QqlkYI4dMVSnH9dEecrcQQ-1
Received: by mail-lj1-f198.google.com with SMTP id y19-20020a05651c221300b00279958f353fso6383243ljq.1
        for <regressions@lists.linux.dev>; Sat, 14 Jan 2023 10:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXHP4vmdSOTVVgF00Ub+U89drkXSQBR/JVMraYuO3x0=;
        b=PoT8QokZxYwxJYINX3pK+Pc01YFsRrmoIMHM6JT2N2eDnKoF7irSJ+Onpt6l4bwFcH
         NSJJIr9KCe54d4lPvz6wp9VA2AMXPo7vf0Z9fA3ffyySX+WaUzyUZM/hkNv72wzS/tkU
         /ZYXW1IzN3NxxQB+RCg9/tsTSGDRZOc+onA2sVdS4P27Mx1RJk48zqNw0943DoyvTPpl
         JGnv8HlU8WSUaO/7PEOA2Zf4ZdP+iIeyuXHWdegGDYV/3kVMM0QAmZrOiork9vAfv/cr
         +kO29Q0NJMpse4FQi9tu/tdvhKPKirv/tSClCtx4eUJjUtUgePjEDcN7U2JLwKSqUMhn
         jcig==
X-Gm-Message-State: AFqh2kr4kGRCYDDyZi3fyGLfswx7S30be0+8bNXLO7loE9UU4FvVbIYt
	WHS+AvDHi2QvvNvlUHQR73SqAMiMwTgO3S0JFhjn6snzK3WCd3HT+CJ9q8SDMUGIFAHofoeYkFq
	Znp02Cn/sipenNVDbR8AC1VjIZf30ot3QfmWD2+0=
X-Received: by 2002:a05:651c:149:b0:287:4eeb:53dc with SMTP id c9-20020a05651c014900b002874eeb53dcmr884880ljd.27.1673722575659;
        Sat, 14 Jan 2023 10:56:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt5Mu8PJf+/bXqZgwCzYqz6n0H/o6+lRjfPUJtA6rMdJkISya4bxJjhHdQkz4fgSum9S2xn4ipskm1xaWFTl4w=
X-Received: by 2002:a05:651c:149:b0:287:4eeb:53dc with SMTP id
 c9-20020a05651c014900b002874eeb53dcmr884876ljd.27.1673722575480; Sat, 14 Jan
 2023 10:56:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop> <c32ea02c-d706-ea2f-aa13-660b8db958ef@leemhuis.info>
 <481f19ba-da7e-6900-0bb2-64ba92d59ce6@leemhuis.info> <CACO55tv3E7y31MgyhW22GdDkE=XCYJF+boMivc5AEmyQ-svMhA@mail.gmail.com>
 <20230114160336.2jsh3ztij6cpzcee@wslaptop>
In-Reply-To: <20230114160336.2jsh3ztij6cpzcee@wslaptop>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 14 Jan 2023 19:56:03 +0100
Message-ID: <CACO55tvm0wBiA4Oi-QKmi-Q09Y4FXsjb4+0=T9f0DKUXSGEErg@mail.gmail.com>
Subject: Re: [REGRESSION] GM20B probe fails after commit 2541626cfb79
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, bskeggs@redhat.com, 
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, airlied@redhat.com, 
	Daniel Vetter <daniel@ffwll.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 14, 2023 at 5:07 PM Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
>
> On Sat, Jan 14, 2023 at 04:27:38AM +0100, Karol Herbst wrote:
> > I tried to look into it, but my jetson nano, just constantly behaves
> > in very strange ways. I tried to compile and install a 6.1 kernel onto
> > it, but any kernel just refuses to boot and I have no idea what's up
> > with that device. The kernel starts to boot and it just stops in the
> > middle. From what I can tell is that most of the tegra devices never
> > worked reliably in the first place and there are a couple of random
> > and strange bugs around. I've attached my dmesg, so if anybody has any
> > clues why the kernel just stops doing anything, it would really help
> > me.
>
> Hello,
>
> Thank you for looking into this! I have seen this type of hang in
> mainline on this SoC, and it was due to a reset not being deasserted.
> Would you mind getting a log with initcall_debug enabled to pinpoint
> where the hang occurs? I would be happy to help if I can.
>

the last thing printed is:

[   20.517642] calling  clk_disable_unused+0x0/0xe0 @ 1

> > But maybe it would be for the best to just pull tegra support out of
> > nouveau, because in the current situation we really can't spare much
> > time dealing with them and we are already busy enough just dealing
> > with the desktop GPUs. And the firmware we got from Nvidia is so
> > ancient and different from the desktop GPU ones, that without actually
> > having all those boards available and properly tested, we can't be
> > sure to not break them.
> >
> > And afaik there are almost no _actual_ users, just distribution folks
> > wanting to claim "support" for those devices, but then ending up using
> > Nvidia's out of tree Tegra driver in deployments anyway.
>
> > If there are actual users using them for their daily life, I'd like to
> > know, because I'm aware of none.
>
> For what it's worth, I consider myself a user of nouveau. Granted, I'm
> using it as a hobby project, but in its current state it is not far from
> a usable desktop experience on the Pixel C.
>

okay. I mean, I'm happy to keep fixing regressions and figuring out
what's wrong with booting the devices and such if regular users come
around and file bugs. And until today I wasn't really aware of anybody
:)

It's just not worth my time, if there are no users using them at all.
Or rather.. if there would only be commercial users (like.. companies
deploying those for money), then they could get involved and help us
out, because I wouldn't be willing to spend my time on this, if that
would be the case.

> Diogo
>

