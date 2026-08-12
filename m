Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A8529BD8C
	for <regressions@lists.linux.dev>; Wed, 12 Aug 2026 04:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786510346; cv=none; b=IdodcvcXJ1T/uhuU+fp5J+Hoy5GokPYByVJaZkZf/uoi5shE2PbzY0d7HwUWkBgB2O44V471cZAU5VJj8b4vQdffk73yYyuBL6YHcB7ec9prb+65Q2SYaIRLtJNUXF8VPphvcf2O75a4krz9xrObp4Ex4okoEHlaO80kpsajXG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786510346; c=relaxed/simple;
	bh=/jtYA8UwzRfLTaO0w8NHSrjKQTDnDF4r8/q0+a2/wRg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKKzkxD6u+ql3CcXddCfgxcIdRVAQefNUElgwCo9KOwYgydrX7bgSNSgJ+gxtKOpIOFDl3GP92imHNqbE1Hu4FU9giVmbzwPP40X15TJdB+w2BjeVUsAv4e8xcDZsaLINHHUh6w3DMH+RNgoeIYoh33H5GkCw00vzS4qxXW1i7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ZC9O8bT4; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ZC9O8bT4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1786510337; x=1786769537;
	bh=QxpfgLUxNSdiBijKLdd2WbIDliEEu661/LABaYjzQfU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZC9O8bT46edEWPqoEo28iKLiC9RIM+R6DYPQ8de9X3CJXT7DiLV5c7yEPFD/7igmA
	 XzjlYW5CobKUWlXT0QrDAG+uLjQf/robI+5vi1mmmEVIbtj6nIuMZwU1sg1rrJ+JR7
	 exYpDyf5rruwyTKRVjthdikdY4+ieqF5Pr3cLp3iDOCU1gWrhOc5wptR64gReZJOwv
	 I4RdtcH8tdMiEmXPMmEVN0c3W17CvA7GU40bzcf3n6CdJC2HR1twzXWJ52GgK+vFJ+
	 DmtF7dI0lWsh/g+fY2F3Q2cMp/qBacZPaEPR/DbLNM8OKsDNR6Fq4VPGtXZ9L7hlRe
	 Ee9BOr8RmxeUg==
Date: Wed, 12 Aug 2026 04:52:13 +0000
To: Tvrtko Ursulin <tursulin@ursulin.net>
From: Luke.Wildhardt@proton.me
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>, "dakr@kernel.org" <dakr@kernel.org>, "phasta@kernel.org" <phasta@kernel.org>, "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [REGRESSION] drm/sched: FAIR policy causes serious performance degradation at max GPU load on 9070XT
Message-ID: <0cdzNER9iUvIoKj0xg2DofKCfvToYWAhxj4MWWVyePXAP__liqXLKh6BMul6p3ypc-MqEiNM4i3uwCx_qg0XPc71rpYNJchP8xjCEmDVyoE=@proton.me>
In-Reply-To: <938ef65f-231f-40e9-a9b1-327d5d91e53a@ursulin.net>
References: <TfhgV1W0W5LI6RWUO6J35B3R8QIYH_FN3Eihzdo_9PH39hfn1AVByT-QBPHmWiAR-L0Kqi2sppM_EhFPKwZPGmb5pFgpF2MrzeFzkZDmpG8=@proton.me> <938ef65f-231f-40e9-a9b1-327d5d91e53a@ursulin.net>
Feedback-ID: 214028577:user:proton
X-Pm-Message-ID: a179f2fa176cac2eba01ef3e32aba7ce803bc9ad
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Here are some videos I took of what I encountered

Stock 7.2.0-rc7
https://www.youtube.com/watch?v=3DDAmnZ25i1uA

The first patch you sent me:
https://www.youtube.com/watch?v=3D86kYUwGwv2c

My initial quick observation with the patch you sent me might have just bee=
n a fluke, or things were just right for it not to freeze entirely.

Additional games I saw this in was

Spyro: Reignited Trilogy
Hitman: Absolution

Same sort of deal, opening a menu (which reduced GPU load) recovered the ga=
me.=20

At least in the original game, Project Silverfish, and a small amount of ti=
me in Spyro, it appeared that playing with gamescope stopped the issue from=
 appearing. Maybe gamescope does something under the hood that changes the =
scheduling?


On Tuesday, August 11th, 2026 at 12:46 AM, Tvrtko Ursulin <tursulin@ursulin=
.net> wrote:

>
> On 09/08/2026 00:33, Luke.Wildhardt@proton.me wrote:
> > Since the DRM scheduler default policy was switched to FAIR in 7.2, sus=
tained 100% GPU load in-game on my RX 9070 XT causes severe performance deg=
radation. In the example title running through Proton, Project Silverfish, =
the foreground application degrades to roughly 10 fps or freezes outright w=
hile audio continues, and the KDE Plasma Wayland session can lock up entire=
ly, requiring a reboot or killing the compositor to recover. The problem is=
 not limited to games. Running the game in the background + alt tabbing, th=
en playing a YouTube video can also cause the entire desktop to freeze.
>
> Was there anything interesting in dmesg then the total UI lockup happened=
?
>
> >
> > Then, if the game starts to stutter, either alt-tabbing, or opening up =
a menu in game (which reduced the load on the GPU) immediately stops the st=
uttering.
> >
> > The issue is reliably reproducible under sustained GPU saturation, alth=
ough the time-to-failure varies. Increasing shadow load (which decreases in=
-game frame rate) substantially shortens the time-to-failure.
> >
> > In game, MangoHud does not reveal any frametime discrepancy.
>
> What exactly did you mean by not revealing discrepancy? Game is at 10fps
> and HUD shows 10fps? Or game appears to stutter but HUD shows "normal" fp=
s?
>
> > Bisection / test matrix
> >
> > Reproducer: Project Silverfish (Proton) at settings that saturate the G=
PU, with a second GPU client active (browser video). Other titles show the =
same symptom under sustained load; I have not yet re-tested those specific =
titles against the fix.
>
> Could you list the other titles which showed the issue?
>
> Regards,
>
> Tvrtko
>
> >
> > Kernel=09Result
> > torvalds/master stock=09FAIR (default)=09FAIL
> > same as above + reverts below=09gpu_sched.sched_policy=3D2 (FAIR)=09FAI=
L
> > same as above + reverts below=09gpu_sched.sched_policy=3D1 (FIFO)=09PAS=
S
> > 7.1.5 release=09PASS
> > drm-next=09FAIR (default)=09FAIL
> >
> > Reverted Commits:
> >
> > d09339388b77 drm/sched: Remove drm_sched_init_args->num_rqs
> > 2833a0512b4c drm/sched: Remove drm_sched_init_args->num_rqs usage
> > 16e7698bc04d drm/sched: Embed run queue singleton into the scheduler
> > 77a6809f1dc3 drm/sched: Remove FIFO and RR and simplify to a single run=
 queue
> > 45c211ddf92a drm/sched: Switch default policy to fair
> > 2462a0ce23b0 drm/amdgpu: Remove drm_sched_init_args->num_rqs usage
> >
> >
> >
> > Kernel (failing):  7.2.0-rc6 (stock), also current drm-next
> > Kernel (working):  7.2.0-rc6-default-revert-00006-g7e5de9b07e3d with sc=
hed_policy=3D1
> >                     7.1 release
> > Distro:            Arch Linux
> > Session:           KDE Plasma 6.7.4 / Wayland (KWin), Qt 6.11.1, KF 6.2=
8.0
> > CPU:               AMD Ryzen 9 9950X3D
> > RAM:               64 GiB
> > GPU:               Sapphire Pulse Radeon RX 9070 XT
> >                     03:00.0 [1002:7550] rev c0, subsys Sapphire 1478
> > Motherboard:       ASUS (AM5 / 800-series chipset)
> > Mesa:              26.1.6-arch1.1 (RADV, driverVersion 26.1.6)
> > Vulkan:            instance 1.4.357 / device 1.4.354
> >
> >
> >
> >
> > On the same reverted kernel build, changing only gpu_sched.sched_policy=
 from 2 (FAIR) to 1 (FIFO) changes the result from reliably failing to pass=
ing extended stress testing.
> >
> >
> >
> > Possible mitigation options
> >
> > Given that 7.2 is late in the release cycle and 77a6809f1dc3 removes FI=
FO/RR as selectable policies, there is currently no runtime workaround for =
affected systems.
> >
> >
> > Revert 45c211ddf92a so FIFO remains the default while FAIR remains avai=
lable for further testing.
> >
> > If necessary, also revert 77a6809f1dc3 and dependent changes to restore=
 runtime policy selection.
> >
> > Alternatively, fix the underlying FAIR regression if a suitable fix can=
 be identified in time for 7.2.
> >
> >
> > I mention the revert options because the justification for removing FIF=
O/RR included the absence of known regressions relative to those policies. =
This report appears to provide at least one counterexample.
> >
> >
> > I am willing to test patches responsively and collect data if necessary=
.
> >
>
>
