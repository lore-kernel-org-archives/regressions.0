Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795227973;
	b=muoFjRVRXONVJfvcu5XBhdpX+5RyRE+DejNj4Zx7L72x70OvgCc2vhU98gEOtcw4JdIm
	 Sf1GhejCTaYUOvjsNZYT8lmDL6YWE9i0x/C/SZY0hbEGIO7UUSW+TfUMRvUCt88Qt7pGo
	 upht3Us0e6LYmMLW9OKFAfSE2Mi9TL4mfw0J0RRq54CtJHqDfkxCdxtrGPzfsJv10TmTi
	 Ys8/ZIeHWOZ6duCdy0cedHHPCwsueCjRUMbMn+Ks/13PO4rLwI3jHW+Lb6Hot/ei+0o+r
	 4ipij94zTJqown9+/py2ttfe5ONesIhW8UcHBW0BtNwEUce9Z4yTPirgywAgggbOQYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795227973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qvzvR7eFw18VmCP4IyCpLYFsv+yar7ywiKXjqrHf1do=;
	b=wdj3+DZbM4VsVZaAodlhLynBSfFty1r4dEkV2DH8oc/hghWEYwEPAxzk44DO81QvesAP
	 RT/E5bGeUOaCeR9XhK5f69NkcscjPqg/RUDg8s88R3+JgNhuY375V2RxKtf5jCI9+rpPV
	 /l8MYLisT1zopin5V5lNny0q0EyzNxz9WvgX6etk6/wnY0+In5fwzlKgiJA6sEPKhOIge
	 sBxeC67yIQIkS8+gUuWz0oyHXpkv6q1G8ilWCFEOk/A/vKV2LYjlPF5PleoDvM1NIqtgy
	 3OfS3WKj/TnIPqPZHj0nLDshUIy0XsstT7YY3OpfjinSvgtaFS6hmqwhUjQZRcCfjLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCUHE3PY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E930606A6A1
	for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 02:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E930606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UCUHE3PY
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-679aeeddc6bso1525977d50.2
        for <regressions@lists.linux.dev>; Fri, 20 Nov 2026 18:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795227971; cv=none;
        d=google.com; s=arc-20260327;
        b=bXHXIWAomK+502M8b6Uxbg/3f79eoh48Rt/adILVMyF9gVl8e0qHzsxMS/q+C7GCwG
         6mfOZ5mNWIYh5eXGB8WGHebMvCKY4p3aw0VjCbhoQZJMDvmmXL9T8R//K35V1HOUrp9y
         DJlGCBrQ7++aOHLi5Ja/W+odoOS+WRcVMOmjK/XRcB8EiXSQkDZnR25go7qiuLikqjvW
         negQBiRIj3m0fE99R3SZTXhm/BydKwNDrEVAkSva8B+9EdigX4EOs8cSXQeFgVTlP31V
         DTHyd6B+ovLojg9uZdjL5VRZFjQcTLL1la1Ywk9xeplj77CUXSCsFWlHXN7mllsDunSu
         /QBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qvzvR7eFw18VmCP4IyCpLYFsv+yar7ywiKXjqrHf1do=;
        fh=5NeTIBtnlx72yG+donVQKnHArAlMMjw0gy/NCE0Ay7Y=;
        b=gb2i18+h5SQkKkIonSH9ZfDnkxGsqhYyJzYyGUo8OTHBppoRV9yagL/Lw1xAzbs/eS
         V8sYhKkMqQTUldtHkrd+cmspyrWceejQI/e0RdrqpXf5HfhDs9kVkHluruOJmVgPYn2D
         XwP+gBh5AGAQJ13eyIJHaSLPoZQEeIfsc/qScPPoCEPl2ZIM0H1NRZwHtho+N/ZLLlF9
         lslSj7WwR6Gp0jEBRNNWl+nJGuDZHDtn4+cYp+BUgx5qZbVgg4/bktDhKe5V70ZY5S+x
         ef0H4ELMpmgTM4NVw0u4xVA2P5+dg6gzQh8T9wel0c+3pz0ShXiZoBXV4APOgn8vRtyf
         T+tw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795227971; x=1795832771; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qvzvR7eFw18VmCP4IyCpLYFsv+yar7ywiKXjqrHf1do=;
        b=UCUHE3PYyssfFwKYs05a68yMDvS5g4vcpkxHUVdwKlwyk0IMH5P0YLjEMmP00AahdT
         fLqWrtdMkhjHBexoZ6dXb5hmD/BhlclD1cGU3rI4ArK7ZuCckBvpDgNS3gYSu5Ks4oyh
         a3bIz0AwJKohrVJGcHiHrHUgtyoRMOaKul1+rVa3TCxQbJRiKMBVb56HEIRyEaLl/SAR
         n7sB4LA+rAZ+q5aPXlzQz4n1ZN8pn9NKqeX6AFwwYUgPYIQmsnHLG0gFahGPwV0jLOH4
         NltfPa8MWTbZTqprhvKkkr5By6ah92C8kDmbGecrTDc8w4Ln/xF2y4fsmJsBszf0XozI
         Sbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795227971; x=1795832771;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvzvR7eFw18VmCP4IyCpLYFsv+yar7ywiKXjqrHf1do=;
        b=QQsNE56sbGCbfSktfBEGqdbW2j6eewfzthG6/KEWlvmi3SlC6aC42R2fUVBxiiBJ1w
         P1vieweMHpxKmBVBBDp7G0kk8ts4D02RYljvtSuSIIBEte9IVNN7AMfv62JrnUC27FDA
         9LOnjqXWTlrFV7ZFjs9sYbDJ1z/8GK3zhpxLHwi02c3WKVwJDzm0OgOlzkvaOZwemDmf
         tFY3tljp6eDI+4a5W7fBSp3gM743ZzvUiEUgzcMiNlp7YeESgljT4MG7dJCn16l12uVs
         4zGEoKO4T8MdOgWrjIeCu+m8vVDhJ0dzJwh+32UrZJ1KaS7TW/enaREl1KRDvekBKpae
         uaxA==
X-Forwarded-Encrypted: i=1; AL+hErExCgNETXMfJFYMiAo7Ty+YF/l1E70adBc4BlbZ9lQYQOvQjAitkgJivIBqjzWBNj6LCAR7SVB1ztDdSw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Hl33y0QnvNRhrJh/VmSxfmL1XKk9wnVFeN6MYknEiXUcyQwfs
	DV/hUFlhbighkBgN93dSHeseol+w3jaUclxzU5IFLpK7yNz//z04f8sC6xJ0nAXr10EGdVUNe1l
	zKNWNMMBKV8qyIwPDl2aY+c1vhMI/bb4=
X-Gm-Gg: AZFdTZcbQDjAnXNymq0POWGDkwNnZZ/4OVjyDbXeG7eprrDoFeQLP9zNbvpUa8oJhW4
	siEjPbE8zjDgTi8dLb/baIrbki7fu3qt3+mNMPaZ7uBtmuA2OF0B+Gb+7O4OwFtHO1dwaT8nhON
	t6A56qT3biBunDlCIH2dQqpvtEliL/9r1eHz3h1JWsqbveooepHw0vXJ5vbHJqvautRlebI09g8
	kxxpFZuXJh27uVBGApfPuQi6966jXNV/6T+Sp0R1u78onCi/GkM6fmcK7pY+PT2L7261rpw3xEo
	WPNfyCTMlE8yxHh8HBF5/k6qCIeDqEm6nYgOnxQ+doo9f0M/Pzxg9tqS9FN/f98GJRgFSx6scwR
	glMfSURm1fUy00Y11elbMU/mvYB/6j/2E6go=
X-Received: by 2002:a05:690e:1247:b0:67c:f8c:2300 with SMTP id
 956f58d0204a3-67df44d4536mr1726391d50.80.1795227971008; Fri, 20 Nov 2026
 18:26:11 -0800 (PST)
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
In-Reply-To: <CAFS5DSEhgk8fJgAwEn+-U-7vnBchCrx6L1uReT3Upm+AA22=Wg@mail.gmail.com>
From: Luciano Lo Giudice <lmlogiudice@gmail.com>
Date: Fri, 20 Nov 2026 23:25:59 -0300
X-Gm-Features: Aa3M54ojJXgcnAb9fjbJ0QGRhwYz0P_qQIncZccMkVpu2WqI-CMZLaLFuOpuoYw
Message-ID: <CAFS5DSEsdz8Eu1vmeCkE+6eeXgk+9yS6EwqyHSeD2jkq90DZaA@mail.gmail.com>
Subject: Re: [REGRESSION] ublk: dispatched IO intermittently never posts its
 fetch completion (v7.0)
To: Bernd Schubert <bernd@bsbernd.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org, 
	regressions@lists.linux.dev, axboe@kernel.dk, stable@vger.kernel.org, 
	Ming Lei <tom.leiming@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

Using Bernd's repo, I was _unable_ to reproduce the bug after several
runs (it used to hang in about 1 out of 3 runs). I had to add a small
compat layer to make the module build in 7.0, but it was overall
pretty easy. I will be now using this module for any development on
7.0 (thanks, Bernd!) and will report if any other issues arise.

All the best,
Luciano.

On Fri, Nov 20, 2026 at 8:40=E2=80=AFPM Luciano Lo Giudice
<lmlogiudice@gmail.com> wrote:
>
> Hello Bernd,
>
> Yes, I can do that. I'll go ahead and compile ublk_drv from your repo
> for the 7.0 backport and see how that goes.
>
> All the best,
> Luciano.
>
> On Fri, Nov 20, 2026 at 8:27=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com=
> wrote:
> >
> >
> >
> > On 11/20/26 23:55, Luciano Lo Giudice wrote:
> > > From: Luciano Lo Giudice <lmlogiudice@gmail.com>
> > > To: linux-block@vger.kernel.org, io-uring@vger.kernel.org
> > > Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
> > >     stable@vger.kernel.org, regressions@lists.linux.dev
> > > Subject: [REGRESSION] ublk: dispatched IO intermittently never posts =
its
> > >  fetch completion (v7.0)
> > >
> > > Hello everyone,
> > >
> > > I'm writing a library that implements various block devices in usersp=
ace by
> > > utilizing the ublk framework. Every so often, I'm hitting a completio=
n loss on
> > > Linux 7.0, in which an inflight request is lost forever, which leads =
to an
> > > unkillable process and a ublk block device that cannot be torn down, =
and so the
> > > machine needs to be rebooted to remedy this. I've tested the attached=
 reproducer
> > > on 6.8, but found no hangs after many runs. Details of the bug are be=
low.
> >
> > Hi Luciano,
> >
> > I just scanned the io-uring list and found this by accident. I have bee=
n
> > working on this for a couple of month.
> >
> >
> > Would you be open to test a specific branch or dkms module? I actually
> > wanted to send this to upstream last months already, but then found and
> > fixed (with a lot of AI help) more issues and also got busy with other
> > tasks.
> >
> > https://github.com/bsbernd/linux/tree/ublk-stop-races-with-tests-for-7.=
3
> >
> > and here the backports, that also work on 7.0 (with a compat patch) and
> > that is used for our dkms module
> >
> > https://github.com/bsbernd/linux/tree/niova-ublk-7.1-fix-backports
> >
> > The 7.3 patches are actually verified through tla+ and an ublk branch
> > for https://github.com/brauner/linux-formal
> >
> >
> > @Ming the patches for 7.3 include heavy ublk state changes (it is now a
> > bit closer to what fuse-io-uring does) and also adds debugfs that can b=
e
> > used understand state issues.
> >
> >
> > Thanks,
> > Bernd
> >
> >
> > >
> > > 1. Environment
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > - Breaks on 7.0.0-31-generic and 7.0.0-43-generic using the kernels t=
hat ship
> > >   with Ubuntu. Tested on amd64 and the ublk_drv module.
> > > - An identical binary was run on 6.8.0-117-generic but no hangs were =
reproduced.
> > > - This was run on virtual machines provisioned with LXD and with 4 CP=
Us.
> > > - After reading the code, I suspect the issue arises due to the 2025 =
rework (the
> > >   list batching first appeared in 6.15 and the per-IO task tracking i=
n 6.16).
> > >   I have not run any kernels between 6.8 and 7.0
> > >
> > > 2. About the attached reproducer
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > - It's a single C file that requires only liburing.
> > > - 3 devices are loaded (2 are file-backed, the other memory-backed).
> > > - A fourth device is added, started, loaded (briefly), stopped and
> > >   deleted in a loop while the others are under loaded. This is the
> > >   fastest way I found to reproduce the issue.
> > > - On 7.0, this hangs within the first 2 runs. On 6.8, no hangs were
> > >   observed after more than 10 runs. When the issue is detected, the
> > >   program prints what evidence it can gather (per-device inflight
> > >   operation numbers, the running threads' waiting channels and the
> > >   io_uring's pending CQE counts).
> > > - Bonus: 2 additional bugs where found when shrinking the workload:
> > >   A queue was leaking its io_uring (keeping the chardev pinned), and
> > >   START_DEV issued for a queued that had died before arming. Both sta=
lled
> > >   the program identically on 6.8 and both were fixed in the attached =
version.
> > >
> > > 3. What indicates a failure (from userspace's POV)
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > >
> > > - The issue is always connected to a READ request:
> > >   /sys/block/ublkb$N/inflight yields "1 0" and is never modified agai=
n.
> > > - The thread that handles the queue is blocked in io_cqring_wait (as =
seen by
> > >   inspecting /proc/$TID/wchan), byt the ring has no entries to consum=
e.
> > > - The ublksrv_io_desc for the corresponding tag was written by the ke=
rnel
> > >   at dispatch. The server reads descriptors after a CQE is posted, bu=
t
> > >   this never happens.
> > > - There is no way (AFAIK) to recover the tag. The lost completion is =
the
> > >   one that would set UBLK_IO_FLAG_OWNED_BY_SRV so a COMMIT_AND_FETCH =
for
> > >   the tag is rejected (returns -EINVAL).
> > > - Something very similar also shows on the control plane, which is wh=
y I
> > >   suspect shared implementation details rather than something queue-s=
pecific.
> > > - START_DEV, STOP_DEV and DEL_DEV will occassionnally never post thei=
r CQE
> > >   after the kernel provably completes. In one capture, the deleted bl=
ock
> > >   device was already gone from /sys/block when the caller's 30 second=
s
> > >   time bound fired. Repeated re-enters never produced the completion.
> > > - DEL_DEV was seen stalling 30-90 seconds on the kernel for operation=
s that
> > >   should complete instantly. The io-wq worker thread was blocked in:
> > >
> > >   ublk_ctrl_del_dev
> > >     del_gendisk
> > >       blk_mq_freeze_queue_wait
> > >
> > >   the device was stuck half-deleted, and it reacted to ADD_DEV by ret=
urning
> > >   -EEXIST for minutes. In the worst instance it survivied its own ser=
ver
> > >   exiting and stayed un-deletable (needed a reboot).
> > > - A START_DEV completed with -EINTR. The process was detached and arm=
s no
> > >   signal sources. I didn't capture the pending signal set in that ins=
tance,
> > >   so I cannot rule out a spurious signal, but the same op's immediate=
 retry
> > >   stalled for a full 30 seconds.
> > > - Not needed to repro the bug: COOP_TASKRUN, readahead bursts, eventf=
d wakeups.
> > >
> > > 4. Aftermath
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > - AFter the request is lost, teardown hangs and takes the control pla=
ne with
> > >   it. Looking at /proc/*/wchan and dmesg of a hanged instance shows t=
hat the
> > >   teardown uring command (running in an io-wq worker) is stucj in
> > >
> > >   ublk_stop_dev/ublk_ctrl_del_dev
> > >     del_gendisk
> > >       blk_unregister_queue
> > >         elevator_set_none
> > >           blk_mq_freeze_queue_wait
> > >
> > >   And the message printed by the kernel is:
> > >
> > >     INFO: task iou-wrk-2115:2118 blocked for more than 122 seconds.
> > >     [...]
> > >      ublk_stop_dev_unlocked.part.0+0x38/0x160 [ublk_drv]
> > >      ublk_ctrl_uring_cmd+0x629/0x830 [ublk_drv]
> > >
> > > - Subsequent control command hangs on the control mutex:
> > >     task iou-wrk-12720:12721 is blocked on a mutex likely owned by ta=
sk
> > >     iou-wrk-12626:12629.
> > >     [...]
> > >      ublk_ctrl_get_params+0x8b/0x190 [ublk_drv]
> > >
> > > - Killing the process doesn't help. The worker thread keeps waiting o=
n the
> > >   queue and the frozen queue waits for a request whose owner (the ser=
ver) is
> > >   gone. On 7.0, ublk_timeout(...) only takes action for unprivileged =
devices by
> > >   SIGKILL'ing the server. On privileged processes it retursn BLK_EH_R=
ESET_TIMER
> > >   so a lost request is re-armed forever and never aborted, even when =
the
> > >   server is dead.
> > >
> > > - When the process exits, the io_uring io-wq teardown warns while a w=
orker is
> > >   still stuck and the process remains a zombie. The following message=
 is
> > >   printed by the kernel:
> > >
> > >     WARNING: io_uring/io-wq.c:1370 at io_wq_put_and_exit+0x10d/0x2e0,
> > >     CPU#3: live_server_ram/2115
> > >
> > > 5. Where I suspect is the problem
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > - Evidence points at the completion side of the 2025 rework.
> > > - per-IO task tracking ( ("ublk: require unique task per io instead o=
f
> > >   unique task per queue", Pure Storage, 04/2025,
> > >   https://patchew.org/linux/20250416-ublk._5Ftask._5Fper._5Fio-v5-0-9=
261ad7bff20@purestorage.com/):
> > >   our fetches are all submitted by the queue's own thread, so io->tas=
k
> > >   should always match at dispatch time;
> > > - rq_list batching: ublk_queue_rqs() coalesces same-<ctx_handle, task=
>
> > >   requests into one list and queues a single
> > >   io_uring_cmd_complete_in_task(io->cmd, ublk_cmd_list_tw_cb) for the
> > >   whole batch. If that single task work is lost, every request in the
> > >   list strands - the observations are consistent with one lost reques=
t per
> > >   occurrence.
> > >
> > > 6. Follow-ups
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > - Does this ring any bells in the 7.0 completion rework (lost task wo=
rk
> > >   for ublk_cmd_list_tw_cb / ublk_cmd_tw_cb, or io->task mismatch taki=
ng
> > >   a path that neither completes nor aborts)? Is a fix already in
> > >   flight?
> > > - Independently of the completion loss: should ublk_timeout() for
> > >   privileged daemons fail a request whose ublk server is gone? Today
> > >   BLK_EH_RESET_TIMER keeps a lost request - and with it the del_gendi=
sk
> > >   freeze and the control mutex - stuck forever after server's death,
> > >   which turns a single lost completion into a machine-level hang.
> > >
> > > I can test candidate patches on 7.0.0-43 or bisect across 6.15-7.0 on=
 a
> > > VM, or capture the trace of a missing completion.
> > >
> > > #regzbot introduced: v6.8..v7.0
> > >
> > > Best regards,
> > > Luciano
> >
