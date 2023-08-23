Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1262FBE4D
	for <regressions@lists.linux.dev>; Wed, 23 Aug 2023 13:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A152C433C8
	for <regressions@lists.linux.dev>; Wed, 23 Aug 2023 13:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692797123;
	bh=jEGoO/SIqTMm5IlTmQZnmSfRF3IDKY2mxs9mRNzX6OQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q3o6S2BYEEa9SBrfzumW+pOFwcr5iOtKQfUWJjQhpoNvo1nmSJtXoz5NSjPigftJT
	 wAFCTme3aZwxqhJKiUrSc0uxM5/Q+Uq8Q7yRLdNVKY3i7kxobXjEqVQJ4UIqjkCY+f
	 2luu6xif70GQQt8NIOL7WSKCZ1wqkIroqghVVgE7CXC22HZmyfDCbBtuKKfSSF9zqn
	 NSUSCHPbY7TJAxOF7VIg51yLWJ0nalE10wMUXWmIG67xjTqO2fydd1p61KJUjYV1ZM
	 ztozSPc+4CL2Bz1bkOvhXLd3t1wjHdWgOXDJ16VOFd57HQomwsGMxAUTEPQlOaoBax
	 IJiUGdG0lC91g==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fe61ae020bso8603418e87.2
        for <regressions@lists.linux.dev>; Wed, 23 Aug 2023 06:25:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YwSif2nklV0jxofiOAOWDrIuHyu9ykQT6cRWt0HBOPDr2/rg5Du
	6GxfQf2xPNRCBQwE4giBOpIqfm2l89ABBLKxIUA=
X-Google-Smtp-Source: AGHT+IGX9g86c71yNCwbKrv9G6HYy2Z2bkkDKT/Q72uRs//FLM6Cse0jXp/Uz7zyES9jM9n0j6gH9X/Tiqt0EwZbVxw=
X-Received: by 2002:ac2:4d90:0:b0:4f8:5905:8e0a with SMTP id
 g16-20020ac24d90000000b004f859058e0amr8355947lfe.6.1692797121470; Wed, 23 Aug
 2023 06:25:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <028a21df-4397-80aa-c2a5-7c754560f595@gmail.com>
 <20230818101630.000027f4@linux.intel.com> <b0488ff7-10c8-4b4e-28b8-01809133c297@linux.dev>
 <CAPhsuW6cSLqwRVO_EpFyimvc7hgi1rb3T8-NA+stHdwrqrScBA@mail.gmail.com>
 <20230822083923.00007fb6@linux.intel.com> <CAMz9Wg8KE1rDkSaQnUTJ5ikzH7YGGYbkLM3AcrVue3=JgK+14w@mail.gmail.com>
 <35130b3f-c0fd-e2d6-e849-a5ceb6a2895f@linux.dev> <CAMz9Wg_zKSJ2vL=r2zAtLBOv4GSMT63+ZQGXfYTjVJsE+DLQGA@mail.gmail.com>
In-Reply-To: <CAMz9Wg_zKSJ2vL=r2zAtLBOv4GSMT63+ZQGXfYTjVJsE+DLQGA@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Wed, 23 Aug 2023 06:25:09 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6W0XgFjH1zNC+EFYjujd4smEiWs+-nYCWQ+KaFmbuvkg@mail.gmail.com>
Message-ID: <CAPhsuW6W0XgFjH1zNC+EFYjujd4smEiWs+-nYCWQ+KaFmbuvkg@mail.gmail.com>
Subject: Re: Infiniate systemd loop when power off the machine with multiple
 MD RAIDs
To: AceLan Kao <acelan@gmail.com>
Cc: Guoqing Jiang <guoqing.jiang@linux.dev>, 
	Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@lst.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux RAID <linux-raid@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi AceLan,

On Wed, Aug 23, 2023 at 1:03=E2=80=AFAM AceLan Kao <acelan@gmail.com> wrote=
:
>
[...]
> >
> > My suggestion is delete the list node under this scenario, did you try
> > above?
> Still no luck, the patch doesn't work, the sympton is the same.
[...]
> >
> > Is the issue still reproducible with remove below from cmd?
> >
> > echo "repair" | sudo tee /sys/class/block/md12?/md/sync_action
> >
> > Just want to know if resync thread is related with the issue or not.
> Probably not, we can reproduce the issue without resync, just feel
> it's easier to reproduce the issue, so I put the command in my script.
>

Could you please run the follow two experiments?

1. Confirm 12a6caf273240a triggers this. Specifically:
   git checkout 12a6caf273240a =3D> repros
   git checkout 12a6caf273240a~1 =3D> cannot repro

2. Try with the following change (add debug messages), which hopefully
   shows which command is holding a reference on mddev->openers.

Thanks,
Song

diff --git i/drivers/md/md.c w/drivers/md/md.c
index 78be7811a89f..3e9b718b32c1 100644
--- i/drivers/md/md.c
+++ w/drivers/md/md.c
@@ -7574,11 +7574,15 @@ static int md_ioctl(struct block_device *bdev,
blk_mode_t mode,
                if (mddev->pers && atomic_read(&mddev->openers) > 1) {
                        mutex_unlock(&mddev->open_mutex);
                        err =3D -EBUSY;
+                       pr_warn("%s return -EBUSY for %s with
mddev->openers =3D %d\n",
+                               __func__, mdname(mddev),
atomic_read(&mddev->openers));
                        goto out;
                }
                if (test_and_set_bit(MD_CLOSING, &mddev->flags)) {
                        mutex_unlock(&mddev->open_mutex);
                        err =3D -EBUSY;
+                       pr_warn("%s return -EBUSY for %s with
MD_CLOSING bit set\n",
+                               __func__, mdname(mddev));
                        goto out;
                }
                did_set_md_closing =3D true;
@@ -7789,6 +7793,8 @@ static int md_open(struct gendisk *disk, blk_mode_t m=
ode)
                goto out_unlock;

        atomic_inc(&mddev->openers);
+       pr_info("%s:%s openers++ =3D %d by %s\n", __func__, mdname(mddev),
+               atomic_read(&mddev->openers), current->comm);
        mutex_unlock(&mddev->open_mutex);

        disk_check_media_change(disk);
@@ -7807,6 +7813,8 @@ static void md_release(struct gendisk *disk)

        BUG_ON(!mddev);
        atomic_dec(&mddev->openers);
+       pr_info("%s:%s openers-- =3D %d by %s\n", __func__, mdname(mddev),
+               atomic_read(&mddev->openers), current->comm);
        mddev_put(mddev);
 }
