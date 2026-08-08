Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8779282F26
	for <regressions@lists.linux.dev>; Sat,  8 Aug 2026 23:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786232054; cv=none; b=ClUh9dj6bWK8cHggwY7uaM0OiLKQRDUy51YZV7+9AZ0Nh+ivX7rA39tkzJcRibfRtsc+SLLzxSlc+SnUzfFi/e70IY9P7lpraSBAb9J3LijjgjK0pleSTrpgmz7xkvf8OOMACtQJQwtTcvGrc0f7e/ahtHhyaOmojfhi9G4r/Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786232054; c=relaxed/simple;
	bh=GTh0JFslYViswkEzfhfRwr8aTiEetAY3l0PW7mUJHkQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c9irojJ01aXsmOH3PiBovEvCvFdYfHAP9dBjtDLuXwrI0Jn41YZBEH6NEhrr9+A5Ux7Ph63UAPovHTgYcxO1BZ7su6K6yBA8XvxW9HjUTM5AD8mBZBbY2Puuq6S/IMpnbPFmdAHhH6veqLIOo9uE0dIjLNBAiq0NZSCIE8fQ8zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KizvSMe6; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KizvSMe6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=co6yyqyzlrcc7d26slqtp2xwqa.protonmail; t=1786232031; x=1786491231;
	bh=UeFex5hr/f3/r9BnbZHKSCTGlDzLV8Nd44sec1id9ms=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KizvSMe6uD9nCcwE9pbisXXqwtGEBsEY49p6zabbFH6UpaSNjyt6AsU3Jgc73/74u
	 I4iD3qdBVAEGqCSBD9xYYeL7iNmfAZ/wuk0YEuGd9WGeYTpkWBWz/EYSOWHzsPEXKZ
	 sX1FBy4iylOZAtVtFkBZM34OzLnoGfBzw2tOWzAcqSjFpKWK/5/8faGvxhjD1kjJNb
	 DdWp7vC1ws2ZmRLTM3umUhaj7Tk76q09eacrEHRhhh4UkIPqb41KkC5gmCPQ7G/Yop
	 Ma9OAjs+KSfk+fFC6wJPQvwAqgLzNwrL7GjPNxgs4F65WKESq9UOBD5oolO2pOGCfP
	 6a1wGH/4TrEqw==
Date: Sat, 08 Aug 2026 23:33:45 +0000
To: "matthew.brost@intel.com" <matthew.brost@intel.com>, "dakr@kernel.org" <dakr@kernel.org>, "phasta@kernel.org" <phasta@kernel.org>, "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Luke.Wildhardt@proton.me
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [REGRESSION] drm/sched: FAIR policy causes serious performance degradation at max GPU load on 9070XT
Message-ID: <TfhgV1W0W5LI6RWUO6J35B3R8QIYH_FN3Eihzdo_9PH39hfn1AVByT-QBPHmWiAR-L0Kqi2sppM_EhFPKwZPGmb5pFgpF2MrzeFzkZDmpG8=@proton.me>
Feedback-ID: 214028577:user:proton
X-Pm-Message-ID: b2be153680247ee43884e865155ce540ad4365cb
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Since the DRM scheduler default policy was switched to FAIR in 7.2, sustain=
ed 100% GPU load in-game on my RX 9070 XT causes severe performance degrada=
tion. In the example title running through Proton, Project Silverfish, the =
foreground application degrades to roughly 10 fps or freezes outright while=
 audio continues, and the KDE Plasma Wayland session can lock up entirely, =
requiring a reboot or killing the compositor to recover. The problem is not=
 limited to games. Running the game in the background + alt tabbing, then p=
laying a YouTube video can also cause the entire desktop to freeze.=20

Then, if the game starts to stutter, either alt-tabbing, or opening up a me=
nu in game (which reduced the load on the GPU) immediately stops the stutte=
ring.=20

The issue is reliably reproducible under sustained GPU saturation, although=
 the time-to-failure varies. Increasing shadow load (which decreases in-gam=
e frame rate) substantially shortens the time-to-failure.

In game, MangoHud does not reveal any frametime discrepancy.=20

Bisection / test matrix

Reproducer: Project Silverfish (Proton) at settings that saturate the GPU, =
with a second GPU client active (browser video). Other titles show the same=
 symptom under sustained load; I have not yet re-tested those specific titl=
es against the fix.

Kernel=09Result
torvalds/master stock=09FAIR (default)=09FAIL
same as above + reverts below=09gpu_sched.sched_policy=3D2 (FAIR)=09FAIL
same as above + reverts below=09gpu_sched.sched_policy=3D1 (FIFO)=09PASS
7.1.5 release=09PASS
drm-next=09FAIR (default)=09FAIL

Reverted Commits:

d09339388b77 drm/sched: Remove drm_sched_init_args->num_rqs
2833a0512b4c drm/sched: Remove drm_sched_init_args->num_rqs usage
16e7698bc04d drm/sched: Embed run queue singleton into the scheduler
77a6809f1dc3 drm/sched: Remove FIFO and RR and simplify to a single run que=
ue
45c211ddf92a drm/sched: Switch default policy to fair
2462a0ce23b0 drm/amdgpu: Remove drm_sched_init_args->num_rqs usage



Kernel (failing):  7.2.0-rc6 (stock), also current drm-next
Kernel (working):  7.2.0-rc6-default-revert-00006-g7e5de9b07e3d with sched_=
policy=3D1
                   7.1 release
Distro:            Arch Linux
Session:           KDE Plasma 6.7.4 / Wayland (KWin), Qt 6.11.1, KF 6.28.0
CPU:               AMD Ryzen 9 9950X3D
RAM:               64 GiB
GPU:               Sapphire Pulse Radeon RX 9070 XT
                   03:00.0 [1002:7550] rev c0, subsys Sapphire 1478
Motherboard:       ASUS (AM5 / 800-series chipset)
Mesa:              26.1.6-arch1.1 (RADV, driverVersion 26.1.6)
Vulkan:            instance 1.4.357 / device 1.4.354




On the same reverted kernel build, changing only gpu_sched.sched_policy fro=
m 2 (FAIR) to 1 (FIFO) changes the result from reliably failing to passing =
extended stress testing.



Possible mitigation options

Given that 7.2 is late in the release cycle and 77a6809f1dc3 removes FIFO/R=
R as selectable policies, there is currently no runtime workaround for affe=
cted systems.


Revert 45c211ddf92a so FIFO remains the default while FAIR remains availabl=
e for further testing.

If necessary, also revert 77a6809f1dc3 and dependent changes to restore run=
time policy selection.

Alternatively, fix the underlying FAIR regression if a suitable fix can be =
identified in time for 7.2.


I mention the revert options because the justification for removing FIFO/RR=
 included the absence of known regressions relative to those policies. This=
 report appears to provide at least one counterexample.


I am willing to test patches responsively and collect data if necessary. =
=20

