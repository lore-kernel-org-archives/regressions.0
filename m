Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EE0340A7D
	for <regressions@lists.linux.dev>; Mon, 22 Jun 2026 17:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150510; cv=none; b=WIV3yg5q4LRgqUgpS48EClZ2YclCEJ8NSrVwqKmdgVC7wS1AKbcBcxxn6fdsAxyDa8x3Ia7ieBh+YRyWb8rZy1N/AVzw5p8FJ9C/pfxcw1tj4GRynO1CPnDpTsFhW6eMRX+9a+MhuVg/JUal3/VCT6K+HjtcpyIZbMdNRIHyJ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150510; c=relaxed/simple;
	bh=rT+UtKMtzGnsnjtDXBDLQP30MQk3djrKnOyWlXkyvIw=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=U+39+tMJLMkDpq64lr9AKBdg9rUUW8SOuK6aQdGrngyDeiNx6FnLfhyeDBPVc5j0YUMKiHM2XwS6jkBjp3AHzodm44Um7IdNA9XDfh0u2aj+wo/J+aIBMT3CJ7kZfZYAYmxfAjh5a+SOTPvytpAhXvmXPZhR/sLHVIJds5yQwe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIuiwy2A; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIuiwy2A"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6611689dc10so5634546d50.1
        for <regressions@lists.linux.dev>; Mon, 22 Jun 2026 10:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782150508; x=1782755308; darn=lists.linux.dev;
        h=content-language:thread-index:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=33veWonGavd+osVYaZO16Ido/MSdlOEETv1HhacB24U=;
        b=AIuiwy2A4ExVp8Ta5XMWZJczxutyh9oN5uG5SEJHchX5c4cTlOjtIkd+ZTXsajD7g/
         c6z1aLVwPljkU1OQ3KxpSHbax2M9XvF/ZWhEWXaZgvqOCrURK2dDluO3qml6saAXhb4c
         9XH6WQXvh1VxTGlSGHjkS9ZUycsd0hgbXWwtwwFOQmIC+vn5YiRx/eobLF0UK1biXIVw
         dam0NKbJrd51HNhcCzRDxs2wDSHdJ1NaTDNYDSfLgLBBk+jR0SK+gGOXgT0rQ9qghqdJ
         GctaSYU2NFdX5knsjg+MGcSBuhmPFlwlUvHEm9SbXV8fjLiYqP9OuoedgyCcSdglEwsF
         Nfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782150508; x=1782755308;
        h=content-language:thread-index:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33veWonGavd+osVYaZO16Ido/MSdlOEETv1HhacB24U=;
        b=cRJPyKi2AgiQhcWaxPUpzi4MU9PLptatZ8sKqIikR4yJSa+CWRurFDi2GrHSyzrwDD
         8p4BHmv8oF7Swyc90JBU3U3jWsJmY+heVt5I+dTzQSC1ZfazBj3B+D7INsD7DY8IM7TL
         IAxrr4PKPil6Pa77UjN5/Aqj9L+f4h6XVOBlBG6nekLBRmTZRIfd6mpc7eldnIfC3IUs
         kvw/uLTXd0JIMF2f88DEJbC6df2e+dKG/p2q4yrEXoEaQODow9oKgwZM3urnci13RRF1
         VyLwwxAZ/W73MtNbRXXX1YTXHyolJCKIhD0S3ndl1EdIu2hsKq2qlYyNiF/VsyKbMm3T
         okNA==
X-Forwarded-Encrypted: i=1; AHgh+RqDJH3yLVsX9l5J35DUKAGozNfngaFRzieyrurdob2gPckDuB2rWMOWsGN5ZKp3+0ltSl7+zF4PuEXx6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgCI5cT2zzEBsetmwgVsMzDWPpa+Sng5Za0XmS85Unqwf43LIf
	rEEbdbXLPbvBtdxCzoGP2JT1YWCXBMySxu5SmczvsJyiTzmVU0MhLKCE
X-Gm-Gg: AfdE7clErh8ZIPtpn1W3DImH0O+4uDmpmzVu7S1WoghHg1razUWzatNP4npAoWLyswS
	gFav52EdWMjyb3EDATptVPfL/dYjzv2BDrViviwrsfCgLLF6GR9aHP78bvAhPPuyaPs+R9cmgGN
	FsvBvSFkkzYm4sUwWKGfZFQFfa3X6hVMoPPxwyOMM9biBg2z8Ow0RZFeMl5Ae4J4VJ0iNvQ9flT
	40HsFEKZbQ7WZDQUGAXO10gtZdDk19ZHEKT82ilvvJnRnDDAfOyVZleSD44/yN66cAUOX9SWf7q
	8lX0uiSsqYx5NsugwIFTbE1oVzOKio/PJp5vhdDUs2EnPBoANU0pf/BDmXsgr05hOwCEHGjXXvC
	GJxyxut+w8uESdvUQ7wTnRegQsiZQlIAdsNfRRJj2/HveZ3bPhw7/bETY3EXrcu2F8okmVZPX/R
	6JZxn2R7nveXwAG2YKKB8QxWeQYf4Z5x7rUIh/kM4Lxet+79w2gLxG+7pm14AEmZ0kh9TmH0a/S
	R/gcDEYPSAqdcY=
X-Received: by 2002:a05:690c:4b10:b0:7fe:bd7:9cae with SMTP id 00721157ae682-80178c4a2ecmr145514817b3.44.1782150508479;
        Mon, 22 Jun 2026 10:48:28 -0700 (PDT)
Received: from WIN6DK41G9CSL2 (c-73-56-149-95.hsd1.fl.comcast.net. [73.56.149.95])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025f8da5fbsm34884557b3.30.2026.06.22.10.48.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2026 10:48:28 -0700 (PDT)
From: "Brien Oberstein" <brienpub@gmail.com>
To: "'Stefano Garzarella'" <sgarzare@redhat.com>
Cc: <netdev@vger.kernel.org>,
	<regressions@lists.linux.dev>,
	<stable@vger.kernel.org>
References: <467b01dd017b$733792d0$59a6b870$@gmail.com> <ajkAlpiyPWmNPWfx@sgarzare-redhat> <618701dd023e$063de350$12b9a9f0$@gmail.com> <ajkmjgGdJp9Dj6em@sgarzare-redhat>
In-Reply-To: <ajkmjgGdJp9Dj6em@sgarzare-redhat>
Subject: RE: [REGRESSION 6.12.90 -> 6.12.94] vsock/virtio: large AF_VSOCK transfers reset under backpressure
Date: Mon, 22 Jun 2026 13:48:27 -0400
Message-ID: <672f01dd026f$54fa0600$feee1200$@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGzlm2Q3QdtCPSkkHXQpTkeFGbfJwIutksBAb+8QgECzm+rZbZnykdw
Content-Language: en-us

Hi Stefano,

Confirmed -- the 16 MB buffer fixes it: with socat owning the VSOCK-LISTEN
and SO_VM_SOCKETS_BUFFER_MAX_SIZE/SIZE at 16 MB, a 6.12.94 guest passed
21/21 large transfers (1.5 MB x12 through 8 MB); the same 1.5 MB payload
failed every time without it. So the per-socket workaround covers the
bridges whose listen I control, but not vsock services I can't
reconfigure, which stay broken on 6.12.94.

Agreed the old behaviour was buggy in its own right -- it was
over-allocating past the advertised buffer. The practical effect for me is
just that a config that worked on 6.12.90 no longer does on 6.12.94.

A question mainly for stable@: until the merging work lands, would an
interim be acceptable -- something that keeps ordinary small-packet
workloads under the limit without reopening the DoS? I don't have the
kernel-side expertise to judge what's safe there, but I'm glad to prepare
and test whatever interim you think is right, and to test the merging
patch when it's ready.

Thanks,
Brien

-----Original Message-----
From: Stefano Garzarella <sgarzare@redhat.com> 
Sent: Monday, June 22, 2026 8:22 AM
To: Brien Oberstein <brienpub@gmail.com>
Cc: netdev@vger.kernel.org; regressions@lists.linux.dev;
stable@vger.kernel.org
Subject: Re: [REGRESSION 6.12.90 -> 6.12.94] vsock/virtio: large AF_VSOCK
transfers reset under backpressure

On Mon, Jun 22, 2026 at 07:55:30AM -0400, Brien Oberstein wrote:
>Hi Stefano,
>
>Thanks, that matches what I'm seeing: large transfers reset mid-stream
>instead of the sender being throttled (reliable above ~1.5 MB, fine below
>~90 KB).
>
>The bind for me: it's not just this mail bridge -- I use AF_VSOCK for a few
>host/guest services, some of which open their own sockets, so the
per-socket
>buffer workaround can't cover them all. That leaves pinning 6.12.90 (losing
>the DoS fix and further kernel updates) as the only blanket option.

Okay, but in that case did it work?

>
>A few quick questions:
>
>1. Is a -stable backport of the merging fix likely, and roughly when?

We don't have a fix yet.

>2. Could a smaller interim land in -stable sooner (e.g. more default
>   headroom) without reopening the DoS?

What we've merged so far is the best we can do for now, but anyone who 
wants to help improve the situation is welcome to submit patches.

>3. Will the fix guarantee backpressure for any packet size, or just widen
>   the margin?

It should fix STREAM sockets for any packet size.
SEQPACKET/DGRAM is a bit different since we need to keep boundaries, so 
it will come later if needed.

>
>Happy to test any patch

THanks, I'll ask you to test.

>I have a solid reproducer and can turn it around
>in a day. I'll also file this as a tracked regression so it's not lost.

Unfortunately, it's always been partially broken, using more memory than 
specified, so I don't know if this is actually a full regression, but I 
understand.

Thanks,
Stefano


