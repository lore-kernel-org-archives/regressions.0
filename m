Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E30921361
	for <regressions@lists.linux.dev>; Tue,  3 Oct 2023 12:25:59 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d7e904674aeso897875276.3
        for <regressions@lists.linux.dev>; Tue, 03 Oct 2023 05:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696335958; x=1696940758; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNO5GJBfVgDppnnjLs8Ey/aGvi+SY8q8n/RPtqg6Lb0=;
        b=JuszM1kayAw/4eOnNI90rQkXE6JCnzg5J0lrRf/KPl8dLGhUN58xpQ27OwEFr+VHqz
         vVeVpUG9LmcGsy0PAWRWdCE4+8XOljnr2HwQpLlMClcqGQwvGecGYlyrcuvdGbwkUpQv
         1b3WHfNYumkL+2u/xJdigbgCEQrhMktuTw/uHHg0Uqy2trsgl1JRUeCRnGh8uJEKblQ6
         ARBz4A6SN/qhMSi3FvWKHNhacQOlho1fpLe/h+ukNTfwnATVt5Ic0uEXYzaR9Ylm8ySb
         1HiNoNMOCg4aL6K2b4tCHOdhEZs25+9iFBypB2ZagxkG///BXxZ58C8JG3p113VzgO26
         xz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696335958; x=1696940758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNO5GJBfVgDppnnjLs8Ey/aGvi+SY8q8n/RPtqg6Lb0=;
        b=pG+II4upfpbYv0vVDVKGbDqKZokV63dREI36GnN4d2oSZJSyASQJs6fy96JbIpa7Kf
         STcbgx9Mi0FmnNwCpyNLDlqlXdlJDZ2I60yMH6Id7Bgp8huwBbPif3mPhv1BHyajZcDz
         9Hz/sN0tEe1EST3GtVhNJp5Z+2tDuzJsS6MLZ4po+YUJE5gPkkdtLZ7EpN9dxDQgGXn2
         E8U8kkrO0c9/CoE0/bRHkFGCYh1Tau5Ahzxlxg2yL1Jq+dBkY5LSZxSQbxnYKo94u6E7
         DuN8ZnTHvxlCJrNSHl0HNHQNZuLuPZ0OUsfMxHjHofBAqWZMYAG7sF0GsXx/TkLco4pl
         mfAg==
X-Gm-Message-State: AOJu0YwJly1+BL00M6GcpTSFOHFrALygz2QpzFBBE6QE52BCxLYxjxAb
	4Qhu6zYmK8j+9Cv0K1r/UvhvLjMiWncYnm0l5TY=
X-Google-Smtp-Source: AGHT+IH3vFPI8wkZPSB+huGryIAf1o97KjtxkawCjpbmFqLZ7a060PcmeyqhgyDquT7PF4ujt0bcej93HgDs77wHvAQ=
X-Received: by 2002:a05:6902:707:b0:d85:aa81:53f0 with SMTP id
 k7-20020a056902070700b00d85aa8153f0mr16641798ybt.4.1696335957740; Tue, 03 Oct
 2023 05:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
 <ZRtWcgiH5JhD5NU2@debian.me>
In-Reply-To: <ZRtWcgiH5JhD5NU2@debian.me>
From: =?UTF-8?Q?Erik_Dob=C3=A1k?= <erik.dobak@gmail.com>
Date: Tue, 3 Oct 2023 14:25:46 +0200
Message-ID: <CAH7-e5uspavg_VBJxKLOKJfU3nAq-OrPqzihF2opffY-ReiC-w@mail.gmail.com>
Subject: Re: bluetooth issues since kernel 6.4 - not discovering other bt
 devices - /linux/drivers/bluetooth/btusb.c
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Stable <stable@vger.kernel.org>, 
	Linux Bluetooth <linux-bluetooth@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Mediatek <linux-mediatek@lists.infradead.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Tomasz_Mo=C5=84?= <tomasz.mon@nordicsemi.no>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Oct 2023 at 01:47, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On Sun, Oct 01, 2023 at 07:47:54AM +0200, Erik Dob=C3=A1k wrote:
> > Hello!
> >
> > I bought a new laptop fujitsu life book and everything is going fine
> > on artix just the bt makes trouble:
> >
> > /var/log/error.log
> > Sep 30 18:43:48 nexus bluetoothd[2266]:
> > src/adapter.c:reset_adv_monitors_complete() Failed to reset Adv
> > Monitors: Failed (0x03)
> > Sep 30 18:43:48 nexus bluetoothd[2266]: Failed to clear UUIDs: Failed (=
0x03)
> > Sep 30 18:43:48 nexus bluetoothd[2266]: Failed to add UUID: Failed (0x0=
3)
> > Sep 30 18:43:48 nexus bluetoothd[2266]: Failed to add UUID: Failed (0x0=
3)
> >
> > i searched a bit the webs and found a new commit at kernel org that
> > does do the trouble:
> > https://bugs.archlinux.org/task/78980
> >
> > follow the linkeys inside the commits there or read this one:
> >
> > ---------------before------------------------------------
> > /* interface numbers are hardcoded in the spec */
> >         if (intf->cur_altsetting->desc.bInterfaceNumber !=3D 0) {
> >                 if (!(id->driver_info & BTUSB_IFNUM_2))
> >                         return -ENODEV;
> >                 if (intf->cur_altsetting->desc.bInterfaceNumber !=3D 2)
> >                         return -ENODEV;
> >         }
> > -----------after----------------------------------------------------
> > if ((id->driver_info & BTUSB_IFNUM_2) &&
> >     (intf->cur_altsetting->desc.bInterfaceNumber !=3D 0) &&
> >     (intf->cur_altsetting->desc.bInterfaceNumber !=3D 2))
> > return -ENODEV;
> > --------------------------------------------------------
> >
> > the dude just hooked up 3 conditions in a row with && where before it
> > was 2 conditions in 1 condition. + the comment was removed.
> >
> >
>
> Try latest mainline first (currently v6.6-rc4). Because you have to
> compile your own kernel, please refer to
> Documentation/admin-guide/quickly-build-trimmed-linux.rst if you don't kn=
ow how to do the compilation.
>
> Also, don't top-post when replying; reply inline with appropriate context
> instead.
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara

Hi i booted now into linux-6.6-rc4 and the issue is still there. No
bluetooth devices are discovered.
with this device: Bus 001 Device 004: ID 04c5:1670 Fujitsu, Ltd Bluetooth R=
adio

E
