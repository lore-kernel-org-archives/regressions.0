Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577CF4692
	for <regressions@lists.linux.dev>; Mon,  9 Oct 2023 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pgw7GRae"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C001EC433C7
	for <regressions@lists.linux.dev>; Mon,  9 Oct 2023 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696841676;
	bh=9n/7RwxQhXcoWDnbns8I2FTa6fM9dCa/G7p8dxIGNok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pgw7GRae+wKAnMOnM/+5rHl/WCpsw6W/8c3Tt5JZN0DFQElI4IkV+SlINTxqpoHLq
	 ZA8uZl8EQtVexIpuJofR0lrei37fHNpQRUpf3hvJQBEvg5ylExreknJsf+zN1Iqnh1
	 pWSRt70dK7ji/uOARGL9FjH+B1d1USOL9q5y9enWywYp3x+zWu4F/wAi5z4ztda7TW
	 MWaHE1VApJwiXeEtUpptTxgpKUeROrS2OyHX1uTODWXqZsZXExmtmLTp4T4uEMuDZq
	 4pydbGVznmQDT/+HyT8jApMjv2XLZjcW8Pn/2jrYo4j2kOrqYk4aBPS609qAm0Rv61
	 0rMG78kRTTC6w==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9b2cee55056so777268866b.3
        for <regressions@lists.linux.dev>; Mon, 09 Oct 2023 01:54:36 -0700 (PDT)
X-Gm-Message-State: AOJu0YzqWxWzWbX0O/yvJHFtclkrk4XhKV83xHpHNOddNAW3NKCQtkpu
	uFYduNfANvVltr8TmFqlmrkwVMnIhbn88VLUH5o=
X-Google-Smtp-Source: AGHT+IHGww7rveukx+cl27yL8nzyIgkRy+YrEuRsJ+DkxVHOlDW304ob+nvB745R9AlYO0maQg3J0Dz168Y6kCwz9oI=
X-Received: by 2002:a17:906:108f:b0:9ae:519f:8287 with SMTP id
 u15-20020a170906108f00b009ae519f8287mr10823154eju.77.1696841675200; Mon, 09
 Oct 2023 01:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
 <31bdf7b1-0ed9-4217-b459-1d857e53120b@leemhuis.info> <CAAhV-H7fRpykesVUEyaTpVnFiGwpP+fPbtdrp6JwfgD=bDp06Q@mail.gmail.com>
 <CAAhV-H7XCmbgS=N4-SE8FnASAws8hnDRZsQJgXE+dwyARaqzNw@mail.gmail.com> <ZSO9uArAtsPMPeTP@debian.me>
In-Reply-To: <ZSO9uArAtsPMPeTP@debian.me>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 9 Oct 2023 16:54:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5GbidUx8YanUc7S9oGqBkDd53xeT=2O4aCuX7KpM-+8A@mail.gmail.com>
Message-ID: <CAAhV-H5GbidUx8YanUc7S9oGqBkDd53xeT=2O4aCuX7KpM-+8A@mail.gmail.com>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad L570
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Regressions <regressions@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jaak Ristioja <jaak@ristioja.ee>, 
	Javier Martinez Canillas <javierm@redhat.com>, 
	Linux DRI Development <dri-devel@lists.freedesktop.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2023 at 4:45=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen wrote:
> > Hi, all,
> >
> > On Tue, Sep 26, 2023 at 10:31=E2=80=AFPM Huacai Chen <chenhuacai@kernel=
.org> wrote:
> > >
> > > Hi, all,
> > >
> > > On Tue, Sep 26, 2023 at 7:15=E2=80=AFPM Linux regression tracking (Th=
orsten
> > > Leemhuis) <regressions@leemhuis.info> wrote:
> > > >
> > > > [CCing the regression list, as it should be in the loop for regress=
ions:
> > > > https://docs.kernel.org/admin-guide/reporting-regressions.html]
> > > >
> > > > Hi, Thorsten here, the Linux kernel's regression tracker.
> > > >
> > > > On 13.09.23 14:02, Jaak Ristioja wrote:
> > > > >
> > > > > Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Inte=
l HD
> > > > > Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a b=
lank
> > > > > screen after boot until the display manager starts... if it does =
start
> > > > > at all. Using the nomodeset kernel parameter seems to be a workar=
ound.
> > > > >
> > > > > I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3=
a2e4
> > > > > ("drivers/firmware: Move sysfb_init() from device_initcall to
> > > > > subsys_initcall_sync").
> > > >
> > > > Hmmm, no reaction since it was posted a while ago, unless I'm missi=
ng
> > > > something.
> > > >
> > > > Huacai Chen, did you maybe miss this report? The problem is apparen=
tly
> > > > caused by a commit of yours (that Javier applied), you hence should=
 look
> > > > into this.
> > > I'm sorry but it looks very strange, could you please share your conf=
ig file?
> > As confirmed by Jaak, disabling DRM_SIMPLEDRM makes things work fine
> > again. So I guess the reason:
>
> Did Jaak reply privately? It should have been disclosed in public
> ML here instead.
Yes, he replied privately, and disabling DRM_SIMPLEDRM was suggested by me.

>
> >
> > When SIMPLEDRM takes over the framebuffer, the screen is blank (don't
> > know why). And before 60aebc9559492cea6a9625f ("drivers/firmware: Move
> > sysfb_init() from device_initcall to subsys_initcall_sync") there is
> > no platform device created for SIMPLEDRM at early stage, so it seems
> > also "no problem".
>
> I don't understand above. You mean that after that commit the platform
> device is also none, right?
No. The SIMPLEDRM driver needs a platform device to work, and that
commit makes the platform device created earlier. So, before that
commit, SIMPLEDRM doesn't work, but the screen isn't blank; after that
commit, SIMPLEDRM works, but the screen is blank.

Huacai
>
> Confused...
>
> --
> An old man doll... just what I always wanted! - Clara
