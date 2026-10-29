Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269152;
	b=Odqfjcd88Nh9Mta1BPXGCqv/jYopHvngrN8TyOaxL6V6SXmCndbaFiEDnVRcDhGwuyJZ
	 mBmwPtWZ53ujZPROuPlbqaQjnNBvugxtqdiglHcO5/D8x3iCXXwvQZ5V85KRJyXKF55uL
	 8YDT4fGuKhzF99/KppU0MtgyhG7F/YtA5nguT4jMbZ+qF8jY0PDeyLwDxxniy2XvyCXuy
	 qrRULUXZOo+etC7uxesUtPT20YDrSwyjeClA60SnwrOqmoyhmtcDNdydbMjS6Ci4X8sem
	 aJcR/f6Bnw26145smfoNkSaVfpJmxpyoddEu8VbEpVW4eXcL8HuWlZGqXihXdynrGWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Vc0r3JbZbwBvUVapNGhL09kDmaTErdcaYY3i2MzSoa4=;
	b=MV0Y4zdSlSz5Os5I5UbsFf9GmAZg7Om/8oPjATVtG3mRKlZGLPnaOdj5V55j3Ion35ET
	 nuYB82xCokrKtYdM7XubgZyBK0uX+N3MpS25YUa5/aPucKqIyhv3IdL84qdPg3POBAheB
	 ntGo2/e6BdN1ipRhPdN3tTJOKuv2qGIzSrTZhkgEYKknfSUnuce4FAD4akxBh/VNBhqet
	 4qFNWXK8G/RZdvthMws4ByDHCSo7IdIXygM0NvsAUgszAdmt5YoEZj3eEjeqCkUBgEEmK
	 rFurT9Q7YIX9SUsXu5agkeiK4Dr5ySO9ko343e8BCSYuFlSCSHsm6Girdtiy3vI6CMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cejPoL5C;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9AB606A31C
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 10:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD9AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cejPoL5C
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so21237655e9.2
        for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269145; x=1793873945; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vc0r3JbZbwBvUVapNGhL09kDmaTErdcaYY3i2MzSoa4=;
        b=cejPoL5CpnL4L4EF43gJ5flAcMwtmw6JnLRm3OJjIgegRkn3eM9ITeYg6kXwStgPsR
         r+smCjc9qsGI1cjyQkb8WiPuLT1VPOfrjkAPkH+/HR0MpkBivSYeuVMsu0u3BgkZ97wb
         n/0nipICOPuS7ONYDa8fg4TedJETWb6Axb0vEWI72czTnGsWL1R2snWnxmPy5ItHBuFc
         jjfhI4+8lkyzYXM2ElIa4Z0r+hUsDWPqahhINSFd3VhqSuvXqJhH2LAwAfKqDMdYkSNn
         r6fcWt8R91rkwudnSs+CwzgZ2KQQEJR88txw920jBgtoojApwG7DydQMfjaKG62QzBww
         L85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269145; x=1793873945;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vc0r3JbZbwBvUVapNGhL09kDmaTErdcaYY3i2MzSoa4=;
        b=HAfGgx2nd+i3moqYTw9khdgqoMiIjjRPs1ilk6b4WedyqK5DZHeDhG11IWyRoAXb5T
         1tknocmu1O9cBr54yh016HjTyF47WXcG4I1pQK/6XcLAY8brVyHKoyDEpFM81JDSI4S4
         rfWIagVI6E2gQc7c65qg6/eJk0CS/WyLdiY7qgf+JDba1N1JpXJhLGZ0ga+dpxOFuYo+
         FpMAnGXfybUsnG8HeuOXka6WrY/VOhYQugl2qMzIcgpHLWfdqcIAqpzBr6TNGT5vMKR6
         or9ZHvyaYSeLngtwUmhaVnnly5CUvMlMNIngMmjoNWQdswl9TLtg2zXfcPz7i09laHM2
         g5lg==
X-Forwarded-Encrypted: i=1; AKwUvBxh8+u7sBxmEQlq/fx+yRhJIgZ8UkcaSh5wCjdOLRUCeajpf3sCTh162zwD+yiz+k2ZOqj8Ehlxt++fQg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIYmHi24cYgysXH7WlNcJB7Qx6bcOZo218DIHd7ywb4g1T9h+5a
	vWZVoPJqR6pnxbXg6xAzAYmlowzj157yO1hXxZ3JhcseaYRNNSZAGl3t
X-Gm-Gg: AYBFou1OtUoObj1WV3drxEj/Hk8Ql3zxfsZSeejuz/zwrc2ZYouVMRPYb57RUYtAFsZ
	8h3zi7SYmhSaP1hnbMaIUzo2Os68x6n5cjZWNVxQHNiAQdcLuM6yvevLfZOSw7/MBufS+VunuZ1
	Afw0ydqYIIjErlWCR01jdNe91SqqkFnuZHGhu9X+yZQ5wAFmEr9A2kVGIxeDWfvZ7r6/8XPnKCv
	niOVZsV0H7zsz1IJB0XEnhbd3Za3lcj3klKkgj0+kCn4SII8Debnmunut4X8/Xbi6uAJ8KOxz8U
	sobFJfrv59o2IDKGjke8UqanFuUBrEHcm2ij4YWUCKJDOQLEYvYKxZTB4fUB71juSH8QdzyNmv1
	aQhOh9RExyZP0G8vzIiDLJdvHkQd6gIJqeQ7owakfp6llNxWvQXl+SFLAy+dtTfL6mvbdbe4jq7
	LDdAL/mMlZ2ztUXvf2l6uqdrraeaDyfm19cXflVRkKomPhdetqxHHc9j21NrPFDUvecMIABmEFs
	8D2BMCOz1rdCt85opPz1Os1XLZxOZL5W5LCvMQlIKm2h+2Z2DqXqVo9FpQ40C8MRpF2pLACHmG8
	CALrV3CmKNpbnQ7IByll7ccZ/qWOXr0e8DoiXDkIqCg5RxordnhYDR0YxOhDqQK0Ow==
X-Received: by 2002:a05:600c:6088:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a9677ca203mr118445565e9.27.1793269145060;
        Thu, 29 Oct 2026 03:19:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm31946023f8f.43.2026.10.29.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:19:04 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:18:59 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Esko Mobius via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Cc: echoowall@gmail.com, netdev@vger.kernel.org, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, Simon Horman <horms@kernel.org>, David Ahern
 <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Jiayuan Chen
 <jiayuan.chen@linux.dev>, Shuah Khan <shuah@kernel.org>, Thorsten Leemhuis
 <regressions@leemhuis.info>, regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
Message-ID: <20261029101859.6893f1a0@pumpkin>
In-Reply-To: <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
	<20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 15:23:09 +0800
Esko Mobius via B4 Relay <devnull+echoowall.gmail.com@kernel.org> wrote:

> From: Esko Mobius <echoowall@gmail.com>
> 
> This reverts commit 2640e6419594 ("net: advertise TCP MSS from the
> configured MTU, not the learned PMTU").
> 
> That commit stopped the learned PMTU from lowering the MSS we advertise
> in SYN and SYN-ACK. For symmetric paths it argued that "the peer runs
> its own PMTU discovery and usually already knows the real path MTU".
> That only holds if ICMP "fragmentation needed" can reach the peer. When
> the peer sits behind a firewall that drops inbound ICMP, its PMTU
> discovery is a black hole (RFC 2923, section 2.1), and the smaller MSS
> we advertised was the only thing keeping its full-size segments off the
> narrow hop.
> 
> Inbound ICMP filtering is very common in enterprise and carrier
> networks, and it is pervasive in mainland China. We hit this in
> production after the commit was backported to 6.12.111: TCP connections
> that reach a server through a relay with a smaller-MTU hop complete the
> handshake, then stall as soon as the client sends full-size segments.
> Clients on networks that let ICMP through, and connections that bypass
> the relay, are unaffected, which made it hard to trace back to the
> kernel.

If it isn't a silly question, how to connections in the other direction
work?

I'd have thought they'd need that ICMP message to get through.

David
