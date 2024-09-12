Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16426192B73
	for <regressions@lists.linux.dev>; Thu, 12 Sep 2024 22:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726179973; cv=none; b=k9uH6kDTlUrB9yTqoU2yEd5GgRnwyO0Iwila6jifkBr/nCEUjYZrXAcErmKvaLnLqbJq7LbJYJOd8He3gwCA2aHYfGxMOG5fITV8Mah2PoXQGrBYoc1HQjxDRKfXlURx7WvE5NHAjNXEpaeEDaKpT+dOySIRWhm6CS6rpRhAwkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726179973; c=relaxed/simple;
	bh=KbS83rDiWhetHVtFkjA/wbafpTGhtpNgKVkrYNxEn7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csIkxyapQB1DdwWfrMzLFSF9GbenSOXfjb/mK+FQOMD8bgfW+n4k3XPpG7torNAGlwWQc8zXVqIRlwntd8W8II0st1XhNUQd0rjylbLXn6H7255GJPh49FDBLn5JYuzrsA12KmBu0VqhyKn7L2qvCM17sNcDvrPKXL/wRQUFb0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=I/Oaf+mk; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I/Oaf+mk"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53659867cbdso453530e87.3
        for <regressions@lists.linux.dev>; Thu, 12 Sep 2024 15:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726179969; x=1726784769; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QeNLQ4zvks3207JaJjctekem2eb/h7As09d+6h+vRY8=;
        b=I/Oaf+mkpqvMZt3ojn0UV/9BYXxG+aYUDw4JBUFI+/QAyIqcziZvtHjAtVT+LySdVo
         XdGX6gPqXYf89lV/smnSuh2o8sVnLUCm+BENwgpx7lTfmlc0Qe/g5fIj94WHyoJpVXb6
         +a7usezHA34PSOCDHTwZbF+wBPbxroH2umBhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726179969; x=1726784769;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeNLQ4zvks3207JaJjctekem2eb/h7As09d+6h+vRY8=;
        b=iLk1jlkJxHWKS5XQkVcK+e5D5uqbABxTb75RgHI5dy1rm706/HAErw8Tt/ND1pr0Lv
         udPDbUr6f1dIOSL1OPxBohKMojtUq9TuxdKdjFizev93DreNZE917i6dzU27qTONPxOr
         M3ggaBPEnx7WIWSvFlprizLxB5BnIGIYhSL9/9cxYjz8E85Macg96+lms4m5xjURXMzg
         pMhxJhQr33lY/9k+oWLT5z5mAq4ntIfdRniI2mY3dgSzS96Jql0QtnMA27VPpy9Mkdpz
         M7g6jGaoWM2UZoa9zZJQCMGVVZ/M3B2aztV8z6OAyQb1Z0hU08EIwxZUZhs4sAYyF1dE
         TVGA==
X-Forwarded-Encrypted: i=1; AJvYcCVPU0J2AEVtzTBc/DGqkdTFAtgELRAKqbXcY/A8urtkJEkfCt+58ZtVJuts+DvOBuejaPROobJA6mcKFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMvOEKbGpOqr12nwZUKhwmALen3psge/WfeXYNRnxBuf653ozo
	6oU4ATcDyrN6udSd6LMAQjgnKgPuBXT6LgRkHj1vANHpqItYN1fDSFfsTbxxPYycXzEm9wSQaPQ
	O+6M0yg==
X-Google-Smtp-Source: AGHT+IEKMMaW1FdISDpnDV8xq1xRGynOvrPxIRia9d51LBgmV29ZSakUOuzJTAkvM/FyUOlxJnvebw==
X-Received: by 2002:a05:6512:2812:b0:533:3fc8:9ab9 with SMTP id 2adb3069b0e04-5367fef18femr460651e87.34.1726179968604;
        Thu, 12 Sep 2024 15:26:08 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf6a88sm789383166b.182.2024.09.12.15.26.07
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 15:26:07 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c26a52cf82so126489a12.2
        for <regressions@lists.linux.dev>; Thu, 12 Sep 2024 15:26:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0hc84KH6Wx8JfaHpgB6l/CxYBr5e1yR1/VvhuO3OaDxTYOv74ffdFlIcMCozWw0hkH0a1H7DVJC5Vbw==@lists.linux.dev
X-Received: by 2002:a05:6402:43cd:b0:5c4:ae3:83bd with SMTP id
 4fb4d7f45d1cf-5c41e193d3dmr666054a12.21.1726179967306; Thu, 12 Sep 2024
 15:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <A5A976CB-DB57-4513-A700-656580488AB6@flyingcircus.io>
 <ZuNjNNmrDPVsVK03@casper.infradead.org> <0fc8c3e7-e5d2-40db-8661-8c7199f84e43@kernel.dk>
In-Reply-To: <0fc8c3e7-e5d2-40db-8661-8c7199f84e43@kernel.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Sep 2024 15:25:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>
Message-ID: <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Jens Axboe <axboe@kernel.dk>
Cc: Matthew Wilcox <willy@infradead.org>, Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	Dave Chinner <david@fromorbit.com>, clm@meta.com, regressions@lists.linux.dev, 
	regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Sept 2024 at 15:12, Jens Axboe <axboe@kernel.dk> wrote:
>
> When I saw Christian's report, I seemed to recall that we ran into this
> at Meta too. And we did, and hence have been reverting it since our 5.19
> release (and hence 6.4, 6.9, and 6.11 next). We should not be shipping
> things that are known broken.

I do think that if we have big sites just reverting it as known broken
and can't figure out why, we should do so upstream too.

Yes,  it's going to make it even harder to figure out what's wrong.
Not great. But if this causes filesystem corruption, that sure isn't
great either. And people end up going "I'll use ext4 which doesn't
have the problem", that's not exactly helpful either.

And yeah, the reason ext4 doesn't have the problem is simply because
ext4 doesn't enable large folios. So that doesn't pin anything down
either (ie it does *not* say "this is an xfs bug" - it obviously might
be, but it's probably more likely some large-folio issue).

Other filesystems do enable large folios (afs, bcachefs, erofs, nfs,
smb), but maybe just not be used under the kind of load to show it.

Honestly, the fact that it hasn't been reverted after apparently
people knowing about it for months is a bit shocking to me. Filesystem
people tend to take unknown corruption issues as a big deal. What
makes this so special? Is it because the XFS people don't consider it
an XFS issue, so...

                Linus
