Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49EC13698F
	for <regressions@lists.linux.dev>; Mon, 16 Sep 2024 00:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726444825; cv=none; b=q07pZQfPAuXDxZ9IKX370+iLZJ1ytuw7OS3P7pzuesjQGUc9DVWSXwKVYV2ECGw7GXLJ1ufleL653PykXqNiAcf+EFO6a97pmAINYogiI78z0O96FzG19D1Sj4rcW42HUp54Tch8zsg1RjA7bjIJyQPWR9psuIvx88zwpNJifQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726444825; c=relaxed/simple;
	bh=Bk6VaLA8U1o7y/shFK8tVIvvxwhrWjMjA7XJdgB4N/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5QZrZQ/Ta6bUmHZXW0B2M9Qc0NuWsQZBZazBz4uWc6WlZ84NaCDsZxF/rZ5SsgjE1G5GDpQezqNA25e6FF9VshXjNdDIoInMvlolKRuOf4xXQqPdTwUF5fFZHOyo68i5yYiCqzFI73IHbA5JYiNHabOydtlA/NsBN/ekjpeemQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=gK35+aT7; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="gK35+aT7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2057c6c57b5so23061685ad.1
        for <regressions@lists.linux.dev>; Sun, 15 Sep 2024 17:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1726444823; x=1727049623; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yiTneBRUQz0c7oUx85pbwoHLabaV+URnFTxx3H0XSE8=;
        b=gK35+aT7Ew0b7o49xjLaiH8+p9araOc7hRVnE/U86tCgEk9TqotvDeGbKNc4nJTL79
         v+xCMUydXRwNfQG28VSadUNmkPjVmYq4cpPr6Gs0MdAYsEjU9w7guLzTS/+zda/Ve7Nm
         x9/tS0vOgoFzHuBOx5yXqg9g/i3ur19JlSYOLiEShSgWwCeMUanMiDP/aD0bkmffzJjk
         WauB432f1Jz9BUKc5mmPp2uR8SydBgAsh+FNlnfXT5QKIAEVHOcurshPnvRSYv8w1hjl
         Y3gcJUMB4jIoKsVjZQXasVvX73OGw355gAtXKLZiTxUmgCDvIkzjtUN0fiLAhZf/e/wR
         OTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726444823; x=1727049623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiTneBRUQz0c7oUx85pbwoHLabaV+URnFTxx3H0XSE8=;
        b=mQ2pPQhXTEUz4m/LrQgalUKwGr1vUDEUNx5NvgNTJ+RHUur7FmDY/tUhY2wU+T1aAO
         XkJeomtgSoxnmPPuBLSP7/ngUq+wuLhwK1qqAPG/JBAVA9GKVBu8/e/UnQyoOJkEe9XL
         OvuevPMCY9L5GwfUP3J71u30tsBUq0xhpA3O20cg+UL7Y7M1VT8HtSjQfZGwZ4r9WJP1
         Vdau0ntRfNDfaExfmdd7GO4mIDx3tqDpb/mBzdO+gcZDrq9W5q2AyF01sOjUaW18MVmN
         3kvXTXObFSaajKrvDYCU2nR5Piu6Lrio2nMfeTYGlNXe+6dbeEtNJb8DLc6nv0U4xYuS
         6OqA==
X-Forwarded-Encrypted: i=1; AJvYcCUhpEuG8em9hQxz598xnyp0HiTPRkDOns5x9ECS1eY/VoQIF4Qt9jXKUeaFvUWn03jyoNy06D3h+jerVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGhRtdZyZgMI1o9nJKqm5Ck4bRp6cDWAflJxLG7xXNEh/M+IHX
	We2noHYQnS//6nP23VTXdoVxCy3/ImkBmlNH99u1lAoV2Qoxi17Hvg0cA3Uf4wU=
X-Google-Smtp-Source: AGHT+IEL1eQKv3NuUXB18zqkV0UW1Ie5TJSdwTXsRLrQ2G5lCXlhwJhgyjhFRZZ66d6/+lADVVDKkA==
X-Received: by 2002:a17:902:ce92:b0:207:6d2:1aa5 with SMTP id d9443c01a7336-2076e591737mr218814085ad.13.1726444822748;
        Sun, 15 Sep 2024 17:00:22 -0700 (PDT)
Received: from dread.disaster.area (pa49-179-78-197.pa.nsw.optusnet.com.au. [49.179.78.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945dc76asm26908985ad.42.2024.09.15.17.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 17:00:22 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1spzAA-005hUa-2C;
	Mon, 16 Sep 2024 10:00:18 +1000
Date: Mon, 16 Sep 2024 10:00:18 +1000
From: Dave Chinner <david@fromorbit.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>, Matthew Wilcox <willy@infradead.org>,
	Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Dao <dqminh@cloudflare.com>, clm@meta.com,
	regressions@lists.linux.dev, regressions@leemhuis.info
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
Message-ID: <Zud1EhTnoWIRFPa/@dread.disaster.area>
References: <A5A976CB-DB57-4513-A700-656580488AB6@flyingcircus.io>
 <ZuNjNNmrDPVsVK03@casper.infradead.org>
 <0fc8c3e7-e5d2-40db-8661-8c7199f84e43@kernel.dk>
 <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>

On Thu, Sep 12, 2024 at 03:25:50PM -0700, Linus Torvalds wrote:
> On Thu, 12 Sept 2024 at 15:12, Jens Axboe <axboe@kernel.dk> wrote:
> Honestly, the fact that it hasn't been reverted after apparently
> people knowing about it for months is a bit shocking to me. Filesystem
> people tend to take unknown corruption issues as a big deal. What
> makes this so special? Is it because the XFS people don't consider it
> an XFS issue, so...

I don't think this is a data corruption/loss problem - it certainly
hasn't ever appeared that way to me.  The "data loss" appeared to be
in incomplete postgres dump files after the system was rebooted and
this is exactly what would happen when you randomly crash the
system. i.e. dirty data in memory is lost, and application data
being written at the time is in an inconsistent state after the
system recovers. IOWs, there was no clear evidence of actual data
corruption occuring, and data loss is definitely expected when the
page cache iteration hangs and the system is forcibly rebooted
without being able to sync or unmount the filesystems...

All the hangs seem to be caused by folio lookup getting stuck
on a rogue xarray entry in truncate or readahead. If we find an
invalid entry or a folio from a different mapping or with a
unexpected index, we skip it and try again.  Hence this does not
appear to be a data corruption vector, either - it results in a
livelock from endless retry because of the bad entry in the xarray.
This endless retry livelock appears to be what is being reported.

IOWs, there is no evidence of real runtime data corruption or loss
from this pagecache livelock bug.  We also haven't heard of any
random file data corruption events since we've enabled large folios
on XFS. Hence there really is no evidence to indicate that there is
a large folio xarray lookup bug that results in data corruption in
the existing code, and therefore there is no obvious reason for
turning off the functionality we are already building significant
new functionality on top of.

It's been 10 months since I asked Christain to help isolate a
reproducer so we can track this down. Nothing came from that, so
we're still at exactly where we were at back in november 2023 -
waiting for information on a way to reproduce this issue more
reliably.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
