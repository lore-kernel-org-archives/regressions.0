Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D79EA1
	for <regressions@lists.linux.dev>; Mon, 21 Aug 2023 03:24:00 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1c0fcbf7ae4so2155614fac.0
        for <regressions@lists.linux.dev>; Sun, 20 Aug 2023 20:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692588240; x=1693193040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dwP756RQWeaJUheDspLg4gz0IMnHyBo7z6aeWKm5to=;
        b=ikAQcJ4pWR7NAzM1i/Bgbnlbkj024BEWnn91N44/NzFa9swQlRwFAaNY39ydO6Yu27
         UIadmkqHoNqErOR+9fp4V+LQo5C86utCfJfTyqRMBDN5iUYmd23obEmipmiHvulSLn8O
         frmwgwufGqKHQrUtuTa92RDTheTr2jpCPVsFjkKh4BGb/5a7wtoJuH/slxCz67N3VcyJ
         iLNts3eW0vYlf5yl3QUPUBBx2zXThPW3yCzxw4nPdaZbWNE36hqNW3iYV8rsT47nLNSz
         uJ/eU8lOg460Mx+dAMARgvr1xuZbBpBKEG+p9dVZkiewPmVHxzpdwd+UK6ho+K0YrZlD
         UJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692588240; x=1693193040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dwP756RQWeaJUheDspLg4gz0IMnHyBo7z6aeWKm5to=;
        b=Aryeg2G+YQO6gw6Rlo/77EAS6JrnbfqAp0cP96olVoZpBZh+vbEpDA7NpXS9DEMma0
         fWVbjIkK4rYZ+PH4dJ4oR5QlAgURf0flotlHU0sIEuleCr/CDs142t2gyx+erjlsBXHW
         q0ddS/3LYFuxJugAXcSA7qZeDmEGpzDmrxb37afXa6TMxDVKalOlTImm9CsICeLQzyR0
         a9A6aaCL4rJF7E1pQtXFMew0ekQQjVtrgKAMmiy4RqBHplrP2/bUpsPfZDdQhXQXbn9H
         DBPdBjldaPBDFgOysKMAVDgoGyFTrc7zKaRVNsgkiXCoyOCdOk/IW4U4wxvdlGme/+Fc
         1HOw==
X-Gm-Message-State: AOJu0YxWgD9RCsZrKREG6Ma5chK87SWgKBOQrbpZalLjGAoyEfOouvxh
	8fsnxAUr08vDh0JrlpJGfQ9k3ATSwhP1O7pUky8=
X-Google-Smtp-Source: AGHT+IGgEE6tM7judRJSXqnBK33LYdSELpr0YKoHweeIXfDb1yhLZ1CzJS6GH8YXCJhIfW/wV7rvwXw3FbU9cGjr6ys=
X-Received: by 2002:a05:6870:b4ac:b0:1be:cf5d:6f7b with SMTP id
 y44-20020a056870b4ac00b001becf5d6f7bmr8318594oap.17.1692588239918; Sun, 20
 Aug 2023 20:23:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <028a21df-4397-80aa-c2a5-7c754560f595@gmail.com>
 <20230818101630.000027f4@linux.intel.com> <1b2166ab-e788-475e-a8e2-a6cef26f2524@suse.de>
In-Reply-To: <1b2166ab-e788-475e-a8e2-a6cef26f2524@suse.de>
From: AceLan Kao <acelan@gmail.com>
Date: Mon, 21 Aug 2023 11:23:47 +0800
Message-ID: <CAMz9Wg_Homvy7KSSV5kFJKatVCA0_kmG96h577Ak1qv88CHD6g@mail.gmail.com>
Subject: Re: Infiniate systemd loop when power off the machine with multiple
 MD RAIDs
To: Hannes Reinecke <hare@suse.de>
Cc: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@lst.de>, Song Liu <song@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux RAID <linux-raid@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hannes Reinecke <hare@suse.de> =E6=96=BC 2023=E5=B9=B48=E6=9C=8818=E6=97=A5=
 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:21=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 8/18/23 10:16, Mariusz Tkaczyk wrote:
> > On Wed, 16 Aug 2023 16:37:26 +0700
> > Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> >
> >> Hi,
> >>
> >> I notice a regression report on Bugzilla [1]. Quoting from it:
> >>
> >>> It needs to build at least 2 different RAIDs(eg. RAID0 and RAID10, RA=
ID5
> >>> and RAID10) and then you will see below error repeatly(need to use se=
rial
> >>> console to see it)
> >>>
> >>> [ 205.360738] systemd-shutdown[1]: Stopping MD devices.
> >>> [ 205.366384] systemd-shutdown[1]: sd-device-enumerator: Scan all dir=
s
> >>> [ 205.373327] systemd-shutdown[1]: sd-device-enumerator: Scanning /sy=
s/bus
> >>> [ 205.380427] systemd-shutdown[1]: sd-device-enumerator: Scanning /sy=
s/class
> >>> [ 205.388257] systemd-shutdown[1]: Stopping MD /dev/md127 (9:127).
> >>> [ 205.394880] systemd-shutdown[1]: Failed to sync MD block device
> >>> /dev/md127, ignoring: Input/output error [ 205.404975] md: md127 stop=
ped.
> >>> [ 205.470491] systemd-shutdown[1]: Stopping MD /dev/md126 (9:126).
> >>> [ 205.770179] md: md126: resync interrupted.
> >>> [ 205.776258] md126: detected capacity change from 1900396544 to 0
> >>> [ 205.783349] md: md126 stopped.
> >>> [ 205.862258] systemd-shutdown[1]: Stopping MD /dev/md125 (9:125).
> >>> [ 205.862435] md: md126 stopped.
> >>> [ 205.868376] systemd-shutdown[1]: Failed to sync MD block device
> >>> /dev/md125, ignoring: Input/output error [ 205.872845] block device
> >>> autoloading is deprecated and will be removed. [ 205.880955] md: md12=
5
> >>> stopped. [ 205.934349] systemd-shutdown[1]: Stopping MD /dev/md124p2
> >>> (259:7). [ 205.947707] systemd-shutdown[1]: Could not stop MD /dev/md=
124p2:
> >>> Device or resource busy [ 205.957004] systemd-shutdown[1]: Stopping M=
D
> >>> /dev/md124p1 (259:6). [ 205.964177] systemd-shutdown[1]: Could not st=
op MD
> >>> /dev/md124p1: Device or resource busy [ 205.973155] systemd-shutdown[=
1]:
> >>> Stopping MD /dev/md124 (9:124). [ 205.979789] systemd-shutdown[1]: Co=
uld
> >>> not stop MD /dev/md124: Device or resource busy [ 205.988475]
> >>> systemd-shutdown[1]: Not all MD devices stopped, 4 left.
> >>
> >> See Bugzilla for the full thread and attached full journalctl log.
> >>
> >> Anyway, I'm adding this regression to be tracked by regzbot:
> >>
> >> #regzbot introduced: 12a6caf273240a
> >> https://bugzilla.kernel.org/show_bug.cgi?id=3D217798 #regzbot title: s=
ystemd
> >> shutdown hang on machine with different RAID levels
> >>
> >> Thanks.
> >>
> >> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217798
> >>
> >
> > Hello,
> > The issue is reproducible with IMSM metadata too, around 20% of reboot =
hangs. I
> > will try to raise the priority in the bug because it is valid high- the
> > base functionality of the system is affected.
> >
> > Christoph, could you take a look in short term?
> >
> Does this help?
>
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 78be7811a89f..b3661c8def8c 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -9575,6 +9575,7 @@ static int md_notify_reboot(struct notifier_block
> *this,
>          struct mddev *mddev, *n;
>          int need_delay =3D 0;
>
> +       flush_workqueue(md_misc_wq);
>          spin_lock(&all_mddevs_lock);
>          list_for_each_entry_safe(mddev, n, &all_mddevs, all_mddevs) {
>                  if (!mddev_get(mddev))
>
> Cheers,
>
> Hannes
>

Hi Hannes,

The patch doesn't work, I still can reproduce the issue after applied
the patch on top of v6.5-rc7
706a74159504 Linux 6.5-rc7

--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
