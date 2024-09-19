Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D2B2943F
	for <regressions@lists.linux.dev>; Thu, 19 Sep 2024 04:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726721229; cv=none; b=kHMjFZYUyMbmCiGJ0jjYRgWW1F6gM6fbKBw0i/Hoy+OdzHa0FhI8bdfhgKHqsttcCzbrdO/hUxoUVDFKhdtjReezb27Oj4YKUTKOsxaaDWX/SSNBeJNgsRpoJt+TMjGp+P+wfGatmLYatWjhdvvHWo84GNDhe9fOuGWTfDRPyMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726721229; c=relaxed/simple;
	bh=0x90BrRaLqj/i8vH0YC0E0hwcTLNOAmqTSYD3JcCxfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BotdnvTsecpA8ZwYw/gGk2c1LfUAw+xzQUhYXE8+hBO+Kt0u75L5Ic9bRRnR+Fx21GWm59L38DQk3TAfK7aWYRjSSDLrDSY7dFmy2kfhdyjlHPRNSp7eW9F1J3+u2MXIjW61ckgfmTm3hN9NCIOeJlV3Qoo8+nluiezOmeneZxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C0wiztOi; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C0wiztOi"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d4093722bso52696366b.0
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 21:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726721226; x=1727326026; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v5K6WdNxpXbbHrFkTCJEcTGagR1i25Nnb2d6KDOnxQ4=;
        b=C0wiztOilNcb5SU8TBsNfPbtOrLpnYk19f1OWkfw/E5Gm+QiW138OxrH7DqGrJiMPx
         6ioiWYZx+ZBgUn4JPhArgBODMJx5EuE7xOTpHUyGyRUyufYIsZhopUEgQEHL9Wdd27vq
         gZcz6BpLVY3PkHkSYzaUCVqKeEsk1zlXGmP9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721226; x=1727326026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5K6WdNxpXbbHrFkTCJEcTGagR1i25Nnb2d6KDOnxQ4=;
        b=sPQ3wY6af+Ycd3XIiboriMV1HQeiayRoW+EkX7u3506CKtjalh4sGF+NAtH8NcoC9S
         stq+4gl7pytmHNrsfAoKSwedr26U7bF2iJl+E/zyMQklSLHfQyvqFh4FQ+701wdFq9tW
         XO14RVO+3bGHqyy02encmpQMpWXM03/pWx6nW28Pcay4jVnZkE9IxBPB8SZtIgy9LxgE
         6aKuZjwGxFolL7lxy3gEAtbmSO3VwnPVLpwD89n4z106DD/yMcW8Yj04hE24U9lKF+LS
         zc2hyRAXlJqJOATPmL221iA++ZsGuPY98sqQ0GDT7yfgmgf/fr1ZNpwqgsoetIe9zHVv
         WzPw==
X-Forwarded-Encrypted: i=1; AJvYcCU4MoNGHWrX8nU0v00Fg0jJZJ4Nl79Cp2DJzcFbCW2PUjLZHCTdq1T1rPbbS9YzbL0/9l4U6qjPeqz+Sg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwI9J9dJlfmwfePbZP09qwSvqDkNhpsglySVH7z0rCp87JQDLOW
	hHohUR7jknqOSTzrGG9F+HtJJROwytBtEDyNqyRWJ75vCapetYnywveX5IG+/qVDh9OIMFbX1sr
	Fl09Nxw==
X-Google-Smtp-Source: AGHT+IHbqxn6MbE9avznaW1042ajf7n5zL55C7wFScSXaikB7EICyHn5g+pVCOpNugyMJnuzVbckGQ==
X-Received: by 2002:a17:907:d3c7:b0:a7a:bb54:c858 with SMTP id a640c23a62f3a-a902944fd6cmr2526538566b.26.1726721225732;
        Wed, 18 Sep 2024 21:47:05 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f453asm667995066b.88.2024.09.18.21.47.03
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 21:47:04 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso46657566b.3
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 21:47:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUu4UjXXYH+6U7g/kcGr4/AEF9W2MHDSLRMe6QynFIggPsdNMG4TpHAYdiA55kCXt6EhCjPpxB5uyE+DA==@lists.linux.dev
X-Received: by 2002:a17:907:efc6:b0:a86:9c71:ec93 with SMTP id
 a640c23a62f3a-a9029438edemr2426724866b.24.1726721223112; Wed, 18 Sep 2024
 21:47:03 -0700 (PDT)
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
In-Reply-To: <ZuuqPEtIliUJejvw@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Sep 2024 06:46:46 +0200
X-Gmail-Original-Message-ID: <CAHk-=whPYGhCWOD-K2zCTwDrCK27Y0GST-nt+cb9QPzxO-iSHw@mail.gmail.com>
Message-ID: <CAHk-=whPYGhCWOD-K2zCTwDrCK27Y0GST-nt+cb9QPzxO-iSHw@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Matthew Wilcox <willy@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Dave Chinner <david@fromorbit.com>, Chris Mason <clm@meta.com>, 
	Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Sept 2024 at 06:36, Matthew Wilcox <willy@infradead.org> wrote:
>
> Probably xas_split_alloc() needs to just do the alloc, like the name
> says, and drop the 'entry' argument.  ICBW, but I think it explains
> what you're seeing?  Maybe it doesn't?

.. or we make the rule be that you have to re-check that the order and
the entry still matches when you do the actual xas_split()..

Like commit 6758c1128ceb does, in this case.

We do have another xas_split_alloc() - in the hugepage case - but
there we do have

                xas_lock(&xas);
                xas_reset(&xas);
                if (xas_load(&xas) != folio)
                        goto fail;

and the folio is locked over the whole sequence, so I think that code
is probably safe and guarantees that we're splitting with the same
details we alloc'ed.

                Linus
