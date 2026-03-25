Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B8179CD
	for <regressions@lists.linux.dev>; Wed, 25 Mar 2026 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774407379; cv=pass; b=YFMi3IeDwZzf9ULjaQRCRATeKLoZd/IdFU11aEpXPVVmGGWa7fuOxFgcWLjy8QGIyeSG2QVF6p8HNkIDkY/T7G35v77/I3A9VCaHSmbEqqzJgd1D1hsCEdFGSCYyDhaO/xi/Mx/pX42zfh5yIzl/YPni4UFzclJxeJeF6+mItb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774407379; c=relaxed/simple;
	bh=+uPMDPPtiGZlDWZpdQ5piUM06engoMAUBApWm8b8a4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPGdb7wyO3MiSKV7w28hX/xzWpMALj/9sO7IUO2kj1ImNVqfta5IxXf+LGWz5vv1NC6Q6fxtjE9Od/bEYpQhDSGU5p03LVM64Nbi0rfjV+7rMKsDrXuNQNCHkRWwIUqhb9bJAjc9J7xY+ubqVGvGYoIHOlJowMtEMpTqYKlbEn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KM86KcYD; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KM86KcYD"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b611274bso3256200f8f.3
        for <regressions@lists.linux.dev>; Tue, 24 Mar 2026 19:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774407377; cv=none;
        d=google.com; s=arc-20240605;
        b=klALC/h+vVohPjqWXVT9Ac+c18VS+lQZ1XfCY5qK3OxQRYf+kwMBqo/LzziS0mTecD
         M5XwbiyIWHaXyCYkrdPJTJ+IBgiPqW7t27QMXYzxNChEJOeGTKuRIQdZNssAvNeaQwum
         rfF5KiUdLqDaN+p1gDoCFmG9AwUlVe7uIRrbuttrHGfQISw6j+5hx9fmu1vYSMCUVGod
         TV7JujCt22P4vU4wdUEf1id69B5ksrBxT/QJPVGqxVGQ+c0i/79kCfuXO3rsZEESwk7x
         tCgJMHD2c/xUttj+26McCaW/xtXmbW3sleF77Cz4ocbt/DZQsCJyEK3otcvfALnWoi3W
         iWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M8beg8RaijPeg8FFoZVPlIFnyuzA+pj3RPJBxTKpVis=;
        fh=ts36GvyQTWhZphUTPPH/SAuu/rf5H3SpScLW20ItI7k=;
        b=FyrVbgYnwQBMJwsIo4uKLmyxpm2AiqOU1ddf0hroKAaZw8/xUSRVi9hZu4kyeuLkwo
         va2PzFXjSyJADKH0VdiakPOTgU2TZHgbGb2Urb+e4Tva4/MSwLS5BMMyrKDGtcbtaK2G
         nqXxX7fViQlfStL+CgpttdLl7C9YTAJRgndp+ACk31UFMtRY0434Pw1L0nTzLmDpWbPw
         94dzD/9M5GeF8AI006QLKJZqoM0dnVXkX5+d4Uze9MlhFoONB0aY2FyKWlTGVRuvVKPI
         iJvxmWb+GpRLAcl7ZGBF4Dtgn0VsfuI9amKW03KryDRx4/UZNntWeXS/9CHoVVwYhdsE
         6Q/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774407377; x=1775012177; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8beg8RaijPeg8FFoZVPlIFnyuzA+pj3RPJBxTKpVis=;
        b=KM86KcYDHaTY5uisLF3WPfL1Sh1bSc4XIDSYCJWb3IHaWanPHPPdITKJshROZ3UIMA
         6tP16dn+Tc2yZ4yzWuqpq+7jmuOtt7KrsQtyon71lp/FU1lYfhS1NaZG04c3xiJDos92
         W5UlXgo6TEGw2dPGHkEhGzpqlsB5T5NvVU6NzA4W5ODgLPQoIjMCsp/BiB9RcEyhblLR
         2H24cN/6VZ4TlApN9rmKB45W7jvZsv9g7bafFEKVkYJ4KZNItoPtR0WHcdbgo+UviP6t
         hJ9373Gs5mjXvqHQqRfsVXHwJQeAMJsaf8NNRi3eeZS2Sz9+HSQWLnUGy6bnCblYWnGj
         ONgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774407377; x=1775012177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M8beg8RaijPeg8FFoZVPlIFnyuzA+pj3RPJBxTKpVis=;
        b=RJngUYdPP04ERcMRBuKeXIDKxKJllF+a58DLG7rCaRPMTgT0A97CUkY6ztMbJGFciO
         52acreAe04DT0d1YWgXkkzgVlA1u5BtZgQ2aCEEUCS7hvZ/uEhE4uLkBCtE7qMaT96jC
         O4FFvS2ixew7jJHYcxn4fG4pwk5/ILdY15TIivpjRWxCenocj9gmrkStiHPlooWkCHLV
         YOTn4RvWlshytqm9todNeR4S/bf5ePGibdtUfB4Y8fRSEBQRXBGEx+8lT50dc4KSlEp4
         umsLPfMLtnCJp+t8jMqh9Ft48W7mmiFkSYvlCIkXb2ZrALcgmZXXOc3OA/OHYzc07Qi0
         63Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVHyH8w2eg2jRTSxDxQuxpGxYshakZP5DEa4c74HUvC7TKsQkcY/1QqdGKtSrDvEcdVlvEum7We3q2Jxg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5r5tYkzENBY73bDrpMGWmindV+0Pu9lh6FqP6orHZ8Yw04aZh
	G7CxuEOnGmkF4ERiDxiIs9Ip1uXggUG20RkYxckgKF2VIWpz7CU6vpDAOl65Icm+duVLbhg59vQ
	ba44H87bp+VKLdym9QcXYkJr3gBXG384=
X-Gm-Gg: ATEYQzxqiMXy2l2OdPj2cZGex9iRq+ntZh5EA/5uO0gayqapyGmdmLWaayrr5x8ev2W
	mteK5K6zzuG+7uqQKEvpioSJsW8pyc6r6MQZeBS3d3qAFpQBwpHWK7bHpBbL0zBKRb0yDWEOxWA
	87oWYJ1T/3tpmNEk1qNmgOZnHCMervKnsOEGk31qHHNxGlTWsUDpzi43f/OHXW4PBwIO4l1QeDB
	vLkTeoTFhNy1gmoE+eaEdSgey4fgUgs2p9X4v2ZbvH0Qy2P4gzHKzxQLStPIG5Wul6Soz2A4dqW
	COOE3uuZzH2UWqN+/Q==
X-Received: by 2002:a5d:5d13:0:b0:439:b629:42d7 with SMTP id
 ffacd0b85a97d-43b88a0d06bmr2402635f8f.46.1774407376729; Tue, 24 Mar 2026
 19:56:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260318023733.116789-1-CFSworks@gmail.com> <bae7a16910a7b2cff6b9f8996d93ea72dabb9a6b.camel@ibm.com>
In-Reply-To: <bae7a16910a7b2cff6b9f8996d93ea72dabb9a6b.camel@ibm.com>
From: Sam Edwards <cfsworks@gmail.com>
Date: Tue, 24 Mar 2026 19:56:05 -0700
X-Gm-Features: AQROBzAlSbvlJ_j1hrAwDeyayBxlZCGPHoqUP3hJK2r7_KYkhbvBusND6PVGDs0
Message-ID: <CAH5Ym4i_Vbu88yHr5UG=6=kOS_jebsSaV3B-AvZjrn+jk8h-xA@mail.gmail.com>
Subject: Re: [REGRESSION] [PATCH v2] ceph: fix num_ops OBOE when crypto
 allocation fails
To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Cc: "idryomov@gmail.com" <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	"slava@dubeyko.com" <slava@dubeyko.com>, Milind Changire <mchangir@redhat.com>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, Xiubo Li <xiubli@redhat.com>, 
	"jlayton@kernel.org" <jlayton@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 12:42=E2=80=AFPM Viacheslav Dubeyko
<Slava.Dubeyko@ibm.com> wrote:
> ...

Hi Slava,

> Reviewed-by: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>

This looks like you gave "for future reference" feedback and provided
a R-b tag for the current version of the patch; is that it? Or is this
a tag to roll forward to a v3 with your feedback applied?

If necessary to pass review, I can do something like your (2) and
amend the commit message:

<excerpt>
contiguous ranges (and therefore the required number of "write extent"
ops) in the writeback -- will panic the kernel:

    /* in ceph_submit_write() */
    req =3D ceph_osdc_new_request(/* ... */, ceph_wbc->num_ops, /* ... */);
    /* ... */
    BUG_ON(ceph_wbc->op_idx + 1 !=3D req->r_num_ops);

This issue can be reproduced on affected kernels by writing to
</excerpt>

But I fear adding even that much sacrifices clarity: the central point
is that num_ops needs to be correct when ceph_process_folio_batch()
returns; I understand that documenting the symptom of the problem
(where it panics) is an important secondary goal for helping affected
users/stable/downstreams understand the impact and/or discover the
commit, but I'm also trying to be respectful of their time by not
reiterating code to someone who would just CTRL+F the source file if
they wanted this level of detail.

Best,
Sam
