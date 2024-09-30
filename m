Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B56B1A0BC5
	for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 20:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727727181; cv=none; b=PZm80CnRrCbTdlTXfWvqvFTGQndRUhCWTyPGmiw7jf+JXHYy3a6yp4+P7IS0Urr/AAxrQ+xuRmW0UVBUq4ekTJTwf/+VjwhwOHVSL96BlrH3ud2Swm3BAv9A5obENn0q3mjR69NREu8kTBhFW9FQABh4JXMrkOfwWx7xkuG/Zqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727727181; c=relaxed/simple;
	bh=HQF9J8H/AuRUNDVm0LUM1/KuCoSlcEZcddS5OBrqJUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKYwYTh9JG2a40GcjsKVvwk0kop1j5ESQ8f3A8N513rY1hP1HYYKcv6HXY1K0HdQX5rLisb3ukz9YJGoDm5vqQN3UJCSu8M//IaG2eI/r0XX1gthpC/+g+XELCe4Q9yftzviMsuWwr+x1QdXRm+9mauXc8kn3dv79LQAm/SD71A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cMPBerOx; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cMPBerOx"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c876ed9c93so4746014a12.2
        for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 13:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727727177; x=1728331977; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8SU9mjR4XCAezY3L+HkJFDMRx33ZVP0EqsIm6USarM=;
        b=cMPBerOxEvpdNqTzrCRKWHwqI51zY5uEGXgXP4iEp3hkMg1PgOCMuIBq2H9I37vqzf
         R7+Kb+S9lz4fnIkuwOXaAxJ944mvfXdYULLnYFHaByeyv/e77URLqY8/AoaP5VI7MVWt
         dMnWkArJULJgnkqpqQqJ+0kchktarOqYc3qaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727727177; x=1728331977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8SU9mjR4XCAezY3L+HkJFDMRx33ZVP0EqsIm6USarM=;
        b=aU0wwfRLrq00VpCHqXBoNe1IQ+BaZQIjah58iGm8km7CfVXeuoayBppncQ+malLJqz
         efqOaLsnCg14RXTP9yidUqFDirQB6/pgC4Aw5sZG3zPt2DpMt2+x0aQ6sw4/NE7X5n3T
         7G/hXkbIJLszztK/oRwJr7gHRuFuWyVbOoHB+TojWvgcPDvn+gO3B3MP2aSnkPbQtJ35
         2MFtux1ilX6iUkQewRw2IXc6ev8t9Atx4YTmKUl5RXbUNvtMEH5gD1TnIarfoR1tIzwz
         h7c1bkMiRvHmpwqW9QsvuuuBZlidZGKa8mmX7h8HyJKiYt6EAVdO18yN5K8cDHyNCuyP
         1VXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC9OicwhEBjL9ki+e++pIx6t+qo+F0gWFNZ0FUD8zk6WGPjS6CgKwHelXhGSmpWdJdXbNS0GTvcY5uCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYeWQwXuV8xksDRfp4eoiS/zVASIbtx7z10Zp5RGTwwsnLeyNZ
	GcpcsjSYxNguPf7TfFurDecjkyqZMeN2T0P/POF8nESgS4MOVwSQ0nX4ZgP9FSKfNnz1ocjfrHA
	hm3Eg2Q==
X-Google-Smtp-Source: AGHT+IFEAHGAmaw+px0didAHDYchh9OY4Oilt1BolN7r+5BINp7eNu4r4RUhPamExVu1E3kFQh0x+A==
X-Received: by 2002:a05:6402:5cc:b0:5c8:a01a:f644 with SMTP id 4fb4d7f45d1cf-5c8a01af687mr1336062a12.31.1727727177337;
        Mon, 30 Sep 2024 13:12:57 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245e9efsm4967393a12.58.2024.09.30.13.12.55
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 13:12:56 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8b155b5e9eso750966466b.1
        for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 13:12:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWf6sRxdmYP0+nIm1+NLredlK9IM70rXnwRm9HbjHKZ5oGaDAlSPwYk6skcjVqsH/Uo2DB3w/zUOooSSQ==@lists.linux.dev
X-Received: by 2002:a17:907:869f:b0:a72:50f7:3c6f with SMTP id
 a640c23a62f3a-a93c49219f2mr1408201666b.14.1727727175132; Mon, 30 Sep 2024
 13:12:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>
 <Zud1EhTnoWIRFPa/@dread.disaster.area> <CAHk-=wgY-PVaVRBHem2qGnzpAQJheDOWKpqsteQxbRop6ey+fQ@mail.gmail.com>
 <74cceb67-2e71-455f-a4d4-6c5185ef775b@meta.com> <ZulMlPFKiiRe3iFd@casper.infradead.org>
 <52d45d22-e108-400e-a63f-f50ef1a0ae1a@meta.com> <ZumDPU7RDg5wV0Re@casper.infradead.org>
 <5bee194c-9cd3-47e7-919b-9f352441f855@kernel.dk> <459beb1c-defd-4836-952c-589203b7005c@meta.com>
 <ZurXAco1BKqf8I2E@casper.infradead.org> <ZuuBs762OrOk58zQ@dread.disaster.area>
 <CAHk-=wjsrwuU9uALfif4WhSg=kpwXqP2h1ZB+zmH_ORDsrLCnQ@mail.gmail.com>
 <CAHk-=wgQ_OeAaNMA7A=icuf66r7Atz1-NNs9Qk8O=2gEjd=qTw@mail.gmail.com>
 <E6728F3E-374A-4A86-A5F2-C67CCECD6F7D@flyingcircus.io> <CAHk-=wgtHDOxi+1uXo8gJcDKO7yjswQr5eMs0cgAB6=mp+yWxw@mail.gmail.com>
 <D49C9D27-7523-41C9-8B8D-82B2A7CBE97B@flyingcircus.io> <02121707-E630-4E7E-837B-8F53B4C28721@flyingcircus.io>
 <CAHk-=wj6YRm2fpYHjZxNfKCC_N+X=T=ay+69g7tJ2cnziYT8=g@mail.gmail.com> <295BE120-8BF4-41AE-A506-3D6B10965F2B@flyingcircus.io>
In-Reply-To: <295BE120-8BF4-41AE-A506-3D6B10965F2B@flyingcircus.io>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Sep 2024 13:12:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgF3LV2wuOYvd+gqri7=ZHfHjKpwLbdYjUnZpo49Hh4tA@mail.gmail.com>
Message-ID: <CAHk-=wgF3LV2wuOYvd+gqri7=ZHfHjKpwLbdYjUnZpo49Hh4tA@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Christian Theune <ct@flyingcircus.io>
Cc: Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@meta.com>, 
	Jens Axboe <axboe@kernel.dk>, linux-mm@kvack.org, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Sept 2024 at 12:25, Christian Theune <ct@flyingcircus.io> wrote:
>
> I=E2=80=99m being told that I=E2=80=99m somewhat of a truffle pig for dir=
ty code =E2=80=A6 how long ago does =E2=80=9Cold old=E2=80=9D refer to, btw=
?

It's basically been that way forever. The code has changed many times,
but we've basically always had that "wait on bit will wait not until
the next wakeup, but until it actually sees the bit being clear".

And by "always" I mean "going back at least to before the git tree". I
didn't search further. It's not new.

The only reason I pointed at that (relatively recent) commit from 2021
is that when we rewrote the page bit waiting logic (for some unrelated
horrendous scalability issues with tens of thousands of pages on wait
queues), the rewritten code _tried_ to not do it, and instead go "we
were woken up by a bit clear op, so now we've waited enough".

And that then caused problems as explained in that commit c2407cf7d22d
("mm: make wait_on_page_writeback() wait for multiple pending
writebacks") because the wakeups aren't atomic wrt the actual bit
setting/clearing/testing.

IOW - that 2021 commit didn't _introduce_ the issue, it just went back
to the horrendous behavior that we've always had, and temporarily
tried to avoid.

Note that "horrendous behavior" is really "you probably can't hit it
under any normal load". So it's not like it's a problem in practice.

Except your load clearly triggers *something*. And maybe this is part of it=
.

                 Linus
