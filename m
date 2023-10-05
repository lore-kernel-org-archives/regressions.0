Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E2F26E12
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X97SIj1z"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d867d4cf835so1192152276.1
        for <regressions@lists.linux.dev>; Thu, 05 Oct 2023 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696518681; x=1697123481; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDKk4zcepbEXhYnWFEfyiLcTdCbSHcJlVA6KWd/TpwI=;
        b=X97SIj1zw8XodY/r1NzUhnFaxxV/8Ht1c1gX8IN41v8Mp+UPwdb/arCwx6dRZy/v4C
         y4ivqP6kdiylejt8i+k5I7aCZ5Bx6Ka/OoJAEFE+2WhNCVJt/6+QGTzu2B1THSb+7VpC
         OOBW79XXcHRweJ3hegfs4aysQpCW1c20UVdEdXNtk0ikcVq5+O2zJi6IBZvsSJ2dHUt0
         AFtC1ogj5Vhom47iZpx+kYK4XIchFk4qhplx0A8Ys4SvJZL8o4TyYJM3T4UlFtw9lO37
         Cg3crxYNPIzUSM9DpsrtTn9EmZq62d7jcwUMaMs45rWL0vA4d3p4dJgUsOoLzfUh4elm
         KqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696518681; x=1697123481;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDKk4zcepbEXhYnWFEfyiLcTdCbSHcJlVA6KWd/TpwI=;
        b=j1Z7EdB/Q4kdeZBL4Md+iI4QrVghNNtJO3VO4eJorKZKnHhS5SLvF6TmPi3tPOGfK0
         HeRz0tshgj9THZqZCx7ddcTiaCTxW+oBXIgdS9pXExJTrT73/jvc3DLkBv/WWM+CT7Pu
         Z4Cs91EScTyzMvVBMDEyby8dRH9/wdZ+LIGUao33XO4mbhXRawwQnelJXVwpZQdwpX6b
         X9R6O/dNfbbzBXUoAqI+urkw6RuZmJrdz0aDM9yfvAqWjn9NpYDz/Fp8vdoFPSh6dynE
         DaatThq3dvIh48ikYW0COTNxRVJiJ24Jb0z1XD5o1yCOy5rD7996IDGoNMZSPfYo8eAR
         anYw==
X-Gm-Message-State: AOJu0Yz3znNomEmWYRH3VT5HJHJhd2pSvlv1zFcSeQoVhfqGMg+e6BG/
	W1Uhp5bPzMb0L1YGRWz9MyVF8Gh+OaI2QCBh9pA0777eHJ7UwA==
X-Google-Smtp-Source: AGHT+IGeyvHyPuhTwBG/gLL3HF9QAH+K3XgQRQDrPDbkkhbmB1wo6bAt5doIk2w8S7B7FokS5oE0ZDpPw4WAy6bNyfo=
X-Received: by 2002:a25:b31a:0:b0:d4b:ab7b:17ed with SMTP id
 l26-20020a25b31a000000b00d4bab7b17edmr4848888ybj.4.1696518681385; Thu, 05 Oct
 2023 08:11:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
 <ZRtWcgiH5JhD5NU2@debian.me> <CAH7-e5uspavg_VBJxKLOKJfU3nAq-OrPqzihF2opffY-ReiC-w@mail.gmail.com>
 <834062302e6a98e773dc4b03d7ed568a0f1c44fc.camel@nordicsemi.no>
 <CAH7-e5uZzmnFJAJrG664G6_JbK--DfbKC50aeVN5gMMxDJ51UA@mail.gmail.com>
 <ba7aaaed859ea2c4f5aac597deb382cceab33d65.camel@nordicsemi.no>
 <CAH7-e5unq6ggNjVkSsriUAmpvk4s7-NCYJrZnLK_3BjFO_Dceg@mail.gmail.com> <3e86e69c-64bc-4776-9ee8-75b98be1bf3e@leemhuis.info>
In-Reply-To: <3e86e69c-64bc-4776-9ee8-75b98be1bf3e@leemhuis.info>
From: =?UTF-8?Q?Erik_Dob=C3=A1k?= <erik.dobak@gmail.com>
Date: Thu, 5 Oct 2023 17:11:10 +0200
Message-ID: <CAH7-e5v6jQyjeYDYr0zRXw_7XsdD1M2bbsBBcg0MZ3nZifhJ4g@mail.gmail.com>
Subject: Re: bluetooth issues since kernel 6.4 - not discovering other bt
 devices - /linux/drivers/bluetooth/btusb.c
To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Oct 2023 at 07:20, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 03.10.23 18:10, Erik Dob=C3=A1k wrote:
> > Sorry Tomasz,
> >
> > that must have been a reality glitch with your commit (cant find the
> > page refering to your commit now). But yes it is probably a kernel bug
> > as it manifests kernels 6.4 and not in the 6.1 LTS version.
>
> Could you then please try a bisection to get us closer to the problem?
> You might want to try mainline (e.g. 6.6-rc4) first, with a bit of luck
> the problem is fixed there already; FWIW, a few BT fixes that might or
> might not be relevant for your case are heading that way and will most
> likely be in 6.6-rc5.
>
> Ciao, Thorsten
>
> > On Tue, 3 Oct 2023 at 15:08, Tomasz Mo=C5=84 <tomasz.mon@nordicsemi.no>=
 wrote:
> >>
> >> On Tue, 2023-10-03 at 14:42 +0200, Erik Dob=C3=A1k wrote:
> >>> Sure here you go:
> >>>
> >>> # lsusb -d 04c5:1670 -v
> >>>
> >>> Bus 001 Device 004: ID 04c5:1670 Fujitsu, Ltd Bluetooth Radio
> >>> Device Descriptor:
> >>>   bLength                18
> >>>   bDescriptorType         1
> >>>   bcdUSB               1.00
> >>>   bDeviceClass          224 Wireless
> >>>   bDeviceSubClass         1 Radio Frequency
> >>>   bDeviceProtocol         1 Bluetooth
> >>>   bMaxPacketSize0        64
> >>>   idVendor           0x04c5 Fujitsu, Ltd
> >>>   idProduct          0x1670
> >>>   bcdDevice            0.00
> >>>   iManufacturer           1 Realtek
> >>>   iProduct                2 Bluetooth Radio
> >>>   iSerial                 3 00e04c000001
> >>>   bNumConfigurations      1
> >>>   Configuration Descriptor:
> >>>     bLength                 9
> >>>     bDescriptorType         2
> >>>     wTotalLength       0x00b1
> >>>     bNumInterfaces          2
> >>>     bConfigurationValue     1
> >>>     iConfiguration          0
> >>>     bmAttributes         0xe0
> >>>       Self Powered
> >>>       Remote Wakeup
> >>>     MaxPower              500mA
> >>>     Interface Descriptor:
> >>>       bLength                 9
> >>>       bDescriptorType         4
> >>>       bInterfaceNumber        0
> >>>       bAlternateSetting       0
> >>>       bNumEndpoints           3
> >>>       bInterfaceClass       224 Wireless
> >>>       bInterfaceSubClass      1 Radio Frequency
> >>>       bInterfaceProtocol      1 Bluetooth
> >>>       iInterface              4 Bluetooth Radio
> >>
> >> I have no idea why you referred to my commits, i.e. c13380a55522
> >> ("Bluetooth: btusb: Do not require hardcoded interface numbers") later
> >> fixed by eaac6e223a0d ("Bluetooth: btusb: Fix bluetooth on Intel
> >> Macbook 2014") in the first place.
> >>
> >> BTUSB_IFNUM_2 is not even getting set for this device and therefore th=
e
> >> patches have no impact on your issue. If you were affected, like the
> >> Intel Macbook 2014 was, then bear in mind that the issue would manifes=
t
> >> as btusb driver not even binding to the device. From your emails
> >> however it appears that the issue is something different.
> >>
> >> I honestly don't think it has anything to do with my patches. If you
> >> know a Linux version where your bluetooth device works, then the next
> >> step would be to bisect to find the first bad commit.
> >>
> >> Best Regards,
> >> Tomasz Mo=C5=84
> >
> >

Hello Thorsten,

after more than a day of netto compile time my bisection goes as following:
kernelbuild:
linux-6.6-rc4  linux-6.6-rc4.tar.gz
----bt no discovery---

kernelbuild2:
linux-6.3.9  linux-6.3.9.tar.xz
----bt no discovery---

kernelbuild3:
linux-6.2.9  linux-6.2.9.tar.xz
----bluetoothd wont start and i cant test it with btctl---

kernelbuild4:
linux-6.3.7  linux-6.3.7.tar.gz
----bt no discovery---

kernelbuild6:
linux-6.3.13  linux-6.3.13.tar.gz
----bt no discovery---

kernelbuild7:
linux-6.2  linux-6.2.tar.gz
----bluetoothd wont start and i cant test it with btctl---

I could compile the latest 6.2 kernel maybe things will get better and
i can test again.
But it seams that this is a pre 6.4 issue not like the article on the
world wide interwebs says.
In theory we could assume that it happened between 6.1latest-artix and
6.2first-vanilla

What do you propose now?

Yours

E
