Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967276D1B4
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716283510; cv=none; b=YBB7qW2eELE+zZ6jjJyHbgVkgmP/nFvBJYvLJIXgFEXDVv4LLk7FATiJ5urwdGSj3iXFB2tnHnAz7Lxv6+os197C0Xv1Qsm56ILg48V4bzHQdHzf1CnqqtRUy1aYM+U1+rJZc48+7fxn0g/OzBQsDubDcb68VXBE+ExZ05BD/9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716283510; c=relaxed/simple;
	bh=W7C8qCu9f8aWv8t+JSd20FzArS+tgmmsu1qXPGKkqQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KjXMUujzwJ19F/XC5czgXWohgaKPiRT/S9RzgAbT3XKfjYqiNxDsNjPxmaruLMAXof9Qh7Wy212J4JAvOhMNRxvTYLNps+rs78aN6h53gQ6Zu7s9NdQoV3a+UxW7y6EaMB93ucHen+ZHUtDxCO/hGSuQHTnl4+LVFDj2sdXeIcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjmVgNVe; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjmVgNVe"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1edfc57ac0cso102671985ad.3
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 02:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716283508; x=1716888308; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx9Q/EMTUpa92+pOPrcJO/MH3AWeXtVafWw6ElrJXwI=;
        b=ZjmVgNVeKBlyRbGykPKpXMz9gjLfgTQNam/ashVF2/KEaJbRADLuWOm1nCcZFYTNb/
         BmC0U8qn7Miim8AW8yYzMWs2bSGgbi98DiryVa/pmaYIQhW4AaHDqa1oBPNToBJoFmEQ
         I2fBoestKzs1bcFR9IGt733nfGZZbiYPWk1P29gMYlClfuCsI6f0EuFmoaOsNAMw/tG+
         aKjyvT4yV0CgvNCDp9MO9X9UtCgP+S6xXIn37XMJBmUvfgFPd3igO8khFP7owExluodn
         kBwar+9ftH3uLcZIHYliAAH+cbS2SYQ0gmK6ZuwqkwRqDPUxzl6MmkL/M6qCHS3kvlCH
         H7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716283508; x=1716888308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cx9Q/EMTUpa92+pOPrcJO/MH3AWeXtVafWw6ElrJXwI=;
        b=O1BdyqhxscbYYv6gLex68i9kW4kg/HeLatMknJpDaeoOzp5Xozbpop1QNRfKGcVKZU
         BKuNd13OL5NYliPtax3e1gl7gp7UnLKaogszIj1QvchBcw3gaQRjcN8jx0WE7/ySA+AV
         Qyfm9ftOiHSLUYVbeTRbJUH+DnnEMGRCVx0OIbZ130RHxizn573tljqaUXNWTiIXgwYG
         wmyik4IJo5/YU/EH1uvhBGzy9JYW3M3YQXh2ttrHBbt3YCW6Wiv4zUelwJ9oNm2OQgii
         i0TUZjTuQfC7/vDnQevM0qvgxkHss0JquYI6r2ssOswyraeQFeRPtKQH3FerKrc8A3ci
         LOVg==
X-Forwarded-Encrypted: i=1; AJvYcCWGQ1dV3GTMxpj2i/yb3uWvxzZga1JUg2VtSM+hCj7/S1TVM0jMwu3j9F2GcxuGpM+Nq9Z58EnFvjjdK4wkUgvtHLVbbR4F1FftyK4=
X-Gm-Message-State: AOJu0YwSucur8ecBJs2JcxScYy5neFqHQuN/Sarye8w/XfkIPhcUryx/
	zPeFNDkmv7eBjOEleHoep+Z5EZUlS1eoe8KticpYZGp7UTP3DYUxXGkaA+0dMbkPmu+O2+qm055
	KvjhQqMpGs3QDT9ej7klrGu63URk=
X-Google-Smtp-Source: AGHT+IEwCS7Kheh/nn+lzkJGd0xBKEmdH0HPDsPUkPmuz+sowdI7it3ZW1guqCXJUYh1almZi/G075PMfPqiuKbJrKc=
X-Received: by 2002:a17:90b:46c4:b0:2b1:817d:982b with SMTP id
 98e67ed59e1d1-2b6cc777f3cmr28269888a91.14.1716283507825; Tue, 21 May 2024
 02:25:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHe5sWavQcUTg2zTYaryRsMywSBgBgETG=R1jRexg4qDqwCfdw@mail.gmail.com>
 <38de0776-3adf-4223-b8e0-cedb5a5ebf4d@leemhuis.info> <lqdpk7lopqq4jn22mycxgg6ps4yfs7hcca33tqb2oy6jxc2y7p@rhjjbzs6wigu>
 <611f8200-8e0e-40e4-aff4-cc2c55dc6354@amd.com> <CAHe5sWY_YJsyiuwf2TsfRTS9AoGoYh4+UxkkZZ0G9z2pXfbnzg@mail.gmail.com>
 <20240521051525.GL1421138@black.fi.intel.com> <CAHe5sWY3P7AopLqwaeXSO7n-SFwEZom+MfWpLKGmbuA7L=VdmA@mail.gmail.com>
 <20240521085501.GN1421138@black.fi.intel.com>
In-Reply-To: <20240521085501.GN1421138@black.fi.intel.com>
From: Gia <giacomo.gio@gmail.com>
Date: Tue, 21 May 2024 11:24:56 +0200
Message-ID: <CAHe5sWaABJi0Xo4ygFK4Oa3LdNUiQJSLidGPdAE=gwmy=b+ycw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] "xHCI host controller not responding,
 assume dead" on stable kernel > 6.8.7
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Christian Heusel <christian@heusel.eu>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "kernel@micha.zone" <kernel@micha.zone>, 
	Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?Q?Benjamin_B=C3=B6hmke?= <benjamin@boehmke.net>, 
	"S, Sanath" <Sanath.S@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your suggestion Mika, as a general rule I totally agree
with you and I do not mess with kernel default parameters, but I
remember "pcie_aspm=3Doff" was necessary at the time I set up the
system. Probably a kernel or a BIOS update makes it unnecessary today.

I see it removes these messages from my logs but I trust you when you
say they have not an impact on functionality:

May 21 11:01:36 um773arch kernel: pcieport 0000:05:04.0: Unable to
change power state from D3hot to D0, device inaccessible
May 21 11:01:36 um773arch kernel: igb 0000:09:00.0 eth0: PCIe link lost
May 21 11:01:36 um773arch kernel: xhci_hcd 0000:08:00.0: xHCI host
controller not responding, assume dead
May 21 11:01:36 um773arch kernel: xhci_hcd 0000:07:00.0: xHCI host
controller not responding, assume dead
May 21 11:01:36 um773arch kernel: usb 3-1: 1:1: cannot set freq 48000 to ep=
 0x82
May 21 11:01:36 um773arch kernel: usb 3-1: 10:0: cannot get min/max
values for control 2 (id 10)
May 21 11:01:41 um773arch kernel: xhci_hcd 0000:06:00.0: xHCI host
controller not responding, assume dead
May 21 11:01:41 um773arch kernel: xhci_hcd 0000:06:00.0: HC died; cleaning =
up
May 21 11:01:41 um773arch kernel: usb 1-2: 1:1: cannot set freq 48000 to ep=
 0x1
May 21 11:01:41 um773arch kernel: usb 1-2: 1:2: cannot set freq 48000 to ep=
 0x1
May 21 11:01:41 um773arch kernel: usb 1-2: 1:3: cannot set freq 96000 to ep=
 0x1
May 21 11:01:41 um773arch kernel: usb 1-2: 1:4: cannot set freq 96000 to ep=
 0x1
May 21 11:01:41 um773arch kernel: usb 1-2: 1:5: cannot set freq 48000 to ep=
 0x1
May 21 11:01:41 um773arch kernel: usb 1-2: 2:1: cannot set freq 48000 to ep=
 0x82
May 21 11:01:41 um773arch kernel: usb 1-2: 7:0: cannot get min/max
values for control 2 (id 7)
May 21 11:01:41 um773arch kernel: usb 1-2: 5:0: cannot get min/max
values for control 2 (id 5)
May 21 11:01:41 um773arch kernel: usb 1-2: 6:0: cannot get min/max
values for control 2 (id 6)
May 21 11:01:41 um773arch (udev-worker)[453]: controlC0:
/usr/lib/udev/rules.d/78-sound-card.rules:5 Failed to write
ATTR{/sys/devices/pci0000:00/0000:00:03.1/0000:04:00.0/0000:05:01.0/0000:07=
:00.0/usb3/3-1/3-1:1.0/sound/card0/controlC0/../uevent},
ignoring: No such file or directory
May 21 11:01:42 um773arch (udev-worker)[440]: controlC1:
/usr/lib/udev/rules.d/78-sound-card.rules:5 Failed to write
ATTR{/sys/devices/pci0000:00/0000:00:03.1/0000:04:00.0/0000:05:00.0/0000:06=
:00.0/usb1/1-2/1-2:1.0/sound/card1/controlC1/../uevent},
ignoring: No such file or directory
May 21 11:01:43 um773arch kernel: hid-generic 0003:0D8C:0134.000A: No
inputs registered, leaving

On Tue, May 21, 2024 at 10:55=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Tue, May 21, 2024 at 10:07:23AM +0200, Gia wrote:
> > Thank you Mika,
> >
> > Here you have the output of sudo journalctl -k without enabling the
> > kernel option "pcie_aspm=3Doff": https://codeshare.io/7JPgpE. Without
> > "pcie_aspm=3Doff", "thunderbolt.host_reset=3Dfalse" is not needed, my
> > thunderbolt dock does work. I also connected a 4k monitor to the
> > thunderbolt dock thinking it could provide more data.
> >
> > I'm almost sure I used this option when I set up this system because
> > it solved some issues with system suspending, but it happened many
> > months ago.
>
> Okay. I recommend not to use it. The defaults should always be the best
> option (unless you really know what you are doing or working around some
> issue).
>
> The dmesg you shared looks good, there are few oddities but they should
> not matter from functional perspective (unless you are planning to have
> a second monitor connected).
>
> First is this:
>
>   May 21 09:59:40 um773arch kernel: thunderbolt 0000:36:00.5: IOMMU DMA p=
rotection is disabled
>
> It should really be enabled but I'm not familiar with AMD hardware to
> tell more so hoping Mario can comment on that.
>
> The second thing is the USB4 link that seems to be degraded to 2x10G =3D
> 20G even though you say it is a Thunderbolt cable. I'll comment more on
> that in the other email.
