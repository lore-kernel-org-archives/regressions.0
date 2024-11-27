Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36CD1F8EF8
	for <regressions@lists.linux.dev>; Wed, 27 Nov 2024 11:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732707850; cv=none; b=ZxLI8H5g6TBpR10+BDPVBTtikqeaRD3mXYnj+gsyejftYcguDA74KlmI6/LAIckQAXDgCjXAi7+wBPLG4BAVGb+3E7uBEqSWdpBjBo8RhsFs6kSH4CFDSgCXrTCYvHyNdYkoGVgqDQY2TbRs9b1rbRXF0rt7KwXJ7QcTAfZMM5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732707850; c=relaxed/simple;
	bh=3MJc/5UOELzc3lLNFqRKXX8mgJlL9/yF9oMnIRGKDoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=b/7GL2hu6f2Bo2IemUVA3koC/YhU8gHbTdGKJxyQSzouFKJfTF0GGJYlnIiioI4eMnJWS4662RAiV1JxI4HJ/GedzkTnzPuN/oWXpEiU9/qUnGKdIyyD0dadaiM1HpwrtSttkhfan+Fg7buqc/kLV1ip3HOP7pb9+7r5Ir2EB+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=deGH29hy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="deGH29hy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732707847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q6plBpEJGUo30qTAHoa8kP1VkYTUsju/s0g4R1t9GME=;
	b=deGH29hyH93ovw73l3bqx2fuw+v+frG+nNHPge3UCSWubFo6LnLqt+NzK78eT6rsI7xWny
	P5RFhZKRXS4JW8i1xIWmJX8J7JofixoMM19Fy4Lx2RS2B9ZGEMyRYY5GYJ/g/A1uIalgn6
	voPvLC1MsDnyQtVhsww9AnmO/ogo/gA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-WpT5yBGQNX-c-y3eO-GtyA-1; Wed, 27 Nov 2024 06:44:06 -0500
X-MC-Unique: WpT5yBGQNX-c-y3eO-GtyA-1
X-Mimecast-MFC-AGG-ID: WpT5yBGQNX-c-y3eO-GtyA
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-434941aa9c2so27014875e9.3
        for <regressions@lists.linux.dev>; Wed, 27 Nov 2024 03:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732707845; x=1733312645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6plBpEJGUo30qTAHoa8kP1VkYTUsju/s0g4R1t9GME=;
        b=rImWnoenm+t7K9TQwokYOl1LfebeGcJ8765uBx4T/1dlyJStKx/u2J+vnbMlDACPoc
         +ouD19R7uN8OczJO6+wJ3+lmMa+YH6rJxEpmztzVfXDNzaOQ7RvLIY3RNf99IjzLgcm8
         V4yP61zfJd8L3i8zW0YfE8oFp7rI5eHsupm+WzeNqiBfC/nr1lCq08q3VqqQMwdR+k8R
         pBxvhZkB5i7uoBH/1cQamDTpr/8VMj6Xckobc7XFDxXNSnDO4CStZyg8aS2OTurRmUJ9
         JTS+NT4rjFeulBE32D7H5oSx3YF8dLqJhtUap5fQ/4hYDSq45uTVWa+n7rzYNn0CQ1Gz
         XOXg==
X-Forwarded-Encrypted: i=1; AJvYcCUmqdxmHghZttm8nQDVIVdC81ce+Etw7lVvY2H/3VIReZ0Q9Av1Ppiueyqn/CDvu6lOPiSgJBrpLiMoUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+vgRcRmS/HlaSNqxZaUsdu0IRPAxNeow1CkOn+yvYGRZ14wZU
	IVhsuk/J1z2KNoDFT+W73CInag8fQntSGbcekqr9754HxXEftTJwP3JabHL6aXb94OhyQbBWwuK
	X7fSs/BtNLRbqixKbMog3s/sq5RkllWFIW+7Rwa/fBbi1fria1tIgAf0MMr2s
X-Gm-Gg: ASbGncu71mmUhNojB1YnMn8tOF5BHth/E3N+6c3RobJk1m0dMIlDVisFarLYhFwn9df
	TZbnECqlKOuz+QcjNKCH0l9P+gLRH7fgxQ5SkEtGnN/qDaWVvS2DIbwwDrqRxDQpOABtZI1RtTL
	dpqsTggRGA4kxVYY4UsbHsgxC+RYwIuxiB/6kZxDyYBCqU9zLKaRMVnGUgbAhDFWsSGbmoQJrLi
	xNQ0oIagcEq3TQmEOEm6G6eIoegp9A8MAv+OaBoVbkv
X-Received: by 2002:a05:600c:1c18:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-434a9dc3dc3mr24715055e9.13.1732707845245;
        Wed, 27 Nov 2024 03:44:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2Wg9xpiostqcOzcuiJnTY1FtTSCTZ0H3Sa8n150z0sqbeWKcs6QkV1Nem+aYEqm93fwrOKw==
X-Received: by 2002:a05:600c:1c18:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-434a9dc3dc3mr24714865e9.13.1732707844929;
        Wed, 27 Nov 2024 03:44:04 -0800 (PST)
Received: from redhat.com ([2a02:14f:1ec:7d4b:8b11:bed7:9e00:8df7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aca7eea8sm6069065e9.34.2024.11.27.03.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:44:04 -0800 (PST)
Date: Wed, 27 Nov 2024 06:44:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: virtualization@lists.linux.dev,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, eperezma@redhat.com,
	Sasha Levin <sashal@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: drivers/virtio/virtio_ring.c:1162:11: error: 'struct
 vring_virtqueue' has no member named 'premapped'
Message-ID: <20241127064312-mutt-send-email-mst@kernel.org>
References: <CA+G9fYsF3x+ZXURQmgA1yQj-eiobr378HbodpJf4ncng7QYXmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CA+G9fYsF3x+ZXURQmgA1yQj-eiobr378HbodpJf4ncng7QYXmg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HIGm92zyIP_fFLStOYLj4KuPNcMCjOzNZTMr3l1YH40_1732707845
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 27, 2024 at 01:30:59PM +0530, Naresh Kamboju wrote:
> The following build errors were noticed for arm64, arm, x86_64 and riscv.
> 
> First seen on Sasha Linus-next 441d2975754ad94f3ce2e29f672824bc2dc5120c.
>   Good: 07e98e730a08081b6d0b5c3a173b0487c36ed27f
>   Bad:  441d2975754ad94f3ce2e29f672824bc2dc5120c
> 
> arm64, arm, riscv and x86_64:
>   build:
>     * clang-19-defconfig
>     * gcc-13-defconfig
>     * clang-19-lkftconfig
>     * gcc-13-lkftconfig
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build error:
> ---------
> drivers/virtio/virtio_ring.c: In function '__vring_new_virtqueue_split':
> drivers/virtio/virtio_ring.c:1162:11: error: 'struct vring_virtqueue'
> has no member named 'premapped'
>  1162 |         vq->premapped = false;
>       |           ^~
> drivers/virtio/virtio_ring.c:1163:11: error: 'struct vring_virtqueue'
> has no member named 'do_unmap'
>  1163 |         vq->do_unmap = vq->use_dma_api;
>       |           ^~
> make[5]: *** [scripts/Makefile.build:229: drivers/virtio/virtio_ring.o] Error 1
> 
> Build image:
> -----------
> - https://qa-reports.linaro.org/lkft/sashal-linus-next/build/v6.11-25212-gbe03d2e1a06f/testrun/26081256/suite/build/test/gcc-13-lkftconfig-rcutorture/log
> - https://qa-reports.linaro.org/lkft/sashal-linus-next/build/v6.11-25212-gbe03d2e1a06f/testrun/26081256/suite/build/test/gcc-13-lkftconfig-rcutorture/history/
> - https://qa-reports.linaro.org/lkft/sashal-linus-next/build/v6.11-25212-gbe03d2e1a06f/testrun/26081256/suite/build/test/gcc-13-defconfig/history/
> - https://storage.tuxsuite.com/public/linaro/lkft/builds/2pPghaTDWgXtaR5FXfFS4Ay3d4C/
> 
> $ git log --oneline
> 07e98e730a08081b6d0b5c3a173b0487c36ed27f..441d2975754ad94f3ce2e29f672824bc2dc5120c
>  -- drivers/virtio/virtio_ring.c
>    441d2975754ad Merge tag 'for_linus' of
> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost into
> linus-next
>    a49c26f761d2b virtio: Make vring_new_virtqueue support packed vring
> 
> Steps to reproduce:
> ------------
> - tuxsuite build \
>     --git-repo https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git
> \
>     --git-sha be03d2e1a06f7bd4be131c48f1c5555e83470a4d \
>     --target-arch arm64 \
>     --toolchain gcc-13 \
>     --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2pPghaTDWgXtaR5FXfFS4Ay3d4C/config
> 
> metadata:
> ----
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git
>   git sha: ed9a4ad6e5bd3a443e81446476718abebee47e82
>   kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2pPghaTDWgXtaR5FXfFS4Ay3d4C/config
>   build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2pPghaTDWgXtaR5FXfFS4Ay3d4C/
>   toolchain: gcc-13, clang-19 and clang-nightly
>   config: defconfig, lkftconfig
>   arch: arm64, arm, x86_64 and riscv


Donnu what it going on here. A mismerge?

> --
> Linaro LKFT
> https://lkft.linaro.org

