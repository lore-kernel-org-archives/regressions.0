Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D3E2561
	for <regressions@lists.linux.dev>; Wed, 17 Aug 2022 06:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB71DC433C1
	for <regressions@lists.linux.dev>; Wed, 17 Aug 2022 06:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660717154;
	bh=oF6dkzDnT0pEMqj7irO9fBtZpglR0D+kddXm9mK6r3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jr5YrCU9MJroO3MbcbZYWIWGgxwIQZCmIwiY6vfbJXwqNXSyLCON08Ue/Y6bMxmaM
	 oQEKZm1CI537PiWXD9Ls+7VoSAgeYuiUyNbBRZYFY6RrgtX6p0Kh8PdD/9v6UFXNaX
	 JiefLh9b/eB9HMNye39yt64deRfc7s95qCf+Ae26g4KMGU4iaRYSHOkBuxwGZfpLto
	 k2wI3TC0ma+/ESOKBLAYszWkATdR+QQAqfxk25wkLiom+rccqn/zj0j1/vE7Lt2Slr
	 /shPjY66mFgz+G697thlG0SVALYsDlQkLsnN/bsEZ2c+lpLj6xUzpl/cwJ6F+zCkKF
	 s6uU0BMnKPFCA==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-32a17d3bba2so206506267b3.9
        for <regressions@lists.linux.dev>; Tue, 16 Aug 2022 23:19:13 -0700 (PDT)
X-Gm-Message-State: ACgBeo0pC1iJBYymUXLQS71XyQvEiLnNeYPhHjGjRH3Ftvdzq+Uh9luI
	3jpZ2U0A4Kag0unvIyqyiDO2pNXkmg31807R77A=
X-Google-Smtp-Source: AA6agR6ly96Gbeb7fJOMi9Oh/MOuM2LKJbwAX1IOJexEzTGU8S5JywiVDo21iWA8tCkkwToElKIilmI8m34xKUXCzGk=
X-Received: by 2002:a25:3813:0:b0:68d:c8f8:60b9 with SMTP id
 f19-20020a253813000000b0068dc8f860b9mr5549461yba.257.1660717152936; Tue, 16
 Aug 2022 23:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000401d8a746$3eaca200$bc05e600$@whissi.de> <000001d8ad7e$c340ad70$49c20850$@whissi.de>
 <2a2d1075-aa22-8c4d-ca21-274200dce2fc@leemhuis.info> <0FBCAB10-545E-45E2-A0C8-D7620817651D@digitalocean.com>
In-Reply-To: <0FBCAB10-545E-45E2-A0C8-D7620817651D@digitalocean.com>
From: Song Liu <song@kernel.org>
Date: Tue, 16 Aug 2022 23:19:02 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5f9QD+gzJ9eBhn5irsHvrsvkWjSnA4MPaHsQjjLMypXg@mail.gmail.com>
Message-ID: <CAPhsuW5f9QD+gzJ9eBhn5irsHvrsvkWjSnA4MPaHsQjjLMypXg@mail.gmail.com>
Subject: Re: [REGRESSION] v5.17-rc1+: FIFREEZE ioctl system call hangs
To: Vishal Verma <vverma@digitalocean.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, Thomas Deutschmann <whissi@whissi.de>, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 8:46 AM Vishal Verma <vverma@digitalocean.com> wrot=
e:
>
> Just saw this. I=E2=80=99m trying to understand whether this happens only=
 on md array or individual nvme drives (without any raid) too?
> The commit you pointed added REQ_NOWAIT for md based arrays, but if it is=
 happening on individual nvme drives then that could point to something wit=
h REQ_NOWAIT I think.

Agreed with this analysis.

>
> > On Aug 15, 2022, at 3:58 AM, Thorsten Leemhuis <regressions@leemhuis.in=
fo> wrote:
> >
> > Hi, this is your Linux kernel regression tracker. Top-posting for once,
> > to make this easily accessible to everyone.
> >
> > [CCing Jens, as the top-level maintainer who in this case also reviewed
> > the patch that causes this regression.]
> >
> > Vishal, Song, what up here? Could you please look into this and at leas=
t
> > comment on the issue, as it's a regression that was reported more than
> > 10 days ago already. Ideally at this point it would be good if the
> > regression was fixed already, as explained by "Prioritize work on fixin=
g
> > regressions" here:
> > https://docs.kernel.org/process/handling-regressions.html#prioritize-wo=
rk-on-fixing-regressions

I am sorry for the delay.

[...]

> >>
> >> Hi,
> >>
> >> any news on this? Is there anything else you need from me or I can hel=
p
> >> with?
> >>
> >> Thanks.
> >>
> >>
> >> -- Regards, Thomas -----Original Message----- From: Thomas Deutschmann
> >> <whissi@whissi.de> Sent: Wednesday, August 3, 2022 4:35 PM To:
> >> vverma@digitalocean.com; song@kernel.org Cc: stable@vger.kernel.org;
> >> regressions@lists.linux.dev Subject: [REGRESSION] v5.17-rc1+: FIFREEZE
> >> ioctl system call hangs Hi, while trying to backup a Dell R7525 system
> >> running Debian bookworm/testing using LVM snapshots I noticed that the
> >> system will 'freeze' sometimes (not all the times) when creating the
> >> snapshot. First I thought this was related to LVM so I created
> >> https://listman.redhat.com/archives/linux-lvm/2022-July/026228.html
> >> (continued at
> >> https://listman.redhat.com/archives/linux-lvm/2022-August/thread.html#=
26229) Long story short: I was even able to reproduce with fsfreeze, see la=
st strace lines
> >>> [...]
> >>> 14471 1659449870.984635 openat(AT_FDCWD, "/var/lib/machines", O_RDONL=
Y) =3D3
> >>> 14471 1659449870.984658 newfstatat(3, "",
> >> {st_mode=3DS_IFDIR|0700,st_size=3D4096, ...}, AT_EMPTY_PATH) =3D 0
> >>> 14471 1659449870.984678 ioctl(3, FIFREEZE
> >> so I started to bisect kernel and found the following bad commit:

I am not able to reproduce this on 5.19+ kernel. I have:

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
[root@eth50-1 ~]# for x in {1..100} ; do fsfreeze --unfreeze /root/mnt
; fsfreeze --freeze /root/mnt ; done

Did I miss something?

Thanks,
Song

[...]
