Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA1A3DCD99
	for <regressions@lists.linux.dev>; Fri,  3 Jul 2026 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088389; cv=none; b=dr3gzj9AwAm18Nz5umS8unw3fv1goVAy5AjTGKDrlRSocuL5yAHhtHQf3vzrTOCb9FTdm3pha8t46v9Zf2+ORHaT33T10JRBxcnMFejETYz+h7Kj+o8V1Ovu8YCOcGPr5HRMQ2rYabpJ6s0vCevsgKvy3YvLMlFHd02YI0+9a4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088389; c=relaxed/simple;
	bh=q/RPtCBDsRXrN8eZhZjqfLHvK5UsV4Ryp4HYWQUEoaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qv925e+5duTWSXFK2uQF8HAn0xz5e1HAjsBv0P154rupzUbaJ01fsyhWrhyMvarC/eXHjp7GYI7EBXsTMcHczLwqTuJJdsoMgfsMJxjfB2iSQC0dGzvY/InazQfMJoYacHi2jhnf9q5BOJvcEm6mPxWrge5UJy3E+v0Gg5o/eE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i/VoiBVh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i/VoiBVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783088386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gGk+ND3tT9bnKaJWndsC0fSRrq9dDoIDpmvUwc1Tfsc=;
	b=i/VoiBVhgOFVPQZWBMZqdyX/XqdlatwUGUaPwgg08obG/EJ/doQeOC7Mn3WZDvpxgaVMfu
	gMecXHbIDsA+w85Vt6ldjKXb5rmYN/559ENt12hqXkQnwoSJYdFVJzrJ3AIxvBXQZNQp/O
	sz84Uda7yA7eGU4cT3STLCt6g5OQC1w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-vWSmZWAINDW37dMeu33_yw-1; Fri, 03 Jul 2026 10:19:45 -0400
X-MC-Unique: vWSmZWAINDW37dMeu33_yw-1
X-Mimecast-MFC-AGG-ID: vWSmZWAINDW37dMeu33_yw_1783088384
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-493a7fa8481so12786865e9.1
        for <regressions@lists.linux.dev>; Fri, 03 Jul 2026 07:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783088384; x=1783693184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGk+ND3tT9bnKaJWndsC0fSRrq9dDoIDpmvUwc1Tfsc=;
        b=q6vRCnz210bmy8g4TIPEg6jiVH9KxTwAtN8U7qjCrhTegqd8Y/o6j3t+N4mXMqQHLB
         RWffIwqM6Zpm9KTNYXRy8llMoM2f9432qxalDRaJzbNpQjf/2QuJ7hIjB85PJmmWClFc
         k3DtFgLM2TpB+I7RDazFq89IynlllC6UHc48Ygse16DZxBZoTS0MW3Rc5YxVPcU12bwI
         +3SZg5hXJZ7jXqW5oXFzBYHZIWVlzvUagod2yu/aVQb0PuUTTQmnpOcapj8AVAE9oSQz
         IZkuj/6sQAxK1uPQVldwmtnQPmTYygK7BTPDqiDg0LdbgmN+kKnN42kuinMlS8Bk+vTB
         5TZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XhnhQ0FShX20P75VU6CpLf8zPu4U5e/ZuQfrvhzg4YXz400hb/qWrGRNrndudW7LUfMUUtVfmtc2tJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGvl2QZDeGQF9kAdGxtcllropu2nb1fgJBeVoINrjZUIr5meex
	hC2VyiqHK6/I4xAbz3g7ZQBu7+ygtrQVfRIoEg7QJYS9ThJBVr1T+X/lZLDEL7cJ6ZpKTLoGptJ
	YJPYTSYjr/oPcCSlMGJeH9178y5BWs32VP3NeeQ0mIiY16gcIfLNGAYQ+pGgpB3GL
X-Gm-Gg: AfdE7clowpwAgJZqtyWH46knXPeBfS769bxgQ7IC64M9fLq0ba9X0dOI331ozcKTCsV
	KoMW3Tqdub9X6e8usJ+HwHoD2SmfVNqOyUauLDqbayZlGO7/4vbuLYoyMKY+1ITfJRZkzoLelIp
	RpX8Yt5sW8tUIW/ZxpmbSU7oxGEm0WvbeVdVYAF9YZtYRn6fQUMVc+x3iv9pVGa+XHoWLVKYIef
	f1HRBdrON8aNtWeqy4LmU0z1SD7FUR8+qnFX8FLurgCD4nGfhmEAowHzXHED7+fK0wVkKAl7ihu
	vqwlMswZatUimwnOSjaWhGq7QdjPKD4YXM+xCkbQDyhOA74gtgrh6d6p8Ui1CPdMcL5o2OZ1k9T
	mns+3ghKVioO7UFrpdPJ3eED+oEsX1Yr+
X-Received: by 2002:a05:600c:34ca:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-493c9b4d759mr50356825e9.5.1783088384282;
        Fri, 03 Jul 2026 07:19:44 -0700 (PDT)
X-Received: by 2002:a05:600c:34ca:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-493c9b4d759mr50356475e9.5.1783088383785;
        Fri, 03 Jul 2026 07:19:43 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-68-31.inter.net.il. [80.230.68.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm156369225e9.15.2026.07.03.07.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:19:43 -0700 (PDT)
Date: Fri, 3 Jul 2026 10:19:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brett Sheffield <bacs@librecast.net>
Cc: Simon Schippers <simon.schippers@tu-dortmund.de>,
	regressions@lists.linux.dev, netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Tim Gebauer <tim.gebauer@tu-dortmund.de>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED] tun/tap & vhost-net: multi-threaded
 network performance
Message-ID: <20260703101823-mutt-send-email-mst@kernel.org>
References: <akVnoOYQOrt8k-Gu@karahi.librecast.net>
 <20260701165359-mutt-send-email-mst@kernel.org>
 <ef33f0a7-f0b7-4bc4-9263-10d2b480d717@tu-dortmund.de>
 <akZGg96-Xu9VeGrw@karahi.librecast.net>
 <20260702185420-mutt-send-email-mst@kernel.org>
 <akfDnfkgorxJ_Q6G@karahi.librecast.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <akfDnfkgorxJ_Q6G@karahi.librecast.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sgyj0_2GsyI2lgsgrXucEgOy0EVprZGjvbKJPPEL_7Y_1783088384
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 03, 2026 at 04:13:49PM +0200, Brett Sheffield wrote:
> On 2026-07-02 18:55, Michael S. Tsirkin wrote:
> > On Thu, Jul 02, 2026 at 01:07:47PM +0200, Brett Sheffield wrote:
> > > On 2026-07-02 09:24, Simon Schippers wrote:
> > > > On 7/1/26 22:56, Michael S. Tsirkin wrote:
> > > > > - does it help to increase the tun queue size?
> > > > 
> > > > I agree, this would be great to know.
> 
> I tried adding a queue (qdisc pfifo limit 500) on both host and guest - no
> apparent difference in drops or performance.
> 
> If there's any other setting you want me to try, let me know.
> 
> > Maybe it's the supposedly rare case? Does this change anything
> > for you?
> 
> I also tried both patches, but again, no noticable difference.
> 

Thank you. Simon pointed out issues with the patches but he also said his
intuition is strongly that it's not the way to go.
Let's wait for him to post the backpressure patch, we'll see.

-- 
MST

