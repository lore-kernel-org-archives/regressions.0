Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC712222D0
	for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 18:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763664311; cv=none; b=oJ0G8X/WAd+BWQ7t2lHHNBeBIoFGfL+A7SYk8Y7R2q/rzuXgqro5DIBBAXQb0qcE1+ODqY8u00XGnPOdkEBTsJ86J55sgR089V/vucrlWmFm69gmSBUHVLyeNZYO/p4ktYIc8fUtbXyqUMSrgBYf6Zk6+ShMB5a6vsn8QzH3/yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763664311; c=relaxed/simple;
	bh=qVMDCK5HBqjnHBnKXMp0zyAZJm4qrJuNO2kzvqa1n20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EyQtmbGltJic8r6dlR/aRI+VIyc97QQTC51ltozAD/dPJ7Ow1gYPZk58n+jZqrM662d/8M/kdVjeMpmt4BwXsXJy0g0jOWACPzV4MQi9Q/gRyrsnRsLB4wrfxPb7yCe4agZT0/sH2/osoy5KBKweLosAzYr/rXEy3Pi0h3s95tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eg5HgHEr; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eg5HgHEr"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ee1fca7a16so9932221cf.3
        for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 10:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763664308; x=1764269108; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eCq7aRE9JlXSZYRUFh/YRAi2lTkD7ldmbJsq0UE7DY=;
        b=Eg5HgHEr/E1z2+n6I7Tn3QMFyBXozaFnJ/hRFeQ2LD+Bc6uz+ORtRT0jbyPcixQ4h7
         sUii+0IKc0R6R7hD80/NIn6qR5kL62ZRY4Zlwm/w/DiYZ6/3QjTIyyb+/dayDnK59oFL
         ORu49AShYIfJJ4HLt7rUFZtPn3bfDRL07/fbEl9lBSEmy5eBX0SZPgE51OKpj6Mr86tV
         nm/H/SUMVPhj7htivI+X2I6iW5vC6PjJp7qC9A0a9TwYtsuFiuwi2h13JWKJH/Jt/W1k
         1yARiEMJ+2m4rQwRi1v80CiyeQ6m80l3w2zRpiHCGA4Y97laylXHtOT3URwsuV1HNtEt
         Qf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664308; x=1764269108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9eCq7aRE9JlXSZYRUFh/YRAi2lTkD7ldmbJsq0UE7DY=;
        b=q2CHCLI+CGkZu1Ljz+9FmGHR/oOfWf06FgytwFtaMxRko7luwYx1ChYOtVIuxzDuhZ
         /sKeZ1WvfJq+YQhXQkpL4DBx1ASvTf3buhQQS2Mj+ISkCm71PMzDzEa2j3IqkKSRVuzF
         /U2oJJ0rSKXPdQhPcWZQ93qGBFtdaUNh3GBM6Qa+RymfMKR5OfvDSX78fN6Dmvka2OQK
         duUB2/KZsKdyRvV58obr33Sbe1+CfhxXP0V+zzNb1IdTGzQIpfcHd3xp8KJTg+mNPenc
         zQxKa4DrTfs5gFAC8tcMSJzBQJ9+D9dWwYRo67sOPgvjB5vxVMw8w+2mwP94FgyTHGyZ
         kIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZmxr/3ASkn6iIGz6gyR93jZwFgtZ4Rsz4Xe2HKkql1CnktcxZUUM6HixSsHhJfbel7gwAVNH/QQVrAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4r+7KEEifJeckF1dla8HfZactxYaVif51JYzCrkU3Ur3uk0dI
	SJefI5bSr4rdaJgB6i5LWFFDTN07S6XDXGghD18WDqoZU/ta/1ZUR0s9/CmgeLfNm5bd9551r6K
	p380SCNnhpwRge5Jzz39wZ5MePLYU+j0=
X-Gm-Gg: ASbGnctsmKc5hjXiVYbKgsJBzpMDk3cfmMtDdL8lr/zEJYypHimO5YHF9Lzhb7yrPlP
	s7puvu/d0zN2No7z/dJlzM8d5ancpFbkwGjy34113gqblKguER80Omr1bdXHkJuUtiBvagkRCob
	I3b8oTFLWYzQ6JvfLLCnGqZoJ/u90KTmk2oKa4dcBJ5+KUX1aM8gqqqMW/BbVrtqYXSuz0YmM+g
	SP1ZMN/9bs6J9Bay09iZUcg1upCT9u0LSsvvwDX7tFU4Fid6Zvr3AOyTjrbsHkp9FBrHg==
X-Google-Smtp-Source: AGHT+IHO+i9lOHqZaypR7CwTJ8a/SU11MKAGv1EFyh0NBSTLMP1itr67OnIBYO/NiIB0xjAbaZCGO0NJ+H2tFEIVXRE=
X-Received: by 2002:a05:622a:255:b0:4ec:f6ae:d5d9 with SMTP id
 d75a77b69052e-4ee49614f13mr53933041cf.39.1763664308441; Thu, 20 Nov 2025
 10:45:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <mwBOip3XK77dn-UJtlk-uQ1N6i3nwsKticZyQdPYzQcsk0dsjXl4oOAh-Neoxv-0TlpKnt_FEJwx8ses5VJglGLJUW-bIG8KWchtoDwCnnA=@protonmail.com>
 <CAJnrk1ZDEszGbyP4cRh7+mEPu9BLmPrY9Xb-Q3HZnxXZOV7Eag@mail.gmail.com>
 <CAJnrk1aepU0y55FNG3zDHhK4iPo80MtD+tE_PT+ExhD9SDUS_Q@mail.gmail.com>
 <_Gt41eQ_dnFbfGcMH4LkwSqmCYBdQGfnPdQfBlAWwkohIUfDUwtdvpQa61Pk2FMD4B-ov2uVIG9FUCJu_GT67Qkde7e2oZdnnRMopuglZHA=@protonmail.com>
 <CAJnrk1YhZN9=M92dK6EtTTkuhQW_qco_ikwFHmVE0cgiiUnF8g@mail.gmail.com>
 <CAJfpegtzmMFtrg4G5N+M+0GG6QdBrSZStWN2RNO8ut-Uz7LdiA@mail.gmail.com> <CAJnrk1ZjQ8W8NzojsvJPRXiv9TuYPNdj8Ye7=Cgkj=iV_i8EaA@mail.gmail.com>
In-Reply-To: <CAJnrk1ZjQ8W8NzojsvJPRXiv9TuYPNdj8Ye7=Cgkj=iV_i8EaA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 20 Nov 2025 10:44:57 -0800
X-Gm-Features: AWmQ_bmUtygPK-6hxvjMMn_Tvep_ljENcAvnJQU2RUuuoiwkwV60lCAn0ySEPLw
Message-ID: <CAJnrk1Yh4GtF-wxWo_2ffbr90R44u0WDmMAEn9vr9pFgU0Nc6w@mail.gmail.com>
Subject: Re: [REGRESSION] System hangs on suspend after using distrobox container
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Athul Krishna <athul.krishna.kr@protonmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 10:55=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Tue, Nov 18, 2025 at 3:14=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu=
> wrote:
> >
> > On Mon, 17 Nov 2025 at 20:00, Joanne Koong <joannelkoong@gmail.com> wro=
te:
> >
> > > Ok, then that means there is a buggy/stuck fuse server somewhere on
> > > the system that is not completing a writeback request. If we look at
> > > /sys/fs/fuse/connections/*/waiting  and see "waiting" stuck at a
> > > non-zero value, then that should tell us which server is stuck.
> >
> > SysRq-t might also tell us where the server got stuck.
> >
> > > Hmm, I don't think this is a regression because the bug is in
> > > userspace and for a functioning fuse server, the new behavior is more
> >
> > Userspace acting strangely is not an excuse for counting something as
> > a regression.   The rule is:  if a practical use case  worked on
> > kernel version X and didn't work on X + 1, then it's a regression and
> > must be fixed.   And the report does look like a real life use case,
> > not something made up.
>
> Okay, I'll resuscitate that patch in [1] and get that sent out
> sometime this week.
>

This is the link to the patch sent upstream for this:
https://lore.kernel.org/linux-mm/20251120184211.2379439-1-joannelkoong@gmai=
l.com/T/#t

Thanks,
Joanne

> Thanks,
> Joanne
>
> [1] https://lore.kernel.org/linux-fsdevel/20241122232359.429647-4-joannel=
koong@gmail.com/
> >
> > Thanks,
> > Miklos
