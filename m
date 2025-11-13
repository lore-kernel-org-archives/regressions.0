Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFD63451B4
	for <regressions@lists.linux.dev>; Thu, 13 Nov 2025 18:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763057816; cv=none; b=NCJiI9PpbM4j4KV/9maRtbU9bvMOSpCojWXcUOWqN1NEmjeZPvyIC9pp21DjOEzRijdMy5n9RojcuZsVN0Ob89Ce+hOEE5S6fye333gJXtra66+x3UExEtbcPoECC6T6z/wGeOtmRf0jgPRLrdvWoN77CE/v2QxFrlzsErCfyqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763057816; c=relaxed/simple;
	bh=eQmaxXbDI6T55GkvselmhN1Mv7EkmD7uxsIDTUdUiBg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vk3i2HgDmQ8zdLA3BSOwehwid/xMsHEcQRtftJATJD2h0GeB5EJuHxohNrA48wiL0tNwvJag49wq3qd6Evd4/hU7O7SHKpRk6YhVZB6h0a1cK7h71Htq1wbSoYoo0DHHiAGp46MZcUGYKOSeqnOJA0RD6DEdasyR/i62/qoYabU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=B+EQxAJU; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="B+EQxAJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1763057804; x=1763317004;
	bh=eQmaxXbDI6T55GkvselmhN1Mv7EkmD7uxsIDTUdUiBg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=B+EQxAJUMDAy0sHmJyfuKZ7GZXmr72UO1VL6z7/Sp16TghtsTTuFqXErxn+dQii31
	 wBFuQPUGpqTedE4CPFMbvokVi6OLEsNQKYlK/SxG950y6IFQAi93xTdPZSevKYA9ac
	 6kky/YjN816tsndarmuMhMsGrzm3LOL5+VnyjxCXr1RoPfsZl5fR3dYpyIdKw4KgF8
	 lOzAbyOOPsWsdPPfWuhHiQsu+04o8NEKEcRp6eFnxrAPMpOSGLvMGrAIVSL54TpHZe
	 uZRzDyb/9lKQZ0R948wqSZY5KRkWPuzTPNIiHi/DAh7Z7+tRKd9gac6co3UjFfXLs1
	 lPFEVsFG9EEFg==
Date: Thu, 13 Nov 2025 18:16:42 +0000
To: Joanne Koong <joannelkoong@gmail.com>
From: Athul Krishna <athul.krishna.kr@protonmail.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "miklos@szeredi.hu" <miklos@szeredi.hu>
Subject: Re: [REGRESSION] System hangs on suspend after using distrobox container
Message-ID: <_Gt41eQ_dnFbfGcMH4LkwSqmCYBdQGfnPdQfBlAWwkohIUfDUwtdvpQa61Pk2FMD4B-ov2uVIG9FUCJu_GT67Qkde7e2oZdnnRMopuglZHA=@protonmail.com>
In-Reply-To: <CAJnrk1aepU0y55FNG3zDHhK4iPo80MtD+tE_PT+ExhD9SDUS_Q@mail.gmail.com>
References: <mwBOip3XK77dn-UJtlk-uQ1N6i3nwsKticZyQdPYzQcsk0dsjXl4oOAh-Neoxv-0TlpKnt_FEJwx8ses5VJglGLJUW-bIG8KWchtoDwCnnA=@protonmail.com> <CAJnrk1ZDEszGbyP4cRh7+mEPu9BLmPrY9Xb-Q3HZnxXZOV7Eag@mail.gmail.com> <CAJnrk1aepU0y55FNG3zDHhK4iPo80MtD+tE_PT+ExhD9SDUS_Q@mail.gmail.com>
Feedback-ID: 97021173:user:proton
X-Pm-Message-ID: 95d4e6af75153028aee937d35abee29c11c8ab3f
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, November 13th, 2025 at 12:33 AM, Joanne Koong <joannelkoong@gm=
ail.com> wrote:

> On Wed, Nov 12, 2025 at 10:50=E2=80=AFAM Joanne Koong joannelkoong@gmail.=
com wrote:
>=20
> > On Wed, Oct 29, 2025 at 10:47=E2=80=AFAM Athul Krishna
> > athul.krishna.kr@protonmail.com wrote:
> >=20
> > > Device: Asus Zephyrus GA402RJ
> > > Distro: Arch Linux
> > > Kernel: 6.17.6
> > >=20
> > > Noticed this issue after upgrading to 6.16, systems hangs when closin=
g the lid of my laptop. The issue is triggered by using a distrobox contain=
er.
> > >=20
> > > Steps to replicate:
> > > 1. distrobox create --pull -i docker.io/library/archlinux:latest --na=
me test-container --home ~/Containers/test-container --additional-packages =
"systemd" --init
> > > 2. distrobox enter test-container
> > > 3. Suspend the system
> > >=20
> > > Bisected to commit:
> > > commit 0c58a97f919c24fe4245015f4375a39ff05665b6
> > > Author: Joanne Koong joannelkoong@gmail.com
> > > Date: Mon Apr 14 15:22:10 2025 -0700
> > >=20
> > > fuse: remove tmp folio for writebacks and internal rb tree
> > >=20
> > > I was able to temporarily fix the issue on 6.16 by reverting 0c58a97f=
 and 7d0f0f06. Unfortunately reverting 0c58a97f on 6.17 causes huge conflic=
ts.
> > > Attached systemd journal logs.
> >=20
> > I missed this in my inbox until I saw Miklos's reply a few hours ago.
> > Sorry about that.
> >=20
> > I'll try to get this set up on my VM and see if I can repro it. Does
> > that distrobox command you wrote out in step 1) automatically run the
> > fuse servers on the container as well? And for step 3) are you
> > suspending the system with 'systemctl suspend' or are you doing it
> > some other way?
System hangs on either normal lid close or 'systemctl suspend'.

> >=20
> > From the logs, it looks like it's stuck waiting on folio writeback. Is
> > there a stuck fuse server somewhere that's not completing the
> > writeback request?
>=20
>=20
> Athul, would you be able to test if this patch fixes it?:
>=20
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -2694,6 +2694,9 @@ static void wait_sb_inodes(struct super_block *sb)
> if (!mapping_tagged(mapping, PAGECACHE_TAG_WRITEBACK))
> continue;
>=20
> + if (mapping_writeback_may_deadlock_on_reclaim(mapping))
> + continue;
> +
> spin_unlock_irq(&sb->s_inode_wblist_lock);
>=20
Yeah, this solves it.=20

>=20
> from [1] https://lore.kernel.org/linux-fsdevel/20241122232359.429647-4-jo=
annelkoong@gmail.com/
>=20
> Thanks,
> Joanne
>=20
> > Thanks,
> > Joanne
> >=20
> > > Regards,
> > > Athul

Regards,
Athul
