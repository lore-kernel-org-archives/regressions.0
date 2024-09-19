Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5AD168C7
	for <regressions@lists.linux.dev>; Thu, 19 Sep 2024 04:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726720362; cv=none; b=fPbC/UmN68qQfiQSCkC/EMYakvNrNuuBeacmIAfvGPu7thb382BXt3WMnqwQe6FrvOnHYSILIIe1ZYQmkqHnAmxTyyVmg6v1wW6Xe9XGNAmNz5sdycsOEznuJ4rUizJRG1TFNT71G4fWiLzsVcbmFrzxhqJ7bMFSGiTKo+lZkig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726720362; c=relaxed/simple;
	bh=fzixIv7mDCApwoPr19Yl5C0aFP9P4Wj7HGNtS5Rhh7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4awQFjndicJCAlaA2q6Shprby8f7e844XE+9KiRrhbUZCOtI8B8UF26NbvTM0trPbmckeTOtkdQlQ3TM7OqkiEiJZXUazQrexeB7D5LRuzEYGH7wNxosCk2q6qvOIzfNO8RTc/owHor1OeDpKzfHfmm5d3+rLihzKgGr0xDaqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cCCPQ1lT; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cCCPQ1lT"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86e9db75b9so46456066b.1
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 21:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726720359; x=1727325159; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l9yFEfRvpp3RBfmF+3PJrVEwQqIIGgrTWijYjV6RGF0=;
        b=cCCPQ1lTaNhG6gZGijOxDstm6h4oFH1A2mFVmSuriJ2I4sa2BERtAZoghfDeROoTnQ
         j4YgODglfh8xfsWxQMB+HXXoKoWxZ1S7hAEsK9k2DzIQEIRcM0PMr2GWePrNldZvuq9v
         uS05ctC1/pSIhKXL76gXelgLWSFDJcjlAI5eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726720359; x=1727325159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9yFEfRvpp3RBfmF+3PJrVEwQqIIGgrTWijYjV6RGF0=;
        b=ZvgQSVCAfB2abAjzbUAmoAO0uZXfqPfD5Fr4e3f3Tb8krmuaEHA82yPb8xwy3xoUoX
         OMQrPTc6H3cj3WQd0IUPPeop+YvHFRiBw968f0nLgfSRsbbT4aYCN1vNdmnryWlzzvE3
         DJS9RVb/TRTywO0xcc43kTxNJHmbVySUqjVw6HAr9gObhqJkibsar4y2A2nzCwGlV8T9
         HBPyr+bga6/SJDV/E3LYICaiz8bqzncx9RDvSVAWtnFnk+0p25+q1++Vms1fsWR9BY4u
         cbH7b0W9CrsiGx5OJ09OCx1ZnqqGRAz9Zp2sm31206LuzZhlkPKSEwOqo6r0dd4ktPR7
         a1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXmlt+lKy6cmAagyb0uoVodWPv4UrXiKHpc98tcsrfDrZswCkyCL/AKnZPu6v0A+fynK0eKdYX8QAIjhw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqsndfh8VqEWGuRuj1e662/8CS6HwPO/fdQovvJUhbFPvcelEV
	0ldExiN7yQR1jjVGffyl0sPr+DebNGd5H5/Vt/PYRH7HmnSxHl5ThtPUb6cwnFe/q0VC/PYCZDQ
	0C+zLXw==
X-Google-Smtp-Source: AGHT+IG/sah+z0dAntUraEBKeH2DPnM5ctAwW5uKxE+ff3N1zT0aExpNRO9Jbv2j/YfdM9KwnOzIRw==
X-Received: by 2002:a17:907:6096:b0:a8b:6ee7:ba26 with SMTP id a640c23a62f3a-a90294a88d5mr2784151466b.1.1726720359007;
        Wed, 18 Sep 2024 21:32:39 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b38d3sm666282266b.120.2024.09.18.21.32.36
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 21:32:37 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a86e9db75b9so46451766b.1
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 21:32:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVo9dlqMiwsW3z8ROwqxYo2weSHoxGADgrqy+rAXpfaFubHs3RQXYZKBWQSpI77i8BoCFK9GxHO3XWjDg==@lists.linux.dev
X-Received: by 2002:a17:907:f766:b0:a8a:8d81:97b1 with SMTP id
 a640c23a62f3a-a90295a2171mr2279810366b.27.1726720356520; Wed, 18 Sep 2024
 21:32:36 -0700 (PDT)
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
 <CAHk-=wgQ_OeAaNMA7A=icuf66r7Atz1-NNs9Qk8O=2gEjd=qTw@mail.gmail.com> <8697e349-d22f-43a0-8469-beb857eb44a1@kernel.dk>
In-Reply-To: <8697e349-d22f-43a0-8469-beb857eb44a1@kernel.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Sep 2024 06:32:19 +0200
X-Gmail-Original-Message-ID: <CAHk-=wjsf9eAsKf-s6Vcif8wHPFj3iycaJ89ei=K1hQPPAojEg@mail.gmail.com>
Message-ID: <CAHk-=wjsf9eAsKf-s6Vcif8wHPFj3iycaJ89ei=K1hQPPAojEg@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Jens Axboe <axboe@kernel.dk>
Cc: Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@meta.com>, 
	Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Sept 2024 at 05:38, Jens Axboe <axboe@kernel.dk> wrote:
>
> I kicked off a quick run with this on 6.9 with my debug patch as well,
> and it still fails for me... I'll double check everything is sane. For
> reference, below is the 6.9 filemap patch.

Ok, that's interesting. So it's *not* just about "that code didn't do
xas_reset() after xas_split_alloc()".

Now, another thing that commit 6758c1128ceb ("mm/filemap: optimize
filemap folio adding") does is that it now *only* calls xa_get_order()
under the xa lock, and then it verifies it against the
xas_split_alloc() that it did earlier.

The old code did "xas_split_alloc()" with one order (all outside the
lock), and then re-did the xas_get_order() lookup inside the lock. But
if it changed in between, it ended up doing the "xas_split()" with the
new order, even though "xas_split_alloc()" was done with the *old*
order.

That seems dangerous, and maybe the lack of xas_reset() was never the
*major* issue?

Willy? You know this code much better than I do. Maybe we should just
back-port 6758c1128ceb in its entirety.

Regardless, I'd want to make sure that we really understand the root
cause. Because it certainly looks like *just* the lack of xas_reset()
wasn't it.

                Linus
