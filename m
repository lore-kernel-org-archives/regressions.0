Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471B7FB
	for <regressions@lists.linux.dev>; Thu, 17 Aug 2023 03:00:40 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-565f9b2f626so909903a12.0
        for <regressions@lists.linux.dev>; Wed, 16 Aug 2023 20:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692241239; x=1692846039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wQ4KvZviHGr9y/nWdkCdgQJYFdxBNJ1zpQBRqwmYGXc=;
        b=htYHUnR5XLsKO1d90gH4lPfj+7hhoGcxRSrx8YhJmnwn4hgGe8/OV6ms5+vezYkj7M
         aLPDEUo4Lhq+Vl205rS0jmTxTapm2JE/Z5gQQOfKCRZFI3iK95HOx8eB5V7yZDyydBGz
         Cv6CPgrioKY3S9YYSiU21dLQRehMjwDs5h03yXHCHgjSAcmD8BFHX8MTCy9E1CYmR3Wx
         pciwfn7akpRcuguRV9rTgvSkdz5yu6+Qd04Lag/JzzTYkjVOfQB0F7I0bSSCH37vqD4e
         YysWfAz4g/G7HPoiSqUQRvkF7CjRkpH3R3Fqe/BPLKBEd4bZ0Is9s5F4/o2yd8tvudXh
         Ny1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692241239; x=1692846039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQ4KvZviHGr9y/nWdkCdgQJYFdxBNJ1zpQBRqwmYGXc=;
        b=FvkgDK14tSL2PJHbHzy+EgnXwu1xWenV6k5R9UvJelzAyo+ymptfYsc+u8acPAXGqe
         GPApL+YD7ivpo0/hd1UDlO0RUS4phemJqqBtCKOh3+qulsGLzAfYsXvu8CzaWvfu9L3f
         o8zyk2U0PQvkVqmMTFgKTgTBGgrxN91tQ9HRnVsmCMp/lVZQhiTTXfLiT6KLzQakL2qR
         L1kSjqltf3SsGUmP39MUhW+HFwzW3wGd8FDQd7C/xha5MQbpxdP6AKJh+nEH/iN8DQXe
         np5Zp3tQY8vY4WuI8RGM6TxauWaSFZFhZ5lA/2G6ZEu/EiEjuLh8FV49J3nlhP1cSzPF
         SMFw==
X-Gm-Message-State: AOJu0YwOlO/ijX0z/j7azXy/vAhJbvyXU5yDAxtzg6gya+A+VuwoOaOQ
	sUPkNu0BstOXrK8rhHGph4o=
X-Google-Smtp-Source: AGHT+IGEOQsi1YfGleaR1ny8ZUhghxdnwyqjvX8wr5c+fpVO+EwVkp0G7JV1pfeknW19d8AcPzTwPQ==
X-Received: by 2002:a17:90a:c302:b0:269:85d:2aef with SMTP id g2-20020a17090ac30200b00269085d2aefmr3337017pjt.20.1692241239547;
        Wed, 16 Aug 2023 20:00:39 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id gx3-20020a17090b124300b0026b45fb4443sm449973pjb.4.2023.08.16.20.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 20:00:38 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 7230B81A1A74; Thu, 17 Aug 2023 10:00:33 +0700 (WIB)
Date: Thu, 17 Aug 2023 10:00:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Genes Lists <lists@sapience.com>, linux-kernel@vger.kernel.org,
	Ricky WU <ricky_wu@realtek.com>, Arnd Bergmann <arnd@arndb.de>
Cc: kbusch@kernel.org, axboe@kernel.dk, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, hch@lst.de,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Possible nvme regression in 6.4.11
Message-ID: <ZN2NUIg3k5VgMg63@debian.me>
References: <5f968b95-6b1c-4d6f-aac7-5d54f66834a8@sapience.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5UPcTpC6Zd9UUWNK"
Content-Disposition: inline
In-Reply-To: <5f968b95-6b1c-4d6f-aac7-5d54f66834a8@sapience.com>


--5UPcTpC6Zd9UUWNK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 04:39:34PM -0400, Genes Lists wrote:
>=20
> Also reported to bugzilla [1]
>=20
> Failure happens on 1 laptop with samsung ssd.
>=20
> Boot log manually transcribed:
>=20
> kernel: nvme nvme0: controller is down; will reset: CSTS:0xffffffff,
> PCI_STATUS=3D0xffff
> kernel: nvme nvme0: Does your device have a faulty power saving mode
> enabled?
> kernel: nvme nvme0: try "nvme_core.default_ps_max_latency_us=3D0
> pcie_aspm=3Doff" and report a bug
> kernel: nvme 0000:04:00.0: Unable to change power state from D3cold to D0,
> device inaccessible
> kernel: nvme nvme0: Disabling device after reset failure: -19
> mount[353]: mount /sysroot: can't read suprtblock on /dev/nvme0n1p5.
> mount[353]:       dmesg(1) may have more information after failed moutn
> system call.
> kernel: nvme0m1: detected capacity change from 2000409264 to 0
> kernel: EXT4-fs (nvme0n1p5): unable to read superblock
> systemd([1]: sysroot.mount: Mount process exited, code=3Dexited, status=
=3D32/n/a
> ...
>=20
> All kernels are upstream, untainted and compiled on Arch using:
>=20
>  gcc version 13.2.1
>=20
> Kernels Tested:
>  - 6.4.10 - works fine
>  - 6.4.11 - fails
>  - 6.5-rc6 - fails
>  - 6.4.11 + nvme_core.default_ps_max_latency_us=3D0 pcie_aspm=3Doff - fai=
ls
>  - 6.4.11 with 1 revert below - fails
>=20
>     Revert "nvme-pci: add NVME_QUIRK_BOGUS_NID for Samsung PM9B1 256G and
> 512G"
>     This reverts commit 061fbf64825fb47367bbb6e0a528611f08119473.
>=20
> Hardware:
>   model name      : Intel(R) Core(TM) i7-7820HQ CPU @ 2.90GHz
>   stepping        : 9
>   microcode       : 0xf4
>=20
> nvme:
> 04:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe S=
SD
> Controller SM961/PM961/SM963
>         Subsystem: Samsung Electronics Co Ltd SM963 2.5" NVMe PCIe SSD
>         Flags: bus master, fast devsel, latency 0, IRQ 16, NUMA node 0
>         Memory at edb00000 (64-bit, non-prefetchable) [size=3D16K]
>         Capabilities: [40] Power Management version 3
>         Capabilities: [50] MSI: Enable- Count=3D1/32 Maskable- 64bit+
>         Capabilities: [70] Express Endpoint, MSI 00
>         Capabilities: [b0] MSI-X: Enable+ Count=3D33 Masked-
>         Kernel driver in use: nvme
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 101bd907b4244a
#regzbot title: can't change Samsung SSD power state due to ASPM mode check=
ing
#regzbot monitor: https://bugzilla.kernel.org/show_bug.cgi?id=3D217802

--=20
An old man doll... just what I always wanted! - Clara

--5UPcTpC6Zd9UUWNK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZN2NSgAKCRD2uYlJVVFO
o4nLAQCs5bkzknjQjUeWT0ZbGYBdZZcflxXUCkhcUDKBcXBupwD/RZvBrJN3bPq1
E0kmmZWzmDfVkywfHXImiHjV04CCnQA=
=qeoB
-----END PGP SIGNATURE-----

--5UPcTpC6Zd9UUWNK--
