Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28161A2630
	for <regressions@lists.linux.dev>; Mon, 21 Jul 2025 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753107548; cv=none; b=RGZtfSmVzZhkZvHdqH9aifUP8Drz3Ckx1oo55H02OLn5jZ2XEL4olBgC4iYsFNN41/kgfuxUWPRzI7CCCAd74jkbqUBLskp9M6vcUXuQQtZ8lR4ZpMdmUAxYQ/bWZvUd6Nc8opIjJdDxWhLjrbIK82IkKedIChvIaQzcWWYjnuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753107548; c=relaxed/simple;
	bh=PhDPFlnHiVIpBF5FuQv8/HIP8sSK465sZA17RBAssoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4CKuSI18i1jEVgBAMuFfFOkkD6q9UZMhNYYdpwBw0eSr2UBlJDV6vVZhym0E67xkH/gv6VuJDBa57J5oizHinquzjGQ8bVYaf/yKB9PE6Rb5Leg6EvwRefn47agNpZGC74/cTAqY/qV/EFKrtZD/Nug/pN/bcH6bRVBVGFHbXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KaR+HD4F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KaR+HD4F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753107545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2e2g+RSdLVrXvuMyT6qHHm4bEHxvzYzZzIUO+TrG+M=;
	b=KaR+HD4FD6pHoUmP//6Mmxa7bisdzPMl03x54Ii3n0Uwj0umlLEmWwsCF/8hi3Icu5ZlhQ
	cGDJjKJcV1hAeBSWfO+d6BZvUQKrGeMrQqqoTUdEU/r5L/k5qEr+QM3t+NtDO5AznMnhXx
	GavArUfSNH/IzWJDzDppr8bcP5qADL8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-fuP0Ck1WNxiFhHJ5Q1HoNg-1; Mon, 21 Jul 2025 10:19:02 -0400
X-MC-Unique: fuP0Ck1WNxiFhHJ5Q1HoNg-1
X-Mimecast-MFC-AGG-ID: fuP0Ck1WNxiFhHJ5Q1HoNg_1753107541
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31e3d563a53so50013a91.3
        for <regressions@lists.linux.dev>; Mon, 21 Jul 2025 07:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753107541; x=1753712341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2e2g+RSdLVrXvuMyT6qHHm4bEHxvzYzZzIUO+TrG+M=;
        b=lqDMLiGqJo/S/CG0IXHhR8161UWRD522NxzGbGeNoF2wou+9tq90b3B1dbn06j2H6U
         tejI4bLPrhs8LxLCoQLwpsrIEFaNLgqtv4afamm9FIV7zIMzKBWOOutznqR0RIawj9ZM
         DJKIxdfZR5gTaBiKLyqAlic8mw4kwFawyJAL2fznBhSbH/Vxfw2M2BJbnywAY8FJE7xa
         oKJWV0wzJfGluKuosBwU+hobeA9KqBwzphdptAaBrLdV5my1RkHTQHnfQK1Pk6ELYdfg
         ni9fWdVroysGk+mCvC6oQhrQpNuyPBnRWG70rGk5R2VR1cGERjYdtRFAyAKQShQoWAoZ
         tXzA==
X-Forwarded-Encrypted: i=1; AJvYcCVaRhzsejFxY9QIVNUd53V+cYIJhYco84pJd4RnQh0ZQlpyEYqY1yuj4vg8541Jr7vcUasjJAxWDzWaig==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnrWyYQI/9tz6H/KajUfDXK2ThaIQ2QQw6CXdDvyurYWtkWlHy
	Dv/j2vuzhrnpXtA1PStWxJ7R3NVJx+bcfZ6HBJC8CFlPXxW2vR5mBjNRot7bCFSkV05qBFW+Pqn
	2rVki1JNUfLdCXuv9Dx3ypjZuHVX0xGNn0cNKNE7oSQ4A3r7b6CQ7UwAu9wECCWWeoCky4M6Qzc
	5U+a/Z7qTZzj5qrijpb25JTnYvHF2i5gDCdh89K6E=
X-Gm-Gg: ASbGnctMfWNSKFnfYZDtcAKgs7AuSwk58siCWCJG/f9LTTrRn6J3FtwMMh7ZgKSuw0F
	4k6gj+BnATL+SjVh7uYCrIMG82MR41osb5aGQoKE2UmjuQwCq/JQ4TnVKAhvPiAILX4gmdEp5E4
	Pv4OvqptGLeEHJPKoljMtKPQ==
X-Received: by 2002:a17:90b:2252:b0:312:1508:fb4e with SMTP id 98e67ed59e1d1-31c9f45e1bamr34067980a91.17.1753107541239;
        Mon, 21 Jul 2025 07:19:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJIdqihCeYBVzkOqoaHkVeRUSem0hiE8oGsu0T7UvW6Id9zyyr788yaoKXL+Z4xHCOtXdyTT7abtsFJKNwYFA=
X-Received: by 2002:a17:90b:2252:b0:312:1508:fb4e with SMTP id
 98e67ed59e1d1-31c9f45e1bamr34067933a91.17.1753107540404; Mon, 21 Jul 2025
 07:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <197d1dc3bff.c01ddb9024897.1898328361232711826@zohomail.com>
 <cd3ca680ac5751368941713c1071e04d69544d47@intel.com> <197d710ac39.10e2c241536088.2706332519040181850@zohomail.com>
In-Reply-To: <197d710ac39.10e2c241536088.2706332519040181850@zohomail.com>
From: Pingfan Liu <piliu@redhat.com>
Date: Mon, 21 Jul 2025 22:18:48 +0800
X-Gm-Features: Ac12FXzDdHF_s7WVKonqNsgMwmdC6Q6zqqujKluH5OQTrSCN3xvRecpp-sj16FU
Message-ID: <CAF+s44SvWGxwty3FA6ZpR3GoXEbqXRDoT9H6KBj_jy0yM1jjLw@mail.gmail.com>
Subject: Re: Second kexec_file_load (but not kexec_load) fails on i915 if CONFIG_INTEL_IOMMU_DEFAULT_ON=n
To: Askar Safin <safinaskar@zohomail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, regressions <regressions@lists.linux.dev>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, kexec <kexec@lists.infradead.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, iommu <iommu@lists.linux.dev>, 
	Ben Hutchings <benh@debian.org>, joonaslahtinen <joonas.lahtinen@linux.intel.com>, 
	josesouza <jose.souza@intel.com>, davehansen <dave.hansen@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sg6wtgFODZzKYDinchwzTxWnLcJO99a4z2Bq0oRWg-k_1753107541
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 5, 2025 at 4:12=E2=80=AFAM Askar Safin <safinaskar@zohomail.com=
> wrote:
>
>  ---- On Fri, 04 Jul 2025 12:29:01 +0400  Jani Nikula <jani.nikula@linux.=
intel.com> wrote ---
>  > Thanks for the detailed debug info. I'm afraid all I can say at this
>  > point is, please file all of this in a bug report as described in
>  > [1]. Please add the drm.debug related options, and attach the dmesgs a=
nd
>  > configs in the bug instead of pointing at external sites.
>
> Okay, now let me speculate how to fix this bug. :) I think someone with m=
oderate kexec understanding
> and with Intel GPU should do this: reproduce the bug and then slowly modi=
fy kexec_file_load code until it
> becomes kexec_load code. (Or vice versa.) In the middle of this modificat=
ion the bug stops to reproduce,
> and so we will know what exactly causes it.
>
> kexec_file_load and kexec_load should behave the same. If they do not, th=
en we should
> understand, why. We should closely review their code.
>
> Also, in case of kexec_load kernel uncompressing and parsing performed by=
 "kexec" userspace
> tool, and in case of kexec_file_load by kernel. So we should closely revi=
ew this two uncompressing/parsing code fragments.
> I think that this bug is related to kexec, not to i915. And thus it shoul=
d be fixed by kexec people, not by i915 people. (But I may be wrong.)
>

I tend to agree with Baoquan on this scene when kexec rebooted with a
graphic card.
I heard that this was due to the missed initialization on the graphic
card by the firmware in the kexec reboot process. But it is not an
official explanation. If any experts could enlighten me on this, I'd
really appreciate it.

IMHO, you could try blacklisting the i915 module to see if
kexec_file_load works without issues - this would help narrow down the
culprit.

Thanks,

Pingfan

> But okay, I reported it to that bug tracker anyway: https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14598
>
> Maybe there is separate kexec bug tracker?
>
> Also, your bug tracker is cool. One can attach files in the middle of rep=
ort. Why not whole kernel uses it? :)
>
> --
> Askar Safin
> https://types.pl/@safinaskar
>
>

