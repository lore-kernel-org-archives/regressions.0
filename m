Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E6D3BE64C
	for <regressions@lists.linux.dev>; Tue, 14 Apr 2026 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158595; cv=none; b=Asy3cEFWbAW8OJliSS6/9A8kza+NRRp+kctH4qobjr9p6yhWwlSPJR2SIS/+gjs+Pfufc1e5hfqEvXUpshAqr4OhF8pvEcSYhXR0YxbrovEddZXdGL1Is2ZI1PiAewaEk3Ug3nzGYZzAZT/907s07JX/RUwrk6MXeW43cvJYHo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158595; c=relaxed/simple;
	bh=CtU2gXiANRDLMS09ZAXJ7WipHbrS0tbOyTqFy+Dyokc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kwQEFPP5JEi3KSviaiNeOorO2Pm9qWVkOThbfbcbIzYXh84QV05wgYQ7+Ylr5COhHMZYoOxEoZMmZNgE0zA88JwXyHFtJE2QVoAkfgg+plNsZzB7KpCg6C+FuoloY0k/dyZ6UKvgGDXPns5e8H6872vyUFKlelzyVxSZnh/VASI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=tTgQbuXx; arc=none smtp.client-ip=109.224.244.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="tTgQbuXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1776158583; x=1776417783;
	bh=stEBsGH6o1WT/D3trkAv9Ny/2kK8BVeL5s+Q9rX12M8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=tTgQbuXx8TeKwc4pOF+Uzh2kb6+V3ZGBHp6FBJm2axCAcSxt4J4PfpmOZZ+nOcMhj
	 PRBHsOqCasv5gmYEhRdA/czqd36h+HrJp6rwyjT5sR/VWzWYYMXevWMHwpo+NE0KYb
	 Z2b3SScwG/1PNxPdoHVC4uxMeySAeQQI6Dt8TsNoVaCgy+z2GeOdvDg8jmxszjf1zG
	 pdKQrbCPKv0O4q97lSM/YKbzm2sUeQu7+zhf0OCl1eWWRvDDpNVlsx3gvMLj1GwQOF
	 YPLQk+q3CMoYWB22GEaky/ntZwvzhicyghGwQrlrXtwLjZ0v5RDW5jsWvQ87xCxbn2
	 ACEc9W0Nw8t6w==
Date: Tue, 14 Apr 2026 09:22:58 +0000
To: Baolu Lu <baolu.lu@linux.intel.com>
From: 70sp <70sp@protonmail.com>
Cc: "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] GPU passes into VM improperly after c376a3456d8b or a98db518dde2
Message-ID: <C4BK-Bp_FII0EkxSHQxBS2wO-Age-UxFrp_KfmYzb8cnQ8ZndzBBIPD8S9T86wOifBP0tysQGCFtGQsBsBvG2IzIMw3jb3NF5HGbS3tsawA=@protonmail.com>
In-Reply-To: <56ce85d5-e0b9-407c-9a86-708111a8a509@linux.intel.com>
References: <z7Rkts0EsooZcnCjNfJaK6ursftFU8ubOkH0hcNjzxugEAwGsHLMblOdfoAx-gJzBZ-TMmeUtD7iWBngbFY5UCJCwdSmYqmCVMy-yhbirUk=@protonmail.com> <56ce85d5-e0b9-407c-9a86-708111a8a509@linux.intel.com>
Feedback-ID: 144929603:user:proton
X-Pm-Message-ID: 2c43e2128b9169123231295ad057298bac432d97
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I can confirm, that the "domain is not compatible with device" message is n=
owhere to be seen.

I have double checked by also adding an else statement with a different mes=
sage and that one showed up several times. (by pci (iGPU) 0000:00:02.0, pci=
eport 0000:00:01.0 and vfio-pci (GTX 970) 0000:01:00.0, 0000:01:00.1). ret =
=3D 0.



Sent with Proton Mail secure email.

On Monday, April 13th, 2026 at 8:49 AM, Baolu Lu <baolu.lu@linux.intel.com>=
 wrote:

> On 4/12/26 19:17, 70sp wrote:
> > Hello,
> >
> > I have been dealing with a regression launching a Windows QEMU/KVM
> > virtual machine with a GPU passed through.
> >
> > The issue consists of launching a QEMU/KVM VM, which gets stuck for
> > about 2 minutes on booting with a white screen and then having NVIDIA=
=E2=80=99s
> > code 43 in Windows.
> >
> > I=E2=80=99m certain, that the issue is not caused by anything in Window=
s or
> > related software in Linux, because I tried reinstalling my whole PC
> > including the Windows VM. I tried to reproduce the bug on an out-of-the=
-
> > box Arch Linux install and the bug is still present.
> >
> > The first bad commit is either a98db518dde246e01ead53617dc0a30d6aaa3752
> > or c376a3456d8bef43ec556a98c0a04c35086c2737. I don=E2=80=99t know for s=
ure which
> > one introduced it, because during bisection I had to skip
> > a98db518dde246e01ead53617dc0a30d6aaa3752 due to it being unable to
> > launch the virtual machine resulting in a different error (didn=
=E2=80=99t even
> > start booting). In kernels before these commits, the VM works flawlessl=
y.
> >
> > I have tested it on latest mainline kernel and the issue is still
> > present. I have been experiencing the issue since kernel 6.13, so I jus=
t
> > switched to the 6.12 LTS kernel instead which doesn=E2=80=99t have this=
 issue.
> >
> > Configuration of my Linux install and hardware: https://pastebin.com/
> > rcsyyYiK
> > .config: https://pastebin.com/RTQCBduD
> > dmesg errors: https://pastebin.com/84jPP81E
> > lspci: https://pastebin.com/qi29BSWi
> >
> > #regzbot introduced:
> > a98db518dde246e01ead53617dc0a30d6aaa3752..c376a3456d8bef43ec556a98c0a04=
c35086c2737
>=20
> Before these commits, if a device was attached to a domain that didn't
> perfectly match the hardware's capabilities (such as address width or
> coherency), the kernel would dynamically adjust the domain to
> accommodate the hardware.
>=20
> Following these two commits, the driver now applies a "match or fail"
> policy. If the domain is incompatible with the device's hardware
> capabilities, it returns -EINVAL. This expects the caller to allocate a
> new domain dedicated to that specific device and attempt the attachment
> again.
>=20
> Can you please add a message line in paging_domain_compatible() to
> verify whether it's a domain compatibility issue?
>=20
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 205debd76989..c7e1e0dfa250 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -3111,8 +3111,10 @@ int paging_domain_compatible(struct iommu_domain
> *domain, struct device *dev)
>                  ret =3D
> paging_domain_compatible_second_stage(dmar_domain, iommu);
>          else if (WARN_ON(true))
>                  ret =3D -EINVAL;
> -       if (ret)
> +       if (ret) {
> +               dev_info(dev, "domain is not compatible with device, ret
> =3D %d", ret);
>                  return ret;
> +       }
>=20
>          if (sm_supported(iommu) && !dev_is_real_dma_subdevice(dev) &&
>              context_copied(iommu, info->bus, info->devfn))
>=20
> Thanks,
> baolu
> 
