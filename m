Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ADB1DD528
	for <regressions@lists.linux.dev>; Mon,  7 Oct 2024 16:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728319804; cv=none; b=lkv3m+qsm0k+5e8S+x/Y6G4auSTHCvyH8Wq/6N1zdZf3QZZzJ1GYFY62pNgGjz/ROi314vOsj+6ctrjglmoaNTn6Qd4yU4oUmFxuQEb94s49i4vzRyWLJB3+WZlRh15h2VDnsq9DSJ3ZeGxiDR4O3fIlmdPZqOvEEG6qPF+4xGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728319804; c=relaxed/simple;
	bh=6dI3sJJNpJlplzaGuy7c1kRQ/dEO5ZpL6LqEprZfR5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z9T7oNVYPM0FCyLihRZQ/rGTswM1QgfUwN1jYtflbbWZImHDR+e7GFwBsVDRpLTb2IMSQw6uQLAD45i1T6e4hwy4Mh6Mk4aEwgpR6yZKmoQH84FjMu0Xg6QcnY1kDzQ9tWKE/AFUNISZ64u6x5c1yVgbTYwU4/CUhbz7H/bL63w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fstab.de; spf=pass smtp.mailfrom=fstab.de; dkim=pass (2048-bit key) header.d=fstab.de header.i=@fstab.de header.b=F6hubWso; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fstab.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fstab.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fstab.de header.i=@fstab.de header.b="F6hubWso"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6c3f12d3930so37773876d6.3
        for <regressions@lists.linux.dev>; Mon, 07 Oct 2024 09:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fstab.de; s=google; t=1728319802; x=1728924602; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmGaAQmkU9F3c2Jeb7g7GHDPHRwyj2CfpEporkATVQA=;
        b=F6hubWsoVIWgw/nZi/3CMdkDtNJnAX9x5sJPgtVljDiJHohO/PAjpIqxH8qCvEPPZ0
         Ue6x8wC7FS/KzOZdjkxkMJLAr1RuCbBwD69nEwpy3WgDkdxaphzik6yrnVvHoh8KB733
         sWHf8Cnxwqd496fkEm7/lWj2Os/Peaogu+qACizTEgjdjo72DM10/Inhk1CGxxTBjl4W
         LJY29rhOSeR5isHdt+S0p9TKDJfO3PHCVctVIGpJWyz6bobqkf1xr6snYfgc+B2oS0JT
         OePy3yB4vHWEKaPpvLI7njSgbuVAODdHKjTl8zRGm1sdDKbAF96zzgDO1SZVuOp+QoLh
         w3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728319802; x=1728924602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmGaAQmkU9F3c2Jeb7g7GHDPHRwyj2CfpEporkATVQA=;
        b=reHWDb7H6W2g4LlaRyXSIPeZlzDj++0E8sZ477wOxE7cSa6M+eD7TA9JzzH+OTW3bK
         +jhcZ0HCv53n1Y0Ev2KYg/WRq48WbXG/CANR78B8R7LEiIWEnMwkZG60wMieTZRnXhrc
         GSwzRImZCOE1Ogps6HomVu9fZZn3eHrWcTQoaOt6rSCnpcP/+0x8X5IayMx/YR5eX8TJ
         u0nt8tmlerc+RLORXtuy3Q9SisBS9W3piC0z9uKexafHoU5AD7N+55bdGRtBJpWR2nHk
         IaQX2Bu7zIm61asDFIc92gU1ES5ZrgV88HpPNbLFVhgwnlus44tkBgx3ydCPEh0ZHT67
         cWGw==
X-Forwarded-Encrypted: i=1; AJvYcCXTPRfPvHgNPV3y/gBm410TsgHvxVAguXu2xZCEV61LskUQBaawiCnLE6LsG0ALCig8Avp3uyVTLo2AtA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIysaNMG38NknTH9pAAA5x2aUJsqQYPcAKN+E0FhXDUCurbgWU
	eyHzGbCJpEDog6fgusrRDm/tMKsqoeTxqwpvlhTkulfVRX+05tPHFA79eFyYAA0jz6sfZLC64ll
	DNV31zf/Av8eS4Iy+AyKyvUot77mUNqs/S+IdpQ==
X-Google-Smtp-Source: AGHT+IEm+VXpk2PXdAMKj32kJciQY2qUulpmzOvWUM5SHIl1I7X9ZVDGrC8jmlFtgyk3aSmC+UhdwaJrO50hnJny9+M=
X-Received: by 2002:a05:6214:2c05:b0:6c5:681e:1d4 with SMTP id
 6a1803df08f44-6cb9a4556a6mr191929736d6.34.1728319801515; Mon, 07 Oct 2024
 09:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPX310gmJeYhE2C6-==rKSDh6wAmoR8R5-pjEOgYD3AP+Si+0w@mail.gmail.com>
 <2024092318-pregnancy-handwoven-3458@gregkh> <CAPX310hNn28m3gxmtus0=EAb3wXvDTgG2HXyR63CBW7HKxYkpg@mail.gmail.com>
In-Reply-To: <CAPX310hNn28m3gxmtus0=EAb3wXvDTgG2HXyR63CBW7HKxYkpg@mail.gmail.com>
From: =?UTF-8?Q?Fabian_St=C3=A4ber?= <fabian@fstab.de>
Date: Mon, 7 Oct 2024 18:49:51 +0200
Message-ID: <CAPX310hCZqKJvEns9vjoQ27=JZzNNa+HK0o4knOMfBBK+JWNEg@mail.gmail.com>
Subject: Re: Dell WD19TB Thunderbolt Dock not working with kernel > 6.6.28-1
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

sorry for the delay, I ran git bisect, here's the output. If you need
any additional info please let me know.

3c1d704d9266741fc5a9a0a287a5c6b72ddbea55 is the first bad commit
commit 3c1d704d9266741fc5a9a0a287a5c6b72ddbea55 (HEAD)
Author: Sanath S <Sanath.S@amd.com>
Date:   Sat Jan 13 10:52:48 2024

    thunderbolt: Reset topology created by the boot firmware

    commit 59a54c5f3dbde00b8ad30aef27fe35b1fe07bf5c upstream.

    Boot firmware (typically BIOS) might have created tunnels of its own.
    The tunnel configuration that it does might be sub-optimal. For instanc=
e
    it may only support HBR2 monitors so the DisplayPort tunnels it created
    may limit Linux graphics drivers. In addition there is an issue on some
    AMD based systems where the BIOS does not allocate enough PCIe resource=
s
    for future topology extension. By resetting the USB4 topology the PCIe
    links will be reset as well allowing Linux to re-allocate.

    This aligns the behavior with Windows Connection Manager.

    We already issued host router reset for USB4 v2 routers, now extend it
    to USB4 v1 routers as well. For pre-USB4 (that's Apple systems) we leav=
e
    it as is and continue to discover the existing tunnels.

    Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
    Signed-off-by: Sanath S <Sanath.S@amd.com>
    Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

 drivers/thunderbolt/domain.c |  5 +++--
 drivers/thunderbolt/icm.c    |  2 +-
 drivers/thunderbolt/nhi.c    | 19 +++++++++++++------
 drivers/thunderbolt/tb.c     | 26 +++++++++++++++++++-------
 drivers/thunderbolt/tb.h     |  4 ++--
 5 files changed, 38 insertions(+), 18 deletions(-)

On Tue, Sep 24, 2024 at 8:58=E2=80=AFAM Fabian St=C3=A4ber <fabian@fstab.de=
> wrote:
>
> Hi Greg,
>
> I can reproduce the issue with the upstream Linux kernel: I compiled
> 6.6.28 and 6.6.29 from source: 6.6.28 works, 6.6.29 doesn't.
>
> I'll learn how to do 'git bisect' to narrow it down to the offending comm=
it.
>
> The non-lts kernel is also broken.
>
> Fabian
>
> On Mon, Sep 23, 2024 at 8:45=E2=80=AFAM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Mon, Sep 23, 2024 at 08:34:23AM +0200, Fabian St=C3=A4ber wrote:
> > > Hi,
> >
> > Adding the linux-usb list.
> >
> > > I got a Dell WD19TBS Thunderbolt Dock, and it has been working with
> > > Linux for years without issues. However, updating to
> > > linux-lts-6.6.29-1 or newer breaks the USB ports on my Dock. Using th=
e
> > > latest non-LTS kernel doesn't help, it also breaks the USB ports.
> > >
> > > Downgrading the kernel to linux-lts-6.6.28-1 works. This is the last
> > > working version.
> > >
> > > I opened a thread on the Arch Linux forum
> > > https://bbs.archlinux.org/viewtopic.php?id=3D299604 with some dmesg
> > > output. However, it sounds like this is a regression in the Linux
> > > kernel, so I'm posting this here as well.
> > >
> > > Let me know if you need any more info.
> >
> > Is there any way you can use 'git bisect' to test inbetween kernel
> > versions/commits to find the offending change?
> >
> > Does the non-lts arch kernel work properly?
> >
> > thanks,
> >
> > greg k-h
