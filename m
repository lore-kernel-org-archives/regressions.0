Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E45B2E7397
	for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 01:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781573140; cv=pass; b=SeFn4PeHkUE1E7yTVIKXTRhuhcSge8EkZdcSTRArzsXooY28krJpEhS3iNXatmVg0gw5yBg5c2p+DqnG1qT9Tq/SHM2dLiJJRD3qQPrYO7VF9l7XEYQUgpZprain2g6y7UrE/pJgabzkzMTIkNEGCizun3N9WtVyAHfMIq/w+k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781573140; c=relaxed/simple;
	bh=8ZWDRPXIPPON+VKKK+3tv+DwcJFH7k1tpUTtDI89Shw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jsCOArY8nffdDAP8NZ3YQkqrte4tUAn2UJC0VjkwWL61ala5hovjXUJC/WcPolPudCDYeQy24SiitL4f1Ito0tIocGpSPoTq7a25u/LrC1/B5SI79bBfb3ZAdqhpiXv1fke28aHil1cNqg25Kd82WQrh9tyduBwJbihnXaBbSCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSWo9ZZR; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSWo9ZZR"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-396775428d6so5228581fa.3
        for <regressions@lists.linux.dev>; Mon, 15 Jun 2026 18:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781573137; cv=none;
        d=google.com; s=arc-20240605;
        b=HI5XxDLJF6MIRvwb0ZMhmDej8SfXdFEuqEjDT8I3cH3Wr3ZNRqu+297pbenXqsdwjU
         iJeblLb+Tbu7jxOhPKABePXMAJ0kCDUAFD/dQICmnDAEcjI4pVfJpqxXjtjIShwtvrOC
         9gGRmu6QBYGncBv8z8bJSG0424SnYvfsobGXkBK4nrpGzivpFqR0fDLYO8Cy/E4sQui+
         BVECa9U/KPCiO3Yav5ATuRmsLg6IgQYWK+eDZ7BQ08HevSv9sW/Hbe40ySBYG4xMFYym
         XKB1o2nLRqLplR5a6oZteg6BLi6ITm2JYPCougbiSrQRtPcv7XeJIq5z1yys0cUOmYA1
         8now==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HMsk01wlY4p5T/k9NAK6h3kYTzO1USl5GZhsDzmQ1Vk=;
        fh=u8QOBLNv1ex4y5B/RshcJwGP317XYjJY+MJUj70VX6g=;
        b=dWLWm/BKxKbT+fhzxC9EA57B3WhunpWlOdqppc3mnbdS+/2PFJi1LNSDG/7Qtk4S5x
         Zd0NFvJbj+etY3ZzeCx2I04PXrgjN3+49Qb9G5ZwrE1hb5/AifvdLbcLOqtG0cuuBEKo
         J1nj5j2TuUZma8RK+uxgFRRR+U4MgMJjb3KJ1275z3qVzCGTPTUOlC4CMoQAp//Agx8q
         6PMkfDmN4aS0ID6bcyI5aHEjk+18Y/QLLjeRU68NAl1Kv7moL6LBjyladPITCB0XqIbY
         zOuJSkULHoTqvitVBwJtzpT8A1ePizgJ440jAZZsmw29HwohYEOPqHCPD+fq+vgByVm1
         vuQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781573137; x=1782177937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMsk01wlY4p5T/k9NAK6h3kYTzO1USl5GZhsDzmQ1Vk=;
        b=bSWo9ZZRWvsmKwDY/jJyCOIMm6UJ2Ohg5YOmE+LOJvAp2HnYm1D++0IrG7H2XwtE6U
         n2qToCXrdB1nVeem7MxFSV46Dw9+eU7quNMVR/bNyH5bQPduDmlfmH5rGztovjZjbHqq
         rO9Zyx1Jh63Uvlg/cVNZ6ZEIJ6sjIUepKX6Yqwk3+Abi4u+CNxGDCeoqZYUodqcBuxmc
         NlQjBg0KFta1euL85pKxgZFWhM9zkGxo5xkxpAAwc8HdNpi4Wwi/JIrM5JZW5tT0y7pu
         qoDvklz0ng93RM6TmlXaafW5x7OKpiBlDz99vWE4BWzhqxA/T9wdCDO8bJwFMGkSf/HX
         4TQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781573137; x=1782177937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HMsk01wlY4p5T/k9NAK6h3kYTzO1USl5GZhsDzmQ1Vk=;
        b=e/KiVohiQK5MCsEKpEe01Cmk0/X4KbD2bxriUz9Rsa97RIWGlSVTWfdapSIJN6cy5W
         ZzfPi0NPLYEvl2l8TEY8SCpOfdv4oek7ldvNZ1dI0FnFbs847Nda2SMEHyaQwfsZkLgf
         tbBE3HDCbZ+sy5okxMXer4i6vtkNhlG10r5l9LkuP2HNc9ILPiQn2WAVbckMMwx651GQ
         0+sVkt9CCMqnomjjPNIW7kafYahWIamCF3byVZ4lULwSmx/J7Fwgjlx5mnY4d/+59Nmc
         Biciw4wJiuRQGvymBaj9NEmz7ogzxDNfagOApKvdynKjlZh4PpHfzGIlt45q6JmlHGrh
         Yy2g==
X-Forwarded-Encrypted: i=1; AFNElJ/lSLCOUEuxYXZAR+JpNHVY34F6tTtJyGsMVSs6feU/j9mk9090hlsEHmFCIWR3oLvCDfY46DHAsfsGFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyeuKtcaxBgE7BX9cGzfkSPGC+jk3VkkJPrf0rbgaHqyrVOFdq
	3dbcj2ZvkIKDjaW8G5sUV7G8KZiZCLGdkkXBU1hze5OHL2jMk+ENnQ/9UdUpfP2396PCheI6V6J
	OClAGZKqfBqjpXTzRBcwFYUCJuDnKgTY=
X-Gm-Gg: Acq92OFKBoRU9tH/6FoDFCSaIhE95SQzcS0/bWFtRBi/vJt+PzIH0ftxw0tf5+lo3PJ
	xZtKFiWkUVLC06L8urRKdD8esUtw5kU4lGxhBm06gJ3sSNPby9XimOZmiPlwKCSscqIZdcgzgSi
	KJJ62Dy77enwaHIkD3D0/5s57SztPABcnKKOBmuI4AguB5ayi0X2OXRXWwBvzWitTGbSjqbPoW6
	rBrMkcalg3VxoH8YM7vZhxwcLxUpSq6y6MoMjtLOEOwx1QFSp5rcnWz3gHJ7xjaCvUAfB3/6GiL
	/rk7+wzRoCzup8cpopcUqWevR3/KF3vPeSb57aT9
X-Received: by 2002:a05:6512:12c8:b0:5ad:2ac0:9fb0 with SMTP id
 2adb3069b0e04-5ad2db7474bmr2458218e87.4.1781573136619; Mon, 15 Jun 2026
 18:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ai7rnH20IYeSmY8s@gallifrey> <165d3195-c81d-4760-870b-23a9a3b3b72c@leemhuis.info>
 <ai_1LYtofh1fwD-N@gallifrey> <CAC_j7i0eDccVWzPeRafM50mZEOFHPz2cwd=RZqqx6TK2EVRFvw@mail.gmail.com>
 <ajCTaUaACV9eNmWo@kbusch-mbp>
In-Reply-To: <ajCTaUaACV9eNmWo@kbusch-mbp>
From: Vjaceslavs Klimovs <vklimovs@gmail.com>
Date: Mon, 15 Jun 2026 18:25:24 -0700
X-Gm-Features: AVVi8CdeOn2G2EHhiSfuo8tXmtM_qTdklj5EzkCKuEDGG1otegoAzCBX5cL6vfA
Message-ID: <CAC_j7i2W5ihdGwTCKufsnU0KX3WQF-Xh3Bx8A+bog5cVWqrLFw@mail.gmail.com>
Subject: Re: Repeatable, raid1+O_DIRECT, hang/warn
To: Keith Busch <kbusch@kernel.org>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, Thorsten Leemhuis <regressions@leemhuis.info>, trnka@scm.com, 
	linux-block@vger.kernel.org, dm-devel@lists.linux.dev, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Keith,

Thanks. I tested both patches on current mainline
(v7.1-rc7-271-g424280953322) with my QEMU + LVM "--type mirror"
reproducer (virtio-blk, cache=3Dnone, aio=3Dnative).

With only the "block: check bio split for unaligned bvec" patch, the
hang still reproduces. The WARN fires from a kmirrord worker:

  WARNING: block/bio.c:1044 at bio_add_page+0x108/0x200
  Workqueue: kmirrord do_mirror
  Call Trace:
   bio_add_page+0x108/0x200
   do_region+0x21d/0x270
   dispatch_io+0xf1/0x150
   dm_io+0x136/0x240
   do_reads+0x13e/0x210
   do_mirror+0x117/0x2b0

and the VM then wedges.

With the dm-io.c clone patch applied on top, the WARN and the hang are
both gone. dm-mirror just fails the read instead:

  device-mapper: raid1: Mirror read failed from 252:0. Trying
alternative device.
  device-mapper: raid1: All sides of mirror have failed.
  device-mapper: raid1: Read failure on mirror device 252:1.  Failing I/O.

The guest still gets an I/O error, as you expected, but the host stays
up: no splat, no stuck task. For comparison, on the same kernel the
"--type raid1" case boots the guest and reads fine, and the 128 MB
mirror seed write goes through the clone path without trouble, so
normal I/O looks unaffected.

Thanks,
Vjaceslavs

On Mon, Jun 15, 2026 at 5:06=E2=80=AFPM Keith Busch <kbusch@kernel.org> wro=
te:
>
> On Mon, Jun 15, 2026 at 04:16:12PM -0700, Vjaceslavs Klimovs wrote:
> > Your trace looks like what the two earlier reports hit: a read reaching
> > a leaf device with sectors > 0 but phys_seg 0 (an empty bio). One aside
> > that may help read the trace: blk_io_trace.error is a __u16, so the
> > bracketed values on your C lines are errnos as u16 (65514 =3D -EINVAL,
> > 65531 =3D -EIO).
> >
> > The WARN itself is new, the bad bio isn't. bio_add_page() only started
> > rejecting len =3D=3D 0 in 643893647cac ("block: reject zero length in
> > bio_add_page()", v7.1-rc1); on 7.0.8 the same empty bio tripped
> > scsi_alloc_sgtables()'s !nr_segs instead, which matches what you saw.
> > That fits your "not a recent regression": the condition is older, v7.1
> > just made it loud.
> >
> > For Tomas's and my reports (QEMU O_DIRECT to the LV block device) the
> > origin looks like 5ff3f74e145a ("block: simplify direct io validity
> > check", v6.18): blkdev_dio_invalid() now checks only aggregate
> > ki_pos | count alignment and dropped the per-segment
> > bdev_iter_is_aligned() walk, so a degenerate or misaligned O_DIRECT no
> > longer gets -EINVAL at the fops boundary. But your reproducer reads a
> > file, which goes through the filesystem O_DIRECT path and never calls
> > blkdev_dio_invalid(), and still makes the empty bio. So it isn't only
> > that one entry point.
> >
> > dm-mirror then hangs because Keith's f7b24c7b41f2 only covers md
> > raid1/raid10; legacy dm-mirror (dm-raid1.c) has no equivalent and
> > rebuilds the empty read onto the other leg. Note the leg's status isn't
> > even consistent (your SATA path returns BLK_STS_IOERR, not
> > BLK_STS_INVAL), so copying that status check into dm-mirror probably
> > wouldn't catch every case.
> >
> > For what it's worth, that points me toward rejecting the empty or
> > misaligned bio once, at submission, with -EINVAL, rather than teaching
> > each consumer to tolerate it. But you'll know the tradeoffs far better
> > than I do.
> >
> > I have a small QEMU + LVM raid1/mirror setup that reproduces the
> > block-device variant and bisects to 5ff3f74e. Happy to run your file
> > reproducer with some instrumentation at the dm-mirror read entry
> > (bi_size vs bio_sectors vs bvec lengths) to see whether the bio is
> > already empty on arrival or built that way on the retry, and to test
> > any patch.
>
> Thanks for following up here. I didn't initially see your follow-up
> until Thorsten linked it. I apologize for missing that, this feature is
> important so I don't want to see anything regress for it.
>
> There is a known bug fix I think future tests should include:
>
>   https://lore.kernel.org/linux-block/20260612223205.465913-1-kbusch@meta=
.com/
>
> This likely isn't the fix you're looking for, but including it rules out
> conditions that are not important here.
>
> After that, can we try this suggestion and see if the hang goes away?
>
>   https://lore.kernel.org/linux-block/ajBb8tK-0aJBpIgF@kbusch-mbp/
>
> I expect the original test case to still return an error (and I think it
> was designed to), but it shouldn't produce the warn or bug splats with a
> stuck uninterruptable task.
