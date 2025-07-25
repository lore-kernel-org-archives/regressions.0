Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE36D2BF3FB
	for <regressions@lists.linux.dev>; Fri, 25 Jul 2025 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753432722; cv=none; b=YtQ963mvZKA+b+bTtralc3lfhHaGYotzdd4u7wGbLkkMQ+N0UDZptmOsQX8hz4Ohb3ol4Gng8zwOgnRUH9pORn0sKXjUPtibPpjHfR6QUqpzPqoKTktlL65Tb6Ky1KcUjggXGKcoMLsQJ8MAi8kfwDZ+hklaArH9eQZp7gyu3js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753432722; c=relaxed/simple;
	bh=p/sPergCSqvqBREakhNKoleZIUie9w55wmYdj8MbWVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohvCCoNqGkMCTzBDxbLXFFMSdZ8smF1jaYbr5Yrwp9Jhv7Gnbhgx061xp9HnMaYsJyYO7Wfevqk7CU8ho4D/dv+Gm94DTbd4odgOy1A1UqyP3fefykU6e1VfLifHpq9O6h8m8UgDgsOb2HAIFrQZgQDTXqYPCpTRqCnGEpXawxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Edw+uyb4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Edw+uyb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753432720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l839FtmJfD9QeEUNEIgs65whKDPvocBigZOfnNQ86T4=;
	b=Edw+uyb49mgfOzMnK9KBaRYjkK351nsoG4d+fdiWp5jKZi0piQzodvmIOVMwBjPcR7IwuD
	Zr0ZSXn5S0bLUjYYowiIdji/J554Ekauz2NMlkanx9E9KTw8i7TiOpLjKJ7SOPrFjZN21R
	uqrG1Oy4b6r+inNwDJfhcu7i/4XegLg=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-WUmxGIAvPxOhsrxnlOFhjQ-1; Fri, 25 Jul 2025 04:38:38 -0400
X-MC-Unique: WUmxGIAvPxOhsrxnlOFhjQ-1
X-Mimecast-MFC-AGG-ID: WUmxGIAvPxOhsrxnlOFhjQ_1753432717
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so3136019a91.1
        for <regressions@lists.linux.dev>; Fri, 25 Jul 2025 01:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753432717; x=1754037517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l839FtmJfD9QeEUNEIgs65whKDPvocBigZOfnNQ86T4=;
        b=vQgHQjYqTWdpBVMbmVM2rphb1lDNJzRrLKkckptLXFwIiUH9HqMTa5HkzXkTG82RIQ
         0Xu/NG1sXIph7HonhVg1nJdUSS/qDIFmJrYUggZlNAefEfs8HHUW6mZ3kHPN9sAcGNbG
         dYe8kHW2KSMJT06spQ4eZBCIaRcnm/6PYXIU0RwG59YBLfa3nqyzFBLyZve/U8e5Pv3y
         G9L5wM/AlO7CIjq/yDzKo6Aaq6cglJO91ZzRj6xGqM2nlo/YyTZuiGZDUoe5KLWD6PnJ
         sFOMPzSsAFKEFQDflfGg+aUzhmqAwFw+ck535tnKVVQErFitw0OQRoXn2VQ3JavDxkvP
         5LAA==
X-Forwarded-Encrypted: i=1; AJvYcCWGCGEW/OYUzc2gA7NWdkQwKViK4+yyxKpI3NGQN4wK0dwF7YYvjAqRt197UUTRfu2KcfduyZwkTxMs3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEYEScr5M/2F3CPE4hVnN28rA4sltfO7GBE9I87axgSFtiFmQB
	F34CUEfFcZx3Kv9ksq0kcNLxZ9do8g9417j2eSELw26jtu8LVxdh8iUHnS/1vodDGxNxEfrpEJy
	qj6mSCxF8kDSuWir1Y9TXZbLLU80DjiqE7fQ7aLDDwTwnNeT3QWyGdKb5J2+bgW4IjLN05/+Rwb
	AIm+yLW3WcZos1VX4FdITqvfauvTrl4IOuzok0slc=
X-Gm-Gg: ASbGncuQZAIJncDjhXpK4bLLdjoIiXghqV/DSUGD34bIT5Sz1IfKynmUDbISpZLnxrj
	BP2DPmxR89kfcBgOrkQKo/eFujsYYa55XiArWUApuNf4k0cN0yb8twKg/dgLsn2GZ/7wbhg3F4l
	d7+hLyEo79MtRBnDkIag2f
X-Received: by 2002:a17:90b:35cb:b0:312:639:a064 with SMTP id 98e67ed59e1d1-31e77afec2fmr1638830a91.28.1753432717343;
        Fri, 25 Jul 2025 01:38:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8BbwGTpiFIgHKfWf4ykhdVvu66EB0IkDK+M3uuBHxAip1Ohv9ZFi2p5wZH0IQqVXbSMfAhFdTeSqW8PM8WX0=
X-Received: by 2002:a17:90b:35cb:b0:312:639:a064 with SMTP id
 98e67ed59e1d1-31e77afec2fmr1638806a91.28.1753432716948; Fri, 25 Jul 2025
 01:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuBnDVaiZ6Mqhr=4Y2quAsqeZoGfJ158xJ1-Q5HHw=cBw@mail.gmail.com>
In-Reply-To: <CA+G9fYuBnDVaiZ6Mqhr=4Y2quAsqeZoGfJ158xJ1-Q5HHw=cBw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 25 Jul 2025 16:38:25 +0800
X-Gm-Features: Ac12FXwqAD8VmCJzAPOUYLLys8jDigRvmsJk7uLS2PNwF-x1PPSwDp1GEdHtbVA
Message-ID: <CACGkMEtWyJKqQr2yRyhU5=5qg+EH06FXsHRabk3da5iwfCA4FQ@mail.gmail.com>
Subject: Re: next-20250725 i386 x86_64 virtio_ring.c error variable 'id' is
 uninitialized when used here [-Werror,-Wuninitialized]
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, virtualization@lists.linux.dev, 
	clang-built-linux <llvm@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ISKzmlZ_lFuXeviYljQMYhNAsAxALyYU2V4b4nuX694_1753432717
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 3:43=E2=80=AFPM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Regressions noticed while building x86_64 and i386 builds with clang-nigh=
tly
> and clang-20 toolchains on the Linux next-20250725 tag.
>
> First seen on the Linux next-20250725
> Good: next-20250724
> Bad:  next-20250725
>
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
>
> ## Build regressions
> * i386, build
>   - clang-20-defconfig
>   - clang-nightly-defconfig
>
> * x86_64, build
>   - clang-20-allyesconfig
>   - clang-20-lkftconfig
>   - clang-20-lkftconfig-compat
>   - clang-20-lkftconfig-kcsan
>   - clang-20-lkftconfig-no-kselftest-frag
>   - clang-20-x86_64_defconfig
>   - clang-nightly-lkftconfig
>   - clang-nightly-lkftconfig-hardening
>   - clang-nightly-lkftconfig-kselftest
>   - clang-nightly-lkftconfig-lto-full
>   - clang-nightly-lkftconfig-lto-thing
>   - clang-nightly-x86_64_defconfig
>   - gcc-13-allyesconfig
>   - korg-clang-20-lkftconfig-hardening
>   - korg-clang-20-lkftconfig-lto-full
>   - korg-clang-20-lkftconfig-lto-thing
>   - rustclang-nightly-lkftconfig-kselftest
>
> Build regression: next-20250725 i386 x86_64 virtio_ring.c error
> variable 'id' is uninitialized when used here
> [-Werror,-Wuninitialized]
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build log
> drivers/virtio/virtio_ring.c:2113:40: error: variable 'id' is
> uninitialized when used here [-Werror,-Wuninitialized]
>  2113 |                 BAD_RING(vq, "id %u out of range\n", id);
>       |                                                      ^~
> drivers/virtio/virtio_ring.c:2077:19: note: initialize the variable
> 'id' to silence this warning
>  2077 |         u16 last_used, id, last_used_idx;
>       |                          ^
>       |                           =3D 0
> 1 error generated.
>

A fix has been posted here:

https://lore.kernel.org/virtualization/20250725083635.73355-1-jasowang@redh=
at.com/T/#u

Thanks

