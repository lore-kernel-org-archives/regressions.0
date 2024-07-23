Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FD5143C6B
	for <regressions@lists.linux.dev>; Tue, 23 Jul 2024 22:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721773401; cv=none; b=u6401X6mjv5mp5R3dqQa4CPFzB8/cCRMqT8y5ymoDLGUBMkJOB4O0H7Ph3/D5n89eWep/3Hl5KZubioHFAG9y5t62FSJpVUyatz0Exr3T6gmy+i2e2+Uol/XO8PZNFfyfaOFyNRpwweK9tAzK8RrolfC53vDry7CREzfV+341KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721773401; c=relaxed/simple;
	bh=B0yxpvM+eZg9k7MAtADRmxBUwd4Nd0UGI/w1q5MJXqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scTcno8fNwy1Vv2cZHMW50R+K51Zo0EBr0jQIOpQnVgO6J/jUI9Us+Nd7xyZYBSH8MZcWbh24RiQzOvZafk9AYg9rrZgL22I8F4s73B8NstcyzrIdJwzbr//2UPFKlBMdyumLyYKI+Gjoi/sIdhTYO7dvqMkNm2l5KSKhdjYgco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=GO/1vpwM; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="GO/1vpwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1721773388; x=1722378188; i=christian@heusel.eu;
	bh=iNzUSuUfrMvZqbuKy/z4VvDnjn9+reHM/URSvpIMxcs=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GO/1vpwMVHnMKJmoCzouliAecPsh/pf40UOc1/kTBGehHq5Fm5U+T8r9DihjaNji
	 vBk79AgpeloTedRbn9uiF4enooBWsS4qJPKnWsoZ2bUV8EH9oCg8KX/iloKft8vSU
	 GcE/cdq9jJ3NsB1sfwmHjn3dlYFbFgX/hRH45Zb+d7l+ODGZ3zyQc4IlqO7F4SPOV
	 6O8PIsH5xTQt5BAu7ZFroaX0dpb+8nJjdNClX1yaBSwyIY+MbZKymRcJAh/j49+c/
	 120BHKS1tu65r1WUE+fSggAB29mwMub4DUM1Jp9s845zqG90l6iqjEvsFhkoeE7M/
	 P4JwD7ZGcHeFL7Szow==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M8hlZ-1sb4WL45XV-006cx0; Wed, 24
 Jul 2024 00:08:45 +0200
Date: Wed, 24 Jul 2024 00:08:39 +0200
From: Christian Heusel <christian@heusel.eu>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, regressions@lists.linux.dev, 
	x86@kernel.org, rob@durendal.co.uk
Subject: Re: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
Message-ID: <5e08cab0-c6b5-4169-8d42-ddb0ffb4a6c9@heusel.eu>
References: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>
 <20240723120246.GBZp-b5nHHT0BWmKMZ@fat_crate.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kfzou7hn3gty7cvg"
Content-Disposition: inline
In-Reply-To: <20240723120246.GBZp-b5nHHT0BWmKMZ@fat_crate.local>
X-Provags-ID: V03:K1:E9XPMyG+I3wzezQYjZ7nCpKXOBP3CGV8OQwWaF1AwgmvngfhS2M
 A94irdKXbI21vaRHi78P1VJA/5Kr4a21uQAUvrxjwQ6e0vjailz8GmqdP11fxR2AkKGtZTM
 ACeJhrf42v8NmjID0WluVzB2ZpzxDoU8hKtV1vgMeJb1XXOW2P0Kl1t8fXZIgUJvfE1Fnkv
 D1UD80eVilYcAu7Jn8RZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MmeRk7fr4Lo=;1jsNZYh2Y3Fw64SeXMg62qy1b8M
 h0p0eS+bq1jA0QURBndKH2eT9e0DQyw2s403B0+BH+ifkYS3T+DOHQ0I6rlwFWY+tztY1gLLJ
 2BnA496UwSqLidwKgLKEAvuQzgM9d4OI5SDMdVvleYlja4NEtfJ/TdmSW0UkZegxAl28udJmE
 VoJYeLgUmTRfZKPWmiMJUxLYwpwHacNdyMJUboY2rnGasMGFddRFc6MBg0PnDfUtbb07zVHs0
 eJ1XJwc80AM4DMC46LjoGdTnV4mb5Yu9gmywzO0Ed5ne8Z8TtJqTYF3GPm3OJnUNOXInzY/LA
 pjG4du4GIfbNbWdW9XjWdAdUslKthltzjTjC8A+qaJDMbdHnGTFcAbeCywybuMlfj+JvrFMnT
 BdOuG9y6R6oAWhp5V+x03u6cwtCvPzNY4kN9xWV6QFLLVAIayjDdUGwmua0RzTi8WgcY3Aj1e
 9Up407LvutWmHcfwZwhfs5wQdTtEijD5cwRjwZOitBqON3D8AcLJvdts7ON3OMc5a7D/80BV1
 0yOVU39ukJm2uvXxMqACOlq69mSKcnOW909HO2XkKSXAdNCKqAk2og+Hg9KHmWafG8qe8f9lk
 MUh6Bb6Z0fLq6vUvFOPqGX4wQFr8iW6BtWvbwt1BkVZDM7kK6l9+ouowxSYZLtOXBnhFbYwPB
 W3HKDkMfoXaYYVSjkoktX5ptGxfwcpUsL4vCKgDhw/QNvXQrip/1f4w9cr3psl3PMWHx1dnw0
 VhSsdkGkMfXU1+Z3YKEjC94aS/VxjELww==


--kfzou7hn3gty7cvg
Content-Type: multipart/mixed; boundary="rlnldifet6b3aghg"
Content-Disposition: inline


--rlnldifet6b3aghg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/07/23 02:02PM, Borislav Petkov wrote:
> On Mon, Jul 15, 2024 at 03:11:19PM +0200, Christian Heusel wrote:
> > - output of "cpuid"
> > - dmesg of a working boot
>=20
> Send a full dmesg from 6.10 mainline - not some distro kernel, dunno
> what arch has, perhaps same as mainline but still... - I guess with
> the patch reverted as it doesn't boot otherwise, as you say.

See the attached dmesg for a boot with the mainline kernel that has the
problematic patch reverted!

Regarding the Arch Kernel, we're using a minimal patchset of 3 or 4
patches, see i.e. the following release:
https://github.com/archlinux/linux/releases/tag/v6.9.9-arch1

Other releases are a bit more heavy, but mostly consist of additional
backports to fix issues before the next stable release.

> Thx.

Cheers,
Chris

--rlnldifet6b3aghg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg.20240723.2246.txt"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 6.10.0-rc7-1.1-mainline-dirty (linux-mainline@=
archlinux) (gcc (GCC) 14.1.1 20240522, GNU ld (GNU Binutils) 2.42.0) #1 SMP=
 PREEMPT_DYNAMIC Sat, 13 Jul 2024 15:03:00 +0000
[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-linux-mainline root=
=3DUUID=3De317bc8b-4ecb-4d50-8a10-16c83daf75b3 rw nvidia-drm.modeset=3D1
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009cfffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009d00000-0x0000000009ffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a209fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x000000000a20a000-0x000000000affffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b01ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000b020000-0x00000000dbb65fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000dbb66000-0x00000000dbc62fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000dbc63000-0x00000000dbcdffff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000dbce0000-0x00000000dc1effff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000dc1f0000-0x00000000dcee7fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000dcee8000-0x00000000deffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000df000000-0x00000000dfffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fd100000-0x00000000fdffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000fea0ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000feb80000-0x00000000fec01fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedcffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedd4000-0x00000000fedd5fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000feefffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000021f37ffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] e820: update [mem 0xcebae018-0xcebbc057] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xceb7d018-0xcebad257] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xceb4c018-0xceb7c257] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xceb2c018-0xceb4b457] usable =3D=3D> usab=
le
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000009cfff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000009d00000-0x0000000009ffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000a000000-0x000000000a1fff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000a200000-0x000000000a209f=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000000a20a000-0x000000000affff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000b000000-0x000000000b01ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000b020000-0x00000000ceb2c0=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb2c018-0x00000000ceb4b4=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb4b458-0x00000000ceb4c0=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb4c018-0x00000000ceb7c2=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb7c258-0x00000000ceb7d0=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb7d018-0x00000000cebad2=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000cebad258-0x00000000cebae0=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000cebae018-0x00000000cebbc0=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000cebbc058-0x00000000dbb65f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000dbb66000-0x00000000dbc62f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000dbc63000-0x00000000dbcdff=
ff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000dbce0000-0x00000000dc1eff=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x00000000dc1f0000-0x00000000dcee7f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000dcee8000-0x00000000deffff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000df000000-0x00000000dfffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000f8000000-0x00000000fbffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fd100000-0x00000000fdffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fea00000-0x00000000fea0ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000feb80000-0x00000000fec01f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec10000-0x00000000fec10f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec30000-0x00000000fec30f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed00000-0x00000000fed00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed40000-0x00000000fed44f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed80000-0x00000000fed8ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedc2000-0x00000000fedcff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedd4000-0x00000000fedd5f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fee00000-0x00000000feefff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000021f37ff=
ff] usable
[    0.000000] efi: EFI v2.7 by American Megatrends
[    0.000000] efi: ACPI 2.0=3D0xdc16f000 ACPI=3D0xdc16f000 SMBIOS=3D0xdcd1=
a000 SMBIOS 3.0=3D0xdcd19000 ESRT=3D0xda4d8798 MEMATTR=3D0xd7bcb018 INITRD=
=3D0xd2e47e98 RNG=3D0xdbcdf018=20
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem35: MMIO range=3D[0xf8000000-0xfbffffff] (64M=
B) from e820 map
[    0.000000] e820: remove [mem 0xf8000000-0xfbffffff] reserved
[    0.000000] efi: Remove mem36: MMIO range=3D[0xfd100000-0xfdffffff] (15M=
B) from e820 map
[    0.000000] e820: remove [mem 0xfd100000-0xfdffffff] reserved
[    0.000000] efi: Not removing mem37: MMIO range=3D[0xfea00000-0xfea0ffff=
] (64KB) from e820 map
[    0.000000] efi: Remove mem38: MMIO range=3D[0xfeb80000-0xfec01fff] (0MB=
) from e820 map
[    0.000000] e820: remove [mem 0xfeb80000-0xfec01fff] reserved
[    0.000000] efi: Not removing mem39: MMIO range=3D[0xfec10000-0xfec10fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem40: MMIO range=3D[0xfec30000-0xfec30fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem41: MMIO range=3D[0xfed00000-0xfed00fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem42: MMIO range=3D[0xfed40000-0xfed44fff=
] (20KB) from e820 map
[    0.000000] efi: Not removing mem43: MMIO range=3D[0xfed80000-0xfed8ffff=
] (64KB) from e820 map
[    0.000000] efi: Not removing mem44: MMIO range=3D[0xfedc2000-0xfedcffff=
] (56KB) from e820 map
[    0.000000] efi: Not removing mem45: MMIO range=3D[0xfedd4000-0xfedd5fff=
] (8KB) from e820 map
[    0.000000] efi: Remove mem46: MMIO range=3D[0xfee00000-0xfeefffff] (1MB=
) from e820 map
[    0.000000] e820: remove [mem 0xfee00000-0xfeefffff] reserved
[    0.000000] efi: Remove mem47: MMIO range=3D[0xff000000-0xffffffff] (16M=
B) from e820 map
[    0.000000] e820: remove [mem 0xff000000-0xffffffff] reserved
[    0.000000] SMBIOS 3.1.1 present.
[    0.000000] DMI: Gigabyte Technology Co., Ltd. AB350M-D3V/AB350M-D3V-CF,=
 BIOS F23 08/08/2018
[    0.000000] DMI: Memory slots populated: 2/4
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 3493.374 MHz processor
[    0.000601] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000604] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000617] last_pfn =3D 0x21f380 max_arch_pfn =3D 0x400000000
[    0.000624] MTRR map: 5 entries (3 fixed + 2 variable; max 20), built fr=
om 9 variable MTRRs
[    0.000626] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.000857] e820: update [mem 0xe0000000-0xffffffff] usable =3D=3D> rese=
rved
[    0.000866] last_pfn =3D 0xdf000 max_arch_pfn =3D 0x400000000
[    0.004921] esrt: Reserving ESRT space from 0x00000000da4d8798 to 0x0000=
0000da4d87d0.
[    0.004927] e820: update [mem 0xda4d8000-0xda4d8fff] usable =3D=3D> rese=
rved
[    0.004946] Using GB pages for direct mapping
[    0.006030] Secure boot disabled
[    0.006031] RAMDISK: [mem 0xcebbd000-0xcf47ffff]
[    0.006050] ACPI: Early table checksum verification disabled
[    0.006053] ACPI: RSDP 0x00000000DC16F000 000024 (v02 ALASKA)
[    0.006057] ACPI: XSDT 0x00000000DC16F098 0000AC (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.006062] ACPI: FACP 0x00000000DC1761E8 000114 (v06 ALASKA A M I    01=
072009 AMI  00010013)
[    0.006066] ACPI BIOS Warning (bug): Optional FADT field Pm2ControlBlock=
 has valid Length but zero Address: 0x0000000000000000/0x1 (20240322/tbfadt=
-611)
[    0.006070] ACPI: DSDT 0x00000000DC16F1D8 00700F (v02 ALASKA A M I    01=
072009 INTL 20120913)
[    0.006073] ACPI: FACS 0x00000000DC1D8E00 000040
[    0.006076] ACPI: APIC 0x00000000DC176300 0000DE (v03 ALASKA A M I    01=
072009 AMI  00010013)
[    0.006079] ACPI: FPDT 0x00000000DC1763E0 000044 (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.006082] ACPI: FIDT 0x00000000DC176428 00009C (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.006085] ACPI: SSDT 0x00000000DC1764C8 008C98 (v02 ALASKA A M I    00=
000002 MSFT 04000000)
[    0.006088] ACPI: CRAT 0x00000000DC17F160 000850 (v01 ALASKA A M I    00=
000001 AMD  00000001)
[    0.006090] ACPI: CDIT 0x00000000DC17F9B0 000029 (v01 ALASKA A M I    00=
000001 AMD  00000001)
[    0.006093] ACPI: SSDT 0x00000000DC17F9E0 002DBA (v01 ALASKA A M I    00=
000001 INTL 20120913)
[    0.006096] ACPI: MCFG 0x00000000DC1827A0 00003C (v01 ALASKA A M I    01=
072009 MSFT 00010013)
[    0.006099] ACPI: HPET 0x00000000DC1827E0 000038 (v01 ALASKA A M I    01=
072009 AMI  00000005)
[    0.006101] ACPI: SSDT 0x00000000DC182818 000024 (v01 ALASKA A M I    00=
001000 INTL 20120913)
[    0.006104] ACPI: UEFI 0x00000000DC182840 000048 (v01 ALASKA A M I    00=
000000      00000000)
[    0.006107] ACPI: BGRT 0x00000000DC182888 000038 (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.006110] ACPI: IVRS 0x00000000DC1828C0 0000D0 (v02 ALASKA A M I    00=
000001 AMD  00000000)
[    0.006113] ACPI: SSDT 0x00000000DC182990 001A41 (v01 ALASKA A M I    00=
000001 INTL 20120913)
[    0.006115] ACPI: SSDT 0x00000000DC1843D8 0000F8 (v01 ALASKA A M I    00=
001000 INTL 20120913)
[    0.006118] ACPI: WSMT 0x00000000DC1844D0 000028 (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.006121] ACPI: Reserving FACP table memory at [mem 0xdc1761e8-0xdc176=
2fb]
[    0.006122] ACPI: Reserving DSDT table memory at [mem 0xdc16f1d8-0xdc176=
1e6]
[    0.006123] ACPI: Reserving FACS table memory at [mem 0xdc1d8e00-0xdc1d8=
e3f]
[    0.006124] ACPI: Reserving APIC table memory at [mem 0xdc176300-0xdc176=
3dd]
[    0.006125] ACPI: Reserving FPDT table memory at [mem 0xdc1763e0-0xdc176=
423]
[    0.006126] ACPI: Reserving FIDT table memory at [mem 0xdc176428-0xdc176=
4c3]
[    0.006127] ACPI: Reserving SSDT table memory at [mem 0xdc1764c8-0xdc17f=
15f]
[    0.006128] ACPI: Reserving CRAT table memory at [mem 0xdc17f160-0xdc17f=
9af]
[    0.006129] ACPI: Reserving CDIT table memory at [mem 0xdc17f9b0-0xdc17f=
9d8]
[    0.006130] ACPI: Reserving SSDT table memory at [mem 0xdc17f9e0-0xdc182=
799]
[    0.006130] ACPI: Reserving MCFG table memory at [mem 0xdc1827a0-0xdc182=
7db]
[    0.006131] ACPI: Reserving HPET table memory at [mem 0xdc1827e0-0xdc182=
817]
[    0.006132] ACPI: Reserving SSDT table memory at [mem 0xdc182818-0xdc182=
83b]
[    0.006133] ACPI: Reserving UEFI table memory at [mem 0xdc182840-0xdc182=
887]
[    0.006134] ACPI: Reserving BGRT table memory at [mem 0xdc182888-0xdc182=
8bf]
[    0.006135] ACPI: Reserving IVRS table memory at [mem 0xdc1828c0-0xdc182=
98f]
[    0.006136] ACPI: Reserving SSDT table memory at [mem 0xdc182990-0xdc184=
3d0]
[    0.006137] ACPI: Reserving SSDT table memory at [mem 0xdc1843d8-0xdc184=
4cf]
[    0.006137] ACPI: Reserving WSMT table memory at [mem 0xdc1844d0-0xdc184=
4f7]
[    0.006221] No NUMA configuration found
[    0.006222] Faking a node at [mem 0x0000000000000000-0x000000021f37ffff]
[    0.006225] NODE_DATA(0) allocated [mem 0x21f37b000-0x21f37ffff]
[    0.006251] Zone ranges:
[    0.006252]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.006253]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.006255]   Normal   [mem 0x0000000100000000-0x000000021f37ffff]
[    0.006256]   Device   empty
[    0.006257] Movable zone start for each node
[    0.006258] Early memory node ranges
[    0.006258]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.006260]   node   0: [mem 0x0000000000100000-0x0000000009cfffff]
[    0.006261]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
[    0.006262]   node   0: [mem 0x000000000a20a000-0x000000000affffff]
[    0.006262]   node   0: [mem 0x000000000b020000-0x00000000dbb65fff]
[    0.006264]   node   0: [mem 0x00000000dcee8000-0x00000000deffffff]
[    0.006265]   node   0: [mem 0x0000000100000000-0x000000021f37ffff]
[    0.006266] Initmem setup node 0 [mem 0x0000000000001000-0x000000021f37f=
fff]
[    0.006272] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.006296] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.006508] On node 0, zone DMA32: 768 pages in unavailable ranges
[    0.006530] On node 0, zone DMA32: 10 pages in unavailable ranges
[    0.014536] On node 0, zone DMA32: 32 pages in unavailable ranges
[    0.014680] On node 0, zone DMA32: 4994 pages in unavailable ranges
[    0.025954] On node 0, zone Normal: 4096 pages in unavailable ranges
[    0.026000] On node 0, zone Normal: 3200 pages in unavailable ranges
[    0.026435] ACPI: PM-Timer IO Port: 0x808
[    0.026444] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.026462] IOAPIC[0]: apic_id 5, version 33, address 0xfec00000, GSI 0-=
23
[    0.026467] IOAPIC[1]: apic_id 6, version 33, address 0xfec01000, GSI 24=
-55
[    0.026469] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.026470] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.026474] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.026476] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.026486] e820: update [mem 0xd8135000-0xd8179fff] usable =3D=3D> rese=
rved
[    0.026508] CPU topo: Max. logical packages:   1
[    0.026509] CPU topo: Max. logical dies:       1
[    0.026509] CPU topo: Max. dies per package:   1
[    0.026513] CPU topo: Max. threads per core:   1
[    0.026515] CPU topo: Num. cores per package:     4
[    0.026515] CPU topo: Num. threads per package:   4
[    0.026516] CPU topo: Allowing 4 present CPUs plus 12 hotplug CPUs
[    0.026540] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.026542] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0=
x000fffff]
[    0.026544] PM: hibernation: Registered nosave memory: [mem 0x09d00000-0=
x09ffffff]
[    0.026546] PM: hibernation: Registered nosave memory: [mem 0x0a200000-0=
x0a209fff]
[    0.026547] PM: hibernation: Registered nosave memory: [mem 0x0b000000-0=
x0b01ffff]
[    0.026549] PM: hibernation: Registered nosave memory: [mem 0xceb2c000-0=
xceb2cfff]
[    0.026551] PM: hibernation: Registered nosave memory: [mem 0xceb4b000-0=
xceb4bfff]
[    0.026551] PM: hibernation: Registered nosave memory: [mem 0xceb4c000-0=
xceb4cfff]
[    0.026553] PM: hibernation: Registered nosave memory: [mem 0xceb7c000-0=
xceb7cfff]
[    0.026554] PM: hibernation: Registered nosave memory: [mem 0xceb7d000-0=
xceb7dfff]
[    0.026555] PM: hibernation: Registered nosave memory: [mem 0xcebad000-0=
xcebadfff]
[    0.026556] PM: hibernation: Registered nosave memory: [mem 0xcebae000-0=
xcebaefff]
[    0.026558] PM: hibernation: Registered nosave memory: [mem 0xcebbc000-0=
xcebbcfff]
[    0.026560] PM: hibernation: Registered nosave memory: [mem 0xd8135000-0=
xd8179fff]
[    0.026561] PM: hibernation: Registered nosave memory: [mem 0xda4d8000-0=
xda4d8fff]
[    0.026563] PM: hibernation: Registered nosave memory: [mem 0xdbb66000-0=
xdbc62fff]
[    0.026564] PM: hibernation: Registered nosave memory: [mem 0xdbc63000-0=
xdbcdffff]
[    0.026565] PM: hibernation: Registered nosave memory: [mem 0xdbce0000-0=
xdc1effff]
[    0.026566] PM: hibernation: Registered nosave memory: [mem 0xdc1f0000-0=
xdcee7fff]
[    0.026567] PM: hibernation: Registered nosave memory: [mem 0xdf000000-0=
xdfffffff]
[    0.026568] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0=
xfe9fffff]
[    0.026569] PM: hibernation: Registered nosave memory: [mem 0xfea00000-0=
xfea0ffff]
[    0.026570] PM: hibernation: Registered nosave memory: [mem 0xfea10000-0=
xfec0ffff]
[    0.026570] PM: hibernation: Registered nosave memory: [mem 0xfec10000-0=
xfec10fff]
[    0.026571] PM: hibernation: Registered nosave memory: [mem 0xfec11000-0=
xfec2ffff]
[    0.026572] PM: hibernation: Registered nosave memory: [mem 0xfec30000-0=
xfec30fff]
[    0.026573] PM: hibernation: Registered nosave memory: [mem 0xfec31000-0=
xfecfffff]
[    0.026573] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0=
xfed00fff]
[    0.026574] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0=
xfed3ffff]
[    0.026575] PM: hibernation: Registered nosave memory: [mem 0xfed40000-0=
xfed44fff]
[    0.026576] PM: hibernation: Registered nosave memory: [mem 0xfed45000-0=
xfed7ffff]
[    0.026576] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0=
xfed8ffff]
[    0.026577] PM: hibernation: Registered nosave memory: [mem 0xfed90000-0=
xfedc1fff]
[    0.026578] PM: hibernation: Registered nosave memory: [mem 0xfedc2000-0=
xfedcffff]
[    0.026579] PM: hibernation: Registered nosave memory: [mem 0xfedd0000-0=
xfedd3fff]
[    0.026580] PM: hibernation: Registered nosave memory: [mem 0xfedd4000-0=
xfedd5fff]
[    0.026580] PM: hibernation: Registered nosave memory: [mem 0xfedd6000-0=
xffffffff]
[    0.026582] [mem 0xe0000000-0xfe9fffff] available for PCI devices
[    0.026583] Booting paravirtualized kernel on bare hardware
[    0.026586] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 6370452778343963 ns
[    0.031929] setup_percpu: NR_CPUS:320 nr_cpumask_bits:16 nr_cpu_ids:16 n=
r_node_ids:1
[    0.033359] percpu: Embedded 66 pages/cpu s233472 r8192 d28672 u524288
[    0.033370] pcpu-alloc: s233472 r8192 d28672 u524288 alloc=3D1*2097152
[    0.033372] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07=20
[    0.033378] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15=20
[    0.033403] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-linux-mainli=
ne root=3DUUID=3De317bc8b-4ecb-4d50-8a10-16c83daf75b3 rw nvidia-drm.modeset=
=3D1
[    0.033458] Unknown kernel command line parameters "BOOT_IMAGE=3D/boot/v=
mlinuz-linux-mainline", will be passed to user space.
[    0.034532] Dentry cache hash table entries: 1048576 (order: 11, 8388608=
 bytes, linear)
[    0.035065] Inode-cache hash table entries: 524288 (order: 10, 4194304 b=
ytes, linear)
[    0.035183] Fallback order for Node 0: 0=20
[    0.035191] Built 1 zonelists, mobility grouping on.  Total pages: 20839=
55
[    0.035192] Policy zone: Normal
[    0.035513] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.035581] software IO TLB: area num 16.
[    0.070979] Memory: 8006796K/8335820K available (18432K kernel code, 217=
7K rwdata, 13400K rodata, 3428K init, 3572K bss, 328764K reserved, 0K cma-r=
eserved)
[    0.071200] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D16, =
Nodes=3D1
[    0.071254] ftrace: allocating 50089 entries in 196 pages
[    0.078888] ftrace: allocated 196 pages with 3 groups
[    0.078981] Dynamic Preempt: full
[    0.079052] rcu: Preemptible hierarchical RCU implementation.
[    0.079053] rcu: 	RCU restricting CPUs from NR_CPUS=3D320 to nr_cpu_ids=
=3D16.
[    0.079054] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[    0.079055] 	Trampoline variant of Tasks RCU enabled.
[    0.079056] 	Rude variant of Tasks RCU enabled.
[    0.079056] 	Tracing variant of Tasks RCU enabled.
[    0.079057] rcu: RCU calculated value of scheduler-enlistment delay is 3=
0 jiffies.
[    0.079058] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D16
[    0.079070] RCU Tasks: Setting shift to 4 and lim to 1 rcu_task_cb_adjus=
t=3D1.
[    0.079072] RCU Tasks Rude: Setting shift to 4 and lim to 1 rcu_task_cb_=
adjust=3D1.
[    0.079074] RCU Tasks Trace: Setting shift to 4 and lim to 1 rcu_task_cb=
_adjust=3D1.
[    0.082914] NR_IRQS: 20736, nr_irqs: 1096, preallocated irqs: 16
[    0.083125] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.083263] kfence: initialized - using 2097152 bytes for 255 objects at=
 0x(____ptrval____)-0x(____ptrval____)
[    0.083300] Console: colour dummy device 80x25
[    0.083303] printk: legacy console [tty0] enabled
[    0.083350] ACPI: Core revision 20240322
[    0.083468] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484873504 ns
[    0.083496] APIC: Switch to symmetric I/O mode setup
[    0.084742] AMD-Vi: Using global IVHD EFR:0xf77ef22294ada, EFR2:0x0
[    0.085076] APIC: Switched APIC routing to: physical flat
[    0.085863] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.100163] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x325add93063, max_idle_ns: 440795205842 ns
[    0.100168] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 6989.86 BogoMIPS (lpj=3D11644580)
[    0.100179] AMD Zen1 DIV0 bug detected. Disable SMT for full protection.
[    0.100181] SVM disabled (by BIOS) in MSR_VM_CR
[    0.100211] LVT offset 1 assigned for vector 0xf9
[    0.100277] LVT offset 2 assigned for vector 0xf4
[    0.100293] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    0.100294] Last level dTLB entries: 4KB 1536, 2MB 1536, 4MB 768, 1GB 0
[    0.100298] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.100300] Spectre V2 : Mitigation: Retpolines
[    0.100301] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.100301] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    0.100302] Spectre V2 : Enabling Speculation Barrier for firmware calls
[    0.100303] RETBleed: Mitigation: untrained return thunk
[    0.100304] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.100306] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl
[    0.100310] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.100312] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.100312] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.100314] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.100315] x86/fpu: Enabled xstate features 0x7, context size is 832 by=
tes, using 'compacted' format.
[    0.118808] Freeing SMP alternatives memory: 40K
[    0.118811] pid_max: default: 32768 minimum: 301
[    0.120201] LSM: initializing lsm=3Dcapability,landlock,lockdown,yama,bpf
[    0.120225] landlock: Up and running.
[    0.120226] Yama: becoming mindful.
[    0.120231] LSM support for eBPF active
[    0.120261] Mount-cache hash table entries: 16384 (order: 5, 131072 byte=
s, linear)
[    0.120274] Mountpoint-cache hash table entries: 16384 (order: 5, 131072=
 bytes, linear)
[    0.227718] smpboot: CPU0: AMD Ryzen 3 1300X Quad-Core Processor (family=
: 0x17, model: 0x1, stepping: 0x1)
[    0.227903] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    0.227908] ... version:                0
[    0.227909] ... bit width:              48
[    0.227909] ... generic registers:      6
[    0.227910] ... value mask:             0000ffffffffffff
[    0.227911] ... max period:             00007fffffffffff
[    0.227912] ... fixed-purpose events:   0
[    0.227912] ... event mask:             000000000000003f
[    0.227994] signal: max sigframe size: 1776
[    0.228020] rcu: Hierarchical SRCU implementation.
[    0.228021] rcu: 	Max phase no-delay instances is 1000.
[    0.230165] MCE: In-kernel MCE decoding enabled.
[    0.230165] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.230165] smp: Bringing up secondary CPUs ...
[    0.230165] smpboot: x86: Booting SMP configuration:
[    0.230165] .... node  #0, CPUs:        #1  #2  #3
[    0.235501] smp: Brought up 1 node, 4 CPUs
[    0.235501] smpboot: Total of 4 processors activated (27958.45 BogoMIPS)
[    0.237024] devtmpfs: initialized
[    0.237024] x86/mm: Memory block size: 128MB
[    0.237484] ACPI: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a20=
9fff] (40960 bytes)
[    0.237484] ACPI: PM: Registering ACPI NVS region [mem 0xdbce0000-0xdc1e=
ffff] (5308416 bytes)
[    0.237484] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 6370867519511994 ns
[    0.237484] futex hash table entries: 4096 (order: 6, 262144 bytes, line=
ar)
[    0.237484] pinctrl core: initialized pinctrl subsystem
[    0.237484] PM: RTC time: 21:44:34, date: 2024-07-23
[    0.237552] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.237762] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic alloca=
tions
[    0.237867] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    0.237983] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    0.237996] audit: initializing netlink subsys (disabled)
[    0.238090] audit: type=3D2000 audit(1721771074.153:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.238182] thermal_sys: Registered thermal governor 'fair_share'
[    0.238184] thermal_sys: Registered thermal governor 'bang_bang'
[    0.238185] thermal_sys: Registered thermal governor 'step_wise'
[    0.238186] thermal_sys: Registered thermal governor 'user_space'
[    0.238187] thermal_sys: Registered thermal governor 'power_allocator'
[    0.238198] cpuidle: using governor ladder
[    0.238201] cpuidle: using governor menu
[    0.238234] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.238234] PCI: ECAM [mem 0xf8000000-0xfbffffff] (base 0xf8000000) for =
domain 0000 [bus 00-3f]
[    0.238234] PCI: Using configuration type 1 for base access
[    0.238234] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    0.243552] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.243554] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.243555] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.243556] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.243627] Demotion targets for Node 0: null
[    0.243906] ACPI: Added _OSI(Module Device)
[    0.243907] ACPI: Added _OSI(Processor Device)
[    0.243908] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.243909] ACPI: Added _OSI(Processor Aggregator Device)
[    0.254805] ACPI: 6 ACPI AML tables successfully acquired and loaded
[    0.255480] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.258393] ACPI: _OSC evaluation for CPUs failed, trying _PDC
[    0.258788] ACPI: Interpreter enabled
[    0.258802] ACPI: PM: (supports S0 S3 S4 S5)
[    0.258804] ACPI: Using IOAPIC for interrupt routing
[    0.259547] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.259548] PCI: Using E820 reservations for host bridge windows
[    0.259779] ACPI: Enabled 2 GPEs in block 00 to 1F
[    0.267805] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.267812] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI EDR HPX-Type3]
[    0.267895] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplu=
g LTR DPC]
[    0.268044] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER =
PCIeCapability]
[    0.268054] acpi PNP0A08:00: [Firmware Info]: ECAM [mem 0xf8000000-0xfbf=
fffff] for domain 0000 [bus 00-3f] only partially covers this bridge
[    0.268435] PCI host bridge to bus 0000:00
[    0.268437] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    0.268439] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    0.268441] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
[    0.268442] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.268443] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dfff=
f window]
[    0.268445] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xfec2fff=
f window]
[    0.268446] pci_bus 0000:00: root bus resource [mem 0xfee00000-0xfffffff=
f window]
[    0.268447] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.268460] pci 0000:00:00.0: [1022:1450] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.268539] pci 0000:00:00.2: [1022:1451] type 00 class 0x080600 convent=
ional PCI endpoint
[    0.268624] pci 0000:00:01.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.268673] pci 0000:00:01.1: [1022:1453] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.268687] pci 0000:00:01.1: PCI bridge to [bus 01]
[    0.268692] pci 0000:00:01.1:   bridge window [mem 0xf7c00000-0xf7cfffff]
[    0.268955] pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
[    0.269131] pci 0000:00:01.3: [1022:1453] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.269145] pci 0000:00:01.3: PCI bridge to [bus 02-0a]
[    0.269148] pci 0000:00:01.3:   bridge window [io  0xd000-0xefff]
[    0.269150] pci 0000:00:01.3:   bridge window [mem 0xf6400000-0xf77fffff]
[    0.269156] pci 0000:00:01.3:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.269237] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
[    0.269442] pci 0000:00:02.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.269505] pci 0000:00:03.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.269555] pci 0000:00:03.1: [1022:1453] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.269573] pci 0000:00:03.1: PCI bridge to [bus 0b]
[    0.269578] pci 0000:00:03.1:   bridge window [io  0xf000-0xffff]
[    0.269580] pci 0000:00:03.1:   bridge window [mem 0xf5000000-0xf60fffff]
[    0.269587] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf1ffffff=
 64bit pref]
[    0.269997] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
[    0.270201] pci 0000:00:04.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.270268] pci 0000:00:07.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.270317] pci 0000:00:07.1: [1022:1454] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.270330] pci 0000:00:07.1: PCI bridge to [bus 0c]
[    0.270334] pci 0000:00:07.1:   bridge window [mem 0xf7800000-0xf7afffff]
[    0.270351] pci 0000:00:07.1: enabling Extended Tags
[    0.270417] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.270596] pci 0000:00:08.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.270645] pci 0000:00:08.1: [1022:1454] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.270659] pci 0000:00:08.1: PCI bridge to [bus 0d]
[    0.270664] pci 0000:00:08.1:   bridge window [mem 0xf7b00000-0xf7bfffff]
[    0.270889] pci 0000:00:08.1: enabling Extended Tags
[    0.270958] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.271166] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500 convent=
ional PCI endpoint
[    0.271374] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100 convent=
ional PCI endpoint
[    0.271589] pci 0000:00:18.0: [1022:1460] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.271624] pci 0000:00:18.1: [1022:1461] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.271657] pci 0000:00:18.2: [1022:1462] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.271692] pci 0000:00:18.3: [1022:1463] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.271724] pci 0000:00:18.4: [1022:1464] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.271757] pci 0000:00:18.5: [1022:1465] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.271789] pci 0000:00:18.6: [1022:1466] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.271823] pci 0000:00:18.7: [1022:1467] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.271941] pci 0000:01:00.0: [144d:a804] type 00 class 0x010802 PCIe En=
dpoint
[    0.271956] pci 0000:01:00.0: BAR 0 [mem 0xf7c00000-0xf7c03fff 64bit]
[    0.272157] pci 0000:00:01.1: PCI bridge to [bus 01]
[    0.272232] pci 0000:02:00.0: [1022:43bb] type 00 class 0x0c0330 PCIe Le=
gacy Endpoint
[    0.272247] pci 0000:02:00.0: BAR 0 [mem 0xf77a0000-0xf77a7fff 64bit]
[    0.272330] pci 0000:02:00.0: PME# supported from D3hot D3cold
[    0.272473] pci 0000:02:00.1: [1022:43b7] type 00 class 0x010601 PCIe Le=
gacy Endpoint
[    0.272514] pci 0000:02:00.1: BAR 5 [mem 0xf7780000-0xf779ffff]
[    0.272521] pci 0000:02:00.1: ROM [mem 0xf7700000-0xf777ffff pref]
[    0.272561] pci 0000:02:00.1: PME# supported from D3hot D3cold
[    0.272644] pci 0000:02:00.2: [1022:43b2] type 01 class 0x060400 PCIe Sw=
itch Upstream Port
[    0.272668] pci 0000:02:00.2: PCI bridge to [bus 03-0a]
[    0.272674] pci 0000:02:00.2:   bridge window [io  0xd000-0xefff]
[    0.272677] pci 0000:02:00.2:   bridge window [mem 0xf6400000-0xf76fffff]
[    0.272685] pci 0000:02:00.2:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.272735] pci 0000:02:00.2: PME# supported from D3hot D3cold
[    0.272837] pci 0000:00:01.3: PCI bridge to [bus 02-0a]
[    0.272922] pci 0000:03:00.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.272949] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.273028] pci 0000:03:00.0: PME# supported from D3hot D3cold
[    0.273135] pci 0000:03:01.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.273162] pci 0000:03:01.0: PCI bridge to [bus 05]
[    0.273241] pci 0000:03:01.0: PME# supported from D3hot D3cold
[    0.273348] pci 0000:03:04.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.273374] pci 0000:03:04.0: PCI bridge to [bus 06]
[    0.273379] pci 0000:03:04.0:   bridge window [io  0xe000-0xefff]
[    0.273382] pci 0000:03:04.0:   bridge window [mem 0xf7600000-0xf76fffff]
[    0.273391] pci 0000:03:04.0:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.273456] pci 0000:03:04.0: PME# supported from D3hot D3cold
[    0.273564] pci 0000:03:05.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.273590] pci 0000:03:05.0: PCI bridge to [bus 07]
[    0.273670] pci 0000:03:05.0: PME# supported from D3hot D3cold
[    0.273774] pci 0000:03:06.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.273800] pci 0000:03:06.0: PCI bridge to [bus 08-09]
[    0.273805] pci 0000:03:06.0:   bridge window [io  0xd000-0xdfff]
[    0.273808] pci 0000:03:06.0:   bridge window [mem 0xf6400000-0xf74fffff]
[    0.273881] pci 0000:03:06.0: PME# supported from D3hot D3cold
[    0.273986] pci 0000:03:07.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.274011] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    0.274090] pci 0000:03:07.0: PME# supported from D3hot D3cold
[    0.274203] pci 0000:02:00.2: PCI bridge to [bus 03-0a]
[    0.274240] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.274286] pci 0000:03:01.0: PCI bridge to [bus 05]
[    0.274358] pci 0000:06:00.0: [10ec:8168] type 00 class 0x020000 PCIe En=
dpoint
[    0.274384] pci 0000:06:00.0: BAR 0 [io  0xe000-0xe0ff]
[    0.274419] pci 0000:06:00.0: BAR 2 [mem 0xf7600000-0xf7600fff 64bit]
[    0.274441] pci 0000:06:00.0: BAR 4 [mem 0xf2100000-0xf2103fff 64bit pre=
f]
[    0.274588] pci 0000:06:00.0: supports D1 D2
[    0.274589] pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.274797] pci 0000:03:04.0: PCI bridge to [bus 06]
[    0.274836] pci 0000:03:05.0: PCI bridge to [bus 07]
[    0.274927] pci 0000:08:00.0: [8086:10c9] type 00 class 0x020000 PCIe En=
dpoint
[    0.274963] pci 0000:08:00.0: BAR 0 [mem 0xf7420000-0xf743ffff]
[    0.274982] pci 0000:08:00.0: BAR 1 [mem 0xf7000000-0xf73fffff]
[    0.275002] pci 0000:08:00.0: BAR 2 [io  0xd020-0xd03f]
[    0.275022] pci 0000:08:00.0: BAR 3 [mem 0xf74c4000-0xf74c7fff]
[    0.275078] pci 0000:08:00.0: ROM [mem 0xf6c00000-0xf6ffffff pref]
[    0.275249] pci 0000:08:00.0: PME# supported from D0 D3hot D3cold
[    0.275326] pci 0000:08:00.0: VF BAR 0 [mem 0xf74a0000-0xf74a3fff 64bit]
[    0.275327] pci 0000:08:00.0: VF BAR 0 [mem 0xf74a0000-0xf74bffff 64bit]=
: contains BAR 0 for 8 VFs
[    0.275375] pci 0000:08:00.0: VF BAR 3 [mem 0xf7480000-0xf7483fff 64bit]
[    0.275376] pci 0000:08:00.0: VF BAR 3 [mem 0xf7480000-0xf749ffff 64bit]=
: contains BAR 3 for 8 VFs
[    0.275575] pci 0000:08:00.0: 2.000 Gb/s available PCIe bandwidth, limit=
ed by 2.5 GT/s PCIe x1 link at 0000:03:06.0 (capable of 8.000 Gb/s with 2.5=
 GT/s PCIe x4 link)
[    0.275731] pci 0000:08:00.1: [8086:10c9] type 00 class 0x020000 PCIe En=
dpoint
[    0.275767] pci 0000:08:00.1: BAR 0 [mem 0xf7400000-0xf741ffff]
[    0.275787] pci 0000:08:00.1: BAR 1 [mem 0xf6800000-0xf6bfffff]
[    0.275806] pci 0000:08:00.1: BAR 2 [io  0xd000-0xd01f]
[    0.275825] pci 0000:08:00.1: BAR 3 [mem 0xf74c0000-0xf74c3fff]
[    0.275882] pci 0000:08:00.1: ROM [mem 0xf6400000-0xf67fffff pref]
[    0.276053] pci 0000:08:00.1: PME# supported from D0 D3hot D3cold
[    0.276129] pci 0000:08:00.1: VF BAR 0 [mem 0xf7460000-0xf7463fff 64bit]
[    0.276130] pci 0000:08:00.1: VF BAR 0 [mem 0xf7460000-0xf747ffff 64bit]=
: contains BAR 0 for 8 VFs
[    0.276178] pci 0000:08:00.1: VF BAR 3 [mem 0xf7440000-0xf7443fff 64bit]
[    0.276179] pci 0000:08:00.1: VF BAR 3 [mem 0xf7440000-0xf745ffff 64bit]=
: contains BAR 3 for 8 VFs
[    0.276520] pci 0000:03:06.0: PCI bridge to [bus 08-09]
[    0.276560] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    0.276889] pci 0000:0b:00.0: [10de:1d01] type 00 class 0x030000 PCIe Le=
gacy Endpoint
[    0.276906] pci 0000:0b:00.0: BAR 0 [mem 0xf5000000-0xf5ffffff]
[    0.276920] pci 0000:0b:00.0: BAR 1 [mem 0xe0000000-0xefffffff 64bit pre=
f]
[    0.276933] pci 0000:0b:00.0: BAR 3 [mem 0xf0000000-0xf1ffffff 64bit pre=
f]
[    0.276943] pci 0000:0b:00.0: BAR 5 [io  0xf000-0xf07f]
[    0.276952] pci 0000:0b:00.0: ROM [mem 0xf6000000-0xf607ffff pref]
[    0.276986] pci 0000:0b:00.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.277123] pci 0000:0b:00.0: 8.000 Gb/s available PCIe bandwidth, limit=
ed by 2.5 GT/s PCIe x4 link at 0000:00:03.1 (capable of 31.504 Gb/s with 8.=
0 GT/s PCIe x4 link)
[    0.277214] pci 0000:0b:00.1: [10de:0fb8] type 00 class 0x040300 PCIe En=
dpoint
[    0.277231] pci 0000:0b:00.1: BAR 0 [mem 0xf6080000-0xf6083fff]
[    0.277423] pci 0000:00:03.1: PCI bridge to [bus 0b]
[    0.277491] pci 0000:0c:00.0: [1022:145a] type 00 class 0x130000 PCIe En=
dpoint
[    0.277513] pci 0000:0c:00.0: enabling Extended Tags
[    0.277599] pci 0000:0c:00.2: [1022:1456] type 00 class 0x108000 PCIe En=
dpoint
[    0.277611] pci 0000:0c:00.2: BAR 2 [mem 0xf7900000-0xf79fffff]
[    0.277619] pci 0000:0c:00.2: BAR 5 [mem 0xf7a00000-0xf7a01fff]
[    0.277625] pci 0000:0c:00.2: enabling Extended Tags
[    0.277723] pci 0000:0c:00.3: [1022:145c] type 00 class 0x0c0330 PCIe En=
dpoint
[    0.277733] pci 0000:0c:00.3: BAR 0 [mem 0xf7800000-0xf78fffff 64bit]
[    0.277752] pci 0000:0c:00.3: enabling Extended Tags
[    0.277780] pci 0000:0c:00.3: PME# supported from D0 D3hot D3cold
[    0.277863] pci 0000:00:07.1: PCI bridge to [bus 0c]
[    0.277936] pci 0000:0d:00.0: [1022:1455] type 00 class 0x130000 PCIe En=
dpoint
[    0.277960] pci 0000:0d:00.0: enabling Extended Tags
[    0.278056] pci 0000:0d:00.2: [1022:7901] type 00 class 0x010601 PCIe En=
dpoint
[    0.278081] pci 0000:0d:00.2: BAR 5 [mem 0xf7b08000-0xf7b08fff]
[    0.278088] pci 0000:0d:00.2: enabling Extended Tags
[    0.278119] pci 0000:0d:00.2: PME# supported from D3hot D3cold
[    0.278193] pci 0000:0d:00.3: [1022:1457] type 00 class 0x040300 PCIe En=
dpoint
[    0.278200] pci 0000:0d:00.3: BAR 0 [mem 0xf7b00000-0xf7b07fff]
[    0.278218] pci 0000:0d:00.3: enabling Extended Tags
[    0.278248] pci 0000:0d:00.3: PME# supported from D0 D3hot D3cold
[    0.278328] pci 0000:00:08.1: PCI bridge to [bus 0d]
[    0.278712] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.278764] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    0.278808] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.278864] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.278915] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.278956] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.278996] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.279037] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.279576] iommu: Default domain type: Translated
[    0.279577] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.279692] SCSI subsystem initialized
[    0.279715] libata version 3.00 loaded.
[    0.279715] ACPI: bus type USB registered
[    0.279715] usbcore: registered new interface driver usbfs
[    0.279715] usbcore: registered new interface driver hub
[    0.279715] usbcore: registered new device driver usb
[    0.279715] EDAC MC: Ver: 3.0.0
[    0.279715] efivars: Registered efivars operations
[    0.280346] NetLabel: Initializing
[    0.280348] NetLabel:  domain hash size =3D 128
[    0.280348] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.280361] NetLabel:  unlabeled traffic allowed by default
[    0.280364] mctp: management component transport protocol core
[    0.280365] NET: Registered PF_MCTP protocol family
[    0.280369] PCI: Using ACPI for IRQ routing
[    0.284480] PCI: pci_cache_line_size set to 64 bytes
[    0.284556] e820: reserve RAM buffer [mem 0x09d00000-0x0bffffff]
[    0.284558] e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
[    0.284559] e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
[    0.284560] e820: reserve RAM buffer [mem 0xceb2c018-0xcfffffff]
[    0.284561] e820: reserve RAM buffer [mem 0xceb4c018-0xcfffffff]
[    0.284562] e820: reserve RAM buffer [mem 0xceb7d018-0xcfffffff]
[    0.284563] e820: reserve RAM buffer [mem 0xcebae018-0xcfffffff]
[    0.284564] e820: reserve RAM buffer [mem 0xd8135000-0xdbffffff]
[    0.284565] e820: reserve RAM buffer [mem 0xda4d8000-0xdbffffff]
[    0.284566] e820: reserve RAM buffer [mem 0xdbb66000-0xdbffffff]
[    0.284567] e820: reserve RAM buffer [mem 0xdf000000-0xdfffffff]
[    0.284567] e820: reserve RAM buffer [mem 0x21f380000-0x21fffffff]
[    0.284610] pci 0000:0b:00.0: vgaarb: setting as boot VGA device
[    0.284610] pci 0000:0b:00.0: vgaarb: bridge control possible
[    0.284610] pci 0000:0b:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.284610] vgaarb: loaded
[    0.284610] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.284610] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.285618] clocksource: Switched to clocksource tsc-early
[    0.285652] VFS: Disk quotas dquot_6.6.0
[    0.285652] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.285652] pnp: PnP ACPI init
[    0.285652] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.285652] system 00:02: [io  0x0a00-0x0a2f] has been reserved
[    0.285652] system 00:02: [io  0x0a30-0x0a3f] has been reserved
[    0.285652] system 00:02: [io  0x0a40-0x0a4f] has been reserved
[    0.285652] pnp 00:03: [dma 0 disabled]
[    0.285652] system 00:04: [io  0x04d0-0x04d1] has been reserved
[    0.285652] system 00:04: [io  0x040b] has been reserved
[    0.285652] system 00:04: [io  0x04d6] has been reserved
[    0.285652] system 00:04: [io  0x0c00-0x0c01] has been reserved
[    0.285652] system 00:04: [io  0x0c14] has been reserved
[    0.285652] system 00:04: [io  0x0c50-0x0c51] has been reserved
[    0.285652] system 00:04: [io  0x0c52] has been reserved
[    0.285652] system 00:04: [io  0x0c6c] has been reserved
[    0.285652] system 00:04: [io  0x0c6f] has been reserved
[    0.285652] system 00:04: [io  0x0cd0-0x0cd1] has been reserved
[    0.285652] system 00:04: [io  0x0cd2-0x0cd3] has been reserved
[    0.285652] system 00:04: [io  0x0cd4-0x0cd5] has been reserved
[    0.285652] system 00:04: [io  0x0cd6-0x0cd7] has been reserved
[    0.285652] system 00:04: [io  0x0cd8-0x0cdf] has been reserved
[    0.285652] system 00:04: [io  0x0800-0x089f] has been reserved
[    0.285652] system 00:04: [io  0x0b00-0x0b0f] has been reserved
[    0.285652] system 00:04: [io  0x0b20-0x0b3f] has been reserved
[    0.285652] system 00:04: [io  0x0900-0x090f] has been reserved
[    0.285652] system 00:04: [io  0x0910-0x091f] has been reserved
[    0.285652] system 00:04: [mem 0xfec00000-0xfec00fff] could not be reser=
ved
[    0.285652] system 00:04: [mem 0xfec01000-0xfec01fff] could not be reser=
ved
[    0.285652] system 00:04: [mem 0xfedc0000-0xfedc0fff] has been reserved
[    0.285652] system 00:04: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.285652] system 00:04: [mem 0xfed80000-0xfed8ffff] could not be reser=
ved
[    0.285652] system 00:04: [mem 0xfec10000-0xfec10fff] has been reserved
[    0.285652] system 00:04: [mem 0xff000000-0xffffffff] has been reserved
[    0.285652] pnp: PnP ACPI: found 5 devices
[    0.290820] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.290868] NET: Registered PF_INET protocol family
[    0.290964] IP idents hash table entries: 131072 (order: 8, 1048576 byte=
s, linear)
[    0.302737] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4,=
 65536 bytes, linear)
[    0.302766] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.302803] TCP established hash table entries: 65536 (order: 7, 524288 =
bytes, linear)
[    0.302987] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes,=
 linear)
[    0.303099] TCP: Hash tables configured (established 65536 bind 65536)
[    0.303178] MPTCP token hash table entries: 8192 (order: 5, 196608 bytes=
, linear)
[    0.303208] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
[    0.303230] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, l=
inear)
[    0.303281] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.303288] NET: Registered PF_XDP protocol family
[    0.303309] pci 0000:00:01.1: PCI bridge to [bus 01]
[    0.303314] pci 0000:00:01.1:   bridge window [mem 0xf7c00000-0xf7cfffff]
[    0.303321] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.303330] pci 0000:03:01.0: PCI bridge to [bus 05]
[    0.303339] pci 0000:03:04.0: PCI bridge to [bus 06]
[    0.303342] pci 0000:03:04.0:   bridge window [io  0xe000-0xefff]
[    0.303346] pci 0000:03:04.0:   bridge window [mem 0xf7600000-0xf76fffff]
[    0.303349] pci 0000:03:04.0:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.303354] pci 0000:03:05.0: PCI bridge to [bus 07]
[    0.303363] pci 0000:03:06.0: PCI bridge to [bus 08-09]
[    0.303365] pci 0000:03:06.0:   bridge window [io  0xd000-0xdfff]
[    0.303369] pci 0000:03:06.0:   bridge window [mem 0xf6400000-0xf74fffff]
[    0.303375] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    0.303384] pci 0000:02:00.2: PCI bridge to [bus 03-0a]
[    0.303386] pci 0000:02:00.2:   bridge window [io  0xd000-0xefff]
[    0.303390] pci 0000:02:00.2:   bridge window [mem 0xf6400000-0xf76fffff]
[    0.303392] pci 0000:02:00.2:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.303397] pci 0000:00:01.3: PCI bridge to [bus 02-0a]
[    0.303398] pci 0000:00:01.3:   bridge window [io  0xd000-0xefff]
[    0.303401] pci 0000:00:01.3:   bridge window [mem 0xf6400000-0xf77fffff]
[    0.303403] pci 0000:00:01.3:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.303407] pci 0000:00:03.1: PCI bridge to [bus 0b]
[    0.303409] pci 0000:00:03.1:   bridge window [io  0xf000-0xffff]
[    0.303412] pci 0000:00:03.1:   bridge window [mem 0xf5000000-0xf60fffff]
[    0.303414] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf1ffffff=
 64bit pref]
[    0.303419] pci 0000:00:07.1: PCI bridge to [bus 0c]
[    0.303421] pci 0000:00:07.1:   bridge window [mem 0xf7800000-0xf7afffff]
[    0.303425] pci 0000:00:08.1: PCI bridge to [bus 0d]
[    0.303427] pci 0000:00:08.1:   bridge window [mem 0xf7b00000-0xf7bfffff]
[    0.303433] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[    0.303434] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[    0.303436] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
[    0.303437] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
[    0.303438] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000dffff windo=
w]
[    0.303439] pci_bus 0000:00: resource 9 [mem 0xe0000000-0xfec2ffff windo=
w]
[    0.303440] pci_bus 0000:00: resource 10 [mem 0xfee00000-0xffffffff wind=
ow]
[    0.303442] pci_bus 0000:01: resource 1 [mem 0xf7c00000-0xf7cfffff]
[    0.303443] pci_bus 0000:02: resource 0 [io  0xd000-0xefff]
[    0.303444] pci_bus 0000:02: resource 1 [mem 0xf6400000-0xf77fffff]
[    0.303445] pci_bus 0000:02: resource 2 [mem 0xf2100000-0xf21fffff 64bit=
 pref]
[    0.303447] pci_bus 0000:03: resource 0 [io  0xd000-0xefff]
[    0.303448] pci_bus 0000:03: resource 1 [mem 0xf6400000-0xf76fffff]
[    0.303449] pci_bus 0000:03: resource 2 [mem 0xf2100000-0xf21fffff 64bit=
 pref]
[    0.303450] pci_bus 0000:06: resource 0 [io  0xe000-0xefff]
[    0.303451] pci_bus 0000:06: resource 1 [mem 0xf7600000-0xf76fffff]
[    0.303452] pci_bus 0000:06: resource 2 [mem 0xf2100000-0xf21fffff 64bit=
 pref]
[    0.303454] pci_bus 0000:08: resource 0 [io  0xd000-0xdfff]
[    0.303455] pci_bus 0000:08: resource 1 [mem 0xf6400000-0xf74fffff]
[    0.303456] pci_bus 0000:0b: resource 0 [io  0xf000-0xffff]
[    0.303457] pci_bus 0000:0b: resource 1 [mem 0xf5000000-0xf60fffff]
[    0.303458] pci_bus 0000:0b: resource 2 [mem 0xe0000000-0xf1ffffff 64bit=
 pref]
[    0.303460] pci_bus 0000:0c: resource 1 [mem 0xf7800000-0xf7afffff]
[    0.303461] pci_bus 0000:0d: resource 1 [mem 0xf7b00000-0xf7bfffff]
[    0.303778] pci 0000:0b:00.1: extending delay after power-on from D3hot =
to 20 msec
[    0.303809] pci 0000:0b:00.1: D0 power state depends on 0000:0b:00.0
[    0.303975] PCI: CLS 64 bytes, default 64
[    0.304001] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters support=
ed
[    0.304044] Trying to unpack rootfs image as initramfs...
[    0.304052] pci 0000:00:01.0: Adding to iommu group 0
[    0.304064] pci 0000:00:01.1: Adding to iommu group 1
[    0.304074] pci 0000:00:01.3: Adding to iommu group 2
[    0.304088] pci 0000:00:02.0: Adding to iommu group 3
[    0.304103] pci 0000:00:03.0: Adding to iommu group 4
[    0.304113] pci 0000:00:03.1: Adding to iommu group 5
[    0.304126] pci 0000:00:04.0: Adding to iommu group 6
[    0.304140] pci 0000:00:07.0: Adding to iommu group 7
[    0.304150] pci 0000:00:07.1: Adding to iommu group 8
[    0.304163] pci 0000:00:08.0: Adding to iommu group 9
[    0.304174] pci 0000:00:08.1: Adding to iommu group 10
[    0.304193] pci 0000:00:14.0: Adding to iommu group 11
[    0.304202] pci 0000:00:14.3: Adding to iommu group 11
[    0.304248] pci 0000:00:18.0: Adding to iommu group 12
[    0.304257] pci 0000:00:18.1: Adding to iommu group 12
[    0.304266] pci 0000:00:18.2: Adding to iommu group 12
[    0.304277] pci 0000:00:18.3: Adding to iommu group 12
[    0.304287] pci 0000:00:18.4: Adding to iommu group 12
[    0.304296] pci 0000:00:18.5: Adding to iommu group 12
[    0.304305] pci 0000:00:18.6: Adding to iommu group 12
[    0.304314] pci 0000:00:18.7: Adding to iommu group 12
[    0.304324] pci 0000:01:00.0: Adding to iommu group 13
[    0.304348] pci 0000:02:00.0: Adding to iommu group 14
[    0.304359] pci 0000:02:00.1: Adding to iommu group 14
[    0.304370] pci 0000:02:00.2: Adding to iommu group 14
[    0.304375] pci 0000:03:00.0: Adding to iommu group 14
[    0.304378] pci 0000:03:01.0: Adding to iommu group 14
[    0.304384] pci 0000:03:04.0: Adding to iommu group 14
[    0.304388] pci 0000:03:05.0: Adding to iommu group 14
[    0.304392] pci 0000:03:06.0: Adding to iommu group 14
[    0.304396] pci 0000:03:07.0: Adding to iommu group 14
[    0.304401] pci 0000:06:00.0: Adding to iommu group 14
[    0.304407] pci 0000:08:00.0: Adding to iommu group 14
[    0.304411] pci 0000:08:00.1: Adding to iommu group 14
[    0.304429] pci 0000:0b:00.0: Adding to iommu group 15
[    0.304441] pci 0000:0b:00.1: Adding to iommu group 15
[    0.304452] pci 0000:0c:00.0: Adding to iommu group 16
[    0.304464] pci 0000:0c:00.2: Adding to iommu group 17
[    0.304475] pci 0000:0c:00.3: Adding to iommu group 18
[    0.304487] pci 0000:0d:00.0: Adding to iommu group 19
[    0.304498] pci 0000:0d:00.2: Adding to iommu group 20
[    0.304508] pci 0000:0d:00.3: Adding to iommu group 21
[    0.306955] AMD-Vi: Extended features (0xf77ef22294ada, 0x0): PPR NX GT =
IA GA PC GA_vAPIC
[    0.306966] AMD-Vi: Interrupt remapping enabled
[    0.307104] AMD-Vi: Virtual APIC enabled
[    0.307109] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.307110] software IO TLB: mapped [mem 0x00000000d3bcb000-0x00000000d7=
bcb000] (64MB)
[    0.307154] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/b=
ank).
[    0.312618] Initialise system trusted keyrings
[    0.312629] Key type blacklist registered
[    0.312664] workingset: timestamp_bits=3D41 max_order=3D21 bucket_order=
=3D0
[    0.312670] zbud: loaded
[    0.312755] fuse: init (API version 7.40)
[    0.312826] integrity: Platform Keyring initialized
[    0.312828] integrity: Machine keyring initialized
[    0.323431] Key type asymmetric registered
[    0.323433] Asymmetric key parser 'x509' registered
[    0.323466] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 246)
[    0.323534] io scheduler mq-deadline registered
[    0.323541] io scheduler kyber registered
[    0.323551] io scheduler bfq registered
[    0.325161] pcieport 0000:00:01.1: PME: Signaling with IRQ 26
[    0.325236] pcieport 0000:00:01.1: AER: enabled with IRQ 26
[    0.325744] pcieport 0000:00:01.3: PME: Signaling with IRQ 27
[    0.325795] pcieport 0000:00:01.3: AER: enabled with IRQ 27
[    0.325980] pcieport 0000:00:03.1: PME: Signaling with IRQ 28
[    0.326047] pcieport 0000:00:03.1: AER: enabled with IRQ 28
[    0.326230] pcieport 0000:00:07.1: PME: Signaling with IRQ 29
[    0.326287] pcieport 0000:00:07.1: AER: enabled with IRQ 29
[    0.326823] pcieport 0000:00:08.1: PME: Signaling with IRQ 31
[    0.326928] pcieport 0000:00:08.1: AER: enabled with IRQ 31
[    0.327830] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.327938] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input0
[    0.327959] ACPI: button: Power Button [PWRB]
[    0.327981] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input1
[    0.329756] ACPI: button: Power Button [PWRF]
[    0.330288] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.330509] 00:03: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) =
is a 16550A
[    0.332423] Non-volatile memory driver v1.3
[    0.332427] Linux agpgart interface v0.103
[    0.332470] ACPI: bus type drm_connector registered
[    0.332961] ahci 0000:02:00.1: version 3.0
[    0.333094] ahci 0000:02:00.1: SSS flag set, parallel bus scan disabled
[    0.333130] ahci 0000:02:00.1: AHCI vers 0001.0301, 32 command slots, 6 =
Gbps, SATA mode
[    0.333133] ahci 0000:02:00.1: 4/8 ports implemented (port mask 0x33)
[    0.333134] ahci 0000:02:00.1: flags: 64bit ncq sntf stag pm led clo onl=
y pmp pio slum part sxs deso sadm sds apst=20
[    0.333531] scsi host0: ahci
[    0.333623] scsi host1: ahci
[    0.333699] scsi host2: ahci
[    0.333779] scsi host3: ahci
[    0.333852] scsi host4: ahci
[    0.333921] scsi host5: ahci
[    0.333993] scsi host6: ahci
[    0.334061] scsi host7: ahci
[    0.334085] ata1: SATA max UDMA/133 abar m131072@0xf7780000 port 0xf7780=
100 irq 41 lpm-pol 3
[    0.334087] ata2: SATA max UDMA/133 abar m131072@0xf7780000 port 0xf7780=
180 irq 41 lpm-pol 3
[    0.334088] ata3: DUMMY
[    0.334089] ata4: DUMMY
[    0.334090] ata5: SATA max UDMA/133 abar m131072@0xf7780000 port 0xf7780=
300 irq 41 lpm-pol 3
[    0.334092] ata6: SATA max UDMA/133 abar m131072@0xf7780000 port 0xf7780=
380 irq 41 lpm-pol 3
[    0.334093] ata7: DUMMY
[    0.334094] ata8: DUMMY
[    0.334407] ahci 0000:0d:00.2: AHCI vers 0001.0301, 32 command slots, 6 =
Gbps, SATA mode
[    0.334410] ahci 0000:0d:00.2: 2/2 ports implemented (port mask 0x3)
[    0.334411] ahci 0000:0d:00.2: flags: 64bit ncq sntf ilck pm led clo onl=
y pmp fbs pio slum part sxs=20
[    0.334597] scsi host8: ahci
[    0.334675] scsi host9: ahci
[    0.334701] ata9: SATA max UDMA/133 abar m4096@0xf7b08000 port 0xf7b0810=
0 irq 43 lpm-pol 0
[    0.334703] ata10: SATA max UDMA/133 abar m4096@0xf7b08000 port 0xf7b081=
80 irq 44 lpm-pol 0
[    0.334780] usbcore: registered new interface driver usbserial_generic
[    0.334784] usbserial: USB Serial support registered for generic
[    0.334860] rtc_cmos 00:01: RTC can wake from S4
[    0.335258] rtc_cmos 00:01: registered as rtc0
[    0.335320] rtc_cmos 00:01: setting system clock to 2024-07-23T21:44:34 =
UTC (1721771074)
[    0.335356] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram=
, hpet irqs
[    0.335401] amd_pstate: the _CPC object is not present in SBIOS or ACPI =
disabled
[    0.335433] ledtrig-cpu: registered to indicate activity on CPUs
[    0.335551] Relocating firmware framebuffer to offset 0x0000000001000000=
[d] within [mem 0xf0000000-0xf1ffffff flags 0x14220c]
[    0.335672] [drm] Initialized simpledrm 1.0.0 20200625 for simple-frameb=
uffer.0 on minor 0
[    0.336110] fbcon: Deferring console take-over
[    0.336114] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledr=
mdrmfb frame buffer device
[    0.336160] hid: raw HID events driver (C) Jiri Kosina
[    0.336223] drop_monitor: Initializing network drop monitor service
[    0.336320] NET: Registered PF_INET6 protocol family
[    0.341311] Freeing initrd memory: 8972K
[    0.345550] Segment Routing with IPv6
[    0.345552] RPL Segment Routing with IPv6
[    0.345562] In-situ OAM (IOAM) with IPv6
[    0.345587] NET: Registered PF_PACKET protocol family
[    0.345911] microcode: Current revision: 0x08001137
[    0.345983] IPI shorthand broadcast: enabled
[    0.347394] sched_clock: Marking stable (346085021, 312267)->(350571922,=
 -4174634)
[    0.347476] Timer migration: 2 hierarchy levels; 8 children per group; 2=
 crossnode level
[    0.347517] registered taskstats version 1
[    0.347751] Loading compiled-in X.509 certificates
[    0.350454] Loaded X.509 cert 'Build time autogenerated kernel key: 4c6f=
028942e243ae246dfff8cf5907591c08e6cc'
[    0.353592] zswap: loaded using pool zstd/zsmalloc
[    0.353649] Demotion targets for Node 0: null
[    0.353902] Key type .fscrypt registered
[    0.353903] Key type fscrypt-provisioning registered
[    0.354774] PM:   Magic number: 0:648:753
[    0.354791] ata_link link4: hash matches
[    0.354792]  link4: hash matches
[    0.354804] tty ttyS4: hash matches
[    0.357442] RAS: Correctable Errors collector initialized.
[    0.368070] clk: Disabling unused clocks
[    0.368074] PM: genpd: Disabling unused power domains
[    0.647553] ata1: SATA link down (SStatus 0 SControl 300)
[    0.648702] ata9: SATA link down (SStatus 0 SControl 300)
[    0.650213] ata10: SATA link down (SStatus 0 SControl 300)
[    0.965364] ata2: SATA link down (SStatus 0 SControl 300)
[    1.279776] ata5: SATA link down (SStatus 0 SControl 300)
[    1.333656] tsc: Refined TSC clocksource calibration: 3493.436 MHz
[    1.333661] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x325=
b186289d, max_idle_ns: 440795326624 ns
[    1.333676] clocksource: Switched to clocksource tsc
[    1.593102] ata6: SATA link down (SStatus 0 SControl 300)
[    1.594443] Freeing unused decrypted memory: 2028K
[    1.594869] Freeing unused kernel image (initmem) memory: 3428K
[    1.594888] Write protecting the kernel read-only data: 32768k
[    1.595157] Freeing unused kernel image (rodata/data gap) memory: 936K
[    1.639050] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.639055] rodata_test: all tests were successful
[    1.639060] Run /init as init process
[    1.639062]   with arguments:
[    1.639063]     /init
[    1.639064]   with environment:
[    1.639064]     HOME=3D/
[    1.639065]     TERM=3Dlinux
[    1.639066]     BOOT_IMAGE=3D/boot/vmlinuz-linux-mainline
[    1.672690] fbcon: Taking over console
[    1.677643] Console: switching to colour frame buffer device 128x48
[    1.776472] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    1.776481] xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus =
number 1
[    1.798294] nvme nvme0: pci function 0000:01:00.0
[    1.816839] nvme nvme0: 7/0/0 default/read/poll queues
[    1.831846] xhci_hcd 0000:02:00.0: hcc params 0x0200ef81 hci version 0x1=
10 quirks 0x0000010048000010
[    1.832093] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    1.832098] xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus =
number 2
[    1.832106] xhci_hcd 0000:02:00.0: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.832154] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.10
[    1.832157] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.832158] usb usb1: Product: xHCI Host Controller
[    1.832160] usb usb1: Manufacturer: Linux 6.10.0-rc7-1.1-mainline-dirty =
xhci-hcd
[    1.832161] usb usb1: SerialNumber: 0000:02:00.0
[    1.832322] hub 1-0:1.0: USB hub found
[    1.832336] hub 1-0:1.0: 10 ports detected
[    1.832633] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.832650] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.10
[    1.832652] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.832653] usb usb2: Product: xHCI Host Controller
[    1.832654] usb usb2: Manufacturer: Linux 6.10.0-rc7-1.1-mainline-dirty =
xhci-hcd
[    1.832655] usb usb2: SerialNumber: 0000:02:00.0
[    1.832725] hub 2-0:1.0: USB hub found
[    1.832733] hub 2-0:1.0: 4 ports detected
[    1.832812] usb: port power management may be unreliable
[    1.832965] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    1.832969] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus =
number 3
[    1.833067] xhci_hcd 0000:0c:00.3: hcc params 0x0270f665 hci version 0x1=
00 quirks 0x0000000040000010
[    1.833218] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    1.833220] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus =
number 4
[    1.833222] xhci_hcd 0000:0c:00.3: Host supports USB 3.0 SuperSpeed
[    1.833247] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.10
[    1.833249] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.833250] usb usb3: Product: xHCI Host Controller
[    1.833251] usb usb3: Manufacturer: Linux 6.10.0-rc7-1.1-mainline-dirty =
xhci-hcd
[    1.833252] usb usb3: SerialNumber: 0000:0c:00.3
[    1.833329] hub 3-0:1.0: USB hub found
[    1.833335] hub 3-0:1.0: 4 ports detected
[    1.833500] usb usb4: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.833517] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.10
[    1.833519] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.833520] usb usb4: Product: xHCI Host Controller
[    1.833521] usb usb4: Manufacturer: Linux 6.10.0-rc7-1.1-mainline-dirty =
xhci-hcd
[    1.833522] usb usb4: SerialNumber: 0000:0c:00.3
[    1.833593] hub 4-0:1.0: USB hub found
[    1.833599] hub 4-0:1.0: 4 ports detected
[    1.842964]  nvme0n1: p1 p2 p3 p4 p5
[    1.949912] EXT4-fs (nvme0n1p2): mounted filesystem e317bc8b-4ecb-4d50-8=
a10-16c83daf75b3 r/w with ordered data mode. Quota mode: none.
[    2.020075] systemd[1]: systemd 256.2-1-arch running in system mode (+PA=
M +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +=
ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LI=
BCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZ=
IP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP -SYSVINIT +LIBARCH=
IVE)
[    2.020082] systemd[1]: Detected architecture x86-64.
[    2.021133] systemd[1]: Hostname set to <aquilonia>.
[    2.083658] usb 1-5: new high-speed USB device number 2 using xhci_hcd
[    2.182414] systemd[1]: bpf-restrict-fs: LSM BPF program attached
[    2.244570] systemd[1]: /usr/lib/systemd/system/shorewall6.service:17: S=
tandard output type syslog is obsolete, automatically updating to journal. =
Please update your unit file, and consider removing the setting altogether.
[    2.245012] usb 1-5: New USB device found, idVendor=3D1a40, idProduct=3D=
0101, bcdDevice=3D 1.11
[    2.245018] usb 1-5: New USB device strings: Mfr=3D0, Product=3D1, Seria=
lNumber=3D0
[    2.245020] usb 1-5: Product: USB 2.0 Hub
[    2.245947] systemd[1]: /usr/lib/systemd/system/shorewall.service:16: St=
andard output type syslog is obsolete, automatically updating to journal. P=
lease update your unit file, and consider removing the setting altogether.
[    2.250024] hub 1-5:1.0: USB hub found
[    2.252998] hub 1-5:1.0: 4 ports detected
[    2.306803] systemd[1]: Queued start job for default target Graphical In=
terface.
[    2.331328] systemd[1]: Created slice Slice /system/dirmngr.
[    2.331740] systemd[1]: Created slice Slice /system/getty.
[    2.332047] systemd[1]: Created slice Slice /system/gpg-agent.
[    2.332361] systemd[1]: Created slice Slice /system/gpg-agent-browser.
[    2.332668] systemd[1]: Created slice Slice /system/gpg-agent-extra.
[    2.332981] systemd[1]: Created slice Slice /system/gpg-agent-ssh.
[    2.333306] systemd[1]: Created slice Slice /system/keyboxd.
[    2.333619] systemd[1]: Created slice Slice /system/modprobe.
[    2.334397] systemd[1]: Created slice Slice /system/netctl.
[    2.334809] systemd[1]: Created slice Slice /system/systemd-fsck.
[    2.335122] systemd[1]: Created slice User and Session Slice.
[    2.335307] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[    2.335491] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[    2.335777] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[    2.335955] systemd[1]: Expecting device /dev/disk/by-uuid/0b65f5a0-93cf=
-4a0a-8a8f-f4bf9226f42c...
[    2.336099] systemd[1]: Expecting device /dev/disk/by-uuid/239d593f-624d=
-4dea-9861-d6b13c23eb78...
[    2.336241] systemd[1]: Expecting device /dev/disk/by-uuid/9607-240E...
[    2.336358] systemd[1]: Expecting device /dev/disk/by-uuid/be771001-b8ee=
-4984-9a81-5e565c762a52...
[    2.336498] systemd[1]: Expecting device /sys/subsystem/net/devices/enp6=
s0...
[    2.336619] systemd[1]: Expecting device /sys/subsystem/net/devices/enp8=
s0f0...
[    2.336748] systemd[1]: Reached target Local Encrypted Volumes.
[    2.336881] systemd[1]: Reached target Login Prompts.
[    2.337012] systemd[1]: Reached target Local Integrity Protected Volumes.
[    2.337159] systemd[1]: Reached target Host and Network Name Lookups.
[    2.337298] systemd[1]: Reached target Remote File Systems.
[    2.337427] systemd[1]: Reached target Slice Units.
[    2.337560] systemd[1]: Reached target Local Verity Protected Volumes.
[    2.337678] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    2.337788] systemd[1]: Listening on LVM2 poll daemon socket.
[    2.340643] systemd[1]: Listening on RPCbind Server Activation Socket.
[    2.340728] systemd[1]: Reached target RPC Port Mapper.
[    2.341978] systemd[1]: Listening on Process Core Dump Socket.
[    2.342720] systemd[1]: Listening on Credential Encryption/Decryption.
[    2.342836] systemd[1]: Listening on Journal Socket (/dev/log).
[    2.342946] systemd[1]: Listening on Journal Sockets.
[    2.343012] systemd[1]: TPM PCR Measurements was skipped because of an u=
nmet condition check (ConditionSecurity=3Dmeasured-uki).
[    2.343028] systemd[1]: Make TPM PCR Policy was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    2.343099] systemd[1]: Listening on udev Control Socket.
[    2.343180] systemd[1]: Listening on udev Kernel Socket.
[    2.343972] systemd[1]: Mounting Huge Pages File System...
[    2.344517] systemd[1]: Mounting POSIX Message Queue File System...
[    2.345109] systemd[1]: Mounting Kernel Debug File System...
[    2.346759] systemd[1]: Mounting Kernel Trace File System...
[    2.348559] systemd[1]: Starting Create List of Static Device Nodes...
[    2.350159] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling...
[    2.351067] systemd[1]: Starting Load Kernel Module configfs...
[    2.353452] systemd[1]: Starting Load Kernel Module dm_mod...
[    2.355554] systemd[1]: Starting Load Kernel Module drm...
[    2.357863] systemd[1]: Starting Load Kernel Module fuse...
[    2.361691] systemd[1]: Starting Load Kernel Module loop...
[    2.362491] systemd[1]: File System Check on Root Device was skipped bec=
ause of an unmet condition check (ConditionPathIsReadWrite=3D!/).
[    2.362542] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    2.364250] systemd[1]: Starting Journal Service...
[    2.367327] systemd[1]: Starting Load Kernel Modules...
[    2.367686] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    2.371694] device-mapper: uevent: version 1.0.3
[    2.371815] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised:=
 dm-devel@lists.linux.dev
[    2.371888] systemd[1]: Starting Remount Root and Kernel File Systems...
[    2.373321] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    2.374075] loop: module loaded
[    2.374526] systemd[1]: Starting Load udev Rules from Credentials...
[    2.380655] systemd[1]: Starting Coldplug All udev Devices...
[    2.384603] systemd[1]: Mounted Huge Pages File System.
[    2.385092] systemd[1]: Mounted POSIX Message Queue File System.
[    2.385461] systemd[1]: Mounted Kernel Debug File System.
[    2.385792] systemd[1]: Mounted Kernel Trace File System.
[    2.386290] systemd[1]: Finished Create List of Static Device Nodes.
[    2.386851] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    2.387015] systemd[1]: Finished Load Kernel Module configfs.
[    2.387537] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    2.387670] systemd[1]: Finished Load Kernel Module dm_mod.
[    2.388305] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    2.388482] systemd[1]: Finished Load Kernel Module drm.
[    2.389093] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    2.389220] systemd[1]: Finished Load Kernel Module fuse.
[    2.389610] systemd-journald[295]: Collecting audit messages is disabled.
[    2.389690] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    2.389825] systemd[1]: Finished Load Kernel Module loop.
[    2.390300] systemd[1]: Finished Load Kernel Modules.
[    2.394931] systemd[1]: Mounting FUSE Control File System...
[    2.395891] systemd[1]: Mounting Kernel Configuration File System...
[    2.396214] systemd[1]: Repartition Root Disk was skipped because no tri=
gger condition checks were met.
[    2.397454] systemd[1]: Starting Apply Kernel Variables...
[    2.398520] systemd[1]: Starting Create Static Device Nodes in /dev grac=
efully...
[    2.400618] EXT4-fs (nvme0n1p2): re-mounted e317bc8b-4ecb-4d50-8a10-16c8=
3daf75b3 r/w. Quota mode: none.
[    2.405247] systemd[1]: Finished Load udev Rules from Credentials.
[    2.406516] systemd[1]: Mounted FUSE Control File System.
[    2.408489] systemd[1]: Finished Remount Root and Kernel File Systems.
[    2.409273] systemd[1]: Rebuild Hardware Database was skipped because no=
 trigger condition checks were met.
[    2.414732] systemd[1]: Mounted Kernel Configuration File System.
[    2.415853] systemd[1]: Finished Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling.
[    2.417315] systemd[1]: Finished Apply Kernel Variables.
[    2.426928] systemd[1]: Finished Create Static Device Nodes in /dev grac=
efully.
[    2.430464] systemd[1]: Starting Create System Users...
[    2.433820] systemd[1]: Started Journal Service.
[    2.625086] dca service started, version 1.12.1
[    2.647795] Adding 4194300k swap on /dev/nvme0n1p3.  Priority:-2 extents=
:1 across:4194300k SS
[    2.650836] ccp 0000:0c:00.2: enabling device (0000 -> 0002)
[    2.651804] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, re=
vision 0
[    2.651809] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port=
 selection
[    2.651878] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at=
 0xb20
[    2.659277] pps_core: LinuxPPS API ver. 1 registered
[    2.659280] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    2.659294] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840=
 ms ovfl timer
[    2.659297] RAPL PMU: hw unit of domain package 2^-16 Joules
[    2.667016] cryptd: max_cpu_qlen set to 1000
[    2.669269] PTP clock support registered
[    2.670498] input: PC Speaker as /devices/platform/pcspkr/input/input2
[    2.670591] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    2.670788] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO ad=
dress
[    2.670920] sp5100-tco sp5100-tco: initialized. heartbeat=3D60 sec (nowa=
yout=3D0)
[    2.671158] ccp 0000:0c:00.2: ccp enabled
[    2.671163] ccp 0000:0c:00.2: psp: unable to access the device: you migh=
t be running a broken BIOS.
[    2.673684] usb 1-5.3: new full-speed USB device number 3 using xhci_hcd
[    2.686960] igb: Intel(R) Gigabit Ethernet Network Driver
[    2.686966] igb: Copyright (c) 2007-2014 Intel Corporation.
[    2.695035] AVX2 version of gcm_enc/dec engaged.
[    2.695107] AES CTR mode by8 optimization enabled
[    2.708067] r8169 0000:06:00.0 eth0: RTL8168g/8111g, e0:d5:5e:68:14:c5, =
XID 4c0, IRQ 91
[    2.708074] r8169 0000:06:00.0 eth0: jumbo features [frames: 9194 bytes,=
 tx checksumming: ko]
[    2.764882] snd_hda_intel 0000:0b:00.1: Disabling MSI
[    2.764895] snd_hda_intel 0000:0b:00.1: Handle vga_switcheroo audio clie=
nt
[    2.764935] snd_hda_intel 0000:0d:00.3: enabling device (0000 -> 0002)
[    2.787467] input: HDA NVidia HDMI/DP,pcm=3D3 as /devices/pci0000:00/000=
0:00:03.1/0000:0b:00.1/sound/card0/input3
[    2.787506] input: HDA NVidia HDMI/DP,pcm=3D7 as /devices/pci0000:00/000=
0:00:03.1/0000:0b:00.1/sound/card0/input4
[    2.787540] input: HDA NVidia HDMI/DP,pcm=3D8 as /devices/pci0000:00/000=
0:00:03.1/0000:0b:00.1/sound/card0/input5
[    2.787571] input: HDA NVidia HDMI/DP,pcm=3D9 as /devices/pci0000:00/000=
0:00:03.1/0000:0b:00.1/sound/card0/input6
[    2.796971] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC887-VD:=
 line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:line
[    2.796977] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    2.796992] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=3D1 (0x1b/0x0/=
0x0/0x0/0x0)
[    2.796993] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=3D0x0
[    2.796995] snd_hda_codec_realtek hdaudioC1D0:    dig-out=3D0x11/0x0
[    2.796996] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[    2.796997] snd_hda_codec_realtek hdaudioC1D0:      Front Mic=3D0x19
[    2.796999] snd_hda_codec_realtek hdaudioC1D0:      Rear Mic=3D0x18
[    2.797000] snd_hda_codec_realtek hdaudioC1D0:      Line=3D0x1a
[    2.799374] r8169 0000:06:00.0 enp6s0: renamed from eth0
[    2.811692] input: HD-Audio Generic Front Mic as /devices/pci0000:00/000=
0:00:08.1/0000:0d:00.3/sound/card1/input7
[    2.811728] input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000=
:00:08.1/0000:0d:00.3/sound/card1/input8
[    2.811761] input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:=
08.1/0000:0d:00.3/sound/card1/input9
[    2.812125] input: HD-Audio Generic Line Out as /devices/pci0000:00/0000=
:00:08.1/0000:0d:00.3/sound/card1/input10
[    2.812155] input: HD-Audio Generic Front Headphone as /devices/pci0000:=
00/0000:00:08.1/0000:0d:00.3/sound/card1/input11
[    2.849359] AMD Address Translation Library initialized
[    2.849890] intel_rapl_common: Found RAPL domain package
[    2.849894] intel_rapl_common: Found RAPL domain core
[    2.879738] igb 0000:08:00.0: added PHC on eth0
[    2.879776] igb 0000:08:00.0: Intel(R) Gigabit Ethernet Network Connecti=
on
[    2.879778] igb 0000:08:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 80:61:5f:0a:=
2c:fc
[    2.879861] igb 0000:08:00.0: eth0: PBA No: E43709-006
[    2.879862] igb 0000:08:00.0: Using MSI-X interrupts. 4 rx queue(s), 4 t=
x queue(s)
[    3.066289] igb 0000:08:00.1: added PHC on eth1
[    3.066325] igb 0000:08:00.1: Intel(R) Gigabit Ethernet Network Connecti=
on
[    3.066326] igb 0000:08:00.1: eth1: (PCIe:2.5Gb/s:Width x1) 80:61:5f:0a:=
2c:fd
[    3.066411] igb 0000:08:00.1: eth1: PBA No: E43709-006
[    3.066412] igb 0000:08:00.1: Using MSI-X interrupts. 4 rx queue(s), 4 t=
x queue(s)
[    3.069455] igb 0000:08:00.1 enp8s0f1: renamed from eth1
[    3.069579] igb 0000:08:00.0 enp8s0f0: renamed from eth0
[    3.125011] usb 1-5.3: New USB device found, idVendor=3D046d, idProduct=
=3Dc318, bcdDevice=3D55.03
[    3.125017] usb 1-5.3: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    3.125019] usb 1-5.3: Product: Logitech Illuminated Keyboard
[    3.125020] usb 1-5.3: Manufacturer: Logitech
[    3.346984] usb 1-5.4: new low-speed USB device number 4 using xhci_hcd
[    3.416334] EXT4-fs (nvme0n1p5): mounted filesystem be771001-b8ee-4984-9=
a81-5e565c762a52 r/w with ordered data mode. Quota mode: none.
[    3.418912] EXT4-fs (nvme0n1p4): mounted filesystem 0b65f5a0-93cf-4a0a-8=
a8f-f4bf9226f42c r/w with ordered data mode. Quota mode: none.
[    3.435690] systemd-journald[295]: Received client request to flush runt=
ime journal.
[    3.700340] Generic FE-GE Realtek PHY r8169-0-600:00: attached PHY drive=
r (mii_bus:phy_addr=3Dr8169-0-600:00, irq=3DMAC)
[    3.704029] usb 1-5.4: New USB device found, idVendor=3D03f0, idProduct=
=3D0941, bcdDevice=3D 1.00
[    3.704032] usb 1-5.4: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    3.704033] usb 1-5.4: Product: HP X500 USB Optical Mouse
[    3.704035] usb 1-5.4: Manufacturer: PixArt
[    3.809095] usbcore: registered new interface driver usbhid
[    3.809100] usbhid: USB HID core driver
[    3.816583] input: Logitech Logitech Illuminated Keyboard as /devices/pc=
i0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5.3/1-5.3:1.0/0003:046D:C318.=
0001/input/input12
[    3.873764] hid-generic 0003:046D:C318.0001: input,hidraw0: USB HID v1.1=
1 Keyboard [Logitech Logitech Illuminated Keyboard] on usb-0000:02:00.0-5.3=
/input0
[    3.873910] input: Logitech Logitech Illuminated Keyboard Consumer Contr=
ol as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5.3/1-5.3:1.=
1/0003:046D:C318.0002/input/input13
[    3.897136] r8169 0000:06:00.0 enp6s0: Link is Down
[    3.930463] hid-generic 0003:046D:C318.0002: input,hiddev96,hidraw1: USB=
 HID v1.11 Device [Logitech Logitech Illuminated Keyboard] on usb-0000:02:0=
0.0-5.3/input1
[    3.930573] input: PixArt HP X500 USB Optical Mouse as /devices/pci0000:=
00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5.4/1-5.4:1.0/0003:03F0:0941.0003/i=
nput/input15
[    3.930724] hid-generic 0003:03F0:0941.0003: input,hidraw2: USB HID v1.1=
1 Mouse [PixArt HP X500 USB Optical Mouse] on usb-0000:02:00.0-5.4/input0
[    3.944839] mousedev: PS/2 mouse device common for all mice
[    6.540919] igb 0000:08:00.0 enp8s0f0: igb: enp8s0f0 NIC Link is Up 1000=
 Mbps Full Duplex, Flow Control: RX/TX
[    6.567279] r8169 0000:06:00.0 enp6s0: Link is Up - 1Gbps/Full - flow co=
ntrol rx/tx

--rlnldifet6b3aghg--

--kfzou7hn3gty7cvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmagKecACgkQwEfU8yi1
JYX3FA/+P4mVpyzfriPkXwtrJ+SQqLrd+XoLNyIK1b5uwxRCn4uSsfS25ZKRCOqA
Ch8ZOxuZhXGpB9KBuYr/fzcQv5Tv7J6ofQoilx3QV46RGGk8od8T/RWl42JDif6Q
/a8Kd0QyQRaDpaih+2OCr29QQEc41PmSoMo0sbF1PRsmyIwiKPOLtkptHdnvIN84
H/Hvb9ujAll8ddNIgOAiahOZQCDh6GFV1cNLLNvXgHP6O8Y6bLzjKvZgsvv/2Pwi
lIHn5WG8eY4qCjnmJrOYxNnaYu0UrN44u9BsRdkq28sO9bYQ3NLzmdvzZ1rU8p0Z
z0P46+1c998skD2bWFRew3/zlTICXkRkRKuXh2YdQ8Kbcr3Z9ODxHkAeY1rz17QG
7DVXOr8TywjpC3CulYrWWqy8LiH0uDEPU8pONvcVcHoB1J6IEICZrsLokJoDF/Cp
TSi7GZqi3WiO53403f0vcrKMwI1bvdrjoLK0SNa+kgLEzSxIXcPFdgCDuhIUDVY2
2YOOdBM6CeRUNOzUWj6SAY1OQtQKFRSJrThNhaFtg2DRhE3aTpZ9fG3mZczOxD1m
6sWoCAO5c8y510uqhD2on8NbfCTv/rHdtOCfXAF1/lxiDWv0yFXzdoLoY2ucqRzi
OzBn10G3iGEaLTSKxf7LG7qJDELKxs6aVWD1Dvgl6NUsdVCT54g=
=XLLS
-----END PGP SIGNATURE-----

--kfzou7hn3gty7cvg--
