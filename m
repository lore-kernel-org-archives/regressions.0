Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4EB3CB2E5
	for <regressions@lists.linux.dev>; Fri,  3 Jul 2026 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079747; cv=none; b=qRDQ08V9VUHigDP1KMVJFJnFFPG/85s+L556QOIC/3YK8xvO/akwYRZp5uunj5Q1o/ojVnuOmaZFWq73bMOudv61fnhf2XvC6ovcHp/wVbEy+Zatefp+u67s86NyTSC5XncJ3wB5dNfRfrJcW0fjpmhEHFjl4uCTkIC2SK/wITo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079747; c=relaxed/simple;
	bh=gx+Opbiuesxxetpo+OTPT6kTeiBuIGRqPbf2vmcAhMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=msJMmwkDZOaA7UO3j6yyWcukhW3V9bJ99EqlGKp/kudwr6IGMFQ98y2BoW1K+Ry4ps7qv8w9ENZ9ZFyd8oefpqb3gxjVLDkZOYX8xk3jfQFnsnaDfndtZgM2TrYEPURDbw7Em47oWMBE2SecEhtj3NlizQTEv6OICfBM1JHSZFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Edpl+wxp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Edpl+wxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783079745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EMUE4aQBQf5gDaVLs1aXgAur2VD1yy3m5vYBxXEcv0k=;
	b=Edpl+wxp9O6va3oEv7Z+utPNstnyuTZ5Dhtlzrj3D3XNLUf1IRTmH3t93pCLgdqzd/xa+i
	mYv7aVIJ8UTnD2BXK5QwsES+baXN3fEGehSy6rvo4x78/FhDu2CjMmCYQ6VtgpFmuNcOyj
	+3vhciew1QZkb+mymRQxXwrNnX8wk+w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-iygnEOrlOwipRoFjZ6MrZQ-1; Fri, 03 Jul 2026 07:55:44 -0400
X-MC-Unique: iygnEOrlOwipRoFjZ6MrZQ-1
X-Mimecast-MFC-AGG-ID: iygnEOrlOwipRoFjZ6MrZQ_1783079743
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4925bf70f5bso4696915e9.1
        for <regressions@lists.linux.dev>; Fri, 03 Jul 2026 04:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079743; x=1783684543;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMUE4aQBQf5gDaVLs1aXgAur2VD1yy3m5vYBxXEcv0k=;
        b=jye3bLREafpM9HxjhzltVItUEBlsin+oFbAE8BkA2e0o69cavBUdDcq5TwjYlYPFFV
         zFgsa1mXEWenzwhCh3loZt0orXYXzzG9xgM1eeFbuUh0G2JfAUSGVzE/Xea9uJCzkrRM
         smVFLNqXLK+aKjg43DtOUPO6yaiGEpqomddY/vJe1+X5ZXAnjpedKzV86JHgYPU4YpMD
         uQTjKWQcAm5JWM1E9UZEXZ1zjtHe7SJL8y5rMkypBrtAhXJWibIYZSzgiPLqos6JWBDF
         bLsH0UYdvTu5VmjLLqPzZKfJMg6is32STRUZFG5sKhqgV0wuZNGu8xE3q7uHgPlGDp2Z
         9h5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9CpNnNj9rRhO7YoBGJ1n+gwtMOfbCjnDinhaROuFG50bQRyRLmvbbB54qtkB9XIjXpi5jRgGvhHofXSw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3Ru8xz+RYKK05I+33BOOoIw81PCGS4qyh7CGCBckoa+f0iaQl
	xVqRllMauNSYug30NFvDh56aFdTJCNfoTJE/VuNo/D3cxkEY2oIiYEMwDBI6M3ULHIlk8jRp+kn
	YdzD6cbLNx2fwBWKKORDFLXFzLDNeNso6o3GXk2WT+l6xNin2PWTLBMwnzibYjxuk
X-Gm-Gg: AfdE7ckN0oQza4Owe6xZ4Rnkp8laUrvqFoVJ4916jtqfYjKFObWH632tI5/0Ie8cRoi
	NTTEFxLQCU4rKQtP0tzNKfLFv++yP0/PAaXcfCo2JDdOoLBSfKO5jRo9+yS8/C2qLp0ndPC7lAj
	6HMDVnBcsLARp5nWb7FkhOh7qWaXi2KiHMWE7J2hop6hbehZ8Zy1sGLthSM0S1uHOyR+Af93ybi
	4mczBGwxoowCRfv7H3WHNdKYBy4uMJXYmEa1DwJk0SvJOFIxFYqtRXPisMZzWNdPHyUTw5oYcqV
	XgYHqqGQf84RMTEQPZKN+raCt3nLsg3YqvFcmIT3WEA0kucZ0IDC+B0YKhPoelNTvvGcqG2+sMb
	Wij4uxpLyBy0bbpzPE0qtTDBjRFgWslKg
X-Received: by 2002:a05:600c:8b05:b0:492:5145:f054 with SMTP id 5b1f17b1804b1-493c3cf8c29mr127465505e9.26.1783079742904;
        Fri, 03 Jul 2026 04:55:42 -0700 (PDT)
X-Received: by 2002:a05:600c:8b05:b0:492:5145:f054 with SMTP id 5b1f17b1804b1-493c3cf8c29mr127465055e9.26.1783079742456;
        Fri, 03 Jul 2026 04:55:42 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-68-31.inter.net.il. [80.230.68.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm60793295e9.2.2026.07.03.04.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:55:41 -0700 (PDT)
Date: Fri, 3 Jul 2026 07:55:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Tim Gebauer <tim.gebauer@tu-dortmund.de>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, Brett Sheffield <bacs@librecast.net>,
	regressions@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED] tun/tap & vhost-net: multi-threaded
 network performance
Message-ID: <20260703075438-mutt-send-email-mst@kernel.org>
References: <akVnoOYQOrt8k-Gu@karahi.librecast.net>
 <a1bae349-61a1-4c65-a531-179850576642@tu-dortmund.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <a1bae349-61a1-4c65-a531-179850576642@tu-dortmund.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uUuhb_VdQxDjvfNwnx7N15I_FPpIbBJxWqTvHXz_XOM_1783079743
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 03, 2026 at 12:41:19PM +0200, Simon Schippers wrote:
> On 7/1/26 21:16, Brett Sheffield wrote:
> > TL;DR - Commit 1d6e569b7d0c0b2736636749e4be0a27f3cefcb3 causes
> > significant performance regressions with TAP interfaces and multithreaded
> > network code. Please revert.
> 
> Micheal, I am convinced that netdev_tx_stop_queue() and
> netdev_tx_wake_queue() are too slow. The communication between the CPUs
> is just too slow. We already spent *a lot* of time speeding it up, the
> patchset was only merged at v12...
> 
> Yes, I would *love* to have qdisc backpressure on by default but I do
> not see how anything could speed it up.
> 
> 
> *Is there any issue if we introduce IFF_BACKPRESSURE?*
> I implemented it and it is a simple patch that only executes the
> stopping / waking  if ((tun->flags & IFF_BACKPRESSURE)).
> I could submit that to [net] very soon.
> 
> Thank you,
> Simon

Pls go ahead.

-- 
MST

