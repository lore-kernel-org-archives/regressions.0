Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDBB1AC8A4
	for <regressions@lists.linux.dev>; Tue, 24 Sep 2024 19:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727205877; cv=none; b=pHRaxTYxQLdle0vZ0WTZBfDtHiC8GBnf13mh5rRA5aQKMqBqGXtPcK4GX8eMJ4Cge39auGyPM+78SA0M9nDB4rvVPICTw8Zo+ipIfX3zLJ8bSnFvsdpRwp+90ORolmENslXyNUvaw9A5IZdfO5RwkRmHFHaqnojGIIL+1Bv9Bl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727205877; c=relaxed/simple;
	bh=SIeQoyCxYAQebwPctse0ec/xuA/Q6FV0i8cdsXtARic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oJMbqiNvE8AMRbuKE4ELxK+BxczgumPhV1lKb+qW9UtpjGjLI1hT9NRedkOG8S3Z/H/h0/7lNsSWJWyhAfEZ3SjQQT+VeNsf18teoLfJf8EKjHlgPwgdD/A64vE1j7qFCkoyQwB7mpfBTQdL5Xmvrnfi43Qh5Ot0qWl0BKRTNbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fZ3Ts/NP; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fZ3Ts/NP"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c718af3354so1159154a12.0
        for <regressions@lists.linux.dev>; Tue, 24 Sep 2024 12:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727205873; x=1727810673; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3AEQwCgf5wgX6ZTyJ9aWNB159Y5/5DzJz6MiCsxsiWg=;
        b=fZ3Ts/NPM77iU5QnakbaWhghoa9gqEHjli8WxTueASiFcAEKXY0QBO6oi2d5+vdLSQ
         P3r4tnaqLzpIWJrBWI4AeBaroWoJi4nHo+q7j21yL6CEW031hwziNG6OLLRyWeWnBRbt
         bcGZq5jqZJdNH3gw1Zphkmm4gpZwB008R1SqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727205873; x=1727810673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3AEQwCgf5wgX6ZTyJ9aWNB159Y5/5DzJz6MiCsxsiWg=;
        b=ijN9JIZHryfqcQM4bU5CDazXlI5BNSv9pAJDixkXBScxRIK2Mfr4Sbwm8l/0D6XOJv
         wgXRmjbVr9tSsaoWrr0e8xULH15Zvxlz4kFV/ftOpDxGgENX5RvtpFnD/W8E28XuMlVX
         P30Bp0B9AjphEtgUNDJbRByUP8FNTY0e29sVyjeCXgIfTe+0jhFyLi87Oq9ON6EaFxyZ
         J9L8CKUQTLegtu8lHkb3BiNy3ggsiaWZTBbzhlcRnlMM+Vy2Tg5IPvUljr2q1YjCoQzK
         eTqCAqjMTXK6eAbe5/03MgbTQmrB/jS+A2qDm8rqUBtKPSgU3eHPJFnSZvvct2nS5MlK
         nNBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXId/NGdQNfLpmGKowRgUU23LS/17OHIa3D2NK4bsEY42xiH7lSg7woQVxhi71YpbWbIKr8Um8GH2zMyg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzcjz8ibN9nsjo4fdtld12WMixHyS7WIfd5TJ658BPMGhpUEena
	EKKHdpLOr6RU3k1bghu3Y2SREyOssQgG1ugil/uij2Vh6/uO1bG8QlgaN8RlCe0vXyHoATKaRwz
	f8DW7cQ==
X-Google-Smtp-Source: AGHT+IG47R/QZZbkgOCMwb6GITj2LoDPJq33XrdfePcSSOKSan1vesQTeHInh4v8yQScL0PJEDOg9g==
X-Received: by 2002:a05:6402:1d4e:b0:5c7:1f93:72d5 with SMTP id 4fb4d7f45d1cf-5c72060acc2mr257008a12.7.1727205872988;
        Tue, 24 Sep 2024 12:24:32 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf49dd4esm1083775a12.56.2024.09.24.12.24.31
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 12:24:31 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c42e7adbddso7812769a12.2
        for <regressions@lists.linux.dev>; Tue, 24 Sep 2024 12:24:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBi5RnapBbJVq4+6lWeLGGCgo3f9UPNQkQwKht7QC+8a4UCWInz9ZVCTXN2J8gLQFudQqeTcmXXYYZgw==@lists.linux.dev
X-Received: by 2002:a17:907:9726:b0:a86:799d:f8d1 with SMTP id
 a640c23a62f3a-a93a06333edmr32505866b.47.1727205871314; Tue, 24 Sep 2024
 12:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZulMlPFKiiRe3iFd@casper.infradead.org> <52d45d22-e108-400e-a63f-f50ef1a0ae1a@meta.com>
 <ZumDPU7RDg5wV0Re@casper.infradead.org> <5bee194c-9cd3-47e7-919b-9f352441f855@kernel.dk>
 <459beb1c-defd-4836-952c-589203b7005c@meta.com> <ZurXAco1BKqf8I2E@casper.infradead.org>
 <ZuuBs762OrOk58zQ@dread.disaster.area> <CAHk-=wjsrwuU9uALfif4WhSg=kpwXqP2h1ZB+zmH_ORDsrLCnQ@mail.gmail.com>
 <CAHk-=wgQ_OeAaNMA7A=icuf66r7Atz1-NNs9Qk8O=2gEjd=qTw@mail.gmail.com>
 <8697e349-d22f-43a0-8469-beb857eb44a1@kernel.dk> <ZuuqPEtIliUJejvw@casper.infradead.org>
 <0a3b09db-23e8-4a06-85f8-a0d7bbc3228b@meta.com> <15f15df9-ec90-486a-a784-effb8b2cb292@meta.com>
In-Reply-To: <15f15df9-ec90-486a-a784-effb8b2cb292@meta.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Sep 2024 12:24:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiAQ23ongRsJTdYhpQRn2YP-2-Z4_NkWiSJRyv6wf_dxg@mail.gmail.com>
Message-ID: <CAHk-=wiAQ23ongRsJTdYhpQRn2YP-2-Z4_NkWiSJRyv6wf_dxg@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Chris Mason <clm@meta.com>
Cc: Matthew Wilcox <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Chinner <david@fromorbit.com>, Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Sept 2024 at 12:18, Chris Mason <clm@meta.com> wrote:
>
> A few days of load later and some extra printks, it turns out that
> taking the writer lock in __filemap_add_folio() makes us dramatically
> more likely to just return EEXIST than go into the xas_split_alloc() dance.

.. and that sounds like a good thing, except for the test coverage, I guess.

Which you seem to have fixed:

> With the changes in 6.10, we only get into that xas_destroy() case above
> when the conflicting entry is a shadow entry, so I changed my repro to
> use memory pressure instead of fadvise.
>
> I also added a schedule_timeout(1) after the split alloc, and with all
> of that I'm able to consistently make the xas_destroy() case trigger
> without causing any system instability.  Kairui Song's patches do seem
> to have fixed things nicely.

<confused thumbs up / fingers crossed emoji>

              Linus
