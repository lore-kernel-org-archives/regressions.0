Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD241171D
	for <regressions@lists.linux.dev>; Thu, 19 Sep 2024 03:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726715026; cv=none; b=aY0x9QzoPGp/WqaYuJKNmncnWPjLUM20wGZ9nviF/75mufc3/rSoavOAcjvdnVoSDxBdTquDHy+5WHctAMxK5yekCPBwVtgeh69pi0gQjEE4wykuMgcAoemFUYXrDocwoX2BngH2O0Y4B81u6opbsjC6xCzVF1LX0cckn59Hpvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726715026; c=relaxed/simple;
	bh=0MvubnRoO2thymcr3IM6P8f7dqwINBUBTCZ/gsgv40A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YBSGR4+wN4wn8V1sLBJTEQ8Ph10JnGySSaC4kTZHQcxHQo/Oa+HWSbWiG4J8kQX+IQ5nkRUiFWCNRnulOPuxGvt5SuSIsxX5+U/ml5XTDrailOq30im6UGGOop4BHQ4IzvflSh1qhRaz6FYU3cNulqJ8P1PrkKEDLHmWKc7liOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EH6YvvOR; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EH6YvvOR"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f762de00e5so3308311fa.3
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 20:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726715023; x=1727319823; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tyPRcAS13dyaq/sXSJCfCLBh5tay+9ZOU9JDC/uil9A=;
        b=EH6YvvORBTyjUOHTwuGtgjVoC/PR0wu/4WCmZ6InQaHUht37g0rP+h0h8W+jKbGFjc
         +WSTsmBZBhH80qQtOH+WeWzohMJlTSoT82E3lG80TtMt9XNtw9vjda2H//L3sngf2xQR
         gK6aYTxJJlX/DBNcKFmomqnd893FVAM5I1hqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726715023; x=1727319823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyPRcAS13dyaq/sXSJCfCLBh5tay+9ZOU9JDC/uil9A=;
        b=anwny2I2V3KdRXloDWGMzQ2oUYbJlSr/R4gGOkWzMcM6AwqeL+ItNh1ikFw2yPsdZ0
         NF2ARsXOtdwMQsGC8GhXffQ0Vho4nyK8M2h/hwtjK8NY2wjD4Q7zM0DfjadCS7G/c42N
         rImJHNwglDpTZDFV7SUMe9dI2HGq/V7IKAk3RmYIF+av93EDp3OKy6NTzdDBqd+TWeps
         w1QiMq/OIHHu37arhQ52EcJ+vqdRE4V22qCnKnbkPp73s2CgfW3lIGTf7n5VBbwwsavm
         Gyg5ZwMJmBxhOyFAisy5t59v2F+pklK+jEptt3nsxFiLD5bFS1BxvuAbG4/56VMLHtOy
         QZvg==
X-Forwarded-Encrypted: i=1; AJvYcCVVaUxB8PT9NO8ZDrGspT+xYHTh5N8ZngWsw8SthQQM4WGewPwbqHVyiasFAQL3UhZiGvIea8ZGnlCDig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0I+ghtTN5+JBw4QeE3CXlbaLWd9bEgLHZVufvgkr4E6K1czHW
	NkfjgbweqKCTI4pwkpJHgsAsjqvjKXO8waaAYpUVzZ/WdYoogVp8U1PGPOu8tvQoAClH4JlydzA
	rPQm+2w==
X-Google-Smtp-Source: AGHT+IFtUnafEIMiMJiqWLQtHdmXZgR+vwD8B/5g95a8DVEKlDjgi6f2KUj+ndKqySl1WTCIhmwCxQ==
X-Received: by 2002:a05:651c:198e:b0:2ec:637a:c212 with SMTP id 38308e7fff4ca-2f787f57612mr129702361fa.39.1726715022592;
        Wed, 18 Sep 2024 20:03:42 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d59b990sm14737871fa.126.2024.09.18.20.03.40
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 20:03:41 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-536562739baso352581e87.1
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 20:03:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWqOtWX7B8OO5CqV/CW1FjZSmz348Ei8o45LFWgsNpvy8MaMSlN55R5sIMEYUCi7z+vyyv/2iZgujtbg==@lists.linux.dev
X-Received: by 2002:a05:6512:220d:b0:535:6a75:8ac8 with SMTP id
 2adb3069b0e04-53678fc24e6mr13825268e87.23.1726715020071; Wed, 18 Sep 2024
 20:03:40 -0700 (PDT)
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
In-Reply-To: <ZuuBs762OrOk58zQ@dread.disaster.area>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Sep 2024 05:03:23 +0200
X-Gmail-Original-Message-ID: <CAHk-=wjsrwuU9uALfif4WhSg=kpwXqP2h1ZB+zmH_ORDsrLCnQ@mail.gmail.com>
Message-ID: <CAHk-=wjsrwuU9uALfif4WhSg=kpwXqP2h1ZB+zmH_ORDsrLCnQ@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Dave Chinner <david@fromorbit.com>
Cc: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@meta.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Sept 2024 at 03:43, Dave Chinner <david@fromorbit.com> wrote:
>
> Should we be asking for 6758c1128ceb to be backported to all
> stable kernels then?

I think we should just do the simple one-liner of adding a
"xas_reset()" to after doing xas_split_alloc() (or do it inside the
xas_split_alloc()).

That said, I do also think it would be really good if the 'xa_lock*()'
family of functions also had something like a

        WARN_ON_ONCE(xas->xa_node && !xa_err(xas->xa_node));

which I think would have caught this. Because right now nothing at all
checks "we dropped the xa lock, and held xas state over it".

               Linus
