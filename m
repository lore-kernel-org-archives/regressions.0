Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C34D3C37BA
	for <regressions@lists.linux.dev>; Tue, 23 Jun 2026 07:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198520; cv=none; b=UskHXZcPb2xVbgcQsdu1ngMrrFUTDWyXq9b4qvuiNQNhqIM5tv0LnGU55iACc81UOsneY/7gKQpN77tm2xqtEnpTWkJDKwbY1UxCGN8h4lac/NpVH4moJyBeaiXj483kXORxfPg9J5HiFWQt3GJBwirZVge3zyfdsUVDSqLeA4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198520; c=relaxed/simple;
	bh=Ke1LitD4OywmlOwFcW273fMBllWzfXSPBRZr63oLg7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IXqPQn0UeCNqtsNQlA6xn3C4X/ZC+1QfooKFmxQTOMtobt8cRnfnxOitYVlFJzZ16p/tb7nIFkgz4xMgFIZBonpOzaxDGIsgZNNtz0bhBMPdowmvNy7ilSsWLfGP5vMVuHQSm4oX5w1wzrQAPYY4b6z9Gr8922vrK+BzOU6co7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gxyeKq6y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gxyeKq6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782198518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T+KsZAD0oHJlxnltaTZ/cFJz2c7aO0R1ESRDEl7NjrY=;
	b=gxyeKq6yoJ0spWuZmUKKdwTDx2nOR9DDFQe+PyKQUrrhrwWt7JmZglMaiVpiRnmVZkNUn6
	ehguvP57QWzMJRGL19vydlsr0ELlr7mP1QM6PBw+UdZrTdnQ4cYfzJj5Gjg84u/Qc6fV9M
	nDMPbLrMrvONqQZz3S2XFYIGhbxNgvE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-S2ZOXs3vOcWdVhgaPPXXgw-1; Tue, 23 Jun 2026 03:08:36 -0400
X-MC-Unique: S2ZOXs3vOcWdVhgaPPXXgw-1
X-Mimecast-MFC-AGG-ID: S2ZOXs3vOcWdVhgaPPXXgw_1782198515
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-462d8ccf553so3296183f8f.1
        for <regressions@lists.linux.dev>; Tue, 23 Jun 2026 00:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782198515; x=1782803315;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T+KsZAD0oHJlxnltaTZ/cFJz2c7aO0R1ESRDEl7NjrY=;
        b=CYN09GeFyyUFhcSmyQp1oLThOQb/HbmzuwYp/+V9IyKq1ynH/3DsJMG2ZpnkTIBiDc
         85dH2224N5HrZy7sQgqxibTxxCOPV6oNNC9w+DhHZx/LiiCHXXTJVLk+RQqIfvlP3iUK
         XwdaTHGTdj8hGF8jMr1XH4ssM4dK8D6+PEz93LUnobZJt9WaxHUo692qOjMADLGcz5iW
         AD8XkywiAKP8f+bMUl3pRP9qbMmu9kC0A/SLW5JdNM32129NriTFuV8pVDQXLXb+1e3E
         SratqnIorzfa2RkHTxSgl1nBRl0Z0zlmDxbK7ZgkiG5HeLB+yogZ69e4oTASfNRGS5+c
         hS8g==
X-Forwarded-Encrypted: i=1; AFNElJ+DB17FAp8/hd0I8RTjjxkIAI7zg5DZ57tJpXFo3tX98arFRtgPM+GJRptW/c0cfkcSKUc7tSUa2MwGMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz9n7MQW6NWgTn31JVRjyaJIOZv7qllHfVYNchJiv1w2KYPIe9
	Ay3xIAgOmr4fsaq2xCX84l+RISo9DDNQU7+0fbXf4pFFfzZq66n1FbIiMcPl0tah8krtNTbRRmO
	RSk7t9/gJCO6uNKKRdOCl6cOLcgvn7Xg1LLo5fW4iOyRwmd0rddZePaEmak3/rCcPdYbxN3k+
X-Gm-Gg: AfdE7cmVwFQ8uyhYpNIN/cZDw61OgE5gDQg8oepBXpnuJ1o4BHqxnm/CptnKp5NZQJm
	vXsulcrCI2EoHJ96KFM0lsWOYhZ4QLCd8RU6ntMxgbzQI4mmHuvgCtWb3enEGc6fwLkVSmw+n4h
	FOU13sYAoL9SlYaWtHPUSQgjR5fYpvfYwNPklzyVL5Xw4G38rP4R7YJNuxiSZGbLDB2F1g/8d5O
	IrRTapf0bwNo219yQulPbqg+aKCo9QkF9gZ1lheKYU4hxr02rFSnFyXeGAZ29xHHFGBCm/ptUe/
	iW9kUxPhMW2Inzza89K8oZPxnOGCvDv79XFYsKvHHxn1CGaCcLqcXOajaCc/Ly9lKY/6epvE6OZ
	wsCmgMIkxAB3xJ0Awpy7Ma5xsdZHuzKIWNhRFwdaytAcoGTxQtyaz9BJQIGsG
X-Received: by 2002:a05:600c:4453:b0:490:d32b:39d6 with SMTP id 5b1f17b1804b1-4925b37973bmr21307815e9.19.1782198513385;
        Tue, 23 Jun 2026 00:08:33 -0700 (PDT)
X-Received: by 2002:a05:600c:4453:b0:490:d32b:39d6 with SMTP id 5b1f17b1804b1-4925b37973bmr21307275e9.19.1782198512939;
        Tue, 23 Jun 2026 00:08:32 -0700 (PDT)
Received: from sgarzare-redhat (host-79-34-22-35.business.telecomitalia.it. [79.34.22.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f4ee6sm31772016f8f.5.2026.06.23.00.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:08:32 -0700 (PDT)
Date: Tue, 23 Jun 2026 09:08:27 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Brien Oberstein <brienpub@gmail.com>
Cc: netdev@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [REGRESSION 6.12.90 -> 6.12.94] vsock/virtio: large AF_VSOCK
 transfers reset under backpressure
Message-ID: <ajoulmq3g7nuYHF0@sgarzare-redhat>
References: <467b01dd017b$733792d0$59a6b870$@gmail.com>
 <ajkAlpiyPWmNPWfx@sgarzare-redhat>
 <618701dd023e$063de350$12b9a9f0$@gmail.com>
 <ajkmjgGdJp9Dj6em@sgarzare-redhat>
 <672f01dd026f$54fa0600$feee1200$@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <672f01dd026f$54fa0600$feee1200$@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z9f2jTvACpvOSiHFngvr1eAMpLdlW2NyX7pvpBfywac_1782198515
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 22, 2026 at 01:48:27PM -0400, Brien Oberstein wrote:
>Hi Stefano,
>
>Confirmed -- the 16 MB buffer fixes it: with socat owning the VSOCK-LISTEN
>and SO_VM_SOCKETS_BUFFER_MAX_SIZE/SIZE at 16 MB, a 6.12.94 guest passed
>21/21 large transfers (1.5 MB x12 through 8 MB); the same 1.5 MB payload
>failed every time without it. So the per-socket workaround covers the
>bridges whose listen I control, but not vsock services I can't
>reconfigure, which stay broken on 6.12.94.
>
>Agreed the old behaviour was buggy in its own right -- it was
>over-allocating past the advertised buffer. The practical effect for me is
>just that a config that worked on 6.12.90 no longer does on 6.12.94.
>
>A question mainly for stable@: until the merging work lands, would an
>interim be acceptable -- something that keeps ordinary small-packet
>workloads under the limit without reopening the DoS? I don't have the
>kernel-side expertise to judge what's safe there, but I'm glad to prepare
>and test whatever interim you think is right, and to test the merging
>patch when it's ready.

Let me try something: one of my patches merges the SKBs when we exceed a 
certain threshold. That should be enough to fix this issue with STREAM 
sockets. I can extract this patch from my series (which does other 
things as well) and minimize the changes so it can be backported to the 
stable branch. I’ll see if I can send you a draft later today for 
testing.

Thanks,
Stefano

>
>Thanks,
>Brien
>
>-----Original Message-----
>From: Stefano Garzarella <sgarzare@redhat.com>
>Sent: Monday, June 22, 2026 8:22 AM
>To: Brien Oberstein <brienpub@gmail.com>
>Cc: netdev@vger.kernel.org; regressions@lists.linux.dev;
>stable@vger.kernel.org
>Subject: Re: [REGRESSION 6.12.90 -> 6.12.94] vsock/virtio: large AF_VSOCK
>transfers reset under backpressure
>
>On Mon, Jun 22, 2026 at 07:55:30AM -0400, Brien Oberstein wrote:
>>Hi Stefano,
>>
>>Thanks, that matches what I'm seeing: large transfers reset mid-stream
>>instead of the sender being throttled (reliable above ~1.5 MB, fine below
>>~90 KB).
>>
>>The bind for me: it's not just this mail bridge -- I use AF_VSOCK for a few
>>host/guest services, some of which open their own sockets, so the
>per-socket
>>buffer workaround can't cover them all. That leaves pinning 6.12.90 (losing
>>the DoS fix and further kernel updates) as the only blanket option.
>
>Okay, but in that case did it work?
>
>>
>>A few quick questions:
>>
>>1. Is a -stable backport of the merging fix likely, and roughly when?
>
>We don't have a fix yet.
>
>>2. Could a smaller interim land in -stable sooner (e.g. more default
>>   headroom) without reopening the DoS?
>
>What we've merged so far is the best we can do for now, but anyone who
>wants to help improve the situation is welcome to submit patches.
>
>>3. Will the fix guarantee backpressure for any packet size, or just widen
>>   the margin?
>
>It should fix STREAM sockets for any packet size.
>SEQPACKET/DGRAM is a bit different since we need to keep boundaries, so
>it will come later if needed.
>
>>
>>Happy to test any patch
>
>THanks, I'll ask you to test.
>
>>I have a solid reproducer and can turn it around
>>in a day. I'll also file this as a tracked regression so it's not lost.
>
>Unfortunately, it's always been partially broken, using more memory than
>specified, so I don't know if this is actually a full regression, but I
>understand.
>
>Thanks,
>Stefano
>
>

