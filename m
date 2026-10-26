Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008305;
	b=CThPAI/YTzKIy+nOHnDpZy1DolCGHMz1M5Br/f3s7UdPz/SI/fv5X7gzk5by0rWKP45H
	 527inXdt/yM4DR/68Ri5GxXn8iqyPjyxA9+2rJNeAtVHOKMPEepRwfOE4DJd7n48zbUeK
	 0DRfr4pZJW7NR8Ibx6dng51s4SCZcL4hdt/DQj4SF8RW7uypCUf3wafPM/eyxgFNJ76wr
	 bpKyAeYNefVwRItfCfjG8tEcG0V6yfdYI1NKxPz1LEs49MuCQUHmqMJ+0819ygmClNuhF
	 wTFCEdmTkeosFCCYO4LMVf++/mjd752YfsY4QuODf7tqBn/gtAu8FX0n1TM7J7Zk3Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JgmEPFVnTpRCUP0N3Fa9flIVssp/Qodc0qLnWI6QuoY=;
	b=zzP1V02WCbgxqMFNNVVjuffIsLTfp0Va3Yd+msQv5Fhg98Az7zqK38QQCdEu2+yuBLnh
	 33eYnTR6tq2l6v+dVG6VSmSXSF3nz1SQxrIjrdsLf6/vIjVutJKi/kyX65LpTAgAyv2bO
	 ZCwAYaxkRcxJhkFyHAtzKwji6ho3WfFege4CtxdChuIhO8dfbtlhsD7lQnBrf/dG/HrSC
	 9yRrWSsK6Y2mfc0ASHCr9I22myM8cspJzOeAIUL+qYio3kHyfIY4EVnac4yWYLknh+7W+
	 /6qdIWeV/uQWURlYx+aHa01ZzNebn0gE4RKqeWlsYieaKsbD5Gw3vhu/ATvwjUwfePA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dPw692CF;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86563606A31A
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 09:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86563606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dPw692CF
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2521313f8f.2
        for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 02:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008304; x=1793613104; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JgmEPFVnTpRCUP0N3Fa9flIVssp/Qodc0qLnWI6QuoY=;
        b=dPw692CFQv39byJAtqhInUVlYAUyihAhE/jA6ujD3VMryfn+sYbh6BbXPjWlVJUp68
         ynfNmDcxhWSpl6IXoTyfwqHVYFTIqmbTLsidc0BqweK3/vbYF5JbD8A3hePXltaB3ouN
         nG2X8PtFTe7psn5N6rf7LIqcUYxt4soqU7KXrNgEWISh2rkirnwXmFdJfLeQJmfR+7wR
         WoAg5jX2F1zr3PG3PMd32yCWxeq0zvpzrDj3hnobNeGwVNtgo6yaOeRIh2WE3V+Mseio
         S8pUUSRtTlj9is4k4P4zNtRFTE4yMutkeJkvAgTtDbDVAFxGnRn998FOFNv86FvbmMzo
         UpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008304; x=1793613104;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgmEPFVnTpRCUP0N3Fa9flIVssp/Qodc0qLnWI6QuoY=;
        b=A/Ky+Ghl+x36o21RHHZyNWBiOi6aw9umUy1HPD4K/Sa+AcYqHCfC/GtA1mJHDvyOTM
         Or76vRoSqVGFYKDmgcQ3fGvmWgZgVDei5/9DhMT3jsiLnrogoqty6fkEPyusrAeyR+SZ
         2aB06scpib4wzcpLpE2TbRh4PJM/g64R6/8EurhG9u5ufDmgClypBcbvh9a673o8FwbM
         hfbdomdgok9yXrZ+CG+n3jcmMyfmWxkA6wPuu/giTJWJbyawL3EMosm7A2+NvfSJXtmL
         8cXt5+jDGNxiDJCUU3vsUMmGrHeGR7rhgwsvYLxKBk39Ikwlnhd4AEd+h/b3E5ScA1/D
         RrMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7Ju4kuyYjVww8LI6+EOuf+cKmVT1aEbsPmP6mK0IBhTQvEanlNH4FDItm5go+ZNUCmvEO5ZyUhVmipw==@lists.linux.dev
X-Gm-Message-State: AFq9FYK73hVVcIMnaEo+B9hYr7FuuIPIGtfYm0cUchyrdIMkLHEy6Cvs
	Rc4NYypogRU0cdf+OTEJPGVHS8OryFPJLPOz4jiAenmg/BirgpotRXDO
X-Gm-Gg: AYBFou3afwA7T1CnZu4uJIvGM0+304mSpbyCOba6J20B4w+EpMOk9X1HPa9MLWagKbv
	vDUjyRZEgmPlELoZwv2yUxdsFVGlxrhRNKCChyvzUu6EAtssF61AL3p3Pi8V3iGb7jqYqPsbHhA
	ad8Ldx0J28sh7efhpuc8MwsRzm7smF10PjJi+NnATE0UDL1XKPOysTHe/UneKfTwJ2FiGKXv3yH
	EYbMpH3VP57JVqV1DDSNb4PswaEGXpr1XmV+UOPkHvxcWBswKLwA+i9iip4kpP1n0Y0nzb+i4Ru
	8nSsBuKQMY5zG0akfbq9PNNQDrPZ4ZGe27pGq+V0YDe2BJ1B5dLktDEF6BGTRFvMKXqm+qLL91b
	bf1ilgj+dwlxOuJYBOrT/fFOxh2kyM3wNuVvN/SdiPd2nzGboKxK1l2RJyz/GPUmseFhtSrUg0P
	9xCfNPxuzyqeJxb6N/rOVGkPrZLXy0ytMU04bBO7pP99qn8clOYlmEct7YQ819fVWHXKkI6Ug0j
	vFk60z8IPvOBH5qSw41/GwP30KiOtEpTFIi2jDpBogZoq1luvCoP10IbiYEURa1
X-Received: by 2002:adf:f284:0:b0:48e:2980:d396 with SMTP id ffacd0b85a97d-48e3eb8d6a5mr9414467f8f.37.1793008303936;
        Mon, 26 Oct 2026 02:51:43 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdd5b3sm15297823f8f.53.2026.10.26.02.51.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 26 Oct 2026 02:51:43 -0700 (PDT)
Date: Mon, 26 Oct 2026 10:51:39 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261026105139.6b86cb3c.michal.pecio@gmail.com>
In-Reply-To: <7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
	<20261024203558.3181711-1-yiyu@yiyuzhou.io>
	<SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
	<20261025111410.2c14fcef.michal.pecio@gmail.com>
	<7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
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

On Mon, 26 Oct 2026 11:18:34 +0200, Mathias Nyman wrote:
> > That's not good, your HC seems to be executing stale URBs, probably
> > from before the device was reset. I suspect we reuse the default pipe
> > without recovering it from the broken state left by EP_DROP_PENDING.
> > (Such bug may have existed since forever, but only in USB3 and cases
> > which seldom or never happen. 7.3 generalized it to more cases.)
> > 
> > But is USB core really resetting a device for which the hub has
> > reported disconnection? Something isn't as I would expect.  
> 
> I suspect udev, xhci virt_dev, and thus xhci ep0 ring stays intact
> even if device has a short disconnect during reset/enumeration.

But this doesn't make sense, right? If the port reports connect state
change, we have no idea if it's still the same device or not, I would
expect udev to be discarded. Or is this some "USB persist" magic?

I didn't want to dig into the hub driver or bother Alan, I hope we will
get that debug log showing what usbcore is doing there.

> So even if we give back all pending URBs and clear the
> EP_DROP_PENDING flag we continue using the stale ring. We should
> either either move dequeue pointer, set TRBs to no-op, or clear and
> reinitialize whole ep0 ring at device reset.

This may need to be fixed regardless, because EP_DROP_PENDING on EP0
can result from xHCI "Error" aka USB3 "Inactive" state, which (AFAIU)
may be cleared with warm reset, without reallocating the udev. That's
the "existed since forever" issue I was thinking about.

Regards,
Michal
