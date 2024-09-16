Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1269AD512
	for <regressions@lists.linux.dev>; Mon, 16 Sep 2024 04:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726460464; cv=none; b=ELZ/kv1zmgeLmVqpRNhzDymauWji6r1F/zEWkXbYRTQNNcn3ASd+a3cxEoSmisdV812y9e4P5FN3peVouAQ0x8yFbm5yAG45FqmulkwR5OS5RXzbs05tJsBmWID8jjzBqQ2wmTDHWEttOsZ84I6CwIoj3xkrmFCqOWkgJFiVQls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726460464; c=relaxed/simple;
	bh=OTJ/oKsnoisoc9GbqLHkeCIc2BFxmDrQOsJxcfR3nk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lk2esaf1eeg3bsUU0w3Sex0OZlLPe8fp3ZhAu+049e7MvXEr/41bSU8v1WdrqDTPQAWkf+VyjAo3suPO0lDZvsbel5NPBw+o7uPlSlr7VDSUxIUYVQu6xNZlFEmjisESAtOo27JXJvlKsmlaI+MBwrfrKhGvFXx36RGfQos3adQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VG2UDOI6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VG2UDOI6"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c3ed267a7bso5060036a12.3
        for <regressions@lists.linux.dev>; Sun, 15 Sep 2024 21:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726460460; x=1727065260; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jwnw+7buV/Co6cDy6nKRIoLyua67GCD7ZNv0sYBhUOM=;
        b=VG2UDOI6GaxQZEyNWJtiXjQJxe6kPmwT7k2zlnEL9RCRgfbyQM4InJNct/4pQlF8uw
         UkzgOCz3ZoimzMmlmoQqz5wRgrwvniomA0amaTDETahv9f6X/UKBrDSfHI08uwltfkCh
         OwdrHkwKrIFT3Opf7P3JtSs6YOJeLSKuLg2AA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726460460; x=1727065260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwnw+7buV/Co6cDy6nKRIoLyua67GCD7ZNv0sYBhUOM=;
        b=JTLspOGjuQe2Mi00/YnXO4c/JCi4TCkhoR46Qr00sH5AR6uJxDTbmAvodQPvXK2FQS
         cCf+1F+bn+U4dz3Hmy3PX9o63odrw+h+rrrgbe67F3byva5wWdw5HNl6cQQQ/ofzF2NS
         2UpD7AyTtExt+MaeDnT2YKpkRA4xQd/KeiXL/pCBx1tLHIUhhETarl+vTU0SAcXo+8gV
         16fL/nXI/XEOq5kPPF0G5MwXrWqYuCGdi5GGErIajl2/m86MQhr1ijgqLUSVO4kLzEQS
         Fwx/OedI2vpzC06BNKMvENQYbub2jyfwx0Fg7BSCGQwJ5QNzC9AcZIRo9PosBfLqg6+/
         42+w==
X-Forwarded-Encrypted: i=1; AJvYcCVzA3DUYjosToy8N0h9tQvA+HSwA78yoEGTNqIUt9tiwc/fUxcqfbM5YmCZvpV8sxxBPmsYb/byffT33Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwE37uzLDD/02TQWadOOjIzYhz6vyrRHPTSCeVId0A93d/m+Zuc
	TgVb0+B9oUJALPbogMO20oN9Aj9DKYCxrT97GBqwuSqhD3/HkyoO0eG6Rx7X8Uevfx3RiHrggFC
	jHuhCIA==
X-Google-Smtp-Source: AGHT+IF9/yyzPw9dimjks0g+RrgxLRbQphrq2zV6aLXcnf7qeavmJXn/QmL32M3q3rYVqZasNOA2YQ==
X-Received: by 2002:a05:6402:17c4:b0:5be:e01c:6b5f with SMTP id 4fb4d7f45d1cf-5c413e541c8mr9660293a12.33.1726460459968;
        Sun, 15 Sep 2024 21:20:59 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb89d44sm2155894a12.70.2024.09.15.21.20.58
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Sep 2024 21:20:59 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c4226a56a8so3082530a12.2
        for <regressions@lists.linux.dev>; Sun, 15 Sep 2024 21:20:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTxUHwfxjj7byOVz2KCIf5ctVrhNDo6HgRkc+aTxsLG1ShlI4rcB6uwirGfw/fOyUdqgJMjvAWamU75Q==@lists.linux.dev
X-Received: by 2002:a05:6402:2107:b0:5c4:367e:c874 with SMTP id
 4fb4d7f45d1cf-5c4367ec9dfmr3443219a12.11.1726460457889; Sun, 15 Sep 2024
 21:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <A5A976CB-DB57-4513-A700-656580488AB6@flyingcircus.io>
 <ZuNjNNmrDPVsVK03@casper.infradead.org> <0fc8c3e7-e5d2-40db-8661-8c7199f84e43@kernel.dk>
 <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com> <Zud1EhTnoWIRFPa/@dread.disaster.area>
In-Reply-To: <Zud1EhTnoWIRFPa/@dread.disaster.area>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Sep 2024 06:20:40 +0200
X-Gmail-Original-Message-ID: <CAHk-=wgY-PVaVRBHem2qGnzpAQJheDOWKpqsteQxbRop6ey+fQ@mail.gmail.com>
Message-ID: <CAHk-=wgY-PVaVRBHem2qGnzpAQJheDOWKpqsteQxbRop6ey+fQ@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Dave Chinner <david@fromorbit.com>
Cc: Jens Axboe <axboe@kernel.dk>, Matthew Wilcox <willy@infradead.org>, 
	Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, clm@meta.com, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Sept 2024 at 02:00, Dave Chinner <david@fromorbit.com> wrote:
>
> I don't think this is a data corruption/loss problem - it certainly
> hasn't ever appeared that way to me.  The "data loss" appeared to be
> in incomplete postgres dump files after the system was rebooted and
> this is exactly what would happen when you randomly crash the
> system.

Ok, that sounds better, indeed.

Of course, "hang due to internal xarray corruption" isn't _much_
better, but still..

> All the hangs seem to be caused by folio lookup getting stuck
> on a rogue xarray entry in truncate or readahead. If we find an
> invalid entry or a folio from a different mapping or with a
> unexpected index, we skip it and try again.

We *could* perhaps change the "retry the optimistic lookup forever" to
be a "retry and take lock after optimistic failure". At least in the
common paths.

That's what we do with some dcache locking, because the "retry on
race" caused some potential latency issues under ridiculous loads.

And if we retry with the lock, at that point we can actually notice
corruption, because at that point we can say "we have the lock, and we
see a bad folio with the wrong mapping pointer, and now it's not some
possible race condition due to RCU".

That, in turn, might then result in better bug reports. Which would at
least be forward progress rather than "we have this bug".

Let me think about it. Unless somebody else gets to it before I do
(hint hint to anybody who is comfy with that filemap_read() path etc).

                 Linus
