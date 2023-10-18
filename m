Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB87E179B6
	for <regressions@lists.linux.dev>; Wed, 18 Oct 2023 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NMn5vv9v"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-507c78d258fso859124e87.2
        for <regressions@lists.linux.dev>; Wed, 18 Oct 2023 02:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697621435; x=1698226235; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+z3LrvywvH2G6NIfVU/XJ/JLCRcetjXjsTm8sPFYUo=;
        b=NMn5vv9vjct/EFTivw+7w3ExeBO5u89ZxlI61FOZaII6G1BDe+IImvTfRS0/TbxSPy
         9i///KbrvBBKTDFLh+68xp8koEG5zr3IarzwHrGdp9dHKW/21Dk9P5WLygZ7B4L++Llo
         a8UKaxA5tq5lb+irK41ZC7EcWd5eJJYT/4E3w4SGhY2nnlRkTYO9yMcCWscCxZkjJNJc
         wri7zVVgKwe+0yyvG47XvveTjQFhn5rpJ9ioCkTac3/PTjX+ZG4nvfYIY7aNcQn5WjIz
         IQiRkov+BUsh970JaKaugkrw+AJnopw/mD/ND/X1yzAasaQe9p9npEfb0TzPAJ5ISoYk
         FGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697621435; x=1698226235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+z3LrvywvH2G6NIfVU/XJ/JLCRcetjXjsTm8sPFYUo=;
        b=s9YA80H3fahal7Q9rMFylvQxlelMEK7xnhFm6VOFg0+Z46W2qHbGChj/FX31m3lHkW
         /YwUTtdxo+GzwE9tvYCwdKeDvXQMrlG+ioAec+v248/9UHzcxIX2Na1S0ID2F8bqMPdP
         VEUcCr7mNVLI4mkRqj8xpgY+Ae7LJn1AavAATmhHHk8nser3YsJ6qaLFYmcviIyM6rhT
         aHhDp1m/5UG8Vyg32b3RJDXaRP18ibBvgvpNq9njbTZFSrih121nvabrwKh523bSoL85
         pGG+/x9Xy+Kj/hEqdiQB0FEuXfIlACx19iwAmNvRdU5aKBR+3RK/0EqQorcs/tQ48e4n
         3Yhw==
X-Gm-Message-State: AOJu0YxkfNO/kCl0E3E85f6Ze1aHdnEaMKLrRn/126rRyveJR/uQLO85
	+m5O0ENR5PtNSLORlpCS5ZuDvB4RFyyZvLgr3QPiBw==
X-Google-Smtp-Source: AGHT+IH2uQl/Fyj8SvKhXifub5DJW84yf3ZAxCw8sNP+SVz2+WDQW00+UrhEUCDO9c7YO/aRloQrvnHIDGn00Q/iL1Y=
X-Received: by 2002:a05:6512:3102:b0:507:9b70:1f0e with SMTP id
 n2-20020a056512310200b005079b701f0emr3807189lfb.24.1697621434724; Wed, 18 Oct
 2023 02:30:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Nh-DzlX--3-9@bens.haus> <CAMj1kXFKe6piagNLdSUhxUhwLB+RfNHqjNWt8-r2CNS-rBdJKA@mail.gmail.com>
 <817366c2-33e0-4908-90ec-57c63e3eb471@canonical.com>
In-Reply-To: <817366c2-33e0-4908-90ec-57c63e3eb471@canonical.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 18 Oct 2023 12:29:58 +0300
Message-ID: <CAC_iWjJB3OTWiYX5YsJmNcPQw+rHSm955c1Z5pUajedWGM5QgA@mail.gmail.com>
Subject: Re: [REGRESSION] boot fails for EFI boot stub loaded by u-boot
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Ben Schneider <ben@bens.haus>, Regressions <regressions@lists.linux.dev>, 
	Linux Efi <linux-efi@vger.kernel.org>, Stable <stable@vger.kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 18 Oct 2023 at 12:17, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 10/18/23 10:34, Ard Biesheuvel wrote:
> > (cc Heinrich)
> >
> > Hello Ben,
> >
> > Thanks for the report.
> >
> > On Wed, 18 Oct 2023 at 03:19, Ben Schneider <ben@bens.haus> wrote:
> >>
> >> Hi Ard,
> >>
> >> I have an ESPRESSObin Ultra (aarch64) that uses U-Boot as its bootload=
er. It shipped from the manufacturer with with v5.10, and I've been trying =
to upgrade. U-Boot supports booting Image directly via EFI (https://u-boot.=
readthedocs.io/en/latest/usage/cmd/bootefi.html), and I have been using it =
that way to successfully boot the system up to and including v6.0.19. Howev=
er, v6.1 and v6.5 kernels fail to boot.
> >>
> >> When booting successfully, the following messages are displayed:
> >>
> >> EFI stub: Booting Linux Kernel...EFI stub: ERROR: FIRMWARE BUG: efi_lo=
aded_image_t::image_base has bogus value
> >> EFI stub: ERROR: FIRMWARE BUG: kernel image not aligned on 64k boundar=
y
> >> EFI stub: Using DTB from configuration table
> >> EFI stub: ERROR: Failed to install memreserve config table!
> >> EFI stub: Exiting boot services...
> >> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> >>
> >> I suspect many of the above error messages are simply attributable to =
using U-Boot to load an EFI stub and can be safely ignored given that the s=
ystem boots and runs fine.
>
> These messages are not typical for launching a kernel via the EFI stub
> from U-Boot. It should look like this:

The alignment one might be true depending on the U-Boot version that's used=
.
The alignment was fixed on commit ebdea88d57d5e ("efi_loader: Fix
loaded image alignment")
The rest indeed make little sense for now

>
> =3D> load mmc 0:1 $fdt_addr_r boot/dtb
> 28846 bytes read in 6 ms (4.6 MiB/s)
> =3D> load mmc 0:1 $kernel_addr_r boot/vmlinuz
> 53686664 bytes read in 2223 ms (23 MiB/s)
> =3D> setenv bootargs root=3D/dev/mmcblk0p1 efi=3Ddebug earlyprintk
> initrd=3Dboot/initrd.img
> =3D> bootefi $kernel_addr_r $fdt_addr_r
> Card did not respond to voltage select! : -110
> Failed to load EFI variables
> Booting /boot\vmlinuz
> EFI stub: Booting Linux Kernel...
> EFI stub: EFI_RNG_PROTOCOL unavailable
> EFI stub: Loaded initrd from command line option
> EFI stub: Using DTB from configuration table
> EFI stub: Exiting boot services...
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
>

[...]

Cheers
/Ilias
