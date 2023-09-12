Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226751640D
	for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 08:09:00 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-502153ae36cso8524270e87.3
        for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 01:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694506139; x=1695110939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRy58mtOMfLsnyOd5KeG4RjAf/fDpf2NPVmv4pRKN3U=;
        b=sve4wpIDdsosSF3TFGQoI+E4CXuPxSAyyZZR4/TUFwk0bR/czAct2i4rPgXKWui0Go
         Wc8X7Nk5KiurXWkYP+V5fU2yHDFyiksiCtPOGBfQonRv1gVGjx0fGnXFQ9uRqfmzRq0b
         6bfOfdw9DO79ucMvNB+zw9gVVSvyWfJbCIZH969fdeeUpZVFNFL6GbuyyYhulAx7cPy7
         ejHUSyvxszwv2ciUd3ZBOZIWDtNVdnylkH1HU9Krsgm2uHW7Lbbyq9sXwHpHT62QZsSr
         vRCtEOfDnHqrgw7WMofa5bVCFyMyFDGUtuYiX++cqU12XDq+qwZS+8baIr+1OIkkG+kw
         TrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694506139; x=1695110939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRy58mtOMfLsnyOd5KeG4RjAf/fDpf2NPVmv4pRKN3U=;
        b=DOXGkHQAe2XmbYHs5AZGIZWM8ymADejFmutooVOY6lrqsCBWywB/RTo86iVLnk+bmR
         E3yDsIh3Rydo6XvdZVXUu3GB9IzuTPZI9+GGmhFS2KG4djzeOd152ZcrnWOBcd7WycQt
         K91zYvA58vrVU1S/A8INrZbZq+Td9zSvcoZgIZKPJaoRCrEvCdqyiYKe/MOsxPlx1Ubh
         P+A+b2gH3NpAnaDCpP6lQkBp/AtiII8urMIfzUnPY2oBO86wBgQbM022ncwb3M9ydNEh
         BLG30+gnu0SBwDWk8meb5l1cvg6cddwezmLtEcyEE+p0wxxnrf+teEjZ/O5bkVsRbYw0
         cpmg==
X-Gm-Message-State: AOJu0YzIgnVuXfQA99uiZzREEtjiAEaV56+yf9hG5WceaWVxsKgOsPof
	xMU8bH8lbH6u1MhBN3Xjwo89vSr6SWz8f9DmIGg=
X-Google-Smtp-Source: AGHT+IFwDwJhrpy8HowhIBYcBi/whf/X/T3w9uKWfcXrLILoGcUMzinlah9wOUe1t9L08eJ9Z5UmcgaMaRFE2N9j4uo=
X-Received: by 2002:a05:6512:33c8:b0:502:a56b:65f7 with SMTP id
 d8-20020a05651233c800b00502a56b65f7mr8526287lfg.16.1694506138521; Tue, 12 Sep
 2023 01:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <8af186ba-5f64-2102-8f9c-3969b0906893@gmail.com>
 <faa245bf-e925-45b0-9827-b0c9c117e06c@leemhuis.info> <ZPc8v9-lHF4jAcxL@kbusch-mbp>
In-Reply-To: <ZPc8v9-lHF4jAcxL@kbusch-mbp>
From: =?UTF-8?Q?Cl=C3=A1udio_Sampaio?= <patola@gmail.com>
Date: Tue, 12 Sep 2023 10:08:48 +0200
Message-ID: <CA+4wXKCAYM19H7n4TpbnrtRy_Yv1JOjT3CHVuxh_18Mb7NB4+A@mail.gmail.com>
Subject: Re: Fwd: Lexar NM790 SSDs are not recognized anymore after 6.1.50 LTS
To: Keith Busch <kbusch@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux NVMe <linux-nvme@lists.infradead.org>, 
	Linux Stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Keith... Just to give you guys a response concerning this, I'm
sorry for the late reply -- too much work. But yes, you are correct,
due to having tried patching the kernel in different days and too much
stuff going on at the same time, I applied this two-line patch to the
same source where I have applied the other patch that multiplies the
timeout by 2 and occurs at an earlier time on activation. I thought I
had an unpatched kernel at the time and ended up compiling it this
way. Sorry for the mistake, but I also saw that now there's a better
patch for the issue.

On Tue, Sep 5, 2023 at 4:35=E2=80=AFPM Keith Busch <kbusch@kernel.org> wrot=
e:
>
> On Tue, Sep 05, 2023 at 01:37:36PM +0200, Linux regression tracking (Thor=
sten Leemhuis) wrote:
> > On 04.09.23 13:07, Bagas Sanjaya wrote:
> > >
> > > I notice a regression report on Bugzilla [1]. Quoting from it:
> > >
> > >> I bought a new 4 TB Lexar NM790 and I was using kernel 6.3.13 at the=
 time. It wasn't recognized, with these messages in dmesg:
> > >>
> > >> [ 358.950147] nvme nvme0: pci function 0000:06:00.0
> > >> [ 358.958327] nvme nvme0: Device not ready; aborting initialisation,=
 CSTS=3D0x0
> > >>
> > >> My other NVMe appears correctly in the nvme list though.
> > >>
> > >>
> > >> So I tried using other kernels I had installed at the time: 6.3.7, 6=
.4.10, 6.5.0rc6, 6.5.0, 6.5.1 and none of these recognized the disk.
> > >> I installed the 6.1.50 lts kernel from arch repositories (I can comp=
ile my own too if this would be an issue) and then the device was correctly=
 recognized:
> > >>
> > >> [    4.654613] nvme 0000:06:00.0: platform quirk: setting simple sus=
pend
> > >> [    4.654632] nvme nvme0: pci function 0000:06:00.0
> > >> [    4.667290] nvme nvme0: allocated 40 MiB host memory buffer.
> > >> [    4.709473] nvme nvme0: 16/0/0 default/read/poll queues
> >
> > FWIW, the quoted mail missed one crucial detail:
> > """
> >  Claudio Sampaio 2023-09-02 19:04:29 UTC
> >
> > Adding the two lines
> >
> > =E2=94=82 3457   { PCI_DEVICE(0x1d97, 0x1602), /* Lexar NM790 */
> > =E2=94=82 3458   =E2=94=82 .driver_data =3D NVME_QUIRK_BOGUS_NID, },
> >
> > in file drivers/nvme/host/pci.c made my NVMe work correctly. Compiled a
> > new 6.5.1 kernel and everything works.
> > """
> >
> > @NVME maintainers: is there anything more you need from Claudio at this
> > point?
>
> Yes: it doesn't really make any sense. The report says the device
> stopped showing up with message:
>
>   nvme nvme0: Device not ready; aborting initialisation, CSTS=3D0x0
>
> That (a) happens long before the mentioned quirk is considered by the
> driver, and (b) the "quirk" behavior is now the default in 6.5 and
> several of the listed stable kernels anyway.
>
> It more likely sounds like the device is flaky and either never becomes
> ready due to some unspecified internal firmware condition, or
> inaccurately reports how long it actually needs to become ready in
> worst-case-scenario.



--=20
Cl=C3=A1udio "Patola" Sampaio
MakerLinux Labs - Campinas, SP
Resume Gmail - YOUTUBE!
Facebook - Facebook da MakerLinux - Lattes
