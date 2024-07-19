Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE8639FEC
	for <regressions@lists.linux.dev>; Fri, 19 Jul 2024 20:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721422056; cv=none; b=MWnEAzBn9GZ75uj2R++5dEokN/i2MdkpxS7+p5nZ8my+KYNBPuZoYICzcTlQk36wsyKC3IRq1lmcwg71yLoce1bHtloOKcZ5uPhLiYpSkzTZDIB6Twnbk7m6CVhXl0yJFxgGzIlZLwQxMT0lfauncOkBORyRcqlnMMNAhp5ESXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721422056; c=relaxed/simple;
	bh=3P/U3vH70A+DPJbZr3Mx88omChXBtHGjbS+ivr4NAw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfrE2DyNEv+/oXhIHkTKw0xQZ/tlVqr/zZmMezxGeT8biVhprt2ga1ZaM2Caoa5kn2Oh2GHlPNLujsv5/IN3iLAwME2h4nRzMqHg0rCu0c802bsN5il/+/dAs51wjyZkyyTeZS3SChRdA32n0ot079qOg9P6CgyAodPW/TUuzdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHMTijID; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHMTijID"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-447e2d719afso14107151cf.0
        for <regressions@lists.linux.dev>; Fri, 19 Jul 2024 13:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721422054; x=1722026854; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHJzBzbdzklgkKRPKdhiHUJxCYQfxUrxJQaa17KDIKA=;
        b=DHMTijIDuOvsnPQMxzD+HyEgV3mfRH71BkAHfE9sLfUTaZXujrrZaSreTm17GFeT64
         JsFil1YXVWszCGgmz8aJHkA+DdsT+eIsGgDA1n7+RS8+ZB4VqwD4h3vmUcfIa1P3+kao
         PG7vCvXwu3X2M7wJ6fHoISl4cyV9Uj15tjRLEfGAtqZcpHpwcGmkF8Tuq0tLbeL82nwM
         eQ4D3ACq5rgvE9+qUHh8/PFxKz4ZdkrN9qfKzgNow0bWqYqAYCAvayWULxrQ6QrimhzA
         azheEwQyP+EiW4tKbzA/od7krmmjOmPoOwCeRWiMu4d8JFiKjnS38ljPyFFtyN8vdpzk
         1drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721422054; x=1722026854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHJzBzbdzklgkKRPKdhiHUJxCYQfxUrxJQaa17KDIKA=;
        b=QpgB8V6vU5GppxpQ3L8y55WmE/Lja+2DvAR1C7dNflq3xEunijfXZf2jtTzrWdIuHH
         VnLF36odUPLGFy3xQNVoor3FoOnc2NndlK2dQ8xrxGo3EbIlQ1cCyn+XP5TCAOPlKMKJ
         zF4VP0oszpD42F4SQJBpB9/0VJNMyK6R4lt7HbpgF5ZqIMIJQOaHfPTUfgNOYepg83MF
         5UPj/dBzCUxJ3rPeKMMs0p4CZKdbmI4UbZ2obzbsNqzap6THQmoHHO3xSPtiMpv5bdHR
         yL4wqsRDSG7nx9hCkGPxCw9TETFQQYtKjxgtRbCr9/IhpPuRpjd1ZK6iW8MxNZ48ajgd
         DnrA==
X-Forwarded-Encrypted: i=1; AJvYcCW3D0NAY9WOBOgc4qw35CSDIMLBvcrYHa33KAE4mHQlemGqFGWUFCzQ6q8dD2tvQW+PiVaD2TBV//RW7Qvbx6X4ODAULS26jkgWf+E=
X-Gm-Message-State: AOJu0YwdFdGyTA4D6XV24GqrOFpIM3Zoy01Mz1fy03lVsEOmMjqez4tl
	l0A8VhfLu59wlRIpy+oorGj15wZkeuZtHEpH4mfEkDXHuCYamzLdx81fdroHJEdf30TenmhNzup
	xxPu6u8R6vAX3ulnJ7IMh+9pfTkY=
X-Google-Smtp-Source: AGHT+IFMpwzov7uCFemfP4KsoIKQlYs1zWHibfePirGykGkN/1T0jFnhCDhmvchk19y7h0BysI33plGJOjMw0X1BAGQ=
X-Received: by 2002:a05:622a:4c:b0:447:efa7:7eb7 with SMTP id
 d75a77b69052e-44f9684fc42mr89315051cf.0.1721422054009; Fri, 19 Jul 2024
 13:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKbZUD1-kqfuV0U+KDKPkQbm=RwzD_A1H3qk_c+bw92CqtMbuw@mail.gmail.com>
 <CAKEwX=NkWzyhb6dZeV1=sGKwurwhk7wMcH_RtwJ9ztgABjMyfQ@mail.gmail.com> <CAKbZUD3yM0kjbeqdscG3gVhoMz5hNZjCxV9xSQepCEpL=qGa5w@mail.gmail.com>
In-Reply-To: <CAKbZUD3yM0kjbeqdscG3gVhoMz5hNZjCxV9xSQepCEpL=qGa5w@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 19 Jul 2024 13:47:23 -0700
Message-ID: <CAKEwX=OOCc0nxheE3yTJgTR0K7XXL2_TcKp7jt_zt4NbDLv8Dg@mail.gmail.com>
Subject: Re: zswap_writeback_entry crashes in 6.9.5
To: Pedro Falcato <pedro.falcato@gmail.com>
Cc: mm <linux-mm@kvack.org>, Linux Regressions <regressions@lists.linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosryahmed@google.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Christian Heusel <christian@heusel.eu>, yshuiv7@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 11:57=E2=80=AFAM Pedro Falcato <pedro.falcato@gmail=
.com> wrote:
>
> On Mon, Jul 1, 2024 at 2:07=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
> >
> > On Sun, Jun 30, 2024 at 10:58=E2=80=AFAM Pedro Falcato <pedro.falcato@g=
mail.com> wrote:
> > >
> > > Hi everyone,
> >
> > Hi Pedro,
> >
>
> I have a separate theory. I also run the NVIDIA proprietary drivers.
> slabinfo -a shows us:
> [...]
> :0000080     <- zswap_entry Acpi-Parse kernfs_iattrs_cache
> uvm_tools_replay_data_t Acpi-State audit_tree_mark
> [...]
>
> See the uvm_tools_replay_data_t there? Yeah, it's entirely possible
> some random nvidia.ko bug has been corrupting zswap_entry from time to
> time (which explains why e.g the big server people have not seen
> this).

Oh this is fascinating. I would never have guessed this. Thanks for
doing the investigation!

> I'm not sure if Yuxuan is running the same driver, but their kernel is
> also proprietary-tainted.
>
> As such I'll refrain from posting more about this or similar bugs
> until I can get a guarantee it happens with a non-tainted kernel
> (fwiw, I have not seen crashes for 2 weeks or so, hopefully this issue
> is fixed).

Crossing my fingers :)

>
> Again, sorry for not checking the taint before posting this, and thank
> you for your time :)

No worries at all :) Let me know if there are new developments
regarding this issue, or if you are able to confirm one way or another
:)
