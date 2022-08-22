Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877924C6C
	for <regressions@lists.linux.dev>; Mon, 22 Aug 2022 23:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADD4C43141
	for <regressions@lists.linux.dev>; Mon, 22 Aug 2022 23:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661209207;
	bh=BSw6pQ7TQv7+EuVUlrbvN58sMI+jO43JdIKo+Inxx5c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bDq9sI/6cuDwyN/DkyT0iEkTyx0TWMzO0zt8ybO6zEvaKm0TFgXMWHTQUhS0Ra7B9
	 v+lpT0pOi+by9il+FsRrcMKi0GGZ3ftzEnRT8e3TvSckTgE4ApBVRgtn05rMZ+UFuQ
	 orD45MwpRDoLy5KIxvxt5ORAl51TRWAQh4fkS3RH96xt4HLGKsPEe3ehNv4gHPjAAv
	 eYVgICZY42IYy+dmd8Sx1PLGuux5DjEVQVganDqYRlOsVdErMCd8Spdk4/bSRwXkQu
	 yAOu9buN+xEZ4uCZENQG/afVham5IBIRjBGENVJE7Q+RVyYnKA01hynpq8CvlYJf3a
	 J/0PpR+xsxvrw==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-3375488624aso305872367b3.3
        for <regressions@lists.linux.dev>; Mon, 22 Aug 2022 16:00:07 -0700 (PDT)
X-Gm-Message-State: ACgBeo1NsLuNMz4KhoRyHTcONErNeH+tLwdyOPbeKCOHUn7UvUis/0p/
	6QRB8D+hcu5oR9tpWRQGgMPUc9Q2htZ00MnbMek=
X-Google-Smtp-Source: AA6agR4MiT0V47mG3SaMGbEwoyVHtGgLhw8OzKG9Do8nZv+uioqtptoee+6crHBj9PYURhhOTig5uqmLviwx9X7JUXg=
X-Received: by 2002:a05:6902:725:b0:695:b0c7:a248 with SMTP id
 l5-20020a056902072500b00695b0c7a248mr6972772ybt.389.1661209206033; Mon, 22
 Aug 2022 16:00:06 -0700 (PDT)
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
 <CAPhsuW6Bq8rkiCzsWW7bkrCbYYEwFWtKaswOZcXsyk8tu3C5Dg@mail.gmail.com> <be8542cf-9b58-8861-11b5-8eeaa08f1421@whissi.de>
In-Reply-To: <be8542cf-9b58-8861-11b5-8eeaa08f1421@whissi.de>
From: Song Liu <song@kernel.org>
Date: Mon, 22 Aug 2022 15:59:55 -0700
X-Gmail-Original-Message-ID: <CAPhsuW45eYTjmA4C_wc_Z=ELbw9NStGpX6Mkf=tn1AEBknDg4Q@mail.gmail.com>
Message-ID: <CAPhsuW45eYTjmA4C_wc_Z=ELbw9NStGpX6Mkf=tn1AEBknDg4Q@mail.gmail.com>
Subject: Re: [REGRESSION] v5.17-rc1+: FIFREEZE ioctl system call hangs
To: Thomas Deutschmann <whissi@whissi.de>
Cc: Vishal Verma <vverma@digitalocean.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 3:44 PM Thomas Deutschmann <whissi@whissi.de> wrote=
:
>
> On 2022-08-22 23:52, Song Liu wrote:
> > Hmm.. I still cannot repro the hang in my test. I have:
> >
> > [root@eth50-1 ~]# mount | grep mnt
> > /dev/md0 on /root/mnt type ext4 (rw,relatime,stripe=3D384)
> > [root@eth50-1 ~]# lsblk
> > NAME    MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
> > sr0      11:0    1 1024M  0 rom
> > vda     253:0    0   32G  0 disk
> > =E2=94=9C=E2=94=80vda1  253:1    0    2G  0 part  /boot
> > =E2=94=94=E2=94=80vda2  253:2    0   30G  0 part  /
> > nvme0n1 259:0    0    4G  0 disk
> > =E2=94=94=E2=94=80md0     9:0    0   12G  0 raid5 /root/mnt
> > nvme2n1 259:1    0    4G  0 disk
> > =E2=94=94=E2=94=80md0     9:0    0   12G  0 raid5 /root/mnt
> > nvme3n1 259:2    0    4G  0 disk
> > =E2=94=94=E2=94=80md0     9:0    0   12G  0 raid5 /root/mnt
> > nvme1n1 259:3    0    4G  0 disk
> > =E2=94=94=E2=94=80md0     9:0    0   12G  0 raid5 /root/mnt
> >
> > [root@eth50-1 ~]# history
> >    381  fio iou/repro.fio
> >    382  fsfreeze --freeze /root/mnt
> >    383  fsfreeze --unfreeze /root/mnt
> >    384  fio iou/repro.fio
> >    385  fsfreeze --freeze /root/mnt
> >    386  fsfreeze --unfreeze /root/mnt
> > ^^^^^^^^^^^^^^ all works fine.
> >
> > Did I miss something?
>
> No :(
>
> I am currently not testing against the mdraid but this shouldn't matter.
>
> However, it looks like you don't test on bare metal, do you?
>
> I tried to test on VMware Workstation 16 myself but VMware's nvme
> implementation is currently broken
> (https://github.com/vmware/open-vm-tools/issues/579).

I am testing with QEMU emulator version 6.2.0. I can also test with
bare metal.

Thanks,
Song
