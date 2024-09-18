Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A272F18A924
	for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726667523; cv=none; b=rPB6mNu6e4CG6viZnR8szvHLFyroHta9SpSE4j06M0M9yhUk9xGXleqqJAjC8I1WJM/73gakCO0mXYOUY03ho88NuFOwx6BFNCrm5QcUEXHwtYQ+rcOBWwaY6jqqyBtPd3yEtl5ahsSGXiXD2aCdtEionXnUjpk2xHSr7X4Rj9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726667523; c=relaxed/simple;
	bh=jJVr2CDyy7rQp2h2UjSJiI9buPJ4d++KINwnkdK6qcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KkVsP6AoBMfLtKV2MAUILi5ykEBetpPnaHKljH+Q0vDXhwabOfGi79sh8pBg5XPw9+SKf70sFg0uk6KqyD5wHES4yftlMV3v+SGQPD7j1fxAqmlAmx6tUiooDeVO9k03Zixzv6yYXtd34E+j8uOjJ9EBcWJaTpQm9nrzWevicHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UMB/rvgV; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UMB/rvgV"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5365c060f47so7627656e87.2
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726667519; x=1727272319; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+OjIl9uDxGAJUC7PJ0lAX4rCR6IE5m7Lsi7Ws5gE7Fw=;
        b=UMB/rvgVn1QDNOg9p8Az85QAPAzOCqbQgu/oKm9cq92TTlnA63m84Y4AG2I1OV4qom
         dJX1/OYKhw3o5tHuo41z96HI1xCAfrHPRp7GBbSStV9SVN7+HAYcfP1LTLzSlLdQeJ3X
         +icqqNjxd34RIDq0q1z1hGINqjMPbwvjHCOFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726667519; x=1727272319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OjIl9uDxGAJUC7PJ0lAX4rCR6IE5m7Lsi7Ws5gE7Fw=;
        b=URLexYoI+4tuOMlpAQ6acBUC6vttemvvZ1gg2QGDSk3iQ9MVvLmaxn5JxaTRMqIxim
         QE3k/V0OOimt9V49sZYEs10nHWQhkwv4cT9QYQ3NOHWKnt4Cm3OGhUZviSmD3UVpCyLH
         ZYdWYFSq4OlBZh7vIVPnc+asb44O+zkVQGo1tLHvZ3R6U7uOKnkYB8pF+viC4oM5TZmc
         ooA+fLJrsUNXMhsySSKQEHjllMaTJ7kQxFUNOdzeOqprt11DO6Uj88JzUav/WjnjMiC2
         rhHs4l+pHLYAhJkqKzDPRZtDPud/Sa0fOUgYn1kOO7eieIMTSpE4p/NEdCghyhyABqFn
         bygg==
X-Forwarded-Encrypted: i=1; AJvYcCUiADiNqjwHj5Tpxv6ZLlLg5QZN9F2VN5DhW05v+kXNIaBf2tN8RVC3OqZAnqc2jyBSeaY1RpX5Ay1b8A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5WpHJENwv0gj8TZ4H4Sl0kLcw519m8BZsIy2XlZx3LAdm0ukZ
	MRbV3lxNYGrIOJoKDUIZLcOf+7JiCavdGi2MwPDeAW4NXdDv8f4rJcMGk2MwSGbskZ4vpL665c4
	hWO0NuA==
X-Google-Smtp-Source: AGHT+IGSxm83bweZ0o48CiM3vDD8ZXtTVQvSOzkgHMD+MWsuK00Esp1Fxp1x4F/tHlsOkxMXTrASNQ==
X-Received: by 2002:a05:6512:acf:b0:536:55ef:69e8 with SMTP id 2adb3069b0e04-53678f67acamr11746667e87.0.1726667519509;
        Wed, 18 Sep 2024 06:51:59 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5369ef5b90csm324947e87.26.2024.09.18.06.51.56
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 06:51:57 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-536584f6c84so8662438e87.0
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 06:51:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGRxTUALR9DS+1UUfNcCMkfuGWx9oJStNPacv03I9hFVC4wAMLJoHj1yjGWFA6zZykjEuxPoJoFBmPLw==@lists.linux.dev
X-Received: by 2002:a05:6512:4019:b0:52e:fc7b:39cb with SMTP id
 2adb3069b0e04-53678fce759mr13328998e87.26.1726667516650; Wed, 18 Sep 2024
 06:51:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0fc8c3e7-e5d2-40db-8661-8c7199f84e43@kernel.dk>
 <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>
 <Zud1EhTnoWIRFPa/@dread.disaster.area> <CAHk-=wgY-PVaVRBHem2qGnzpAQJheDOWKpqsteQxbRop6ey+fQ@mail.gmail.com>
 <74cceb67-2e71-455f-a4d4-6c5185ef775b@meta.com> <ZulMlPFKiiRe3iFd@casper.infradead.org>
 <52d45d22-e108-400e-a63f-f50ef1a0ae1a@meta.com> <ZumDPU7RDg5wV0Re@casper.infradead.org>
 <5bee194c-9cd3-47e7-919b-9f352441f855@kernel.dk> <459beb1c-defd-4836-952c-589203b7005c@meta.com>
 <ZurXAco1BKqf8I2E@casper.infradead.org>
In-Reply-To: <ZurXAco1BKqf8I2E@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Sep 2024 15:51:39 +0200
X-Gmail-Original-Message-ID: <CAHk-=wjix8S7_049hd=+9NjiYr90TnT0LLt-HiYvwf6XMPQq6Q@mail.gmail.com>
Message-ID: <CAHk-=wjix8S7_049hd=+9NjiYr90TnT0LLt-HiYvwf6XMPQq6Q@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Matthew Wilcox <willy@infradead.org>
Cc: Chris Mason <clm@meta.com>, Jens Axboe <axboe@kernel.dk>, Dave Chinner <david@fromorbit.com>, 
	Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Sept 2024 at 15:35, Matthew Wilcox <willy@infradead.org> wrote:
>
> Oh god, that's it.
>
> there should have been an xas_reset() after calling xas_split_alloc().

I think it is worse than that.

Even *without* an xas_split_alloc(), I think the old code was wrong,
because it drops the xas lock without doing the xas_reset.

> i wonder if xas_split_alloc() should call xas_reset() to prevent this
> from ever being a problem again?

See above: I think the code in filemap_add_folio() was buggy entirely
unrelated to the xas_split_alloc(), although it is probably *much*
easier to trigger issues with it (ie the alloc will just make any
races much bigger)

But even when it doesn't do the alloc, it takes and drops the lock,
and it's unclear how much xas state it just randomly re-uses over the
lock drop.

(Maybe none of the other operations end up mattering, but it does look
very wrong).

So I think it might be better to do the xas_reset() when you do the
xas_lock_irq(), no? Isn't _that_ the a more logical point where "any
old state is unreliable, now we need to reset the walk"?

                   Linus
