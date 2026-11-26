Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699916;
	b=L41az57Qngb/wYV/l+ZypPFxiOFDCdZO8mh2zWbu7zP/e3gjWY3Q7thP3oD9da2c/uPv
	 oy2FFJnm/GM6Not8jHt/txvtWeex/YJK4CArJ6bKOUn9DVian2mbTpj3INsRAiDRX7WG9
	 p1Ou0I2UfmG2iCMzlhfo7N1n70Ma3G2rsYb+mRGbw6zUkjPzkWTIEGoLaGckXnEnm+opq
	 N58XA3BH/KeR0M7luSccHzkWgCHoDlg1/RCg/Z79PoZwPx00ofoEZhALN4p+KFmKkpZJM
	 N5xT9CfORI+7oWBfNt8dxVkT6WXmej9h/4Q8++qgeppIhvUpfAK1+49IfDHK+yAS8nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699916;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:User-Agent:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=3B43kyyzUUTLVNXK4AN+mljA56km2Ewzy7V4dK6lZDs=;
	b=zk/Fjv4WMswH8o/m1OQoAWyWHDEVAdv6kxSM3M3rV/N1ibajNzUoTQZ95lvaw5LSjkxs
	 rmHkwDRuS7wvIrP9E638dalacj/egckdv3YEXHBPhO8B64xeHhc2NBhWyDQ5a3KXSqvAt
	 U2P9VkIdnu7XZeTdy3jw6ti4TKtyZN9hp7cm3koibHMylTu4g5Ozza52TG5ohVs+iF7vV
	 Fk0wZwCiFBVqBEamYdmoxvWn10umrMskDihiEGNqY8nM261v+pXJsH54RCo8uJ4oc49Uq
	 kqqowA/tBO1X1R+n8uyrVUPMY3ocm/KopN1uNynlyNnMAiERfJgah+GC4FYW3Bcd2ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f7EDdOir;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E9F606A31E
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 13:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E9F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f7EDdOir
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795699915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3B43kyyzUUTLVNXK4AN+mljA56km2Ewzy7V4dK6lZDs=;
	b=f7EDdOirMWXC8akAqM9hNUNbt67exkg4w3GR3ZxjimjvLhVh0pYAcCTqRTE+ih/EONmbc2
	LWmfgyO226ldZNKYd4m8ksWnOlp37kk8jH6L1AezJHweNA1QH9uegt6DCeg4hLebfG0jyB
	ON/7vw0OJJKYkKFRXFjRMVTsQGz8zQI=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-sOwVTgcDOjqs74QkRTQwBw-1; Thu, 26 Nov 2026 13:31:53 +0000
X-MC-Unique: sOwVTgcDOjqs74QkRTQwBw-1
X-Mimecast-MFC-AGG-ID: sOwVTgcDOjqs74QkRTQwBw_1795699912
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecb636b587so1114139e0c.3
        for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 05:31:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699912; x=1796304712;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3B43kyyzUUTLVNXK4AN+mljA56km2Ewzy7V4dK6lZDs=;
        b=CeLHWZMLmqKpAE3owogX/TZbY2GhRmNiX3OhmSvlbu5ROIT7rxH8arQJe5lztHsLvp
         bbBoRp3UXFkJJLk6OPkySva/wEr+67BZb50DbFXNC5kZSC3YqdMrUzqA/kI7MLuEaL6b
         W+MXvJLTlVkLjhiVUBuuNAbbn3JzlyAoxf52zQNsxvJqmeVDVkO9j+YGtkf1poMWRRAp
         ecMMOgUuRq8XXZIVMTucJ6OGlZ66vVOQipy6ws9j1ItkYCvynu0QCu7X+wChykXiOW+j
         PFZnexM1ru9ZUgMflL7np2LiYSjIyIT/bfTdyqIElZGlMMJLD5S2is3x2wUYrMKXu9E7
         urrA==
X-Forwarded-Encrypted: i=1; AL+hErGgg1khkAUo3cy9jcHpT24G9WrwfuRtuII1JPR73mKVAQ7IenIEk8ZSo16Fba/dKwZIv9nSFnzutnW6oA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8twt7ONCQVGOzXYRvbkSdFpjO2dAjYEKlDdUjT+yVFZdRvljUH
	XYtz9R3DCFrDHbgRUMufvlZFpQr2m+7EW481KRO46SLxgB2c+dJlZ5lqLY0iOvatQQxkrbabeXI
	PvYQYxIrATh/7IIaRHMwxw8MzowJDjZt73zYR8mgMqHw7F8bF7io3uXRGFHUsX3OR
X-Gm-Gg: AZFdTZfaDZZvLRhTI1EzABaJrVV9NcmsnZKDeBb2kNSJb5vgJqtuOFAnkOQrHYhjjRg
	4pjtiZohPI0/fUliiZgMd2KPVGrhv6c//7fpSQkEHIgBpXBFuUvLMfyvvIKP+1gI1z2Dcx2XiwE
	1v9/itoTLDIN37z1odMICyjIr8ZvzqoB2sloRq9l0OOEMJ7KODnhlxMlSzpyG6g+BKafeWIHQTh
	E/4OTgFi27psk6AD1Z2uzFS7+NWh1CPeqQqHeJ7SPJcKaGEBN3BR9wuQ9/c8JQdR97Xc1iseG8Q
	kDKYP4ViI++OV/Al9vo/j8ThHBFsSeBnDn1R1gOOIWq4UY/STaLds+nFkrYvlNk6heKS8hSd/ba
	9qB1DJkPTE2ejCN0yy1yy5e1CSpiip1G8mgFMqX9MOnXDnyR7/LgWvOaUILSZITNCDOALv9yO+v
	VdXU8PYeiHp4r9Z4J1nVDhsETEYpG8KCC3muAdZDvH/thWxpDNvWvu0CSutJlOjqliQCdmQA==
X-Received: by 2002:a05:6122:29cd:b0:5ec:d751:a18e with SMTP id 71dfb90a1353d-5ee8af5d5c6mr11288494e0c.19.1795699911714;
        Thu, 26 Nov 2026 05:31:51 -0800 (PST)
X-Received: by 2002:a05:6122:29cd:b0:5ec:d751:a18e with SMTP id 71dfb90a1353d-5ee8af5d5c6mr11288267e0c.19.1795699910439;
        Thu, 26 Nov 2026 05:31:50 -0800 (PST)
Received: from loberman-thinkpadp1gen5.rmtusma.csb ([2600:6c65:2440:d8c:929c:b769:6def:faa3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm180018331cf.17.2026.11.26.05.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:31:49 -0800 (PST)
Message-ID: <f323c3d62265dfe90fa71514028af4d35f6e2420.camel@redhat.com>
Subject: Re: [REGRESSION] DMAR fault by Intel H97 SATA controller since
 "block: Increase BLK_DEF_MAX_SECTORS_CAP" (6.17-rc1)
From: Laurence Oberman <loberman@redhat.com>
To: Bart Van Assche <bvanassche@acm.org>, Lu Baolu
 <baolu.lu@linux.intel.com>,  Jason Gunthorpe	 <jgg@ziepe.ca>, Joerg Roedel
 <joro@8bytes.org>
Cc: 70sp <70sp@protonmail.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>,  Tobias Laas <tobias.laas@posteo.de>, Damien
 Le Moal <dlemoal@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	regressions@lists.linux.dev, linux-block@vger.kernel.org, 
	linux-ide@vger.kernel.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org,  David Woodhouse <dwmw2@infradead.org>, Will
 Deacon <will@kernel.org>, Niklas Cassel <cassel@kernel.org>
Date: Thu, 26 Nov 2026 08:31:48 -0500
In-Reply-To: <0edb9525-5068-42e6-b6c3-a1dcebcbcea7@acm.org>
References: <5ad27a97aafbc08a8702d5b90d09cd59@posteo.de>
	 <awSs5Cw3hFkf4O4T@ryzen>
	 <ec36d13e-e4c2-4bfb-8b50-69d4a1628839@leemhuis.info>
	 <87b1bbd8-8113-4890-8623-738b19a9cc7b@leemhuis.info>
	 <a0ff3156-add0-4f7d-8373-09f95bd7036b@acm.org>
	 <2adaf0ef9e1a2fa18590f7d8dbf203c0f7de2be7.camel@redhat.com>
	 <uJluFNYGCCrdvnYT3MatN_4Om8UczTJX_dzxumJxyCAC7F-Ubrekb7LPwlRxhCW0J91UBf-TqeRoJQfgYIYBRvMsPmE-Qs1eAg5zbDP0s58=@protonmail.com>
	 <0edb9525-5068-42e6-b6c3-a1dcebcbcea7@acm.org>
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
X-Mimecast-MFC-PROC-ID: 5yij8JjX9ChA42OgAcf7ExqGwZrH_YTRNeZv74Zx0Gs_1795699912
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-11-25 at 15:27 -0800, Bart Van Assche wrote:
> On 11/25/26 2:51 PM, 70sp wrote:
> > as I mentioned in the referenced regression thread I reported, the
> > patch I sent out was basically an example to show that it works for
> > my use case. I wrote that I don't think the patch is ideal (in
> > fact,
> > I think it's an absolutely terrible solution to fix this). This is
> > also the reason, why I just sent it as a snippet of code.
> >=20
> > Please take a look at the code before the regression started to
> > occur. It was implemented universally. These vibe coded patches are
> > horrible compared to the original code. We are literally making an
> > exemption for a specific CPU in a place where it shouldn't be. The
> > actual correct solution would be to make a patch which works
> > similarly to the pre-regression state.
> >=20
> > If we are going to merge something that is made by a LLM we should
> > at least make it good. Ideally made by an actual human.
> (+Lu, Jason and Joerg, signers/reviewers of the patch mentioned in
> the
> Fixes: tag)
>=20
> Is a better solution possible than the patch "iommu/vt-d: Disable
> superpages on Haswell with integrated graphics" I posted here:
> https://lore.kernel.org/linux-block/uJluFNYGCCrdvnYT3MatN_4Om8UczTJX_dzxu=
mJxyCAC7F-Ubrekb7LPwlRxhCW0J91UBf-TqeRoJQfgYIYBRvMsPmE-Qs1eAg5zbDP0s58=3D@p=
rotonmail.com/T/#mc147f250c5356e3742ab3d30ccf6b4a3a8c4196b
> =C2=A0
> ?
>=20
> Thanks,
>=20
> Bart.

@Simon,
To be clear, What I tested was the patch Bart suggested. Not your
original suggestion. We will still need a test from Tobias to make
sure.

Thanks
Laurence

