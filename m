Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4B21D317
	for <regressions@lists.linux.dev>; Tue, 22 Aug 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BF2C433C8
	for <regressions@lists.linux.dev>; Tue, 22 Aug 2023 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692730579;
	bh=aet0iF2o60a3c3pvv775GQV7jYkTtlDneGAO4LGrg3U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LD/fAycgmTPpfuWhXoXWMjXLsWZ5Z3g4HT6kJ6ryF7BSwS/3g+D5fhp9hXeUVZBdT
	 Z3BORWNKPzWt5hlPiPhX5YqRNqiNKgkoLcTKG7TnMQZiVjp65zeSu99wgiU0J9+1zh
	 pcvWZiqfSV84FhSiDiRRUbOdMmw0kD2IJQqint14nXnOrGTvghg4XyyWxEQHhiukKm
	 +XTbs5nx1szt9mHQQkh9+WInae+76lM0maeKNkVqYyvXa+cmyh1i2LdYqRoeMwVpSH
	 gxQRpa1Y0yujT88pf3ZWYfdFVtFrrM4ayin/W2vn31T1388Pebnt5osLkgDeR6tVgo
	 1e8jKwCN6voBQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4ff91f2d7e2so6912012e87.0
        for <regressions@lists.linux.dev>; Tue, 22 Aug 2023 11:56:19 -0700 (PDT)
X-Gm-Message-State: AOJu0YxVgWO8VhLK5wPSB1LrO9QnaSWRcKAc8hQbfxHIRRK5P3xA+eIO
	DgxX1VI/esUeil5cI3JFPRof/l3wgrYtdkVkVFE=
X-Google-Smtp-Source: AGHT+IHfAxcIi9Piq9Oj+V7RJku3LNFwWPGReKt1Mh0J9dUOB/gWYXDpP9XgEFnPQKf/xnz8LucrZFMvCC3ooqVRyYU=
X-Received: by 2002:a05:6512:3b28:b0:4f9:596d:c803 with SMTP id
 f40-20020a0565123b2800b004f9596dc803mr9936842lfv.53.1692730577195; Tue, 22
 Aug 2023 11:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <028a21df-4397-80aa-c2a5-7c754560f595@gmail.com>
In-Reply-To: <028a21df-4397-80aa-c2a5-7c754560f595@gmail.com>
From: Song Liu <song@kernel.org>
Date: Tue, 22 Aug 2023 11:56:04 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5Od9tczboEBxC8gn+2XLkEbirfCUm7WuJBey5MKQjwDA@mail.gmail.com>
Message-ID: <CAPhsuW5Od9tczboEBxC8gn+2XLkEbirfCUm7WuJBey5MKQjwDA@mail.gmail.com>
Subject: Re: Infiniate systemd loop when power off the machine with multiple
 MD RAIDs
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, AceLan Kao <acelan@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux RAID <linux-raid@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 2:37=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Hi,
>
> I notice a regression report on Bugzilla [1]. Quoting from it:
>
> > It needs to build at least 2 different RAIDs(eg. RAID0 and RAID10, RAID=
5 and RAID10) and then you will see below error repeatly(need to use serial=
 console to see it)
> >
> > [ 205.360738] systemd-shutdown[1]: Stopping MD devices.
> > [ 205.366384] systemd-shutdown[1]: sd-device-enumerator: Scan all dirs
> > [ 205.373327] systemd-shutdown[1]: sd-device-enumerator: Scanning /sys/=
bus
> > [ 205.380427] systemd-shutdown[1]: sd-device-enumerator: Scanning /sys/=
class
> > [ 205.388257] systemd-shutdown[1]: Stopping MD /dev/md127 (9:127).
> > [ 205.394880] systemd-shutdown[1]: Failed to sync MD block device /dev/=
md127, ignoring: Input/output error
> > [ 205.404975] md: md127 stopped.
> > [ 205.470491] systemd-shutdown[1]: Stopping MD /dev/md126 (9:126).
> > [ 205.770179] md: md126: resync interrupted.
> > [ 205.776258] md126: detected capacity change from 1900396544 to 0
> > [ 205.783349] md: md126 stopped.
> > [ 205.862258] systemd-shutdown[1]: Stopping MD /dev/md125 (9:125).
> > [ 205.862435] md: md126 stopped.
> > [ 205.868376] systemd-shutdown[1]: Failed to sync MD block device /dev/=
md125, ignoring: Input/output error
> > [ 205.872845] block device autoloading is deprecated and will be remove=
d.
> > [ 205.880955] md: md125 stopped.
> > [ 205.934349] systemd-shutdown[1]: Stopping MD /dev/md124p2 (259:7).
> > [ 205.947707] systemd-shutdown[1]: Could not stop MD /dev/md124p2: Devi=
ce or resource busy
> > [ 205.957004] systemd-shutdown[1]: Stopping MD /dev/md124p1 (259:6).
> > [ 205.964177] systemd-shutdown[1]: Could not stop MD /dev/md124p1: Devi=
ce or resource busy
> > [ 205.973155] systemd-shutdown[1]: Stopping MD /dev/md124 (9:124).
> > [ 205.979789] systemd-shutdown[1]: Could not stop MD /dev/md124: Device=
 or resource busy
> > [ 205.988475] systemd-shutdown[1]: Not all MD devices stopped, 4 left.

From systemd code, i.e. function delete_md(), this error:

[ 205.957004] systemd-shutdown[1]: Stopping MD /dev/md124p1 (259:6).
[ 205.964177] systemd-shutdown[1]: Could not stop MD /dev/md124p1:
Device or resource busy

is most likely triggered by ioctl(STOP_ARRAY).

And based on the code, I think the ioctl fails here:

        if (cmd =3D=3D STOP_ARRAY || cmd =3D=3D STOP_ARRAY_RO) {
                /* Need to flush page cache, and ensure no-one else opens
                 * and writes
                 */
                mutex_lock(&mddev->open_mutex);
                if (mddev->pers && atomic_read(&mddev->openers) > 1) {
                        mutex_unlock(&mddev->open_mutex);
                        err =3D -EBUSY;
                        goto out;        ////////////////////// HERE
                }
                if (test_and_set_bit(MD_CLOSING, &mddev->flags)) {
                        mutex_unlock(&mddev->open_mutex);
                        err =3D -EBUSY;
                        goto out;
                }
                did_set_md_closing =3D true;
                mutex_unlock(&mddev->open_mutex);
                sync_blockdev(bdev);
        }

>
> See Bugzilla for the full thread and attached full journalctl log.
>
> Anyway, I'm adding this regression to be tracked by regzbot:
>
> #regzbot introduced: 12a6caf273240a https://bugzilla.kernel.org/show_bug.=
cgi?id=3D217798
> #regzbot title: systemd shutdown hang on machine with different RAID leve=
ls

But the observation above doesn't seem to match the bisect result
and it doesn't seem to be related to different RAID levels.

Thanks,
Song

>
> Thanks.
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217798
>
> --
> An old man doll... just what I always wanted! - Clara
