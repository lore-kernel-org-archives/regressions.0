Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9224C63
	for <regressions@lists.linux.dev>; Mon, 22 Aug 2022 21:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB066C43470
	for <regressions@lists.linux.dev>; Mon, 22 Aug 2022 21:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661205160;
	bh=S9Mj236gxYYMRcLCWxECNgvUcTkgpGD98qT7XoMv/qg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ij4DuxsNvNfa3mPRlhrnwrFIDyCGNWZdx34CrGsGS4OBtdUdF2Tc999pcxQzUKzbw
	 iMSELnOlQWRZ2ivFKUytXONP/G2Iir/yzm7q/sEZCOezfZuB8vaLOmtGXyUXahB+Vp
	 Y7XVeaaMg7F8aHDvkk896GVrX+ghNgV4czAWZceLs5V93oHju/oDKXDd5QnMzABmbC
	 RBYNQcIVOhKnyFahuG5PtKH5cDsOsobGQ46+k8elm/OdFbAwtt1hJFgLQCtO/ZRZ0s
	 NaZYM/E4rxP5GgeBXjy/kdUAX+VDlJQbfj1jBifFTWF5z3XmVA1KS7wGCt9Z37/xZ5
	 n1f2a0BLkEDLA==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-31f445bd486so331120557b3.13
        for <regressions@lists.linux.dev>; Mon, 22 Aug 2022 14:52:40 -0700 (PDT)
X-Gm-Message-State: ACgBeo3s8S96aqzUwT/zhl+PeQQI3hqqD9qyDImAiWhuuL59TWQp4M5h
	x9htJn7axc1LDBgoGDhV6FnEjV17FZZwcbm/now=
X-Google-Smtp-Source: AA6agR7zM4yznEYhJHn3Q2hdDtV4cq6Ddnz9vxocQLwmXlngURdsXpF2ZgWBS9W5DHXVcXR5ZE0yQuEazXdITe49zr0=
X-Received: by 2002:a25:3813:0:b0:68d:c8f8:60b9 with SMTP id
 f19-20020a253813000000b0068dc8f860b9mr22229420yba.257.1661205159898; Mon, 22
 Aug 2022 14:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000401d8a746$3eaca200$bc05e600$@whissi.de> <000001d8ad7e$c340ad70$49c20850$@whissi.de>
 <2a2d1075-aa22-8c4d-ca21-274200dce2fc@leemhuis.info> <0FBCAB10-545E-45E2-A0C8-D7620817651D@digitalocean.com>
 <CAPhsuW5f9QD+gzJ9eBhn5irsHvrsvkWjSnA4MPaHsQjjLMypXg@mail.gmail.com>
 <43e678ca-3fc3-6c08-f035-2c31a34dd889@whissi.de> <701f3fc0-2f0c-a32c-0d41-b489a9a59b99@whissi.de>
 <0192a465-d75d-c09a-732a-eb2215bf3479@whissi.de> <CAPhsuW6yLLcj3GtA+4mUFooQmfGo3cVTYn-xBEY2KuP1wwmQNA@mail.gmail.com>
 <b903abd4-d101-e6a5-06a0-667853286308@whissi.de> <4f69659f-7160-7854-0ed5-6867e3eb2edb@whissi.de>
In-Reply-To: <4f69659f-7160-7854-0ed5-6867e3eb2edb@whissi.de>
From: Song Liu <song@kernel.org>
Date: Mon, 22 Aug 2022 14:52:28 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6Bq8rkiCzsWW7bkrCbYYEwFWtKaswOZcXsyk8tu3C5Dg@mail.gmail.com>
Message-ID: <CAPhsuW6Bq8rkiCzsWW7bkrCbYYEwFWtKaswOZcXsyk8tu3C5Dg@mail.gmail.com>
Subject: Re: [REGRESSION] v5.17-rc1+: FIFREEZE ioctl system call hangs
To: Thomas Deutschmann <whissi@whissi.de>
Cc: Vishal Verma <vverma@digitalocean.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 9:30 AM Thomas Deutschmann <whissi@whissi.de> wrote=
:
>
> Hi,
>
> I can now reproduce using fio:
>
> I looked around in MariaDB issue tracker and found
> https://jira.mariadb.org/browse/MDEV-26674 which lead me to
> https://github.com/MariaDB/server/commit/de7db5517de11a58d57d2a41d0bc6f38=
b6f92dd8
> -- it's a conditional based on $KV and I hit that kernel regression
> during one of my bisect attempts (see
> https://lore.kernel.org/all/701f3fc0-2f0c-a32c-0d41-b489a9a59b99@whissi.d=
e/).
>
> Setting innodb_use_native_aio=3DOFF will prevent the problem.
>
> This helped me to find https://github.com/axboe/fio/issues/1195 so I now
> have a working reproducer for fio.
>
>    $ cat reproducer.fio
>    [global]
>    direct=3D1
>    thread=3D1
>    norandommap=3D1
>    group_reporting=3D1
>    time_based=3D1
>    ioengine=3Dio_uring
>
>    rw=3Drandwrite
>    bs=3D4096
>    runtime=3D20
>    numjobs=3D1
>    fixedbufs=3D1
>    hipri=3D1
>    registerfiles=3D1
>    sqthread_poll=3D1
>
>
>    [filename0]
>    directory=3D/srv/machines/fio
>    size=3D200M
>    iodepth=3D1
>    cpus_allowed=3D20
>
>
> ...now call fio like "fio reproducer.fio". After one successful fio run,
> fsfreeze will already hang for me.

Hmm.. I still cannot repro the hang in my test. I have:

[root@eth50-1 ~]# mount | grep mnt
/dev/md0 on /root/mnt type ext4 (rw,relatime,stripe=3D384)
[root@eth50-1 ~]# lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sr0      11:0    1 1024M  0 rom
vda     253:0    0   32G  0 disk
=E2=94=9C=E2=94=80vda1  253:1    0    2G  0 part  /boot
=E2=94=94=E2=94=80vda2  253:2    0   30G  0 part  /
nvme0n1 259:0    0    4G  0 disk
=E2=94=94=E2=94=80md0     9:0    0   12G  0 raid5 /root/mnt
nvme2n1 259:1    0    4G  0 disk
=E2=94=94=E2=94=80md0     9:0    0   12G  0 raid5 /root/mnt
nvme3n1 259:2    0    4G  0 disk
=E2=94=94=E2=94=80md0     9:0    0   12G  0 raid5 /root/mnt
nvme1n1 259:3    0    4G  0 disk
=E2=94=94=E2=94=80md0     9:0    0   12G  0 raid5 /root/mnt

[root@eth50-1 ~]# history
  381  fio iou/repro.fio
  382  fsfreeze --freeze /root/mnt
  383  fsfreeze --unfreeze /root/mnt
  384  fio iou/repro.fio
  385  fsfreeze --freeze /root/mnt
  386  fsfreeze --unfreeze /root/mnt
^^^^^^^^^^^^^^ all works fine.

Did I miss something?

Thanks,
Song
