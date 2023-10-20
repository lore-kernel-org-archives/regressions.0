Received: from w4.tutanota.de (w4.tutanota.de [81.3.6.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C771C801
	for <regressions@lists.linux.dev>; Fri, 20 Oct 2023 01:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bens.haus
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bens.haus
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bens.haus header.i=@bens.haus header.b="GJGPgQmU"
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
	by w4.tutanota.de (Postfix) with ESMTP id 96A951060136;
	Fri, 20 Oct 2023 01:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1697765123;
	s=s1; d=bens.haus;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=1jxNhGDyMeJS0OqpiE+P/Rwnl5U2rvW+F1eQUv3MgS8=;
	b=GJGPgQmUcUlpwCwOMIf3JysAHVDLV2sAWhZ+n1Xy5aeXVS2vFvw5H4n5yFejfZZb
	VLXjgLQPofhGyjEbRtOcKhzu71mZ5g1kJBc7i4mqzZD/444iby15s2U3Q1w7YJ2uYEJ
	GXd+oGWYFGaTVOXam5KZvPq0p4Slmtf9ISRjITi4Zy6f5TUVyuMvbCG3G+5/YH657mb
	Eyzi+4geHdOpx762XuoRvvEPMCi1IkxsvzZyzqdZDhAAD0t8aGQzk5Fp1u8CszdQprf
	2CW1psS2i/lknRaDa3Xzof8gkgYuguGLQvqQjL8PQBsYkPrsdustc1etVWcEPpJhMp+
	X4aOWzAXxQ==
Date: Fri, 20 Oct 2023 03:25:23 +0200 (CEST)
From: Ben Schneider <ben@bens.haus>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Regressions <regressions@lists.linux.dev>,
	Linux Efi <linux-efi@vger.kernel.org>,
	Stable <stable@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Message-ID: <Nh8pThy--3-9@bens.haus>
In-Reply-To: <57062702-f858-46d3-bccc-f0f96891128b@canonical.com>
References: <Nh-DzlX--3-9@bens.haus> <CAMj1kXFKe6piagNLdSUhxUhwLB+RfNHqjNWt8-r2CNS-rBdJKA@mail.gmail.com> <817366c2-33e0-4908-90ec-57c63e3eb471@canonical.com> <CAC_iWjJB3OTWiYX5YsJmNcPQw+rHSm955c1Z5pUajedWGM5QgA@mail.gmail.com> <Nh30qsF--3-9@bens.haus> <57062702-f858-46d3-bccc-f0f96891128b@canonical.com>
Subject: Re: [REGRESSION] boot fails for EFI boot stub loaded by u-boot
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Oct 19, 2023, 07:21 by heinrich.schuchardt@canonical.com:

> To which kernel and device-tree are the messages below related?
>
Sorry. I'm building/testing with v6.5.7 right now, but I have not been able=
 to boot any kernel version >=3D 6.1. The device tree I used also came from=
 linux v6.5.7. Its source is at arch/arm64/boot/dts/marvell/armada-3720-esp=
ressobin-ultra.dts.

> Something in the structure of your device-tree is invalid.
>
The device does boot using kernel v5.15 and the device tree compiled from l=
inux v6.5.7. The device tree could still very well be a problem. I just did=
n't start there because whatever problems the device tree may have don't pr=
event the device from booting for kernels prior to v6.1.

> Please, check the load addresses in U-Boot. Is something overwriting the =
tail of the device-tree?
>
I have always loaded the device tree to 0x1000000 (16MiB) and the kernel to=
=C2=A00x2000000 (32MiB) for no particular reason except that's what the man=
ufacturer did.=C2=A0armada-3720-espressobin-ultra.dtb is only 14K. I don't =
load an initramfs or anything else to memory with u-boot and the address us=
ed to load u-boot environment is 0x6000000.

> Compiling upstream U-Boot's qemu_arm64_defconfig yields lib/efi_loader/dt=
bdump.efi. If you run this instead of the kernel, you can write the device-=
tree as it is passed in a configuration table to the ESP.
>
I compiled and ran this fine, but I was unable to save the device tree. I s=
uspect this is because the program searches for an ESP, and there is none o=
n the device. U-boot was compiled with support to load directly from an ext=
4 filesystem so I didn't bother setting one up. I will work on it. I can co=
nvert the .dtb on disk back to a human-readable .dts easily with dtc if tha=
t is helpful.

Thanks!

Ben
