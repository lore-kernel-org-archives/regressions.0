Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D76CEA8
	for <regressions@lists.linux.dev>; Tue, 22 Aug 2023 08:14:00 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-26b44247123so2892294a91.2
        for <regressions@lists.linux.dev>; Tue, 22 Aug 2023 01:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692692040; x=1693296840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwxiBeDcoEfjxHyLx/YtIfeLMp3A+ec/F6ReskGMLXc=;
        b=HThE9kN+7jf8RJfftViPpYzqQ8ngRWyzTx/TGqSavkIrwNwXJjw7G80N9aJjuDw8Ba
         5omVwMciJhjb4xAQgzCvNnnXA37RXjKKOEC3KEHo7jAvU1OTWiF4RbHUFbkTQ6nWd4BW
         UlIjTeI8kx2Gy27+trg/UQ1lJihrrD08bfl6pCKxyY/d8dyUTjHP2tXuTe8Q+4EC6EM6
         tfNp+1nZnLXclDyiubLY6B2YU/7wMJO1ND3nzhVa7aWw19NDt+m4YkATePqOyOzDUUMq
         6UlaPKJYKwcuvtQO0XFhgroezzOzdofRZOsRZF9JP0Adp0Dj8Y0WxZ8U7XhZ4C0cjzLX
         RE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692692040; x=1693296840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwxiBeDcoEfjxHyLx/YtIfeLMp3A+ec/F6ReskGMLXc=;
        b=af1XiWYNsoE4zHOB/zj1G22NNZ5oNgrGkfQobRXY1GIX7uXdBU9UnxnAwSIkxbcuch
         oPyise7pAjS+MSXuuZAgx3O4oRBD8VUz/hWfRl6uNQVKu6g46mZB76zdBCDJmhyy5gmj
         5iI4c2siIKnfhO+lKxAs52ZIJVXEUYZi5Xun8sBvQYr8v1MJWM/T3MZy7Nz6P5dQrcy7
         OmKpxncv4UhqgsiUky5j+DBqHUNoDyF9A3R6Ng56qfqKGlQvVgUKUKFFHSIj0zbX5nsa
         Y/JOLZhGZg1VbxSSJnLYLGxAzHA53ojQY0n8YH+7NeF3KYHCh7GoHVihUO33VczIujPl
         hGrg==
X-Gm-Message-State: AOJu0Yxanc7bPzrAM/TWDqxTTTmvqc+kLvDjkWwwRm0Mg5d5XYPuMg2O
	luajG9Zb5olD3gbfjfa5TMLb/9UcmgMvcAA7ehA=
X-Google-Smtp-Source: AGHT+IGOVXKDbj5W9DpLYjMonS6xODRpZvmTPWASdKq2gj/glZLPLyPpr5nC7uv4B1DL1sLt8thrH5LwCa2okSOpbvQ=
X-Received: by 2002:a17:90a:4ec2:b0:268:f987:305f with SMTP id
 v2-20020a17090a4ec200b00268f987305fmr8157642pjl.46.1692692039649; Tue, 22 Aug
 2023 01:13:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <028a21df-4397-80aa-c2a5-7c754560f595@gmail.com>
 <20230818101630.000027f4@linux.intel.com> <b0488ff7-10c8-4b4e-28b8-01809133c297@linux.dev>
 <CAPhsuW6cSLqwRVO_EpFyimvc7hgi1rb3T8-NA+stHdwrqrScBA@mail.gmail.com> <20230822083923.00007fb6@linux.intel.com>
In-Reply-To: <20230822083923.00007fb6@linux.intel.com>
From: AceLan Kao <acelan@gmail.com>
Date: Tue, 22 Aug 2023 16:13:46 +0800
Message-ID: <CAMz9Wg8KE1rDkSaQnUTJ5ikzH7YGGYbkLM3AcrVue3=JgK+14w@mail.gmail.com>
Subject: Re: Infiniate systemd loop when power off the machine with multiple
 MD RAIDs
To: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
Cc: Song Liu <song@kernel.org>, Guoqing Jiang <guoqing.jiang@linux.dev>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@lst.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux RAID <linux-raid@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com> =E6=96=BC 2023=E5=B9=B48=
=E6=9C=8822=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:39=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Mon, 21 Aug 2023 23:17:54 -0700
> Song Liu <song@kernel.org> wrote:
>
> > On Mon, Aug 21, 2023 at 8:51=E2=80=AFPM Guoqing Jiang <guoqing.jiang@li=
nux.dev> wrote:
> > >
> > >
> > >
> > > On 8/18/23 16:16, Mariusz Tkaczyk wrote:
> > > > On Wed, 16 Aug 2023 16:37:26 +0700
> > > > Bagas Sanjaya<bagasdotme@gmail.com>  wrote:
> > > >
> > > >> Hi,
> > > >>
> > > >> I notice a regression report on Bugzilla [1]. Quoting from it:
> > > >>
> > > >>> It needs to build at least 2 different RAIDs(eg. RAID0 and RAID10=
, RAID5
> > > >>> and RAID10) and then you will see below error repeatly(need to us=
e
> > > >>> serial console to see it)
> > > >>>
> > > >>> [ 205.360738] systemd-shutdown[1]: Stopping MD devices.
> > > >>> [ 205.366384] systemd-shutdown[1]: sd-device-enumerator: Scan all=
 dirs
> > > >>> [ 205.373327] systemd-shutdown[1]: sd-device-enumerator: Scanning
> > > >>> /sys/bus [ 205.380427] systemd-shutdown[1]: sd-device-enumerator:
> > > >>> Scanning /sys/class [ 205.388257] systemd-shutdown[1]: Stopping M=
D
> > > >>> /dev/md127 (9:127). [ 205.394880] systemd-shutdown[1]: Failed to =
sync
> > > >>> MD block device /dev/md127, ignoring: Input/output error [ 205.40=
4975]
> > > >>> md: md127 stopped. [ 205.470491] systemd-shutdown[1]: Stopping MD
> > > >>> /dev/md126 (9:126). [ 205.770179] md: md126: resync interrupted.
> > > >>> [ 205.776258] md126: detected capacity change from 1900396544 to =
0
> > > >>> [ 205.783349] md: md126 stopped.
> > > >>> [ 205.862258] systemd-shutdown[1]: Stopping MD /dev/md125 (9:125)=
.
> > > >>> [ 205.862435] md: md126 stopped.
> > > >>> [ 205.868376] systemd-shutdown[1]: Failed to sync MD block device
> > > >>> /dev/md125, ignoring: Input/output error [ 205.872845] block devi=
ce
> > > >>> autoloading is deprecated and will be removed. [ 205.880955] md: =
md125
> > > >>> stopped. [ 205.934349] systemd-shutdown[1]: Stopping MD /dev/md12=
4p2
> > > >>> (259:7). [ 205.947707] systemd-shutdown[1]: Could not stop MD
> > > >>> /dev/md124p2: Device or resource busy [ 205.957004]
> > > >>> systemd-shutdown[1]: Stopping MD /dev/md124p1 (259:6). [ 205.9641=
77]
> > > >>> systemd-shutdown[1]: Could not stop MD /dev/md124p1: Device or re=
source
> > > >>> busy [ 205.973155] systemd-shutdown[1]: Stopping MD /dev/md124 (9=
:124).
> > > >>> [ 205.979789] systemd-shutdown[1]: Could not stop MD /dev/md124: =
Device
> > > >>> or resource busy [ 205.988475] systemd-shutdown[1]: Not all MD de=
vices
> > > >>> stopped, 4 left.
> > > >> See Bugzilla for the full thread and attached full journalctl log.
> > > >>
> > > >> Anyway, I'm adding this regression to be tracked by regzbot:
> > > >>
> > > >> #regzbot introduced: 12a6caf273240a
> > > >> https://bugzilla.kernel.org/show_bug.cgi?id=3D217798  #regzbot tit=
le:
> > > >> systemd shutdown hang on machine with different RAID levels
> > > >>
> > > >> Thanks.
> > > >>
> > > >> [1]:https://bugzilla.kernel.org/show_bug.cgi?id=3D217798
> > > >>
> > > > Hello,
> > > > The issue is reproducible with IMSM metadata too, around 20% of reb=
oot
> > > > hangs. I will try to raise the priority in the bug because it is va=
lid
> > > > high- the base functionality of the system is affected.
> > >
> > > Since it it reproducible from your side, is it possible to turn the
> > > reproduce steps into a test case
> > > given the importance?
>
> I didn't try to reproduce it locally yet because customer was able to
> bisect the regression and it pointed them to the same patch so I connecte=
d it
> and asked author to take a look first. At a first glance, I wanted to get
> community voice to see if it is not something obvious.
>
> So far I know, customer is creating 3 IMSM raid arrays, one is the system
> volume and do a reboot and it sporadically fails (around 20%). That is al=
l.
>
> > >
> > > I guess If all arrays are set with MD_DELETED flag, then reboot might
> > > hang, not sure whether
> > > below (maybe need to flush wq as well  before list_del) helps or not,
> > > just FYI.
> > >
> > > @@ -9566,8 +9566,10 @@ static int md_notify_reboot(struct notifier_bl=
ock
> > > *this,
> > >
> > >          spin_lock(&all_mddevs_lock);
> > >          list_for_each_entry_safe(mddev, n, &all_mddevs, all_mddevs) =
{
> > > -               if (!mddev_get(mddev))
> > > +               if (!mddev_get(mddev)) {
> > > +                       list_del(&mddev->all_mddevs);
> > >                          continue;
> > > +               }
> >
> > I am still not able to reproduce this, probably due to differences in t=
he
> > timing. Maybe we only need something like:
> >
> > diff --git i/drivers/md/md.c w/drivers/md/md.c
> > index 5c3c19b8d509..ebb529b0faf8 100644
> > --- i/drivers/md/md.c
> > +++ w/drivers/md/md.c
> > @@ -9619,8 +9619,10 @@ static int md_notify_reboot(struct notifier_bloc=
k
> > *this,
> >
> >         spin_lock(&all_mddevs_lock);
> >         list_for_each_entry_safe(mddev, n, &all_mddevs, all_mddevs) {
> > -               if (!mddev_get(mddev))
> > +               if (!mddev_get(mddev)) {
> > +                       need_delay =3D 1;
> >                         continue;
> > +               }
> >                 spin_unlock(&all_mddevs_lock);
> >                 if (mddev_trylock(mddev)) {
> >                         if (mddev->pers)
> >
> >
> > Thanks,
> > Song
>
> I will try to reproduce issue at Intel lab to check this.
>
> Thanks,
> Mariusz
Hi Guoqing,

Here is the command how I trigger the issue, have to do it around 10
times to make sure the issue is reproducible

echo "repair" | sudo tee /sys/class/block/md12?/md/sync_action && sudo
grub-reboot "Advanced options for Ubuntu>Ubuntu, with Linux 6.5.0-rc77
06a74159504-dirty" && head -c 1G < /dev/urandom > myfile1 && sleep 180
&& head -c 1G < /dev/urandom > myfile2 && sleep 1 && cat /proc/mdstat
&& sleep 1 && rm myfile1 &&
sudo reboot

And the patch to add need_delay doesn't work.



--
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
