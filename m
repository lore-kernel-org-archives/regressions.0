Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610733;
	b=gYP+RAbfqMvmP3vc4d4U+frU4C0BbeKekeVX62Ck9ZQMegMRfbLUPO7RwDgXaU6AwHqF
	 ulSwhC874m42SQ1y+IVMvqkIPrhdEfZa2q/JslxOefcKbfZvuWjfidXe2t8RIVBHumqxt
	 V7j551mYgBDs1hKcr4y6WsUN4EwF/XY7GqME7dj0aGZ3hZOzFfnn4b6CEjtssMmaVgnOr
	 URTtoFHtUzVx/bdLywyUvolNpQSkj4I6YTtcQQGRlFxYhoSPQQRLkWZqWtpw3jOoFPfSB
	 7PihIwfeT9VSmDYOpCC9MZQjcQ68DgigjE5MLy8KfJvlpC1NWpdMz4e5fXnuTmDnz5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610733;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:User-Agent:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=zMekMOFYYzs6d6I/5DTGKyfePdDJNtHmrLQaB2m40Gk=;
	b=nZ/kBJa4iZsb2cQ37ZPGz/2l2TG5tAaVkRl5UnMI5IN4yMPebfNvr8C6kObEvv8v9soY
	 M/NPXRCo/ppNQ3j4VZnTdwfRixgEfQ1CZPKWJwkqELhx197v0D3taseeOlMijjLKgfzSG
	 karq2PJ9BoKK+ZcyYvOTSSd2WnqCA/3Z0y6oZNun0Mg1I3eKmm5LDcvz616WnR1o0W/Tu
	 OrAxsbJuHDGVKA62+A5i8O9w/cfdfQrb33jLWctxGAMCejSo06oojZCO0Slfw6dHeDn0B
	 +zglmltAcoLrq70a0/l2xE6hVfqQL8nvN6UcTo8p7HALbC4YpPMltytpsIEMvv2VXWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PpFu7qOj;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4198606A334
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 12:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4198606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PpFu7qOj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795610731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zMekMOFYYzs6d6I/5DTGKyfePdDJNtHmrLQaB2m40Gk=;
	b=PpFu7qOjgD50N8WhMp8IcFeb5NJdxriYHI1xx6/p5Oih6YB2VnIPUBVwDxvHVzWwPpDvad
	u66UPCSTG+ZN1qejeK3F1qfJ8uEVOGHq7JDPoBJeQJd/K7kkK1ETEXFjrnI4j4sQeRyii1
	wBM9KwSoXS/85GRVHfRNUds8sae5KW8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-106nREkaPhq5krw06iRLOQ-1; Wed, 25 Nov 2026 12:45:30 +0000
X-MC-Unique: 106nREkaPhq5krw06iRLOQ-1
X-Mimecast-MFC-AGG-ID: 106nREkaPhq5krw06iRLOQ_1795610730
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3969a2a7so837851185a.2
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 04:45:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610730; x=1796215530;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMekMOFYYzs6d6I/5DTGKyfePdDJNtHmrLQaB2m40Gk=;
        b=yvuUEgP2kYznjsB/vj+VPX8NH5NW0WQmJs/KHNaLgkAZbDS49IhhWB59XWZBn/cKfc
         N0drIe30n+q4wlXppFmzK8sRA5tOYcn6XV0FmW0GqPgs0v2eVUnSEAdDcU6wGc8zFDfo
         hvLpIheZmDdm98gCY9MEHb6T4pE6PnUeWCrfnEWVIO/g42K0+bQCj6I6s7rbMxdYOz4w
         BwMx3/8t7zEOwwtlf0bS+cMzUsV2Z+t45BCCpR9e8InUBPOQuZU1I2xrctXId/lkIQnr
         jZ9Py86cNI8KAvbU+YfNRMeuBeZQ4EhwPct+xXgzSndojkQdeYA+rI8wfm6Facg2aRUe
         QnTA==
X-Forwarded-Encrypted: i=1; AL+hErFTFMAc40hnY4HzydQjMtTvRLeWqd/901SUhc3/RCMxJbiB0RGFTbBogKWSyFeCIaPjUZHHvdrVsTTivA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/kJ8AD+ezf9rf6SeeHcafG2OU0c2lKPZgEU3F1CG6H/ZoDmEFl
	eb+t7WBXsmNTA3nAFR3mEYfyWaZVpqvwoYuJuLovPusgJe4kH5GoCIBYZ28eywSQXKwKm4KDqL7
	ggof/LnqVO7hHSo4Wntln+TuLO35W4uFMm+5dfa9X4auPx/GyIViH+jd48mDX4nEJ
X-Gm-Gg: AZFdTZeQsTZLDKu5EoV6Ia+bZGLUAYRPzSgmVG/VSElKOnzAAT4V5j0SgUDj7u4YDLr
	ynL72r2hK21ySlQTBOg6hXdJs3ElnWAj45wnQzNLUPNH3lfebpbrVaughBaUMi6v0rerKSQju8j
	52wqE+3TUjnv+AhVt30qMCvzmeI0Av+8riq+W+uVEnfvOLw4ThyNPt6LzS9iDLxqUE4EjzceKqr
	TOVLJY1fgYxDcDRoW7AJ9PFK9JdQLZpd/m6O2STdP62nHzOLFf1GTdfjnNW6ZyJ6Rq1wURERUYm
	A33LuxwRLW7wDG89GRC+UMERetoEgDvr3/e1SG/1lKzR3EUs2Jsslp6XuLByeP20Vk6tDSW/EVc
	g96FoTidkjuaRWIMi8GYl7iceQt3RpLswvNB4KIvVFHKt6ig/sKIWikEpds3hRs7oUHYx+CXhqs
	aT/qxWnEFZqJP35I8DkkwHhOBrUPOJ9c5GB3Z3TwyxZomTNr2k10qkaMJ8cddWgyt5/GG78GU=
X-Received: by 2002:a05:620a:8395:b0:949:849d:e3c7 with SMTP id af79cd13be357-949baa0b24bmr3012431285a.33.1795610729627;
        Wed, 25 Nov 2026 04:45:29 -0800 (PST)
X-Received: by 2002:a05:620a:8395:b0:949:849d:e3c7 with SMTP id af79cd13be357-949baa0b24bmr3012424385a.33.1795610729010;
        Wed, 25 Nov 2026 04:45:29 -0800 (PST)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb349db3sm1293829285a.7.2026.11.25.04.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:45:28 -0800 (PST)
Message-ID: <8bb1bdab536b9f727b00e6b6d2246f44d5ff8567.camel@redhat.com>
Subject: Re: [REGRESSION] DMAR fault by Intel H97 SATA controller since
 "block: Increase BLK_DEF_MAX_SECTORS_CAP" (6.17-rc1)
From: Laurence Oberman <loberman@redhat.com>
To: Tobias Laas <tobias.laas@posteo.de>, Thorsten Leemhuis
	 <regressions@leemhuis.info>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, regressions@lists.linux.dev,
 linux-block@vger.kernel.org, 	linux-ide@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,  David Woodhouse
 <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>
Date: Wed, 25 Nov 2026 07:45:27 -0500
In-Reply-To: <ea064dc05dbf146814f1495adad4d39e@posteo.de>
References: <5ad27a97aafbc08a8702d5b90d09cd59@posteo.de>
	 <awSs5Cw3hFkf4O4T@ryzen>
	 <7eb28c6334a655eb5bfbf3035cf1f1ff1041bb3e.camel@redhat.com>
	 <ea064dc05dbf146814f1495adad4d39e@posteo.de>
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u4mEzCr9YS1M3hyeU7e7P7tDqVz0lnL7ayzT2uZ8Gs4_1795610730
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-11-25 at 08:29 +0000, Tobias Laas wrote:
> Am 23.11.2026 22:49 schrieb Laurence Oberman:
> > Hi Niklas, Tobias,
>=20
> Hi Torsten, hi Laurence,
>=20
> I am responding to both of your emails in this email, because you
> both=20
> suggested to check out intel_iommu=3Don,sp_off.
>=20
> >=20
> > I tried to help here but (full transparency) I had some LLM help
> > for
> > further ideas after I coul dnot repriduce this on my platform.
> >=20
> > I tried to reproduce this on a Coffee Lake desktop (i7-8700, Cannon
> > Lake PCH AHCI 00:17.0) whose INCLUDE_ALL DRHD reports the same
> > relevant capabilities as Tobias's dmar1:
> >=20
> > =C2=A0 dmar1: cap d2008c40660462 ecap f050da
> > =C2=A0 (SLLPS =3D 2M|1G, ecap.C =3D 0, MGAW 39, SAGAW 4-level only)
> >=20
> > with intel_iommu=3Don, DMA-FQ default domain, max_sectors_kb =3D 4096.
> >=20
> > - 6.12-based kernel (pre d373449d8e97, i.e. the old VT-d page table
> > =C2=A0 code, with the larger BLK_DEF_MAX_SECTORS_CAP): 2M O_DIRECT
> > reads,
> > =C2=A0 clean.
> > - 7.4.0-rc1 (generic iommu page table): 2M and 4M O_DIRECT reads
> > and
> > =C2=A0 2M writes from hugepage-backed buffers against a SATA SSD, ~15k
> > =C2=A0 I/Os, no DMAR or ATA errors. The iommu:map tracepoint shows
> > =C2=A0 2 MiB-aligned iova/paddr mappings, and domain_translation_struct
> > =C2=A0 shows 2 MiB leaf PDEs (e.g. 0x000000039c200082, PS set), so the
> > =C2=A0 superpage path was exercised.
> >=20
> > The 4088 vs 4089 threshold matches exactly the point where a
> > request
> > first needs a full 512-page (2 MiB) IOVA, which is where superpage
> > mappings become possible. All three of Tobias's fault addresses
> > fall
> > in the same 2 MiB window at 0xff400000.
> >=20
> > So on this hardware neither the old nor the generic page table code
> > shows the problem, which supports Niklas's suspicion of something
> > platform specific. One difference: on Tobias's system dmar0 reports
> > no superpage support (cap c0000020660462) while dmar1 does; on mine
> > both do.
> >=20
> > Tobias, a few things that would maybe help narrow it down:
> >=20
> > =C2=A0 1. Boot with intel_iommu=3Don,sp_off and an unmodified cap. If t=
he
> > =C2=A0=C2=A0=C2=A0=C2=A0 faults go away, superpages are involved.
> Very nice. I just tried with a kernel with the cap at 8191, which I
> had=20
> at hand (the new default cap is 8192 IIRC): with
> intel_iommu=3Don,sp_off=20
> the faults go away, indeed. More on this below.
>=20
> > =C2=A0 2. The full dmesg from a failing boot, including the DMAR/DRHD
> > =C2=A0=C2=A0=C2=A0=C2=A0 lines. The faults are reported as DMA Write wh=
ile the
> > outstanding
> > =C2=A0=C2=A0=C2=A0=C2=A0 commands were WRITE FPDMA QUEUED, and I'd like=
 to see what
> > else
> > =C2=A0=C2=A0=C2=A0=C2=A0 was in flight.
> To be honest, I'd like to avoid having to capture a full log when the
> error occurs, because I can't think of a good way to save it.=20
> Technically, I hope the logs up to the first fault are identical with
> the various caps. As you can see in the log corresponding to the
> first=20
> screen full of errors in the attachment, there are exactly two WRITE=20
> FPDMA QUEUED commands that fail at a time (with the cap at 4089
> IIRC),=20
> so the log looks very repetitive. After the first couple of errors,
> the=20
> kernel starts reducing the ATA link speed (and later maybe also the
> UDMA=20
> speeds) and continues to do so until it gives up on mounting the
> rootfs.=20
> Then I=E2=80=99m greeted by an initramfs shell prompt, and I=E2=80=99m no=
t sure if I
> can=20
> mount any other filesystem at this point with the slimmed down kernel
> config I used to speed up the bisection.
> I=E2=80=99m not sure if I=E2=80=99ve understood you correctly regarding y=
our second=20
> sentence: I don=E2=80=99t see any contradiction here=E2=80=94for a WRITE =
FPDMA QUEUED
> command, there should be an associated DMA write. The QUEUED just=20
> indicates that the SSD can reorder the commands in the queue (NCQ).
>=20
> Am 24.11.2026 09:55 schrieb Thorsten Leemhuis:
> > I just a few days privately was told that "intel_iommu=3Don,sp_off"=20
> > solved
> > problems wrt to one unresolved regression related to iommu with a
> > similar generation intel hardware. The user wrote "[kernel] code
> > improperly thinking that the CPU supports something called=20
> > "superpages",
> > which it does, but only when the integrated GPU is disabled
> > (speciality
> > of Intel Haswell)."
> >=20
> > Could that maybe related? Do you use the iGPU? Does that parameter
> > prevent the problems? It's a long shot, but quickly tested, so I=20
> > thought
> > it was worth mentioning.
> Yes, it could very well be related. My CPU is a Haswell (Refresh)=20
> Desktop processor, and I do use the iGPU. And sp_off seems to prevent
> the problems, see above.
>=20
> But what I still don't understand is why DMAR faults occur. There are
> dmar0 and dmar1, and as Laurence explained, dmar0 does not support=20
> superpages on my board. I guess this is because the iGPU is supposed
> to=20
> be associated with dmar0 (The BIOS might configure this differently
> when=20
> I install a PCIe GPU and deactivate the iGPU). Is there any conflict
> if=20
> dmar1 uses superpages and dmar0 doesn't? Or does the kernel not
> respect=20
> that dmar0 does not support superpages? Or is the iGPU associated
> with=20
> dmar1? Who determines this: the kernel or the BIOS?
>=20
> Best regards,
> Tobias Laas

Hi Tobias, Thorsten,

Againe, I had LLM help here trying to get clarification.

Thanks Tobias, the sp_off result confirms that superpage mappings are
involved. No need for the full failing log; the question about DMA
Write vs. WRITE FPDMA no longer matters given this.

To your questions: the BIOS defines which devices each DRHD covers,
via the ACPI DMAR table. On your board dmar0 (flags 0x0) covers only
the iGPU (00:02.0), and dmar1 (INCLUDE_PCI_ALL) covers everything
else, including the SATA controller at 00:1f.2. The iGPU is not
behind dmar1.

If I read the history right, this comes from three things combining:

  - Before v6.13, intel-iommu used the lowest common superpage level
    across all active IOMMUs (domain_update_iommu_superpage()). Since
    your dmar0 reports no superpage support (cap c0000020660462),
    superpages were never used anywhere on your system.

  - 5bdd86ec5d19 ("iommu/vt-d: Remove domain_update_iommu_superpage()",
    v6.13-rc1) made superpage support per-IOMMU, so dmar1 started
    using its advertised 2M pages (cap d2008c20660462, SLLPS =3D 2M|1G).

  - 9b8b84879d4a ("block: Increase BLK_DEF_MAX_SECTORS_CAP",
    v6.17-rc1) raised the default cap from 2560 sectors (1.25 MiB) to
    4 MiB. Block I/O can now produce 2 MiB-aligned 512-page mappings,
    which is the first time AHCI DMA hits the superpage path by
    default. That explains both the bisect result and the 4088/4089
    threshold: 4088 sectors is exactly 511 pages, 4089 needs a full
    2 MiB mapping.

All three of your fault addresses (0xff400000, 0xff4a0000,
0xff450000) fall in the same 2 MiB IOVA window, and fault reason 0x0c
(non-zero reserved fields in PTE) at scattered 4K addresses inside it
would fit the IOMMU not handling the 2M leaf entry correctly. That is
similar to the Geminilake igfx superpage issue fixed a few years ago.

For comparison, I could not reproduce this on a Coffee Lake system
(i7-8700, Cannon Lake PCH AHCI) where both DRHDs report SLLPS =3D 2M|1G
(dmar1 cap d2008c40660462, ecap f050da). On 7.4.0-rc1 with
intel_iommu=3Don and max_sectors_kb =3D 4096, against a SATA SSD:

  - O_DIRECT 2M/4M reads and 2M writes from hugepage-backed buffers
    (~15k I/Os); domain_translation_struct confirms 2 MiB leaf PDEs
    were installed (e.g. 0x000000039c200082, PS set)
  - 60s of concurrent 2M sequential + 4k random O_DIRECT reads
  - buffered XFS write/read/copy of 8 GiB, with ~2000 4 MiB mappings
    in the iommu:map trace

all completed without DMAR or ATA errors. A 6.12-based kernel with
the larger cap was also clean. That is consistent with the problem
being specific to the dmar0/dmar1 superpage asymmetry on Haswell with
the iGPU enabled, as Thorsten's report suggests.

Tobias, if you have time, a confirmation test: on a 6.13-6.16 kernel,
raising max_sectors_kb to 4096 via sysfs on the SSD should reproduce
the faults, while 6.12 with the same setting should not.

Lu, is there a known Haswell erratum here? If so, a platform quirk
that disables superpages (or restores the common-denominator rule)
when the igfx DRHD lacks superpage support seems like the right fix,
along the lines of the earlier Geminilake igfx superpage quirk,
rather than limiting max_sectors in libata.

Regards,
Laurence
