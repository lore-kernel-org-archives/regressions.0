Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2461B7E2
	for <regressions@lists.linux.dev>; Mon, 15 Jan 2024 23:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TP0DDyMz"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5542a7f1f3cso11249658a12.2
        for <regressions@lists.linux.dev>; Mon, 15 Jan 2024 15:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705362971; x=1705967771; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP32MFSw3ny7WfjbsVr7W/4A9ct/HGx66eldykG7aiE=;
        b=TP0DDyMzTDt8piM/UhDJeEauOzVytfphUUZLnooVODnD2dzbj5SstwSgWVGHayHucF
         bfVK8WSiElKLKef84zmKOYyKWnv3dQGhhE/V+YSW9GTG1J6kbGLsHZPpdtFyO/Mr0S3N
         2Ro9rYiuQHnbAevu+L35FFpIOBHx3zB5NwvnxyrAdIePNCYwFno/QPGNgfHUS19Qz9TQ
         7fZTXytpVLRdqfZ+ZmL8FVthvCF2jdnMwTUyAFVZCLdLe++yBXUDHAwebJnXQVqB/SS4
         gdUp47G8xYBqSWrRm2M5PJPeSK/yZG+6ntqX5LuHM57Zbgde4s4hrDU/x4GtVnVMoWAU
         bqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705362971; x=1705967771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OP32MFSw3ny7WfjbsVr7W/4A9ct/HGx66eldykG7aiE=;
        b=OL4tvaPI1Dg3sugQJF8QY60uQzbBLwsO91NPPzq9Autrx6i9DlSwLubIyT+KIcmijJ
         /4eVbrc25G6CJ8GRiTZUFgZ/z+z4f8gaEITc89cu0U6X4ESnT4Z0MlHDdFDSN3sXxsm2
         I5LKq3L4EzZa2syKHN6F+Kh9MRnpm8PdIGfqXuq/Gf9g5iT1yYoI07zyjIkqZSEwbexz
         geLohMk7iwQ9Ub2vURzd2rmalJ5seFkDhvbeW0reinIVfPkGE88D1V81bBWYOsnSOrgk
         Ieil5DPXM04EGiFARMsvsGaD/MIQEy0AqyOOaW1n/zprkt6ig29l+zKMUFHogujO7TwI
         yRyw==
X-Gm-Message-State: AOJu0YyRz9DL05ZciZtYrdy5nUVomfMeuapQ0TaSLv1FilgVCQfkrEdK
	6EULQsg5eGgXpKfeK6Apskr5kWFEgXwIQMdyuhY=
X-Google-Smtp-Source: AGHT+IENPQ/sFVda1hFMTyYVM7xu/hE3e1vkx/xmwy+6jXLYZI6pVPI+JByf1ye8dBxy1bImtnwyge5eAifRi/+Avvo=
X-Received: by 2002:a17:906:f8c4:b0:a28:aab9:911c with SMTP id
 lh4-20020a170906f8c400b00a28aab9911cmr2808477ejb.47.1705362970912; Mon, 15
 Jan 2024 15:56:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJvGw+DQhBk_mHXeu6RTOds5iramMW2FbMB01VbKRA4YbHHDTA@mail.gmail.com>
 <dae4bb032ad8b0c9fa6547de5e869e51f9f6e766.camel@sipsolutions.net>
In-Reply-To: <dae4bb032ad8b0c9fa6547de5e869e51f9f6e766.camel@sipsolutions.net>
From: coldolt <andypalmadi@gmail.com>
Date: Tue, 16 Jan 2024 01:56:03 +0200
Message-ID: <CAJvGw+ATM3B09KbuLM0VsmU9GZRSO-ZP6ffwvvOa75xVHR3-kw@mail.gmail.com>
Subject: Re: [REGRESSION] 6.7 broke wifi "AP is in CSA process, reject auth"
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ayala.beker@intel.com, linux-wireless@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can try to keep connecting for over 5 minutes, it never connects,
keeps outputting the same dmesg message. The kernel before 6.7
connects immediately.

The router is an Asus RT-AC53. Output of "sudo iw wlp2s0 scan -u" for it is=
:

BSS b0:6e:bf:76:0a:3c(on wlp2s0)
        last seen: 752.658s [boottime]
        TSF: 177237341 usec (0d, 00:02:57)
        freq: 5180.0
        beacon interval: 200 TUs
        capability: ESS Privacy ShortPreamble SpectrumMgmt APSD (0x0931)
        signal: -61.00 dBm
        last seen: 90 ms ago
        Information elements from Probe Response frame:
        SSID: internet5
        Supported rates: 6.0* 9.0 12.0* 18.0 24.0* 36.0 48.0 54.0
        DS Parameter set: channel 36
        Unknown IE (60): 01 16 24 09
        HT capabilities:
                Capabilities: 0x16e
                        HT20/HT40
                        SM Power Save disabled
                        RX HT20 SGI
                        RX HT40 SGI
                        RX STBC 1-stream
                        Max AMSDU length: 3839 bytes
                        No DSSS/CCK HT40
                Maximum RX AMPDU length 32767 bytes (exponent: 0x002)
                Minimum RX AMPDU time spacing: 4 usec (0x05)
                HT RX MCS rate indexes supported: 0-7, 32
                HT TX MCS rate indexes are undefined
        HT operation:
                 * primary channel: 36
                 * secondary channel offset: above
                 * STA channel width: any
                 * RIFS: 0
                 * HT protection: no
                 * non-GF present: 0
                 * OBSS non-GF present: 0
                 * dual beacon: 0
                 * dual CTS protection: 0
                 * STBC beacon: 0
                 * L-SIG TXOP Prot: 0
                 * PCO active: 0
                 * PCO phase: 0
        RSN:     * Version: 1
                 * Group cipher: CCMP
                 * Pairwise ciphers: CCMP
                 * Authentication suites: PSK
                 * Capabilities: 1-PTKSA-RC 1-GTKSA-RC (0x0000)
        WMM:     * Parameter version 1
                 * u-APSD
                 * BE: CW 15-1023, AIFSN 3
                 * BK: CW 15-1023, AIFSN 7
                 * VI: CW 7-15, AIFSN 2, TXOP 3008 usec
                 * VO: CW 3-7, AIFSN 2, TXOP 1504 usec
        BSS Load:
                 * station count: 0
                 * channel utilisation: 9/255
                 * available admission capacity: 31250 [*32us]
        Vendor specific: OUI 00:0c:43, data: 03 00 00 00
        Power constraint: 3 dB
        Country: FR     Environment: Indoor/Outdoor
                Channels [36 - 96] @ 16 dBm
        VHT capabilities:
                VHT Capabilities (0x31c00120):
                        Max MPDU length: 3895
                        Supported Channel Width: neither 160 nor 80+80
                        short GI (80 MHz)
                        +HTC-VHT
                        RX antenna pattern consistency
                        TX antenna pattern consistency
                VHT RX MCS set:
                        1 streams: MCS 0-9
                        2 streams: not supported
                        3 streams: not supported
                        4 streams: not supported
                        5 streams: not supported
                        6 streams: not supported
                        7 streams: not supported
                        8 streams: not supported
                VHT RX highest supported: 292 Mbps
                VHT TX MCS set:
                        1 streams: MCS 0-9
                        2 streams: not supported
                        3 streams: not supported
                        4 streams: not supported
                        5 streams: not supported
                        6 streams: not supported
                        7 streams: not supported
                        8 streams: not supported
                VHT TX highest supported: 292 Mbps
                VHT extended NSS: not supported
        VHT operation:
                 * channel width: 1 (80 MHz)
                 * center freq segment 1: 42
                 * center freq segment 2: 0
                 * VHT basic MCS set: 0xfffe


On Mon, Jan 15, 2024 at 10:00=E2=80=AFPM Johannes Berg
<johannes@sipsolutions.net> wrote:
>
> On Mon, 2024-01-15 at 16:39 +0200, coldolt wrote:
> > I'm on Arch linux, updated the kernel from 6.6.10 -> 6.7.
> >
> > Now it doesn't connect to my 5GHz wifi, to 2.4GHz it still connects.
> > Also the earlier kernel version still works. Output from "sudo dmesg |
> > grep -i wlp2s0":
> >
> > > [    6.049600] iwlwifi 0000:02:00.0 wlp2s0: renamed from wlan0
> > > [  131.095861] wlp2s0: AP is in CSA process, reject auth
> > > [  132.143170] wlp2s0: AP is in CSA process, reject auth
> > > [  133.599906] wlp2s0: AP is in CSA process, reject auth
> > > [  135.549325] wlp2s0: AP is in CSA process, reject auth
> > > [  145.510438] wlp2s0: AP is in CSA process, reject auth
> >
> > I notice that the commit c09c4f31998bac, which was added to kernel
> > 6.7, introduced rejecting a connection with that error message "AP is
> > in CSA process, reject auth".
> >
> > My guess is that commit is the cause of the regression.
>
> I guess? But that was quite intentional - we don't handle connecting
> well while the AP is switching channels.
>
> This really shouldn't persist for longer than a few seconds though, even
> the 15 seconds sounds pretty excessive.
>
> Could you show the output of
>
> $ sudo iw wlp2s0 scan -u
>
> for this AP?
>
> johannes
