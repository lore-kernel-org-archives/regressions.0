Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F832F32
	for <regressions@lists.linux.dev>; Mon, 13 Mar 2023 20:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B11C433EF
	for <regressions@lists.linux.dev>; Mon, 13 Mar 2023 20:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678739734;
	bh=u7u+NHhCXMgf5hsXTGJG85AoJ3MaLd/lr/vsQ9l3jxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KeSZuAw2+a0jpZKTX3Nv2MHuotqWgQeqMxPO0aiFt7O42tDhJ7d89Q6iO5coRl+nc
	 GPRahWs5h7mR9AZkrG5SyeqtuozYVXytgMkIo8P6khnxR3Q/Twi6pLTstiUt+RqPWy
	 H6UYikQPHa8BJaXYxecyM5bLVaQJOfLOy4waMxZfrN1XF8+N84Gpe623K7mAeO2geL
	 qSEixu8gKdHBk4MvhCr6By6FtGuAU7fdkHJ8POfTQu/KGZdtg+z7OX/0Z0UW5sLr6N
	 6/v79jy7S0WhfYR1sBjZm1EjPkj6hYkLpyaOKtegJ8t3UmjZuUlaWsqRmSwtyeIZYF
	 mz5OEDpNiQUCg==
Received: by mail-lj1-f174.google.com with SMTP id a32so13932724ljq.1
        for <regressions@lists.linux.dev>; Mon, 13 Mar 2023 13:35:34 -0700 (PDT)
X-Gm-Message-State: AO0yUKXP44tAaUq+pgF/GScGkgxlXhn8EmiCv7F7hJlZcs+IGpWc7/qC
	/Xduq7gNSVCj1fIV2TDTBdbxjEGc6g+c9w1yv74=
X-Google-Smtp-Source: AK7set//DFzr7HN1kkaxrWEfPY3wK6bwu6fBSdC6GQNzmN5iHlcln8ZyZm1IPfou1H+Puy+htM1NrinKzbpdWOAFo5U=
X-Received: by 2002:a2e:aaa3:0:b0:295:a64f:9d50 with SMTP id
 bj35-20020a2eaaa3000000b00295a64f9d50mr11100414ljb.5.1678739732443; Mon, 13
 Mar 2023 13:35:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a13cd3b5-cc41-bf2f-c8ac-e031ad0d5dd7@leemhuis.info>
 <CAPhsuW7ZWthh0PZt71hQh1_51C0yMSpOqWYJKc_+VzzTmW_r5A@mail.gmail.com>
 <167805126796.8008.3635368722810568057@noble.neil.brown.name>
 <CAPhsuW64R2ze1AYZhEmQcGf0cKBjjX=4EZZowD+=Cr=VPg1QYg@mail.gmail.com> <167814210165.8008.4497120634222267375@noble.neil.brown.name>
In-Reply-To: <167814210165.8008.4497120634222267375@noble.neil.brown.name>
From: Song Liu <song@kernel.org>
Date: Mon, 13 Mar 2023 13:35:20 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4oAsp=8dBcf_mmpp-bG_+wTHAZzvtRSn3x1QU0N3irXA@mail.gmail.com>
Message-ID: <CAPhsuW4oAsp=8dBcf_mmpp-bG_+wTHAZzvtRSn3x1QU0N3irXA@mail.gmail.com>
Subject: Re: [regression] Bug 217074 - upgrading to kernel 6.1.12 from 5.15.x
 can no longer assemble software raid0
To: NeilBrown <neilb@suse.de>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Jes.Sorensen@gmail.com, 
	linux-raid <linux-raid@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Nikolay Kichukov <hijacker@oldum.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 6, 2023 at 2:35=E2=80=AFPM NeilBrown <neilb@suse.de> wrote:
>
> On Tue, 07 Mar 2023, Song Liu wrote:
> > On Sun, Mar 5, 2023 at 1:21=E2=80=AFPM NeilBrown <neilb@suse.de> wrote:
> > >
> > > On Sat, 04 Mar 2023, Song Liu wrote:
> > > > + Jes.
> > > >
> > > > It appeared to me that we can assemble the array if we have any of =
the
> > > > following:
> > > > 1. Enable CONFIG_BLOCK_LEGACY_AUTOLOAD;
> > > > 2. Have a valid /etc/mdadm.conf;
> > > > 3. Update mdadm to handle this case. (I tried some ugly hacks, whic=
h worked but
> > > >     weren't clean).
> > > >
> > > > Since we eventually would like to get rid of CONFIG_BLOCK_LEGACY_AU=
TOLOAD, I
> > > > think we need mdadm to handle this properly. But the logistics migh=
t
> > > > be complicated, as
> > > > mdadm are shipped separately.
> > > >
> > > > Jes, what do you think about this? AFAICT, we need to update the lo=
gic in
> > > > mdopen.c:create_mddev().
> > >
> > > mdadm already handles this, but only if
> > >    CREATE names=3Dyes
> > > is present in /etc/mdadm.conf
> > >
> > > Maybe we should flip the default for the next mdadm release, and patc=
h
> > > the kernel (with a stable backport) to select BLOCK_LEGACY_AUTOLOAD i=
f
> > > BLK_DEV_MD=3Dm
> > > Then revert that - say - 6 months after the new mdadm is released.
> >
> > I like this idea. I guess we also need to select BLOCK_LEGACY_AUTOLOAD
> > if BLK_DEV_MD=3Dy?
>
> Yes of course - sorry.
>
> Something like the following.
>
> Thanks,
> NeilBrown

Thanks Neil!

I applied this to md-fixes.

Song

>
>
> From: NeilBrown <neilb@suse.de>
> Subject: md: select BLOCK_LEGACY_AUTOLOAD
>
> When BLOCK_LEGACY_AUTOLOAD is not enable, mdadm is not able to
> activate new arrays unless "CREATE names=3Dyes" appears in
> mdadm.conf
>
> As this is a regression we need to always enable BLOCK_LEGACY_AUTOLOAD
> for when MD is selected - at least until mdadm is updated and the
> updates widely available.
>
> Fixes: fbdee71bb5d8 ("block: deprecate autoloading based on dev_t")
> Signed-off-by: NeilBrown <neilb@suse.de>
>
> diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
> index 998a5cfdbc4e..662d219c39bf 100644
> --- a/drivers/md/Kconfig
> +++ b/drivers/md/Kconfig
> @@ -16,6 +16,10 @@ if MD
>
>  config BLK_DEV_MD
>         tristate "RAID support"
>         select BLOCK_HOLDER_DEPRECATED if SYSFS
> +       # BLOCK_LEGACY_AUTOLOAD requirement should be removed
> +       # after relevant mdadm enhancements - to make "names=3Dyes"
> +       # the default - are widely available.
> +       select BLOCK_LEGACY_AUTOLOAD
>         help
>           This driver lets you combine several hard disk partitions into =
one
>           logical block device. This can be used to simply append one
>
>
