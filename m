Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774402;
	b=2cSb8LB2hU7HeskyTpTvR9PC/0G88KOp0F6fDC+RSYkCZtgJBtc0QbcrJypvRU5oRkUq
	 CL2QtbtYKjHlX9hdM4d6W8jRO2h0xz5Fj/PydUchps5Zcm2fVby945bguJKkhapGpzTI2
	 PNMsXaarNmGZGuB3EaEYsbdJDm0QZ3ZJOc3OqCnUD3RXYT0c4JflkRILQaxlKEtB+R3g6
	 PtBoAF40lNFn49s2ZP0aQBmVemR7FnuVVfzTAQMczw6qW82epQQfwpTFTieS8pm0Y9YnT
	 jZOvFBxT1HBem8oJO1HAAbm//t4fKbNxeQeXwYYFoLT/UVNq/HnqeiR52LzGMI37aBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Rg3eS140aI/+OFL98v6V5INyaBk7whCAxPtAkMQ5r2M=;
	b=F7NttEa3EUXKwOHFLuMwJZ5HzbP6NclIh/ImoqNsBx8VfQ1Bj3Ts6R5F0AsXpibibFG4
	 34XNrUOw8TPmMwr5qyRbT10rK0fNRWxAOiN4BPB9dDcwD/L/F4F7LK4VVTZg1bhAhXUbT
	 KP5CIdymZeNjcUc7lWExnUcnzp3MXLrOZo9aDgxu+caxcIt6Xb5VsUarrv7CjqmwoHhLX
	 89afFDxp3dG/KRxdmO+SwV/lDzT0z/1cadDTNLjN9XCDif8s85LynYMeU0JNMIeUo70ZQ
	 Lwo1Qdox/Td6Q3NucgBDGIZS+U0ItYPDzmJajUdt9qCJrY48r4q0UuEpQtL3JUgVyPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iEsAII2T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9271606A323
	for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 10:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9271606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iEsAII2T
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385d8a00598so11792094eec.1
        for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 02:13:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774401; cv=none;
        d=google.com; s=arc-20260327;
        b=lFGw90YNRaQ82jJomc1lKkCiT7HczcZ0LzGW/52BZ2CzbeEkoq5Gwm7O2/RqhzSMkF
         hxubudpU4KwSEVwXrjxbUShM+1aqmk8CyEI7KRM1vAghJtS/39hL6dZAp7oDtsRDYkyA
         iJgp1jp10bjgm2ms8pGDnRfx0vgFUmK2NVmbd9tQe4OcVBNjY8w4YugCGyZdFSjIMtgx
         Q7R9JlOCf5TKGQmnUNQqVlLYNGj2GdjwsCSUOHQhHV6qeLiWSCpbhfJqXRtStDLIC28j
         D3vzl7tUupkU2eLkghCsxosgqByTIN94mBBzqtYMJjhHMBrN4aonZzxruWpn2txQ4GaJ
         hyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rg3eS140aI/+OFL98v6V5INyaBk7whCAxPtAkMQ5r2M=;
        fh=1cQSyXjWBEk0m/dHlc6oCKDFFOVw2bfBP6YIivZcL4w=;
        b=mFRiUXqykeH8EBd1p8No0nHKCN3p/bNu1Ki0koRbj0/TVXXjMVfBiMjnFhW90+G+o5
         KXhkppCs7k6mMwudj/rM5jiqi8oz9iDnYd251psn4+8ZGdkYWjtAACpT1SvDboPzc/ME
         nga2DG+1Ote3Y0Y6X/zOgQhXz4UcRlkF2W64SddQ/sFZLCUA2TkgAjq+I37ipeBUDrev
         YoFul/CmVQ73wXS+TVsmf2zzTBqQ6rMS7KdIT1b7n0telPx+4gKcdD56XB4mUXQ/KP7M
         pQy48CiwogzBR0YhiNq2BOzz261U2X06RBW+QBY8dG865E+s+6y+SP5ToZ0zzch+yKQJ
         XWVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774401; x=1796379201; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rg3eS140aI/+OFL98v6V5INyaBk7whCAxPtAkMQ5r2M=;
        b=iEsAII2T7bb9k1RM7xizq3sd2iXQvn4uNQNS53V3XL9farfJIzMwm0kyPUGPLW1wF0
         YLX+DCKMwbkkqgjYDQ3Uw6pGXhC1XopMuuTGhw7w1cUo6UO0hyxkqLyxbe3EyvXVhPHk
         40tTHab7BNcsAJuysY8j/U/uUfkWmlOWn+HTxkKUdjMztN6QHF2/FQFPAbMk3lXlh/8O
         4wQpa0dWRAQKnLAqAW3uMdnJLpLwUT5cPzsVb3wCpgrymCnX81K0dWCkRPtlxSrRXWr7
         gsXwKfNOSIMOuZW4wR85PEchqI0nji2KkbJWJsqhfYTT6END7niJWKtQvm6cBhivCgk/
         CGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774401; x=1796379201;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rg3eS140aI/+OFL98v6V5INyaBk7whCAxPtAkMQ5r2M=;
        b=ZhYGmJQE3qrMkZFwUV+hS8YAX6XVhK9y5zOKiZoVb7Z/5Sm+411OiyAFf5Kb44tYs8
         GR5GWViUDRjisKFnB8zH1kYuGJkw0MRerzEgbgbCr112UYvIS+7tSQ+7NfKY4/Hk+iMZ
         HntkU1UMkLnvWtqPpdHC3Jd1WKPk80VV6+VF2FU0SrlBx+GmSmZbNBKy4Yu6iRFAFtQS
         Q+6gD2L03a12jeuDsI/E5B3Dt2MACmS5bMu8jiBBO1u+nvdmGwk9g383xetv+sifGcCv
         Gzfxqd5lh//qjKlqf0k5ehqLFhtPYGQjzEHgW0JYXfcrmKsNTwyaCoCsSTWO6vLO6gzB
         w3Gg==
X-Forwarded-Encrypted: i=1; AL+hErGBL8CEbbaS/IDp8WuNjlgwQcHnx3rPaQCnjHdR5ZzeCHq4DXg2ELrOFvym07qurrRaJNInc53/od+ohw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9uKDg0miok6eWf/Z4VWT+BH+xVTmZd62ptMtbXASdmpD3cemgK
	+4UXd6eakr9biHTBIXdUzNN4SEkf7iZZmQ31hv8NwI3duSp2WSv+X0kzvXS9xdufQOL0yKrz/h6
	nn/73W09y7NPgauYjmVhNaf8fhfp9aMw=
X-Gm-Gg: AZFdTZcCPlMSltH7rVUcSEUhrsuMZeuEt10B0xoHFUCXpN6idUUh2I53K2QfP6Iddgo
	pXKcRTYSo2hz/F+zOrSlIgLrnCpLyJXPLRCGL3VBdLTbYigzR5QILFDmt2dnWVemw745hN2zGUf
	GB0vAJUQvAqyurcWDikXb5Khebnb5fID94W5zlzqQQoRSY71sZ/WUJo7LllFPIzgzxMFDJsFCGJ
	KpBL+HdcWWFi/b+y3SxvZe9zJsOuGfsx3ZI/haUgjtUKezG/9IJVP5ss07C+OJGJ0YaEyvIvMpv
	BM7lXH0mPo73dYWpBsYERe61J3HZeY7xEIAxB5t22gpnH08GC6QY0zZLgjlyK9OuOhgSrC8GOg7
	t+wYdibA3H7rlJ6oKioH10nyIrYG28/14dn4w
X-Received: by 2002:a05:7300:cf87:b0:386:565b:4f9b with SMTP id
 5a478bee46e88-386565b529dmr19005091eec.36.1795774400449; Fri, 27 Nov 2026
 02:13:20 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAGvcwsDdKSZe0reeuT0eQabaSbM6+KAfwFimxiqhvKrjD2nQeg@mail.gmail.com>
 <3304e166-c2e6-4bda-bc75-46ca73f836e1@linux.intel.com>
In-Reply-To: <3304e166-c2e6-4bda-bc75-46ca73f836e1@linux.intel.com>
From: Pe3k <pe3cek@gmail.com>
Date: Fri, 27 Nov 2026 11:13:08 +0100
X-Gm-Features: Aa3M54o_aQ8iJ-kAp3ekkaD3-m2tHNuDZRMPmqEPRSpmjapyGgTgQ3YlK0bXNb0
Message-ID: <CAGvcwsDMECLevqiy5iY2LOpPAoFknYVp+bJ+HDX8YemdzeUJCA@mail.gmail.com>
Subject: Re: iommu/vt-d: data corruption, AHCI gets IOVAs inside its RMRR (HP Gen8)
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: iommu@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

added regressions@lists.linux.dev
removed linux-ide@vger.kernel.org

Hi Baolu,

Thanks, that is the same bug, and Renato's analysis matches what I see.
In case you missed it in the other branch of this thread: I bisected it
to c588072bba6b ("iommu/vt-d: Convert intel iommu driver to the iommu
ops"). Its parent c062db039f40 is clean, and so is 5.10. Before that
commit, VT-d reserved the RMRRs in the IOVA space itself.

I tested the one-line change on the spare Gen8: v7.4-rc4 plus

- return 0;
+ return iova_reserve_iommu_regions(dev, domain);

in the already-initialised branch of iommu_dma_init_domain(). Same
setup as before: intel_iommu=3Don, translated default domain (group 10 is
DMA-FQ with 00:1f.0 and 00:1f.2), 6 parallel copies of a 10 GiB file,
and an iommu:map trace filtered to 0xf1f7e000-0xf1f94fff.

  v7.4-rc4 + patch, two boots: clean both times. 0 of 6 copies bad,
      no DMAR errors, no failed ATA commands, no WARN, and the trace
      shows no mapping inside the RMRR.
  v7.4-rc4 unpatched, same machine and load: 1 of 6 copies bad (8 MiB
      of zeros), 64 failed commands with "Emask 0x40 (internal error)"
      (40 READ, 24 WRITE FPDMA QUEUED), and the trace shows
      iova=3D0xf1f7e000 size=3D0 from iommu_dma_map_sg <=3D ata_qc_issue.

So the change fixes this machine. I know Robin's concern from the 2024
thread (Jerry Snitselaar's patch, same change), that a device may join
after the domain is already in use, when reserve_iova() is no longer
safe. This test does not cover that case. On this machine both
functions are added to the group in bus_iommu_probe(), before any of
them has DMA ops or a driver.

I can test further patches on this machine.

Thanks,
Peter

On Fri, Nov 27, 2026 at 6:38=E2=80=AFAM Baolu Lu <baolu.lu@linux.intel.com>=
 wrote:
>
> On 11/25/26 02:08, Pe3k wrote:
> > Hi,
> >
> > On the HP ProLiant MicroServer Gen8 (Xeon E3-1265L V2, C204, BIOS J06
> > 04/04/2019) the AHCI controller is handed IOVAs inside an RMRR that the
> > firmware declares for it. With the default translated DMA domain this
> > corrupts disk data on every boot under write load. iommu=3Dpt avoids it=
.
> > Seen on two machines of this model, on 6.12.118, 7.3.4 and 7.4-rc4.
> >
> > Topology
> > --------
> > 00:1f.0 ISA bridge [8086:1c54] and 00:1f.2 AHCI [8086:1c02] share IOMMU
> > group 10 (DMA-FQ), probed in that order. The group's reserved_regions
> > include "0xf1f7e000 0xf1f94fff direct". The DMAR RMRRs covering that
> > range list 00:1f.2 in their device scope, but not 00:1f.0.
> >
> > 6.12.118 (default cmdline)
> > --------------------------
> > Once per boot, ~20 min into sustained writes, 23 errors (21 + 2):
> >
> >    DMAR: ERROR: DMA PTE for vPFN 0xf1f80 already set (to f1f80003 not 1=
67119001)
> >
> > from AHCI writeback (ata_qc_issue -> iommu_dma_map_sg). Each one is a
> > 4 KiB page that reaches the disk with wrong content: mostly zeros, some
> > with firmware data from the RMRR. No I/O error is reported.
> >
> > 7.3.4 and 7.4-rc4 (default cmdline)
> > -----------------------------------
> > No DMAR errors. Instead 64-84 writes per boot fail before reaching the
> > device:
> >
> >    ata2.00: failed command: WRITE FPDMA QUEUED
> >    ... res 40/00:00:00:00:00/00:00:00:00:00/00 Emask 0x40 (internal err=
or)
> >
> > followed by I/O errors and 4-8 MiB of zeros in written files. In one
> > 7.3.4 run the machine also took an NMI (iLO: "Unrecoverable System
> > Error (NMI)"). An iommu:map trace filtered to the RMRR shows the cause:
> >
> >    map: IOMMU: iova=3D0x00000000f1f7e000 - 0x00000000f1f7e000
> > paddr=3D0x00000001c94d6000 size=3D0
> >     =3D> iommu_map_nosync <=3D iommu_map_sg <=3D iommu_dma_map_sg
> >     <=3D dma_map_sg_attrs <=3D ata_qc_issue
> >
> > With iommu=3Dpt both 6.12 and 7.3.4 run clean.
> >
> > Suspected cause (not verified in the source)
> > --------------------------------------------
> > The domain's IOVA reservations seem to come from the device that
> > initialises it (00:1f.0, no RMRR). When 00:1f.2 joins the domain, its
> > RMRRs are identity-mapped but never reserved in the IOVA allocator.
> >
> > Reproducer
> > ----------
> > Fresh boot, ext4 on an AHCI disk, 6 parallel cp of a 10 GiB random
> > file, sync, drop_caches, compare hashes. Fails within ~25 minutes.
> >
> > I can test patches on a spare machine of this model. Full logs, the
> > DMAR table and traces are available on request.
> >
> > I used Claude Code to run the tests, analyse the
> > logs and draft this report. The results and logs are from my own
> > machines, and I have reviewed the report.
>
> This seems to have been root-caused in this thread:
>
> https://lore.kernel.org/linux-iommu/02b201dd5ea3$02b88430$08298c90$@mache=
lett.com/
>
> A fix patch has also been posted:
>
> https://lkml.iu.edu/2411.1/00575.html
>
> Perhaps you could give that patch a try?
>
> Thanks,
> baolu



--
