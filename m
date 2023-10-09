Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42891A5B
	for <regressions@lists.linux.dev>; Mon,  9 Oct 2023 01:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFERmspS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3AADC433C8
	for <regressions@lists.linux.dev>; Mon,  9 Oct 2023 01:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696814836;
	bh=ePI4sPrOJVud3B+wyuF05+QlHDAmRa99/XgMjusQ7CQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QFERmspS24rcUU3iuTm8gr9nliikS/l5t9bTg7T1Q57nW8cP/fJ/AdsM7NcYGf0ex
	 xyANJy32Scm15YEev3mZgypetPQk+K2Ou2Jkn2F8EQWyTAZQNipIO+TOFqDT/TU1YI
	 kK9/rQ89qcBiLOPNW0wTHMGpHTMOsi4b4N26KWxOI57Tv0zX9SwdbkSDXUZOKUwfU6
	 Op7Hqb5VksdQfk8uZbMzkc/75P0aNbJMk5zIiJPV8ucBwkJtRTVAXaCFzisfAV0tnf
	 WCIwsEETjfdGfhe0c5tcmo/ZeLMJMQR6Ao6IZzWt/QIanpUzAZJUltH6R/HSgVkIDY
	 /AfHGLcBAqbCg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so6501224a12.2
        for <regressions@lists.linux.dev>; Sun, 08 Oct 2023 18:27:16 -0700 (PDT)
X-Gm-Message-State: AOJu0YzGy0vyIMZ1rvxwwhhjWKgnAIgTjPaYHLZFSnV8Rj8gG4yPNQoy
	TdBL9F8R1ZKjIojrVd5y0WyaNsxXlGp59Pf/pvw=
X-Google-Smtp-Source: AGHT+IFuDZWcAXMv/BZKi3giWjLwkrVXd4Fi2eK4WckAot0Lrfx277Vb/p+cHTJaqBzDigw2umg+GIz7HsTJU5Knxlw=
X-Received: by 2002:aa7:d9d4:0:b0:52f:a162:f4c2 with SMTP id
 v20-20020aa7d9d4000000b0052fa162f4c2mr11856309eds.22.1696814835101; Sun, 08
 Oct 2023 18:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
 <31bdf7b1-0ed9-4217-b459-1d857e53120b@leemhuis.info> <CAAhV-H7fRpykesVUEyaTpVnFiGwpP+fPbtdrp6JwfgD=bDp06Q@mail.gmail.com>
In-Reply-To: <CAAhV-H7fRpykesVUEyaTpVnFiGwpP+fPbtdrp6JwfgD=bDp06Q@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 9 Oct 2023 09:27:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7XCmbgS=N4-SE8FnASAws8hnDRZsQJgXE+dwyARaqzNw@mail.gmail.com>
Message-ID: <CAAhV-H7XCmbgS=N4-SE8FnASAws8hnDRZsQJgXE+dwyARaqzNw@mail.gmail.com>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad L570
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: javierm@redhat.com, Jaak Ristioja <jaak@ristioja.ee>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, all,

On Tue, Sep 26, 2023 at 10:31=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org=
> wrote:
>
> Hi, all,
>
> On Tue, Sep 26, 2023 at 7:15=E2=80=AFPM Linux regression tracking (Thorst=
en
> Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > [CCing the regression list, as it should be in the loop for regressions=
:
> > https://docs.kernel.org/admin-guide/reporting-regressions.html]
> >
> > Hi, Thorsten here, the Linux kernel's regression tracker.
> >
> > On 13.09.23 14:02, Jaak Ristioja wrote:
> > >
> > > Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel HD
> > > Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a blank
> > > screen after boot until the display manager starts... if it does star=
t
> > > at all. Using the nomodeset kernel parameter seems to be a workaround=
.
> > >
> > > I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2e4
> > > ("drivers/firmware: Move sysfb_init() from device_initcall to
> > > subsys_initcall_sync").
> >
> > Hmmm, no reaction since it was posted a while ago, unless I'm missing
> > something.
> >
> > Huacai Chen, did you maybe miss this report? The problem is apparently
> > caused by a commit of yours (that Javier applied), you hence should loo=
k
> > into this.
> I'm sorry but it looks very strange, could you please share your config f=
ile?
As confirmed by Jaak, disabling DRM_SIMPLEDRM makes things work fine
again. So I guess the reason:

When SIMPLEDRM takes over the framebuffer, the screen is blank (don't
know why). And before 60aebc9559492cea6a9625f ("drivers/firmware: Move
sysfb_init() from device_initcall to subsys_initcall_sync") there is
no platform device created for SIMPLEDRM at early stage, so it seems
also "no problem".

Huacai


>
> Huacai
>
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat=
)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > If I did something stupid, please tell me, as explained on that page.
> >
> > > git bisect start
> > > # status: waiting for both good and bad commits
> > > # good: [6995e2de6891c724bfeb2db33d7b87775f913ad1] Linux 6.4
> > > git bisect good 6995e2de6891c724bfeb2db33d7b87775f913ad1
> > > # status: waiting for bad commit, 1 good commit known
> > > # bad: [2dde18cd1d8fac735875f2e4987f11817cc0bc2c] Linux 6.5
> > > git bisect bad 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> > > # bad: [b775d6c5859affe00527cbe74263de05cfe6b9f9] Merge tag 'mips_6.5=
'
> > > of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
> > > git bisect bad b775d6c5859affe00527cbe74263de05cfe6b9f9
> > > # good: [3a8a670eeeaa40d87bd38a587438952741980c18] Merge tag
> > > 'net-next-6.5' of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> > > git bisect good 3a8a670eeeaa40d87bd38a587438952741980c18
> > > # bad: [188d3f80fc6d8451ab5e570becd6a7b2d3033023] drm/amdgpu: vcn_4_0
> > > set instance 0 init sched score to 1
> > > git bisect bad 188d3f80fc6d8451ab5e570becd6a7b2d3033023
> > > # good: [12fb1ad70d65edc3405884792d044fa79df7244f] drm/amdkfd: update
> > > process interrupt handling for debug events
> > > git bisect good 12fb1ad70d65edc3405884792d044fa79df7244f
> > > # bad: [9cc31938d4586f72eb8e0235ad9d9eb22496fcee] i915/perf: Drop the
> > > aging_tail logic in perf OA
> > > git bisect bad 9cc31938d4586f72eb8e0235ad9d9eb22496fcee
> > > # bad: [51d86ee5e07ccef85af04ee9850b0baa107999b6] drm/msm: Switch to
> > > fdinfo helper
> > > git bisect bad 51d86ee5e07ccef85af04ee9850b0baa107999b6
> > > # good: [bfdede3a58ea970333d77a05144a7bcec13cf515] drm/rockchip: cdn-=
dp:
> > > call drm_connector_update_edid_property() unconditionally
> > > git bisect good bfdede3a58ea970333d77a05144a7bcec13cf515
> > > # good: [123ee07ba5b7123e0ce0e0f9d64938026c16a2ce] drm: sun4i_tcon: u=
se
> > > devm_clk_get_enabled in `sun4i_tcon_init_clocks`
> > > git bisect good 123ee07ba5b7123e0ce0e0f9d64938026c16a2ce
> > > # bad: [20d54e48d9c705091a025afff5839da2ea606f6b] fbdev: Rename
> > > fb_mem*() helpers
> > > git bisect bad 20d54e48d9c705091a025afff5839da2ea606f6b
> > > # bad: [728cb3f061e2b3a002fd76d91c2449b1497b6640] gpu: drm: bridge: N=
o
> > > need to set device_driver owner
> > > git bisect bad 728cb3f061e2b3a002fd76d91c2449b1497b6640
> > > # bad: [0f1cb4d777281ca3360dbc8959befc488e0c327e] drm/ssd130x: Fix
> > > include guard name
> > > git bisect bad 0f1cb4d777281ca3360dbc8959befc488e0c327e
> > > # good: [0bd5bd65cd2e4d1335ea6c17cd2c8664decbc630] dt-bindings: displ=
ay:
> > > simple: Add BOE EV121WXM-N10-1850 panel
> > > git bisect good 0bd5bd65cd2e4d1335ea6c17cd2c8664decbc630
> > > # bad: [60aebc9559492cea6a9625f514a8041717e3a2e4] drivers/firmware: M=
ove
> > > sysfb_init() from device_initcall to subsys_initcall_sync
> > > git bisect bad 60aebc9559492cea6a9625f514a8041717e3a2e4
> > > # good: [8bb7c7bca5b70f3cd22d95b4d36029295c4274f6] drm/panel:
> > > panel-simple: Add BOE EV121WXM-N10-1850 panel support
> > > git bisect good 8bb7c7bca5b70f3cd22d95b4d36029295c4274f6
> > > # first bad commit: [60aebc9559492cea6a9625f514a8041717e3a2e4]
> > > drivers/firmware: Move sysfb_init() from device_initcall to
> > > subsys_initcall_sync
