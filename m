Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470571;
	b=j/8tvVCHaU7a5hhHcjgRId2mQ6Gox1PuvquJwp2GY+2WCixsHLaqN1is5vSTAnzb2+Mg
	 mvwOFfp6Ns8bKXYlWI1+acV5zbmm/bdM9njvkX/Ecw38tfHgCjIKD8g0j9AN3BduyWRXE
	 VfajxYB8g5kixXFI9h8o2n7eVAnI9dLN9dESXMT4gXZ/8z09hDhjB3KzO6oF5I3MtVaHg
	 lW8Y7xnsvDwydbFEaucbU048L8pwHxehmPAzIYw7yaVqDRTNmWrC+YhYrwfKWNh9X8XHd
	 e6H0vOZ0vqVJ/O+eR8V39hSHclHV63v8YPHIOExkX43rWiPjyowhMnNKli6X0tJnqfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470571;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:User-Agent:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=EXrg3FsOffaVIw+j1I0rphKMSxfBIiuUxoQNWeelH+I=;
	b=cUC5ezHL6t0Ty3sSF05QGnTHS8M8WJSGMTkbh9c3JavcvOwNZeWslajrN3JCBq1jEmSm
	 NcfFV8qAs0LSaTnkYAqvgIq9L/voDti14nk2XLYODh7mKjqiJnXHnU7+cn6MNIUz2OWHS
	 qG1U9u2xq21klYHSRwp7orwv7EPKUuYOXmsB/pj21W0thx21r4MOVKXp0TD77XVY7BXu5
	 fO3N9jWSTrkLMivSh23Y2CbF0Z2T/X6TIANuI4MtHaSQYyPyKwxeUR6QTv139V76BFy/z
	 aGvRVfpUSL+GkJVJkQ3SXUeVMZXrM+gsHmfkFXXxmiF9slP09Btz7PpvWRuDyOzxtYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P8utDJXe;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BEE606A333
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 21:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59BEE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P8utDJXe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795470570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EXrg3FsOffaVIw+j1I0rphKMSxfBIiuUxoQNWeelH+I=;
	b=P8utDJXemWcB23UD8Ny7GUBZQFlqFR2oolQreTffV2mwufBZyHki6jKc6+5UwtuI/kTfo9
	hasr5FK0ggrkdSg/WOUUIKxpO1wqyCBztiJ51m2FhqAmq03OojH3MGn9TZ5hhHsqySuD/B
	bU2N2IP9WR6a8PIdTUCWdoQPZnM7OV0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-_X9rkhv-MbCzvzVi787xhA-1; Mon, 23 Nov 2026 21:49:28 +0000
X-MC-Unique: _X9rkhv-MbCzvzVi787xhA-1
X-Mimecast-MFC-AGG-ID: _X9rkhv-MbCzvzVi787xhA_1795470568
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92126ecb4b8so69208746d6.3
        for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 13:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470568; x=1796075368;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXrg3FsOffaVIw+j1I0rphKMSxfBIiuUxoQNWeelH+I=;
        b=WN6fVxwNHbbJfqBE/S68ribf2YUQQUn8TstSSJfBwMM8Rb/biZHRy2EuBa22Pu/6DQ
         GYkgE0NZsz0vt1hjdYNlSSz1dhL3eU06KPVyBvsTjrOXCwG/UfXxXlVCKezrxk4yS5as
         Te86qnBaBYlUrCq+ur7SMcJ9vHg00so6t9X/tOv+nMeSx4MyTicFRXuOuywZZf06WAbQ
         8s81MbBQYu/hHXhgMAQ3TOxUlcDNuvbi/CkriF7OjQ33bUxXNsmMVUqcbT55wx47P14D
         iQLrnRq9t4HtshGmIwdydNYF8l5zX1oiLoigS4ukKGMLt03T1IcssI76TpzVOQWYrWID
         pZKg==
X-Forwarded-Encrypted: i=1; AL+hErGAwZQZLyk/Jo6bCEE3yecYRn/wKw8/ZLyQEl77tlDWmGKw7or/jJcJ0uvMbBSah9dUnSBX9TJEJk2QQw==@lists.linux.dev
X-Gm-Message-State: APuU4Z97WLeCXkf10NxBgFzUqYB1trKIFhtRzUC0kNxB5DzE4msOd2ZX
	G4+MN/u+L/y+Zy+Mrt5KP760QPOhXmbn/ceoeT0SkKgkEDezoesMUOksKoVtv6TarHeqtW3iESe
	pXIMPfwOW7QYHzWsqvYQiAilGiI9VLuTfO5u84Q8oRHSyra3eiTS43PYz0BWs+BvZ
X-Gm-Gg: AZFdTZcqmtdvZ1xaOC/1WxXmAEWUtJ+ynkcvBWr50NyeyjFzL7eb0X+HofB/mRcXOzu
	A04ne2uNR4USKzBuH13knnQWL8EMw3Bc6GrxBFbiFrc/w5uoBv0Wtf4lMDSZG/b1PsCoWsm1Xa9
	G9wtuqtq02owJiaHb1h/sp2FwWPqPY6VhpF4nGRFbzB0WIBZA8VO8II1Wrz3up0yFV9fVD3okyH
	mxU4i7vXk8MmJaaskN3Nm+b21y6L/fNoHHtuzGmA9/CKcMK2zO12hHgJPmlU2WTlA7+Tkx12/WZ
	WETlTcX9iK17wIMN0K6Ct/qFc3NjIrQ9kvUVuP3BMKAejLGeED6ahO0ofFy/XKzpp0yr9tWGo1a
	NIen1+TUBBriblx7jth4uMd4ZB/WV3TsIHDEj6lk80/mh7KxLalFL6KczKZHfgyuXVqbVoMip2y
	VBxv1ksCjkC5ktGP/4rkXAwOn6tjf5GALVhWZczJ/2gadh7NZEdxTregj3IHhsd8Bp/avRjbk=
X-Received: by 2002:a05:6214:252d:b0:91e:a73b:f9cb with SMTP id 6a1803df08f44-921349d1a8fmr238824506d6.4.1795470568034;
        Mon, 23 Nov 2026 13:49:28 -0800 (PST)
X-Received: by 2002:a05:6214:252d:b0:91e:a73b:f9cb with SMTP id 6a1803df08f44-921349d1a8fmr238823796d6.4.1795470567440;
        Mon, 23 Nov 2026 13:49:27 -0800 (PST)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0f6bsm117366396d6.21.2026.11.23.13.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:49:23 -0800 (PST)
Message-ID: <7eb28c6334a655eb5bfbf3035cf1f1ff1041bb3e.camel@redhat.com>
Subject: Re: [REGRESSION] DMAR fault by Intel H97 SATA controller since
 "block: Increase BLK_DEF_MAX_SECTORS_CAP" (6.17-rc1)
From: Laurence Oberman <loberman@redhat.com>
To: Niklas Cassel <cassel@kernel.org>, Tobias Laas <tobias.laas@posteo.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	regressions@lists.linux.dev, linux-block@vger.kernel.org, 
	linux-ide@vger.kernel.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org,  David Woodhouse <dwmw2@infradead.org>, Lu
 Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>
Date: Mon, 23 Nov 2026 16:49:07 -0500
In-Reply-To: <awSs5Cw3hFkf4O4T@ryzen>
References: <5ad27a97aafbc08a8702d5b90d09cd59@posteo.de>
	 <awSs5Cw3hFkf4O4T@ryzen>
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
X-Mimecast-MFC-PROC-ID: EqZvyZkWamdgTi3m9_dSjwfZzZBaxrh6SqqoJutfqco_1795470568
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-11-23 at 22:15 +0100, Niklas Cassel wrote:
> Hello Tobias,
>=20
> On Mon, Nov 23, 2026 at 06:51:03PM +0000, Tobias Laas wrote:
> > One way forward could be to a new entry to __ata_dev_max_sec_quirks
> > similarly to the recent commit
> > a12cc63129380a5364e787d92b30a3257f66c250
> > ("ata: libata-core: Add max sector quirk to INTEL SSDSCKKB240G8").
> > However,
> > I wonder, whether that would fix the underlying issue or rather be
> > a
> > workaround, because 4088 does not fit the pattern of all other
> > entries,
> > which specify either a power of 2 or a power of 2 minus 1.
>=20
> Your attached kernel log shows that you have a
> Samsung SSD 860 PRO 1TB, FW: RVM02B6Q
>=20
> This SSD is probably quite common, so I somewhat doubt that it is the
> SSD that is at fault here.
>=20
>=20
> >=20
> > Furthermore, the first error messages are DMAR faults, and a SATA
> > SSD that
> > isn't functioning properly shouldn't cause any DMAR faults, because
> > the SATA
> > controller should never read from or write to areas outside its
> > memory
> > region.
> > Since the issue with mounting the rootfs disappears with
> > intel_iommu=3Doff, I
> > wonder, whether there is a limitation on the maxmium block size
> > either by
> > the hardware or from the configuration of the IOMMU and SATA
> > controller by
> > the kernel.
>=20
> Considering how common your SSD is, my guess is that it is somehow an
> IOMMU or a BIOS/ACPI bug (since the BIOS generates specific ACPI
> tables -
> DMAR on Intel).
>=20
>=20
> We have seen similar reports here:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D220693
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221713
>=20
> Does it work if you revert:
> d373449d8e97 ("iommu/vt-d: Use the generic iommu page table") ?
>=20
>=20
> It would be nice if we could involve some Intel IOMMU experts.
>=20
> If the ACPI DMAR is at fault, perhaps it is possible for the kernel
> to
> patch the ACPI DMAR for your platform.
>=20
>=20
> Kind regards,
> Niklas
Hi Niklas, Tobias,

I tried to help here but (full transparency) I had some LLM help for
further ideas after I coul dnot repriduce this on my platform.

I tried to reproduce this on a Coffee Lake desktop (i7-8700, Cannon
Lake PCH AHCI 00:17.0) whose INCLUDE_ALL DRHD reports the same
relevant capabilities as Tobias's dmar1:

  dmar1: cap d2008c40660462 ecap f050da
  (SLLPS =3D 2M|1G, ecap.C =3D 0, MGAW 39, SAGAW 4-level only)

with intel_iommu=3Don, DMA-FQ default domain, max_sectors_kb =3D 4096.

- 6.12-based kernel (pre d373449d8e97, i.e. the old VT-d page table
  code, with the larger BLK_DEF_MAX_SECTORS_CAP): 2M O_DIRECT reads,
  clean.
- 7.4.0-rc1 (generic iommu page table): 2M and 4M O_DIRECT reads and
  2M writes from hugepage-backed buffers against a SATA SSD, ~15k
  I/Os, no DMAR or ATA errors. The iommu:map tracepoint shows
  2 MiB-aligned iova/paddr mappings, and domain_translation_struct
  shows 2 MiB leaf PDEs (e.g. 0x000000039c200082, PS set), so the
  superpage path was exercised.

The 4088 vs 4089 threshold matches exactly the point where a request
first needs a full 512-page (2 MiB) IOVA, which is where superpage
mappings become possible. All three of Tobias's fault addresses fall
in the same 2 MiB window at 0xff400000.

So on this hardware neither the old nor the generic page table code
shows the problem, which supports Niklas's suspicion of something
platform specific. One difference: on Tobias's system dmar0 reports
no superpage support (cap c0000020660462) while dmar1 does; on mine
both do.

Tobias, a few things that would maybe help narrow it down:

  1. Boot with intel_iommu=3Don,sp_off and an unmodified cap. If the
     faults go away, superpages are involved.
=20
  2. The full dmesg from a failing boot, including the DMAR/DRHD
     lines. The faults are reported as DMA Write while the outstanding
     commands were WRITE FPDMA QUEUED, and I'd like to see what else
     was in flight.

Regards,
Laurence

