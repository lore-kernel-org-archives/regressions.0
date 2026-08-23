Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC5F388E4B
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787499667; cv=none; b=LZ2JRNBg5UajnE94MU4m0910mrmed4uNG4k5HYJAiacqidbf5dUdtFh3+8r7ylh60wHBAmBhRWD3NeLNRWV7Fw9I49Y9SxmXouxVXJ+1gNP0k2FpVhx7OtHOBidJVr+OWNtaFiTCeDkkAeObDrRM+FZSK+UaxUyVZC6VALn4Duc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787499667; c=relaxed/simple;
	bh=9eWj5XAL93q32Q5MLRGJkVADfGX6bq+xqj5j/soOMlc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/S8cl8m3hSlTg7CNkzGjsuUoO5jd8gaPH3U6cCtQJHaHxKnyDwZEK6P+jR3yJNBp2Byye9J9CwGUpYdFtg4Ik4xHczPkTbns0MLijW/Om5vACRFSrLCOMw/Vr08inzxdgQRfu+4EmF4yArfnxCB3FbMnsPMhT+WczL8tuemvL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1yDyGUe; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1yDyGUe"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1600d040e4so398648166b.1
        for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787499664; x=1788104464; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oEct0orVM3nYfYZT6CEjrYWKIotoQoECzwgIHGor4Mc=;
        b=g1yDyGUe+xDYRIQS3F/Yep2JPuG0G7j5vFpbuoOMjGAVtbLErekqvKdUuRyl2uSDOQ
         0PF3ZAasXonPlF289IxeqoEgvK3uVVbGTnGsWu7jOGUWk23HT28m1tmGaISKI/RqRpzo
         MFBZF4m0qfyh06tGo1KvckwhXjQRYx2nVkc9nFYaHnV/j0TC5/QOD/bkWdohjwmsqBe2
         kaPVRA6iOE5ZAEyYLK1PNSMsaHZ6IK8JatsSzOcBYEq4BX7W5FCLcdXOqqy3EzAEDv8v
         HaUt+HFiD/7cG/78cRerOz1K6jAnLnqwkTTfYlyux4+NbMLTOskavILPaNIZMRSKe+U5
         1SAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787499664; x=1788104464;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEct0orVM3nYfYZT6CEjrYWKIotoQoECzwgIHGor4Mc=;
        b=Zm+WiQ44cG+8mA9oS5GPOIi6x1CMcjCzTkZ4ZN4PKgR1n9hnPgjzIhKEnzS4Is4/VQ
         NhGKYhCuZ9b/71pErU+NAOu2wl5NuwF7R6ZHPCoSrJAA+NGH4AMauGfZWBFy0GPAcKZ8
         BZYR6E/1gFID4saKeRPyyCIo5+qNiQ5llrRP98HsFILX00fReU3piReneBXEVjHNfNRn
         GqocmfjsKij84UhjGDCCMPTh0CNU06IWTAbIvJyeA2HVfwTYvq+sHiEy96iI6DAg8S/k
         XLkZqKRSca/mbqT0mFS+gN6a6vYLCvUW3kv01lLjauP2om5cQJRPtPcRBVwbxe3YN88J
         dF0g==
X-Forwarded-Encrypted: i=1; AHgh+Rqd7hyhDXr1MlkN1XjkF7cZBD14kRSgWW6SMLcwL0O8dFFpZY7ZQX8QjTVouEuRd3tpd7+G6N1w8UvmHQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kIWMRnr/wjYaAlUjM5DVnrfj+7iYhRLaK7zZ2XO76U692RgLDR
	PCCSHJsiiAAEi1q2MWOchbAnzKYl5d0oYnPMB9P9U9crcW0+lmrUNr3b
X-Gm-Gg: AR+sD11HpfgIJV7BE8COIc9VOzP3nrRCLLFcYwXKGazx+1wIkJW/czpQsVVTu2fUpmv
	ZrdeJcjEL4lJ268YmnhCjDgH2RMX0Sr1YMRC7qzPYeBxgCr4JLv+3i4z8vd2KEN1Q8Fj4T/U9bo
	qWrB9LoXhgO3FSrYmhOcQrK5OtwdsfDGjFdDwuVRsyKpyOsd6DYVkMwAAy8o+DLqJJ7PAY9V14R
	2SblgPGht2z+RxZ6xYSUu/glUo56n/mgT40mKlgtdQUv5NL1f47z+qXv9+RK699G3voC7/pHUOg
	HuSOwvSOFsSmxM8mzot0WLQx/fKFbTxeler+4j22994JzVp5s5RKQqras2NPkuZ5SAz6eVwZTm1
	GUTr5Gimd6JgYU4sGCD6IWyLZKY94qFTb+zvcIp7sM0P3eLKJOSXhhFYAt7+ck9RJ6qn3lsruaY
	g86nrxNrdah5GYztXpEAjfKSm/y1ESnq58+6L0hS+6bAcfrqBM0LMox/zGqkw3x6duJng=
X-Received: by 2002:a17:907:9610:b0:c12:3cbf:9f6d with SMTP id a640c23a62f3a-c246d582330mr1894237766b.1.1787499664318;
        Sun, 23 Aug 2026 08:41:04 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2495ee5295sm843708866b.0.2026.08.23.08.41.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 23 Aug 2026 08:41:03 -0700 (PDT)
Date: Sun, 23 Aug 2026 17:40:59 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mario Limonciello
 <mario.limonciello@amd.com>, Forest <forestix@gaga.casa>, Slavik Dev
 <developer.slavik@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <20260823174059.46fec036.michal.pecio@gmail.com>
In-Reply-To: <aosGtkE_diwVJJtB@eggarch>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
	<CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
	<CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
	<07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
	<aosGtkE_diwVJJtB@eggarch>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Aug 2026 20:47:55 +0530, Lovekesh Solanki wrote:
> I don't think a revert is needed here, we're just trading one
> regression for another.
> Commit 8f5b7e2bec1c introduced the 200ms hold for all superspeed hubs,
> but it's only useful for external ones. Root hubs are superspeed hubs
> too so they go through the same code, but there's nothing useful for
> the hold to do there:
> A root hub has no upstream suspended hub whose wake propagation we
> need to wait for and xhci already handles late USB3 link training
> itself.
> 
> Also hubs have a 0 second autosuspend delay (596d789a211d), so this
> hold is the only thing stretching the awake window.
> 
> and anything opening or closing /dev/bus/usb nodes auto resumes and
> auto suspends the whole host controller, adb's periodic enumeration
> does that so on the reported affected systems every SS roothub cycle
> grows from ~30 to ~235ms (from the dynamic debug traces in
> https://lore.kernel.org/all/qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net/)
> which makes suspend move from close() call into delayed work and
> results in the ~1Hz stress loop described upthread.
> 
> I think skipping the hold for hubs without a parent device, i.e. keep
> TB dock behaviour everywhere it matters, should fix this.

It likely will, as it effectively reverts the problematic commit for
those particular affected devices (root hubs).

But I'm not sure what you mean by "1Hz stress loop" and why is slowing
down the suspend/resume cycles or moving suspend from close() call into
a work supposed to create problems?

I would naively think that doing things *too fast* is more likely to
trigger races and break the HW. The whole issue smells like a HW bug,
or maybe one of those "undefined behaviors" that the xHCI spec warns
about if SW dares to do something out of spec.

So why was the culprit patch even a problem for those root hubs?
Can it not become a problem for external hubs, under other workloads?

Also, what if we connect a downstream SS hub to the root hub? Will this
not cause the root hub to stay awake for 200ms again? Problem is back?

Regards,
Michal
