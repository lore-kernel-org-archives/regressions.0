Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795238630;
	b=Ypl3tDiPcmndqZTDvrfAgqKRDA6pewPN7zRuMuUufsPhEyhsnOALu4BEevUcIjKQxzUe
	 gMxV+VlQGLTNqOdvFO2ieCSIE1wmm+QiYZp7a9O2QR9d4UC9rk6Ana29iTw6qbByGe6WO
	 En8LpbnPpel0heFyTpB+oZgRx3KumNjR9f79qfaa49qahO2B44GFxQSCjmui/KClceZrb
	 5syN4VWkxTdSWY364YPdjXtG7yVb1VrXMfmFR133ZbwaT3FvMM05d5Z92OGC1qy9AnX20
	 ABS+0Oxw/y3lbNBiGvf7LoImbige8jUM1VgzPt94qv8blVyU/zIcEcG4p5bQLhtKPQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795238630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZxgWGW3Jd0IDrSARARfAMJtvz5q15JiqcmzOCWYp1E0=;
	b=i0GbA1w8ukfYLAXZvvz4JW/KKbUglQhrvCFK9SQ7OEVf8Z6mF1zOFdNrJ/kjsry5b26Y
	 SRabiEb2i1iZXJXfSuGiRPzuKGxd9tclrnQ8uTCAC/OKEZngXi94/FooMxoSSQ2gE5awZ
	 tX5hd8qjAbbcNSQYal80YU1sdE05jAjkuUQmxO/rHDkBAUPfok5AZW5j3+kzhy6pTUSG1
	 KCGGtGBCyu1s1OIWn7F5BvSVP+TISnqzzBKF2th7AkDIcfNDGnzyl8+ep81S1Td8r6N1F
	 In4mPO7R81T7YqDlfJKOAUM6LfRdr2SeZLEcmagtwU+gdtuUDtrgSAChHwKJZluT37Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWO4td4V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158A6606A68F
	for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 05:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 158A6606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWO4td4V
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b28d9537bcso1092910b6e.0
        for <regressions@lists.linux.dev>; Fri, 20 Nov 2026 21:23:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795238628; cv=none;
        d=google.com; s=arc-20260327;
        b=PBKJAKQ0otlO1RE0NU1rWyV+T8JTWHQRVqBo0P3Tqm42tDXgNV8zjmntV1gjyK3vS5
         g9CNZPHNugapCJcr6sU7pb5LWK6TC3ssJPExeEKBRKlR15Vp9F+Ma/9vT9qKiuv+EfYa
         tXwDZhA/t+GmOR0UtaEQi6sgIJH4euXpAEE8Ti9AIkbBHTpwWTBkN08IkFFuEYM+Q5pU
         5dMlhNU1OQi7ydOx5uctFHQDDZdORlDpOj+s15yojjLs2ISSLYAw/nLd54u2g3Nm+0qg
         SaHfeoXofIs7oc8lzpuYGQjKPWRZaDrLkrXGr7Qg82ZkP//hxHnJwx1Vjz319lWHWQ8w
         tTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZxgWGW3Jd0IDrSARARfAMJtvz5q15JiqcmzOCWYp1E0=;
        fh=jRZ1jEhgBMylayJlDth1hbsBS9f0LRnF5+B40lqcMgA=;
        b=WwdT4FeJr0QmzzdxtijxjLOOiN5rXcp9GJbAWyF/py0SlGrqmQthJQw7X/KVCw7NcH
         K3zv1uH0W1odHKZGshvVYr2D27dzZ5rPOjy9Ds+zcmnBDLQgf8F69ghh5k53kxUPYxaG
         e0eYFuS1Aea/REjGu2KmilDvlDK5DeYRZ4nzUaanspXbwXbmUjKKteh8ZV6PJtYpTC0D
         2IpfmCHv552HFB+GAI0EP77G+2nmAzMU6zCpKEYZ+vMpcY9jbKMpOCXgEesCWGasD1C9
         YM8toVK2WV/qgV2WL1etLER4B7mudtr41tzZAh1oajmfBgaZjVKG/hRxlxSnW5NQgKwe
         GbHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795238628; x=1795843428; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZxgWGW3Jd0IDrSARARfAMJtvz5q15JiqcmzOCWYp1E0=;
        b=hWO4td4VtlJ8V+PQNRVnsQ8YvacPUbK7Ss9BqyOPQ2+oi8DntdGDVHJCinUxZXmqcA
         XmrR4Lnrkuvzof48MGjvJlufSS4SW72aUyyRNJ9mACRhvId2ipnVwft8+3/loVIUjupi
         kArOJar/k+Jv1riFNogrNZPEDtZSAdd3ukGJ8QcQ0hTQyfwxFOxhQknpus04+B1ihjCy
         snE3yhTKqQ2/n/hCOrw/UeSQLqw/UqAah4zZsihCLF9Qaif5z4zep4XKOUAl/vxkbhVB
         cWlNxoqRN9EFTVnrzUYklHt8dNYLIAVWgmdcPUk3JXU53yqw2HRcMZtFmwmJAZUzv2mG
         FHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795238628; x=1795843428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxgWGW3Jd0IDrSARARfAMJtvz5q15JiqcmzOCWYp1E0=;
        b=SNsmVQo1J+C+NH06uICvDE2a/S2ZClQyYw1UWugKi0xRV/ved1coOc3/05obVH83XW
         Iwtq/9ZKtz4bBqP6uzWbvA2ntsyoO1bjWLyMnYMYVSyqAKKNY2MhRM9oXyO2AhlSBsRh
         CZkWk4QBxzZLhGB+TgP9+v/i5CjjvHCqdKDmw0cxVdajJWFzVyF1E7psEPrvnF+Lfs/H
         1/deU+QGeCEPGVb3pLtqkQmgB6aDZxNP7z4j7xEKhi3r3adIkLy3h0bqyKtZ6n2nQ/BX
         bMAnYk5p0yzdLl51w/dQWf8XRzV2wO5zZpj/Hsdm/K1faA8OxADN/1xPUuFNqnKPawSn
         tPEA==
X-Forwarded-Encrypted: i=1; AL+hErGveIF1ClFJaOGNKJYZ3KVdAuW60GTgwKVxiDkcmM74FJUtMDOujkQ/nSNMceA5/ynYhzHW16eqa6jXvA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9KQnnB7bjZ5vMm+W5P/HVyKyxvJUqhSFVTvjo1VJOgLe3I/0Sh
	soBgrfjqhg9SPlhH5PHI0oLLE4sEhZ3fVvmO0rCBOGMOMeGRYRKQe7dwvHyZ8oGkLY5MzQznnIj
	jRrv4DvcJlb098eGCHI9/gE6oA0OIhOE=
X-Gm-Gg: AYBFou3xrqUYsON6XGn9+C1jXh4EnokYS0WQU8MzXyTQbGbllqh5GBikyYSP2G38Gg+
	sZNPwFaAKe7XSvpavG79FXs+svSh7y/Sdjql/4lhhY4rQCfic69/mLU/fVd43pn2tksjukwbcgf
	feWnKVeqeukIJjXndhRF4qhHt7vG4B8L1Ubm4o4YhLebuN8XQAaMuAhQhAmiYtBNTj+Al6la7gF
	yCdcg6fhBAokhbO/wc+6sXQQGmMrgi3T90sBqu3FIJtNSfCzY0U4Ax9jG9wMdexFloMj4NFojA0
	x7zpMywLF3x8Qzkl4JY+oUKXXcQs6QcLX7QgGk6uK9Z76Aoj2CcStj+fd4GAbraNyeJXuzoutPM
	JDo6csSMyOwlkNcZtkjiv4g6prIwVEqxeku/zHLgXpgWt990TNKeOH7b4hhGRPEmHWws6nsOAQZ
	E9qrhpLoJ7hVzYS2OnPXiKbWku4OaY2c87RSPxkVPtagdrzOZVrmD3GcnRug==
X-Received: by 2002:a05:6808:4f0f:b0:4f5:dc0d:e013 with SMTP id
 5614622812f47-579789cf52cmr6048212b6e.4.1795238628066; Fri, 20 Nov 2026
 21:23:48 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAFS5DSFUi28HgX8t5bRRGVqPkOZ+VqrP+LtyMiwPQhyRpTxFTg@mail.gmail.com>
 <556c4720-0159-4874-8d5b-6379566f6d4a@bsbernd.com> <CAFS5DSEhgk8fJgAwEn+-U-7vnBchCrx6L1uReT3Upm+AA22=Wg@mail.gmail.com>
 <CAFS5DSEsdz8Eu1vmeCkE+6eeXgk+9yS6EwqyHSeD2jkq90DZaA@mail.gmail.com>
In-Reply-To: <CAFS5DSEsdz8Eu1vmeCkE+6eeXgk+9yS6EwqyHSeD2jkq90DZaA@mail.gmail.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Fri, 20 Nov 2026 23:23:35 -0600
X-Gm-Features: Aa3M54r-1Qm2wOa9Pkp5dJnwKyl6aDgAycS9C5SRiXFExx6r8aHR9F25Y7zOCvQ
Message-ID: <CACVXFVPEaJ6oPOaoZZo_XMpywHCzFWSYCrKG=srEDpCqPRp=Dw@mail.gmail.com>
Subject: Re: [REGRESSION] ublk: dispatched IO intermittently never posts its
 fetch completion (v7.0)
To: Luciano Lo Giudice <lmlogiudice@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, linux-block@vger.kernel.org, 
	io-uring@vger.kernel.org, regressions@lists.linux.dev, axboe@kernel.dk, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 8:26=E2=80=AFPM Luciano Lo Giudice
<lmlogiudice@gmail.com> wrote:
>
> Hello everyone,
>
> Using Bernd's repo, I was _unable_ to reproduce the bug after several
> runs (it used to hang in about 1 out of 3 runs). I had to add a small
> compat layer to make the module build in 7.0, but it was overall
> pretty easy. I will be now using this module for any development on
> 7.0 (thanks, Bernd!) and will report if any other issues arise.

I can't reproduce it on 7.4-rc, and we did merge many similar fixes recentl=
y.
Unfortunately, 7.0 isn't a stable release, so can you move to 7.3
stable release?
Otherwise, you may have to sort out the backport by yourself.

Thanks,
Ming


>
> All the best,
> Luciano.
>
> On Fri, Nov 20, 2026 at 8:40=E2=80=AFPM Luciano Lo Giudice
> <lmlogiudice@gmail.com> wrote:
> >
> > Hello Bernd,
> >
> > Yes, I can do that. I'll go ahead and compile ublk_drv from your repo
> > for the 7.0 backport and see how that goes.
> >
> > All the best,
> > Luciano.
> >
> > On Fri, Nov 20, 2026 at 8:27=E2=80=AFPM Bernd Schubert <bernd@bsbernd.c=
om> wrote:
> > >
> > >
> > >
> > > On 11/20/26 23:55, Luciano Lo Giudice wrote:
> > > > From: Luciano Lo Giudice <lmlogiudice@gmail.com>
> > > > To: linux-block@vger.kernel.org, io-uring@vger.kernel.org
> > > > Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
> > > >     stable@vger.kernel.org, regressions@lists.linux.dev
> > > > Subject: [REGRESSION] ublk: dispatched IO intermittently never post=
s its
> > > >  fetch completion (v7.0)
> > > >
> > > > Hello everyone,
> > > >
> > > > I'm writing a library that implements various block devices in user=
space by
> > > > utilizing the ublk framework. Every so often, I'm hitting a complet=
ion loss on
> > > > Linux 7.0, in which an inflight request is lost forever, which lead=
s to an
> > > > unkillable process and a ublk block device that cannot be torn down=
, and so the
> > > > machine needs to be rebooted to remedy this. I've tested the attach=
ed reproducer
> > > > on 6.8, but found no hangs after many runs. Details of the bug are =
below.
> > >
> > > Hi Luciano,
> > >
> > > I just scanned the io-uring list and found this by accident. I have b=
een
> > > working on this for a couple of month.
> > >
> > >
> > > Would you be open to test a specific branch or dkms module? I actuall=
y
> > > wanted to send this to upstream last months already, but then found a=
nd
> > > fixed (with a lot of AI help) more issues and also got busy with othe=
r
> > > tasks.
> > >
> > > https://github.com/bsbernd/linux/tree/ublk-stop-races-with-tests-for-=
7.3
> > >
> > > and here the backports, that also work on 7.0 (with a compat patch) a=
nd
> > > that is used for our dkms module
> > >
> > > https://github.com/bsbernd/linux/tree/niova-ublk-7.1-fix-backports
> > >
> > > The 7.3 patches are actually verified through tla+ and an ublk branch
> > > for https://github.com/brauner/linux-formal
> > >
> > >
> > > @Ming the patches for 7.3 include heavy ublk state changes (it is now=
 a
> > > bit closer to what fuse-io-uring does) and also adds debugfs that can=
 be
> > > used understand state issues.
> > >
> > >
> > > Thanks,
> > > Bernd
> > >
> > >
> > > >
> > > > 1. Environment
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > - Breaks on 7.0.0-31-generic and 7.0.0-43-generic using the kernels=
 that ship
> > > >   with Ubuntu. Tested on amd64 and the ublk_drv module.
> > > > - An identical binary was run on 6.8.0-117-generic but no hangs wer=
e reproduced.
> > > > - This was run on virtual machines provisioned with LXD and with 4 =
CPUs.
> > > > - After reading the code, I suspect the issue arises due to the 202=
5 rework (the
> > > >   list batching first appeared in 6.15 and the per-IO task tracking=
 in 6.16).
> > > >   I have not run any kernels between 6.8 and 7.0
> > > >
> > > > 2. About the attached reproducer
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > - It's a single C file that requires only liburing.
> > > > - 3 devices are loaded (2 are file-backed, the other memory-backed)=
.
> > > > - A fourth device is added, started, loaded (briefly), stopped and
> > > >   deleted in a loop while the others are under loaded. This is the
> > > >   fastest way I found to reproduce the issue.
> > > > - On 7.0, this hangs within the first 2 runs. On 6.8, no hangs were
> > > >   observed after more than 10 runs. When the issue is detected, the
> > > >   program prints what evidence it can gather (per-device inflight
> > > >   operation numbers, the running threads' waiting channels and the
> > > >   io_uring's pending CQE counts).
> > > > - Bonus: 2 additional bugs where found when shrinking the workload:
> > > >   A queue was leaking its io_uring (keeping the chardev pinned), an=
d
> > > >   START_DEV issued for a queued that had died before arming. Both s=
talled
> > > >   the program identically on 6.8 and both were fixed in the attache=
d version.
> > > >
> > > > 3. What indicates a failure (from userspace's POV)
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > >
> > > > - The issue is always connected to a READ request:
> > > >   /sys/block/ublkb$N/inflight yields "1 0" and is never modified ag=
ain.
> > > > - The thread that handles the queue is blocked in io_cqring_wait (a=
s seen by
> > > >   inspecting /proc/$TID/wchan), byt the ring has no entries to cons=
ume.
> > > > - The ublksrv_io_desc for the corresponding tag was written by the =
kernel
> > > >   at dispatch. The server reads descriptors after a CQE is posted, =
but
> > > >   this never happens.
> > > > - There is no way (AFAIK) to recover the tag. The lost completion i=
s the
> > > >   one that would set UBLK_IO_FLAG_OWNED_BY_SRV so a COMMIT_AND_FETC=
H for
> > > >   the tag is rejected (returns -EINVAL).
> > > > - Something very similar also shows on the control plane, which is =
why I
> > > >   suspect shared implementation details rather than something queue=
-specific.
> > > > - START_DEV, STOP_DEV and DEL_DEV will occassionnally never post th=
eir CQE
> > > >   after the kernel provably completes. In one capture, the deleted =
block
> > > >   device was already gone from /sys/block when the caller's 30 seco=
nds
> > > >   time bound fired. Repeated re-enters never produced the completio=
n.
> > > > - DEL_DEV was seen stalling 30-90 seconds on the kernel for operati=
ons that
> > > >   should complete instantly. The io-wq worker thread was blocked in=
:
> > > >
> > > >   ublk_ctrl_del_dev
> > > >     del_gendisk
> > > >       blk_mq_freeze_queue_wait
> > > >
> > > >   the device was stuck half-deleted, and it reacted to ADD_DEV by r=
eturning
> > > >   -EEXIST for minutes. In the worst instance it survivied its own s=
erver
> > > >   exiting and stayed un-deletable (needed a reboot).
> > > > - A START_DEV completed with -EINTR. The process was detached and a=
rms no
> > > >   signal sources. I didn't capture the pending signal set in that i=
nstance,
> > > >   so I cannot rule out a spurious signal, but the same op's immedia=
te retry
> > > >   stalled for a full 30 seconds.
> > > > - Not needed to repro the bug: COOP_TASKRUN, readahead bursts, even=
tfd wakeups.
> > > >
> > > > 4. Aftermath
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > - AFter the request is lost, teardown hangs and takes the control p=
lane with
> > > >   it. Looking at /proc/*/wchan and dmesg of a hanged instance shows=
 that the
> > > >   teardown uring command (running in an io-wq worker) is stucj in
> > > >
> > > >   ublk_stop_dev/ublk_ctrl_del_dev
> > > >     del_gendisk
> > > >       blk_unregister_queue
> > > >         elevator_set_none
> > > >           blk_mq_freeze_queue_wait
> > > >
> > > >   And the message printed by the kernel is:
> > > >
> > > >     INFO: task iou-wrk-2115:2118 blocked for more than 122 seconds.
> > > >     [...]
> > > >      ublk_stop_dev_unlocked.part.0+0x38/0x160 [ublk_drv]
> > > >      ublk_ctrl_uring_cmd+0x629/0x830 [ublk_drv]
> > > >
> > > > - Subsequent control command hangs on the control mutex:
> > > >     task iou-wrk-12720:12721 is blocked on a mutex likely owned by =
task
> > > >     iou-wrk-12626:12629.
> > > >     [...]
> > > >      ublk_ctrl_get_params+0x8b/0x190 [ublk_drv]
> > > >
> > > > - Killing the process doesn't help. The worker thread keeps waiting=
 on the
> > > >   queue and the frozen queue waits for a request whose owner (the s=
erver) is
> > > >   gone. On 7.0, ublk_timeout(...) only takes action for unprivilege=
d devices by
> > > >   SIGKILL'ing the server. On privileged processes it retursn BLK_EH=
_RESET_TIMER
> > > >   so a lost request is re-armed forever and never aborted, even whe=
n the
> > > >   server is dead.
> > > >
> > > > - When the process exits, the io_uring io-wq teardown warns while a=
 worker is
> > > >   still stuck and the process remains a zombie. The following messa=
ge is
> > > >   printed by the kernel:
> > > >
> > > >     WARNING: io_uring/io-wq.c:1370 at io_wq_put_and_exit+0x10d/0x2e=
0,
> > > >     CPU#3: live_server_ram/2115
> > > >
> > > > 5. Where I suspect is the problem
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > - Evidence points at the completion side of the 2025 rework.
> > > > - per-IO task tracking ( ("ublk: require unique task per io instead=
 of
> > > >   unique task per queue", Pure Storage, 04/2025,
> > > >   https://patchew.org/linux/20250416-ublk._5Ftask._5Fper._5Fio-v5-0=
-9261ad7bff20@purestorage.com/):
> > > >   our fetches are all submitted by the queue's own thread, so io->t=
ask
> > > >   should always match at dispatch time;
> > > > - rq_list batching: ublk_queue_rqs() coalesces same-<ctx_handle, ta=
sk>
> > > >   requests into one list and queues a single
> > > >   io_uring_cmd_complete_in_task(io->cmd, ublk_cmd_list_tw_cb) for t=
he
> > > >   whole batch. If that single task work is lost, every request in t=
he
> > > >   list strands - the observations are consistent with one lost requ=
est per
> > > >   occurrence.
> > > >
> > > > 6. Follow-ups
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > - Does this ring any bells in the 7.0 completion rework (lost task =
work
> > > >   for ublk_cmd_list_tw_cb / ublk_cmd_tw_cb, or io->task mismatch ta=
king
> > > >   a path that neither completes nor aborts)? Is a fix already in
> > > >   flight?
> > > > - Independently of the completion loss: should ublk_timeout() for
> > > >   privileged daemons fail a request whose ublk server is gone? Toda=
y
> > > >   BLK_EH_RESET_TIMER keeps a lost request - and with it the del_gen=
disk
> > > >   freeze and the control mutex - stuck forever after server's death=
,
> > > >   which turns a single lost completion into a machine-level hang.
> > > >
> > > > I can test candidate patches on 7.0.0-43 or bisect across 6.15-7.0 =
on a
> > > > VM, or capture the trace of a missing completion.
> > > >
> > > > #regzbot introduced: v6.8..v7.0
> > > >
> > > > Best regards,
> > > > Luciano
> > >



--=20
Ming Lei
