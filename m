Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795218031;
	b=Yd1Ic4CTMrYuYkmk/nLCDTzwKuTkNsgL/SAmnzDHAZMeqS2R3dHWXqBcPZ1p0wURN1aq
	 3mEYgzlPS6U8Uwnhc4bPxArS4uQLHg/b8iGj2VhIZuWPXBtgyCh+uniGj2j1I78GhdbMT
	 hVB9sR9hqpHQOFbuH5PwreHwLJTDQZhNScUh72UIK8zIip6/mXWelqY5zDIK21zWR+/P2
	 k10F2e4/7UAoYU8GLuma/pQFkmdiC+juvdo3l+I+GETFvivShNbwRX30ByfSc1/Xq91l7
	 81L6hTrBpSkTKV58e2+pPCJKqUJK4GxC5fa5Lp/ams06QRZtSM4LuMm5BVKWxZQtKLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P575Q9brE/+upDEGKX8xapQROmOnKTqfCZs6ZbbAFyE=;
	b=z9z4pJlslNFaSeq5wFm/okq382+aJTXDHNZAMKZfFHlOLxbEGfE3v3k6BzoshE8Ij5Bi
	 r6pVdsM4T9XJW7bWS+7/2pbjJlEgd4qtvPxODfrm/99SV3OsAei0O3DLNHCyZIohmLBIT
	 ihCApzXiJ1ubeNkpCJOEOokQY4/ujlLbHvKvV92iI53xf0L2ahkY+ckix3B5EIwUdoTqY
	 lPO2Wdd/TetYnVajaFk4wqCqLL2gJgcq3u7LfTgd3rZ+MJ/ovviFd1bdnbDnSTRB6plY3
	 lHflvjx7yZ949u2KS43vYenfmlhYvv+jawZO0uWrs5EAPnN5DMmhShpaTQ4copdabDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gT521Gov;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A42606A6A9
	for <regressions@lists.linux.dev>; Fri, 20 Nov 2026 23:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A42606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gT521Gov
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67db35e7953so1695736d50.0
        for <regressions@lists.linux.dev>; Fri, 20 Nov 2026 15:40:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795218022; cv=none;
        d=google.com; s=arc-20260327;
        b=VT648hIGWsBCZHqM1auWTy3SjLwhz1VUZD+0Zumy/8E6IrY6aSXk9W4yJPuSd+SUqi
         Ma/ZfE4QqDiGYeEgwaEzQbSYvc00BttSxO4KgwEZ2PYDb5HNrpi67f/VkIIVxZpp/Z22
         NqAOeL9LNjZ35oftq1at0EfEZApEhExbdPS3f2l6EAkw/g3DyjGbAwZ0/Tcmb5wqHidQ
         5ho/M+UG0CRAo77ZjNliOV1NEgw3rxB9PdzUupHtWIQTQc6LUwLX+mk/JTRPEoDZWO9b
         /jMSSUsISQ4PW/6W31BCSPAvpPduacrNrcZS5VrPYWeCs29cj2a/rDJVpspiWVzAXCgD
         g/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P575Q9brE/+upDEGKX8xapQROmOnKTqfCZs6ZbbAFyE=;
        fh=dceltLvc+sPmHLKZyoKIeZgaca3NC3UqLS+xDjicP/s=;
        b=QTHCgrRcyQ4xRrd/WDn6CRxy5yWLtWw4L5y5928hcfsvhlbrTHNrYdzyRnww9pYiwJ
         gzsvEzBfo3jpmBovcUcINfPWv8rPdYUCgV14U99vka+1TVG/0aFc0W2A7zVywAg/VwW1
         CG/y4GUYY7KUe/XqpnxSsZlv1hSsDuotpc4QURSwgr9zjK5XMeb7TU67+Ph36d/GR18y
         Vm0Mxh7uXnOH5thqjf/LrYivFaihj2Q8A5xsv7jO+/j/43QGAocFqguksVBHtXLlepy4
         70ahVavn0XDTQs0KtBDF6VjIVLOsGEd7bi4AJWF4JqEEeTnFx3coLY8LrSQ+DYKbmnNl
         sQXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218022; x=1795822822; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P575Q9brE/+upDEGKX8xapQROmOnKTqfCZs6ZbbAFyE=;
        b=gT521GovXSXyX09pPJanWN/zptDjpZcFiev8uzNuD6Jvmo7FE2KflY3KwbqovTv0Gy
         qLMA9YZwarKUDiiVYzSFBnZIitWjSI+IMfGZnamyh5jVzfAGum8VMuYykgjiV4r9u8k4
         Y0OQvNab7QY9uQde4a0RLjHPDEV5ccXvvgK+mM8oEjIeNms+NzG/JH/ZP0L5N6Pml+0N
         abQo8SBocoyHZxdTxTFL/faxLdrqa3DdAftLaK9AN7nLR0Nw6jVFEmURLU5BLkqWu+O9
         4/1zwGDhz36NmDZZM5sX0GQ5d0LHFqN3EYo8/sDU5EXiHZjwAqql1lVRfBRdepuyj7Rq
         +j3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218022; x=1795822822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P575Q9brE/+upDEGKX8xapQROmOnKTqfCZs6ZbbAFyE=;
        b=Qjk6f0wQcLHnmsmLCMBPa4dif6WrAj6PviskUCDIcW6OCnKv7wcrH6dLxgiJy77h2u
         fTNCuMr3Sq3V6CJRnJvzG+QtIEzrQBzdDT374OQ+F5W2va7Di5wkKnSYTVTWNjf9y3zN
         ZJYm5lG5QzAtr80VJVjlCYphclv3KYF/TU3JFdD8/XWm4GMZQ35IrJWPBYFMoxOBU0D5
         OjcMM0IcYojw8j1io5Tvig6h2i1lcDImkf2VinPG/N3qisrrr7uC5DtNEeAAGhJaZJeV
         7vp8pZr2tCVb0Ryf0gNacFwVqpCF8AAsPIn74caBYW7vvtWf2J4Z6iGQTf7bYZJJoBae
         R5Jg==
X-Forwarded-Encrypted: i=1; AL+hErErMJTprDZh7z4kn3ZvBy8eQbPrgTnzV6mw868NA0f0US3VcETV9e2/cDcpNgMmoiGCa8pSU1Vr3A9vFw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9RIok6oLod8oy27dlz1SxcGxAbk8CcCSxrjH439H+RSKUFhnEH
	juF3bNU2ojDRivj8hXdjpd+K+F2u4zfQpYPRDVO/kYGgPyCojwiPGksbmtv3SamJ55uzNsry91o
	/GAGjnO6LY8202xRbkc1nww/n2Mm75/Y=
X-Gm-Gg: AZFdTZdpNaMpefhMEpfPunkRKtEq8LbB8rtFChtA8XE9Rr++YrHamz4MWkKDaUcYjbF
	S/qGGss6fdovmbRiDyIkbQ7epnrGDG7GX+dABfSKhYxfQefxuVbab2ZMwv2xqo0bP43CVcHcWzO
	YOSrIg8DxznQcq6HF4C2NRrsE/27f0deAm1BS501AYSPQ/No8UTL/ZdtgBbY4k8vYBo2UGK9qxa
	miMXaMAZ0uk5WXMQ/Yz+fhRsBW6Bq0IxiAaDhTlgaW1z3XPYN770HVqBaEyW6CyONnFOuo0DHv7
	aqzuxIZF7ytohitt6EC0luTZdvAoSQYiq6E/rfJQT0KOm4Glq3RF0NSbuKClha47KFSGABBJK7s
	Y19Ql7KD/tlOjG/NxbINqGvQL68ecEAn/gXY=
X-Received: by 2002:a05:690e:478f:10b0:67d:c046:4f74 with SMTP id
 956f58d0204a3-67df44234b3mr1082543d50.25.1795218022001; Fri, 20 Nov 2026
 15:40:22 -0800 (PST)
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
 <556c4720-0159-4874-8d5b-6379566f6d4a@bsbernd.com>
In-Reply-To: <556c4720-0159-4874-8d5b-6379566f6d4a@bsbernd.com>
From: Luciano Lo Giudice <lmlogiudice@gmail.com>
Date: Fri, 20 Nov 2026 20:40:09 -0300
X-Gm-Features: Aa3M54rtJZ9pDNW5zIOi0412D3UCWrKeKTEw-1RlRRJd1NmXScLarnrzrZaMguk
Message-ID: <CAFS5DSEhgk8fJgAwEn+-U-7vnBchCrx6L1uReT3Upm+AA22=Wg@mail.gmail.com>
Subject: Re: [REGRESSION] ublk: dispatched IO intermittently never posts its
 fetch completion (v7.0)
To: Bernd Schubert <bernd@bsbernd.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org, 
	regressions@lists.linux.dev, axboe@kernel.dk, stable@vger.kernel.org, 
	Ming Lei <tom.leiming@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Bernd,

Yes, I can do that. I'll go ahead and compile ublk_drv from your repo
for the 7.0 backport and see how that goes.

All the best,
Luciano.

On Fri, Nov 20, 2026 at 8:27=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
>
> On 11/20/26 23:55, Luciano Lo Giudice wrote:
> > From: Luciano Lo Giudice <lmlogiudice@gmail.com>
> > To: linux-block@vger.kernel.org, io-uring@vger.kernel.org
> > Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
> >     stable@vger.kernel.org, regressions@lists.linux.dev
> > Subject: [REGRESSION] ublk: dispatched IO intermittently never posts it=
s
> >  fetch completion (v7.0)
> >
> > Hello everyone,
> >
> > I'm writing a library that implements various block devices in userspac=
e by
> > utilizing the ublk framework. Every so often, I'm hitting a completion =
loss on
> > Linux 7.0, in which an inflight request is lost forever, which leads to=
 an
> > unkillable process and a ublk block device that cannot be torn down, an=
d so the
> > machine needs to be rebooted to remedy this. I've tested the attached r=
eproducer
> > on 6.8, but found no hangs after many runs. Details of the bug are belo=
w.
>
> Hi Luciano,
>
> I just scanned the io-uring list and found this by accident. I have been
> working on this for a couple of month.
>
>
> Would you be open to test a specific branch or dkms module? I actually
> wanted to send this to upstream last months already, but then found and
> fixed (with a lot of AI help) more issues and also got busy with other
> tasks.
>
> https://github.com/bsbernd/linux/tree/ublk-stop-races-with-tests-for-7.3
>
> and here the backports, that also work on 7.0 (with a compat patch) and
> that is used for our dkms module
>
> https://github.com/bsbernd/linux/tree/niova-ublk-7.1-fix-backports
>
> The 7.3 patches are actually verified through tla+ and an ublk branch
> for https://github.com/brauner/linux-formal
>
>
> @Ming the patches for 7.3 include heavy ublk state changes (it is now a
> bit closer to what fuse-io-uring does) and also adds debugfs that can be
> used understand state issues.
>
>
> Thanks,
> Bernd
>
>
> >
> > 1. Environment
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - Breaks on 7.0.0-31-generic and 7.0.0-43-generic using the kernels tha=
t ship
> >   with Ubuntu. Tested on amd64 and the ublk_drv module.
> > - An identical binary was run on 6.8.0-117-generic but no hangs were re=
produced.
> > - This was run on virtual machines provisioned with LXD and with 4 CPUs=
.
> > - After reading the code, I suspect the issue arises due to the 2025 re=
work (the
> >   list batching first appeared in 6.15 and the per-IO task tracking in =
6.16).
> >   I have not run any kernels between 6.8 and 7.0
> >
> > 2. About the attached reproducer
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - It's a single C file that requires only liburing.
> > - 3 devices are loaded (2 are file-backed, the other memory-backed).
> > - A fourth device is added, started, loaded (briefly), stopped and
> >   deleted in a loop while the others are under loaded. This is the
> >   fastest way I found to reproduce the issue.
> > - On 7.0, this hangs within the first 2 runs. On 6.8, no hangs were
> >   observed after more than 10 runs. When the issue is detected, the
> >   program prints what evidence it can gather (per-device inflight
> >   operation numbers, the running threads' waiting channels and the
> >   io_uring's pending CQE counts).
> > - Bonus: 2 additional bugs where found when shrinking the workload:
> >   A queue was leaking its io_uring (keeping the chardev pinned), and
> >   START_DEV issued for a queued that had died before arming. Both stall=
ed
> >   the program identically on 6.8 and both were fixed in the attached ve=
rsion.
> >
> > 3. What indicates a failure (from userspace's POV)
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >
> > - The issue is always connected to a READ request:
> >   /sys/block/ublkb$N/inflight yields "1 0" and is never modified again.
> > - The thread that handles the queue is blocked in io_cqring_wait (as se=
en by
> >   inspecting /proc/$TID/wchan), byt the ring has no entries to consume.
> > - The ublksrv_io_desc for the corresponding tag was written by the kern=
el
> >   at dispatch. The server reads descriptors after a CQE is posted, but
> >   this never happens.
> > - There is no way (AFAIK) to recover the tag. The lost completion is th=
e
> >   one that would set UBLK_IO_FLAG_OWNED_BY_SRV so a COMMIT_AND_FETCH fo=
r
> >   the tag is rejected (returns -EINVAL).
> > - Something very similar also shows on the control plane, which is why =
I
> >   suspect shared implementation details rather than something queue-spe=
cific.
> > - START_DEV, STOP_DEV and DEL_DEV will occassionnally never post their =
CQE
> >   after the kernel provably completes. In one capture, the deleted bloc=
k
> >   device was already gone from /sys/block when the caller's 30 seconds
> >   time bound fired. Repeated re-enters never produced the completion.
> > - DEL_DEV was seen stalling 30-90 seconds on the kernel for operations =
that
> >   should complete instantly. The io-wq worker thread was blocked in:
> >
> >   ublk_ctrl_del_dev
> >     del_gendisk
> >       blk_mq_freeze_queue_wait
> >
> >   the device was stuck half-deleted, and it reacted to ADD_DEV by retur=
ning
> >   -EEXIST for minutes. In the worst instance it survivied its own serve=
r
> >   exiting and stayed un-deletable (needed a reboot).
> > - A START_DEV completed with -EINTR. The process was detached and arms =
no
> >   signal sources. I didn't capture the pending signal set in that insta=
nce,
> >   so I cannot rule out a spurious signal, but the same op's immediate r=
etry
> >   stalled for a full 30 seconds.
> > - Not needed to repro the bug: COOP_TASKRUN, readahead bursts, eventfd =
wakeups.
> >
> > 4. Aftermath
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - AFter the request is lost, teardown hangs and takes the control plane=
 with
> >   it. Looking at /proc/*/wchan and dmesg of a hanged instance shows tha=
t the
> >   teardown uring command (running in an io-wq worker) is stucj in
> >
> >   ublk_stop_dev/ublk_ctrl_del_dev
> >     del_gendisk
> >       blk_unregister_queue
> >         elevator_set_none
> >           blk_mq_freeze_queue_wait
> >
> >   And the message printed by the kernel is:
> >
> >     INFO: task iou-wrk-2115:2118 blocked for more than 122 seconds.
> >     [...]
> >      ublk_stop_dev_unlocked.part.0+0x38/0x160 [ublk_drv]
> >      ublk_ctrl_uring_cmd+0x629/0x830 [ublk_drv]
> >
> > - Subsequent control command hangs on the control mutex:
> >     task iou-wrk-12720:12721 is blocked on a mutex likely owned by task
> >     iou-wrk-12626:12629.
> >     [...]
> >      ublk_ctrl_get_params+0x8b/0x190 [ublk_drv]
> >
> > - Killing the process doesn't help. The worker thread keeps waiting on =
the
> >   queue and the frozen queue waits for a request whose owner (the serve=
r) is
> >   gone. On 7.0, ublk_timeout(...) only takes action for unprivileged de=
vices by
> >   SIGKILL'ing the server. On privileged processes it retursn BLK_EH_RES=
ET_TIMER
> >   so a lost request is re-armed forever and never aborted, even when th=
e
> >   server is dead.
> >
> > - When the process exits, the io_uring io-wq teardown warns while a wor=
ker is
> >   still stuck and the process remains a zombie. The following message i=
s
> >   printed by the kernel:
> >
> >     WARNING: io_uring/io-wq.c:1370 at io_wq_put_and_exit+0x10d/0x2e0,
> >     CPU#3: live_server_ram/2115
> >
> > 5. Where I suspect is the problem
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - Evidence points at the completion side of the 2025 rework.
> > - per-IO task tracking ( ("ublk: require unique task per io instead of
> >   unique task per queue", Pure Storage, 04/2025,
> >   https://patchew.org/linux/20250416-ublk._5Ftask._5Fper._5Fio-v5-0-926=
1ad7bff20@purestorage.com/):
> >   our fetches are all submitted by the queue's own thread, so io->task
> >   should always match at dispatch time;
> > - rq_list batching: ublk_queue_rqs() coalesces same-<ctx_handle, task>
> >   requests into one list and queues a single
> >   io_uring_cmd_complete_in_task(io->cmd, ublk_cmd_list_tw_cb) for the
> >   whole batch. If that single task work is lost, every request in the
> >   list strands - the observations are consistent with one lost request =
per
> >   occurrence.
> >
> > 6. Follow-ups
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - Does this ring any bells in the 7.0 completion rework (lost task work
> >   for ublk_cmd_list_tw_cb / ublk_cmd_tw_cb, or io->task mismatch taking
> >   a path that neither completes nor aborts)? Is a fix already in
> >   flight?
> > - Independently of the completion loss: should ublk_timeout() for
> >   privileged daemons fail a request whose ublk server is gone? Today
> >   BLK_EH_RESET_TIMER keeps a lost request - and with it the del_gendisk
> >   freeze and the control mutex - stuck forever after server's death,
> >   which turns a single lost completion into a machine-level hang.
> >
> > I can test candidate patches on 7.0.0-43 or bisect across 6.15-7.0 on a
> > VM, or capture the trace of a missing completion.
> >
> > #regzbot introduced: v6.8..v7.0
> >
> > Best regards,
> > Luciano
>
