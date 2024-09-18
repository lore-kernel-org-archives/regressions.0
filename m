Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481901BBBCE
	for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726670447; cv=none; b=I6bnLcATRrNeNrBiau6sfDD4tRz49iRcYTigngiKNK1utv77MqF8od18ZLsruxVFWSaOXKHwxmyDdBXXEbjFNlpp9KX6g0aFstz8orED9Ae+jIIDg/ohz4RCJE4npYmy6AeL1J5aMxcMLZ+Q7zQdVO3U/5/VQpqF3kTUOxyq1rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726670447; c=relaxed/simple;
	bh=mT3ohME7te8T2As9CrdpUmPIESVaDC3Cl9Dhcw5IwvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nda7Q3AfT/bNVC+TipzfA7+QDyKKzjr10hC+42v9Pj1edMhnGwnLiESbFOhZAdd1Rr9p2ifk1BVDzmJbqlARUjsBDba7R96M9EMXfsyuOxKySABCd3W9CB0XdauDwlJ3bSZjAh6wwXrBUoaYBwkCnnP/cR5Wi+OFU3RQ0afekk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VKt+P12d; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VKt+P12d"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso153798466b.0
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726670443; x=1727275243; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2t1ItWJ3ig5qNarueJWrYx/kj01x5BbGfjJ8rjmQF4o=;
        b=VKt+P12dEYuYO9Bz21K+ayYnDyYqHBvJ6rnq0oRYTMWpY4WTkqX7taWaXttPEDIcjy
         VVXWJqxG26rtqyzBD9ULJ8w/YxA+3SN7i/67zSICsj9IK788ELeRoXyXKlHEeSNmwANk
         NQfN/D7jF3cYwINRHyZo1VWPVyVdhCYMuGfFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726670443; x=1727275243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2t1ItWJ3ig5qNarueJWrYx/kj01x5BbGfjJ8rjmQF4o=;
        b=NCv5jIb4UKJGZ8kOoPlADpixGZlD5WwazyXBGC6vD5V6JRrvbsgl4rAPZfQ0fvt/2O
         e99D0n729mvp6hXarXn1VoYBsD7xFHD1vwrUg/VtIaDDgDH1NzFvx83UmC+4/gtSkSgy
         /ZQ9y9cDkb291JNLRsPQ5tHAyOWUf/LTrBwz+OZv7LSQTH/g4xgcdYzAywuzjEwPMFEt
         DtFzKhExrhwVhUrtgY9XIDWlknx+ye8+2ZdmXdKmyJGByh/u65Acn7Ub141KZdlQTmG5
         5i46uNuOwpBreDk88P5Q7Kz0UuOTyzdo54qHsire2QXSywf92++21i7/s6fjV/ovEAPJ
         IvxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9G4F7Y4dpL+Hi7uvUAlDiz2t9hJkZm6tfUkYvA3Tzugg84aOZXBLETj7ve8/WXcq7tNNkFEOHHSO6KA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9L9upL+O1HXIys4a0Nh6pU1qx1zRML4Mwk6IyYVlqmNokjzzh
	o8QYip3JsWDplDfmaMBsyrt+ud1Jy2yFQxN6d2TuHsyt4MmMSB2NMDNddn3Mz5tWSvg8FWE4l88
	HLyzQmg==
X-Google-Smtp-Source: AGHT+IFiqyS0MstMz82HKe1BM8b8aoYumRK5MH/XwfkO9iOyV56x5fpy9+ZaYxD1Io6bg+xwRViIKw==
X-Received: by 2002:a17:906:fd88:b0:a72:7ede:4d12 with SMTP id a640c23a62f3a-a902a3d168amr2321398066b.5.1726670443313;
        Wed, 18 Sep 2024 07:40:43 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b38bdsm597739766b.110.2024.09.18.07.40.14
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 07:40:23 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c24ebaa427so1392700a12.1
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 07:40:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWhlqwwt0D1F7l+xp7lX27aUXyjfDT56I8Sqj6AYIQcN50BndZfBnTpZlnPiPc3VfvlWZ72Dj3ZlB/mQ==@lists.linux.dev
X-Received: by 2002:a05:6402:2189:b0:5c4:178a:7162 with SMTP id
 4fb4d7f45d1cf-5c4178a7270mr24593373a12.19.1726670413894; Wed, 18 Sep 2024
 07:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zud1EhTnoWIRFPa/@dread.disaster.area> <CAHk-=wgY-PVaVRBHem2qGnzpAQJheDOWKpqsteQxbRop6ey+fQ@mail.gmail.com>
 <74cceb67-2e71-455f-a4d4-6c5185ef775b@meta.com> <ZulMlPFKiiRe3iFd@casper.infradead.org>
 <52d45d22-e108-400e-a63f-f50ef1a0ae1a@meta.com> <ZumDPU7RDg5wV0Re@casper.infradead.org>
 <5bee194c-9cd3-47e7-919b-9f352441f855@kernel.dk> <459beb1c-defd-4836-952c-589203b7005c@meta.com>
 <ZurXAco1BKqf8I2E@casper.infradead.org> <CAHk-=wjix8S7_049hd=+9NjiYr90TnT0LLt-HiYvwf6XMPQq6Q@mail.gmail.com>
 <Zurfz7CNeyxGrfRr@casper.infradead.org>
In-Reply-To: <Zurfz7CNeyxGrfRr@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Sep 2024 16:39:56 +0200
X-Gmail-Original-Message-ID: <CAHk-=whNqXvQywo305oixS-xkofRicUD-D+Nh-mLZ6cc-N3P5w@mail.gmail.com>
Message-ID: <CAHk-=whNqXvQywo305oixS-xkofRicUD-D+Nh-mLZ6cc-N3P5w@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Matthew Wilcox <willy@infradead.org>
Cc: Chris Mason <clm@meta.com>, Jens Axboe <axboe@kernel.dk>, Dave Chinner <david@fromorbit.com>, 
	Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Sept 2024 at 16:12, Matthew Wilcox <willy@infradead.org> wrote:
>
>
> That's actually OK.  The first time around the loop, we haven't walked the
> tree, so we start from the top as you'd expect.  The only other reason to
> go around the loop again is that memory allocation failed for a node, and
> in that case we call xas_nomem() and that (effectively) calls xas_reset().

Well, that's quite subtle and undocumented. But yes, I see the
(open-coded) xas_reset() in xas_nomem().

So yes, in practice it seems to be only the xas_split_alloc() path in
there that can have this problem, but maybe this should at the very
least be very documented.

The fact that this bug was fixed basically entirely by mistake does
say "this is much too subtle".

Of course, the fact that an xas_reset() not only resets the walk, but
also clears any pending errors (because it's all the same "xa_node"
thing), doesn't make things more obvious. Because right now you
*could* treat errors as "cumulative", but if a xas_split_alloc() does
an xas_reset() on success, that means that it's actually a big
conceptual change and you can't do the "cumulative" thing any more.

End result: it would probably make sense to change "cas_split_alloc()"
to explicitly *not* have that "check xas_error() afterwards as if it
could be cumulative", and instead make it very clearly have no history
and change the semantics to

 (a) return the error - instead of having people have to check for
errors separately afterwards

 (b) do the xas_reset() in the success path

so that it explicitly does *not* work for accumulating previous errors
(which presumably was never really the intent of the interface, but
people certainly _could_ use it that way).

             Linus
