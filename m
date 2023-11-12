Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8040179C6
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 11:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MC3Ul06p"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28014fed9efso2849240a91.0
        for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 03:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699787534; x=1700392334; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G+55ZTGhMjEEAdR3Q2pbonSohtI5yVDsnlk8FCcFkC4=;
        b=MC3Ul06p530pd3gnJXe3YnZotcQ0/KXWDRe/cfwQX7fb2v9rXIKDyhEJ4W4g679h2v
         DeVwR1cSc4pmQv8yz6lnqRSE+YwPZUsKa7Uo5FX4hfwcTFGW1YyqxxDm8fIw1UkiR4IO
         /5FL8t+wt6dKOMMaUwwNadE1ns6228efqbYNKMDHvmmiBXqt1pHzDGCeLjAzB2dSEFP5
         tCayQbGDfO5JBLWNSlYeiHF5HIE9RM49uUxl9PrCcaF/NxVpOxle/Pl9+TfdjACE7igL
         1eejMxnkkSC8ja3FtNQWszyrzCHwNGW/lrq/V3JJI1XhQ4baIbZlldiFj3mtdiqDaTPk
         25Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699787534; x=1700392334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+55ZTGhMjEEAdR3Q2pbonSohtI5yVDsnlk8FCcFkC4=;
        b=c5ZuvJzX1PJbzrpNhQefoNzH8s5l0ikzMJmjNkfkq01zQHl8Ee4QUr41GpZQ80C1jQ
         hVY3O9w79V1NVTxbamjrP6JXPhuZkuUgsrioIF1ZzG/hVdEQN/3TbyVOnmwrrvYyhQiy
         5ytfBRF98EVTMTPYQ2KVCWegr8UcwJQRysY2y3Wq1ig30tPhCEXtixfRN+EITeyk1VTA
         hmiv/fVsnCq+kvSa/sFzhtUaDD1s5tHSUR5wk4gr1YOa8NsXE5ZxHInQw+iPhScSpY87
         4HydajpJJZgB/GP/G14tg3khMDy+sXogp6fHPqDkOOud6nqFSN1K1/bd2x2AnSzyVT6o
         lJeA==
X-Gm-Message-State: AOJu0YztlKe64KFg4q+4+VwowziD1PCOKeLxjj4lVd5vkl0c7nov5Eb/
	5lYZS2zLq0XNnAdJBvxKoRQH1urDW8Xgsg==
X-Google-Smtp-Source: AGHT+IFvMkqibgudVNnMV3yhatFdkpPr3of/XWNfE4D0B2iM8UBxCbBVW1C1jAN+Dcv+M7MuwkXzxQ==
X-Received: by 2002:a17:903:32c1:b0:1cc:453f:517b with SMTP id i1-20020a17090332c100b001cc453f517bmr3656953plr.0.1699787533628;
        Sun, 12 Nov 2023 03:12:13 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d3cd00b001ca86a9caccsm2432043plb.228.2023.11.12.03.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 03:12:13 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 76E781029976F; Sun, 12 Nov 2023 18:12:10 +0700 (WIB)
Date: Sun, 12 Nov 2023 18:12:10 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Phillip Susi <phill@thesusis.net>, Luben Tuikov <luben.tuikov@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Radeon regression in 6.6 kernel
Message-ID: <ZVCzCrkdRJy9AHd2@archie.me>
References: <87edgv4x3i.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1vHvAQQxV2JwhpFr"
Content-Disposition: inline
In-Reply-To: <87edgv4x3i.fsf@vps.thesusis.net>


--1vHvAQQxV2JwhpFr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2023 at 07:46:41PM -0500, Phillip Susi wrote:
> I had been testing some things on a post 6.6-rc5 kernel for a week or
> two and then when I pulled to a post 6.6 release kernel, I found that
> system suspend was broken.  It seems that the radeon driver failed to
> suspend, leaving the display dead, the wayland display server hung, and
> the system still running.  I have been trying to bisect it for the last
> few days and have only been able to narrow it down to the following 3
> commits:
>=20
> There are only 'skip'ped commits left to test.
> The first bad commit could be any of:
> 56e449603f0ac580700621a356d35d5716a62ce5
> c07bf1636f0005f9eb7956404490672286ea59d3
> b70438004a14f4d0f9890b3297cd66248728546c
> We cannot bisect more!

Please show the full bisect log, and also tell why these commits are
skipped.

>=20
> It appears that there was a late merge in the 6.6 window that originally
> forked from the -rc2, as many of the later commits that I bisected had
> that version number.
>=20
> I couldn't get it more narrowed down because I had to skip the
> surrounding commits because they wouldn't even boot up to a gui desktop,
> let alone try to suspend.
>=20
> When system suspend fails, I find the following in my syslog after I
> have to magic-sysrq reboot because the the display is dead:
>=20
> Nov 11 18:44:39 faldara kernel: PM: suspend entry (deep)
> Nov 11 18:44:39 faldara kernel: Filesystems sync: 0.035 seconds
> Nov 11 18:44:40 faldara kernel: Freezing user space processes
> Nov 11 18:44:40 faldara kernel: Freezing user space processes completed (=
elapsed 0.001 seconds)
> Nov 11 18:44:40 faldara kernel: OOM killer disabled.
> Nov 11 18:44:40 faldara kernel: Freezing remaining freezable tasks
> Nov 11 18:44:40 faldara kernel: Freezing remaining freezable tasks comple=
ted (elapsed 0.001 seconds)
> Nov 11 18:44:40 faldara kernel: printk: Suspending console(s) (use no_con=
sole_suspend to debug)
> Nov 11 18:44:40 faldara kernel: serial 00:01: disabled
> Nov 11 18:44:40 faldara kernel: e1000e: EEE TX LPI TIMER: 00000011
> Nov 11 18:44:40 faldara kernel: sd 4:0:0:0: [sdb] Synchronizing SCSI cache
> Nov 11 18:44:40 faldara kernel: sd 1:0:0:0: [sda] Synchronizing SCSI cache
> Nov 11 18:44:40 faldara kernel: sd 5:0:0:0: [sdc] Synchronizing SCSI cache
> Nov 11 18:44:40 faldara kernel: sd 4:0:0:0: [sdb] Stopping disk
> Nov 11 18:44:40 faldara kernel: sd 1:0:0:0: [sda] Stopping disk
> Nov 11 18:44:40 faldara kernel: sd 5:0:0:0: [sdc] Stopping disk
> Nov 11 18:44:40 faldara kernel: amdgpu: Move buffer fallback to memcpy un=
available
> Nov 11 18:44:40 faldara kernel: [TTM] Buffer eviction failed
> Nov 11 18:44:40 faldara kernel: [drm] evicting device resources failed
> Nov 11 18:44:40 faldara kernel: amdgpu 0000:03:00.0: PM: pci_pm_suspend()=
: amdgpu_pmops_suspend+0x0/0x80 [amdgpu] returns -19
> Nov 11 18:44:40 faldara kernel: amdgpu 0000:03:00.0: PM: dpm_run_callback=
(): pci_pm_suspend+0x0/0x170 returns -19
> Nov 11 18:44:40 faldara kernel: amdgpu 0000:03:00.0: PM: failed to suspen=
d async: error -19
> Nov 11 18:44:40 faldara kernel: PM: Some devices failed to suspend, or ea=
rly wake event detected
> Nov 11 18:44:40 faldara kernel: xhci_hcd 0000:06:00.0: xHC error in resum=
e, USBSTS 0x401, Reinit
> Nov 11 18:44:40 faldara kernel: usb usb3: root hub lost power or was reset
> Nov 11 18:44:40 faldara kernel: usb usb4: root hub lost power or was reset
> Nov 11 18:44:40 faldara kernel: serial 00:01: activated
> Nov 11 18:44:40 faldara kernel: nvme nvme0: 4/0/0 default/read/poll queues
> Nov 11 18:44:40 faldara kernel: ata8: SATA link down (SStatus 0 SControl =
300)
> Nov 11 18:44:40 faldara kernel: ata7: SATA link down (SStatus 0 SControl =
300)
> Nov 11 18:44:40 faldara kernel: ata4: SATA link up 1.5 Gbps (SStatus 113 =
SControl 300)
> Nov 11 18:44:40 faldara kernel: ata1: SATA link down (SStatus 4 SControl =
300)
> Nov 11 18:44:40 faldara kernel: ata3: SATA link down (SStatus 4 SControl =
300)
> Nov 11 18:44:40 faldara kernel: ata4.00: configured for UDMA/133
> Nov 11 18:44:40 faldara kernel: OOM killer enabled.
> Nov 11 18:44:40 faldara kernel: Restarting tasks ... done.
> Nov 11 18:44:40 faldara kernel: random: crng reseeded on system resumption
> Nov 11 18:44:40 faldara kernel: PM: suspend exit
> Nov 11 18:44:40 faldara kernel: PM: suspend entry (s2idle)
> Nov 11 18:44:40 faldara systemd-networkd[384]: enp0s31f6: Gained IPv6LL
> Nov 11 18:44:40 faldara avahi-daemon[668]: Joining mDNS multicast group o=
n interface enp0s31f6.IPv6 with address fe80::3ad5:47ff:fe0f:488a.
>=20
> My video card is this:
>=20
> 03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]=
 Navi 23 (rev c7) (prog-if 00 [VGA controller])
>         Subsystem: Gigabyte Technology Co., Ltd Navi 23
>         Flags: bus master, fast devsel, latency 0, IRQ 139
>         Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
>         Memory at f0000000 (64-bit, prefetchable) [size=3D2M]
>         I/O ports at e000 [size=3D256]
>         Memory at f7900000 (32-bit, non-prefetchable) [size=3D1M]
>         Expansion ROM at 000c0000 [disabled] [size=3D128K]
>         Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
>         Capabilities: [50] Power Management version 3
>         Capabilities: [64] Express Legacy Endpoint, MSI 00
>         Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
>         Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D=
1 Len=3D010 <?>
>         Capabilities: [150] Advanced Error Reporting
>         Capabilities: [200] Physical Resizable BAR
>         Capabilities: [240] Power Budgeting <?>
>         Capabilities: [270] Secondary PCI Express
>         Capabilities: [2a0] Access Control Services
>         Capabilities: [2d0] Process Address Space ID (PASID)
>         Capabilities: [320] Latency Tolerance Reporting
>         Capabilities: [410] Physical Layer 16.0 GT/s <?>
>         Capabilities: [440] Lane Margining at the Receiver <?>
>         Kernel driver in use: amdgpu
>         Kernel modules: amdgpu

Anyway, thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 56e449603f0ac5..b70438004a14f4

--=20
An old man doll... just what I always wanted! - Clara

--1vHvAQQxV2JwhpFr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVCzBwAKCRD2uYlJVVFO
o+DZAQCDDeaRfKfJ++74bg7JPWkbAXui9dTN7+gLunw8DVMBbQD+JnoHXEOPGE4a
btucfJJN5hXnoyn84CKbM+m1tReawAA=
=mJkJ
-----END PGP SIGNATURE-----

--1vHvAQQxV2JwhpFr--
