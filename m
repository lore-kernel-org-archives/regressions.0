Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBA66AAD
	for <regressions@lists.linux.dev>; Sun, 23 Mar 2025 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742723393; cv=none; b=jhJdrnVozIo+gRrJrHL/P86BdfnLpqxBoS5pP+94IXNE5nLvrwbV7PIIjyVdyCsbF70k+Zk0A8drgmlkRZMGuIAgmY5EaVgGQnIix5Wcg8AUgLnuxv7UdJwmYwGa7rN0jIGGt9t4BkXfuYIERLxY1SoxCqr0uxkMlDvIrz6UnLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742723393; c=relaxed/simple;
	bh=zCCQPhULcp8Yr613A/F+Id/s/bqZMfd1q4V9qHcb1Jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LytebmGZc/DTxiJ7gUwl9+rsiZtI3ICvDgJTaXrqNnu8WBOJbDCR17Couiua05Gnwq4XOKTP1yFJZWOqBXfdfun9QEGNjCYUNWsCpssh9/iGmW3EnIZInqKfYCxuzWWwieBgV1+35e0c4Yb4vEcXq7h11jAwWn4sNV3SrEP+2KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuvxWXRv; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuvxWXRv"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72bccda48cbso2456402a34.1
        for <regressions@lists.linux.dev>; Sun, 23 Mar 2025 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742723391; x=1743328191; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qtl4aMOEbfVOV1/Eu8J0ZwV0cESQwszhmL0cG268KPo=;
        b=iuvxWXRv+9Y1GZlgl7cMe7qamqZpVnCJH7E0qP/xRENPiwgLTks4FF8DN6yhybuSFr
         +SSshGpF6sOC9feMXCo30d8xqwVUOYF4/rhyplJr+GZ2OYk6sgf1KfTi5Lzy5PkbbEB7
         OYuRGf0881BgA87+jQmRfRqSLOLa+zZ0J5vDG2IWL2e+JAROajNZnTuWZNpPWZOs+XPQ
         c+Va/BxVkg1ieblSuxIoVoPtgzliIjbu5fHHCs/jxWkNiO3htFQuOHTmiv452E6j6iSr
         6T4DFyFyGd7sEAOXYzeT5uwQdyZbZ+U2Yb7izCohG9iMmTVS4YgAXkNU/GwEHMZOd/cF
         Ad1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742723391; x=1743328191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qtl4aMOEbfVOV1/Eu8J0ZwV0cESQwszhmL0cG268KPo=;
        b=Pm1NkO40G+OZb0otPC9LpZ2pm/tuWprbpaSS7L14tESMjxXYxT8E0i/BkUdvdkTBvR
         SmZVmvaRN44wbnqLEJfR0PAhxzYn4tNl9ZvQkK6hb/nc9dixL228oihDkny2tj7kBR29
         cNln390dxqIA/YUl4hmbqH5ZyD0h9QZZ/5nP7oEj5xH34Z2OolVcWP8JdDtmRBEyb6tQ
         L0+yQteCNBthEZmDlkVF603B1M2GvCm3puyrQmMIJ5MZMSwzOrMrTtMcBfVSVL+LlO0Q
         IirxgvkQX/Wm1fkiiBrBExYVtKk+AhTqtcqgxVawJm7J2V4uoU0xDbOYBxHJhQxkhp7s
         C9ng==
X-Forwarded-Encrypted: i=1; AJvYcCX5bGvEXMD6KkWJTp6SdsZla7kKaO8VQa+VYzIM7qWWGhVTxZFP9fSIc7EIrG1elX4nSEtS8vp2RbqGnw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9GTN2xd14rsIVUqeNLze0SWgZhD+OcFqfJ0YivK+tt2s2QqVd
	jOoZBo9ZYKeBOZpwQq/IITzxhjdQLnUJxGdo86sp/u4aTsYL0eax91VzSL6Dgx9UqpOllro4X+N
	pqdiQ7s4571SGxLdXTy+xksUkMb0=
X-Gm-Gg: ASbGnctM/4vhSgaYfaxrJu0a0BRg77y2r/ViUAQt0O26buVkpMSBQSsy2WYYRt/Fi9x
	G2BIqbMvhAmuzaXYbREqn7SAstMLD2Mu0YPApRB798nDvuCenAf3PDyyRv12keYjYjgqc1U841Q
	PIQAWP0hT4+P6XaVBY8l97ddLSDH1H
X-Google-Smtp-Source: AGHT+IFbAl12hGCj2PVn2R4kzM0/iVrZhywz5UfVG+Lep2sLGwhL+4qnhCJvzW2eWiZaBz44180IIgiem78C1Cc7ib4=
X-Received: by 2002:a05:6830:620b:b0:72b:7cc8:435 with SMTP id
 46e09a7af769-72c0af0c2f2mr6743315a34.24.1742723390919; Sun, 23 Mar 2025
 02:49:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMcxu3pCF8jYPeqF_jN34saBwc8Fci+c-Dg2Lh7rqvuFQ@mail.gmail.com>
 <Z8m9AbD3tjNpBt6p@kbusch-mbp>
In-Reply-To: <Z8m9AbD3tjNpBt6p@kbusch-mbp>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sun, 23 Mar 2025 14:49:40 +0500
X-Gm-Features: AQ5f1Jqdg6rQH9CczdkRGALGwIfqDyOG2EaR3hIqmo1zElkNd9miN3R3DAWLx2Q
Message-ID: <CABXGCsMd_xv8jPDF_sFYhwd8GtANZ23nbaSJuCxQRO7cjPtgWg@mail.gmail.com>
Subject: Re: 6.13/regression/bisected - new nvme timeout errors
To: Keith Busch <kbusch@kernel.org>, mlombard@bsdbackstore.eu
Cc: Christoph Hellwig <hch@lst.de>, axboe@kernel.dk, linux-nvme@lists.infradead.org, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 8:19=E2=80=AFPM Keith Busch <kbusch@kernel.org> wrot=
e:
>
> On Wed, Jan 15, 2025 at 02:58:04AM +0500, Mikhail Gavrilov wrote:
> > Hi,
> > During 6.13 development cycle I spotted strange new nvme errors in the
> > log which I never seen before.
> >
> > [87774.010474] nvme nvme1: I/O tag 0 (3000) opcode 0x1 (I/O Cmd) QID 1 =
timeout, aborting req_op:WRITE(1) size:131072
>
> ...
>
> > I still haven't found a stable way to reproduce this.
> > But I'm pretty sure that if this error don't appearing within two
> > days, then we can assume that the kernel isn't affected by the
> > problem.
> > So I made bisection with above assumption and found this commit:
> >
> > beadf0088501d9dcf2454b05d90d5d31ea3ba55f is the first bad commit
> > commit beadf0088501d9dcf2454b05d90d5d31ea3ba55f
> > Author: Christoph Hellwig <hch@lst.de>
> > Date:   Wed Nov 13 16:20:41 2024 +0100
> >
> >     nvme-pci: reverse request order in nvme_queue_rqs
>
> The patch here uses the order recieved to dispatch commands in
> consequetive submission queue entries, which is supposed to be the
> desired behavior for any device. I did some testing on mailine, and it
> sure looks like the order the driver does this is optimal, so I'm not
> sure what's going on with your observation.
>
> Do you have a scheduler enabled on your device?
>
> How are you generating IO? Is it a pattern I should be able to replicate
> with 'fio'?

Sorry for not answering for a long time, but all because I was testing
the off-list patch that was sent to me by Maurizio Lombardi.

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 950289405ef2..990d9ef1eef9 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -989,6 +989,9 @@ static void nvme_submit_cmds(struct nvme_queue
*nvmeq, struct rq_list *rqlist)
 {
        struct request *req;

+       if (rq_list_empty(rqlist))
+               return;
+
        spin_lock(&nvmeq->sq_lock);
        while ((req =3D rq_list_pop(rqlist))) {
                struct nvme_iod *iod =3D blk_mq_rq_to_pdu(req);

And I want to say right away that this patch solved my problem. I
double checked, and both times the system worked for 4 days without
errors:

nvme nvme0: I/O tag 960 (33c0) opcode 0x2 (I/O Cmd) QID 7 timeout,
aborting req_op:READ(0) size:16384
nvme nvme0: I/O tag 961 (33c1) opcode 0x2 (I/O Cmd) QID 7 timeout,
aborting req_op:READ(0) size:8192
nvme nvme0: Abort status: 0x0
* * *
nvme nvme0: I/O tag 960 (33c0) opcode 0x2 (I/O Cmd) QID 7 timeout,
reset controller

and subsequent freezing of some applications.

> Do you have a scheduler enabled on your device?
No. nvme0 is server-tire 30TB SSD.

> head /sys/block/*/queue/scheduler
=3D=3D> /sys/block/nvme0n1/queue/scheduler <=3D=3D
[none] mq-deadline kyber bfq

=3D=3D> /sys/block/nvme1n1/queue/scheduler <=3D=3D
[none] mq-deadline kyber bfq

=3D=3D> /sys/block/sda/queue/scheduler <=3D=3D
none mq-deadline kyber [bfq]

=3D=3D> /sys/block/sdb/queue/scheduler <=3D=3D
none mq-deadline kyber [bfq]

> How are you generating IO? Is it a pattern I should be able to replicate =
with 'fio'?

It's very complicated. Because it happens only when I update (podman
pull) a large (16 GB) Docker container.

$ podman images
REPOSITORY                                                   TAG
      IMAGE ID      CREATED       SIZE
dev-image-store.my-company.com/local-stand/service  25.2100-latest
513139713b48  19 hours ago  16.5 GB
dev-image-store.my-company.com/local-stand/service  25.1220-latest
920708d4b3dc  9 days ago    16.8 GB
dev-image-store.my-company.com/local-stand/service  25.1220
67d2af91f323  10 days ago   16.8 GB
dev-image-store.my-company.com/local-stand/service  25.2100
24e6817bff52  3 weeks ago   16.4 GB

Podman stores its images on the 30TB BTRFS partition located in /home.

--=20
Best Regards,
Mike Gavrilov.
