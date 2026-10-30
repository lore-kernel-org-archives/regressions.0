Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361939;
	b=YVVP2Pcpay18sXsZ6jaazO5oNZVyDvQdAqtGtnkcILvhGe7DtSfx3RPjUbBU44eVnGYz
	 sa1YtrTcVXGvmKe6LKKMhTaKojNp0D3vF+YbPADVfJ3p+qTSJ0Uj3odOQ4Xm1rBPIQi09
	 U8VxCVIkXe/Khp/twNPzY1jKM/lI1rcfV+b72BoJSI9lsI8vGGREeulm03QD9d0+Ft2hh
	 rqBd1SiHvF7wYc7NeTTbxcn1HYmxFsvvrz7p3B8K78VDmaLPcBn6i9f4H8/EFZGvzMo35
	 eB+qj/Wbse9OWUFg2rXX46sS96gyyZ0BU22XzQewSIpsTNYY1WZ6YW/482KlbFXUmMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jr3UzJy1RXD3EkYxBH1h5gaWx4Lr73w+qKlc2cURMHI=;
	b=Tftt3u9G5PIh8lmW6QUuE/GEN6rL+TcHDRRZ+Y4nhAUnWJAKFLwzEbrUdXZznC3R0atx
	 BkHXucfgyGVx82o3fhuMUWeK8UYeVB7WcXOtncNDDELSJ5mk9FyO38ZdImUz+guJwzBCb
	 lmlcnQyIfI5UqQx8lyJR6ulnAmVaollBrzCqmbVuESoxBVTqjZ7EEa+1skGaLKlpyBsti
	 JSev69QK1RVUbh/9C6/Zo16JbxeO0hnZGX8FOch4QHLcaSkhKJQ7LYsIsFwJir7nbqwVt
	 YrnwPNJ4f55Hg0ryGAPmvYdNxkvxN7WuU1Y/Q3C1C5Z6fcWZ13Gu7FxfnvssD4hRi8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sWyna3kX;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C5A606A336
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 12:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C5A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sWyna3kX
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so6380755e9.2
        for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 05:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361938; x=1793966738; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jr3UzJy1RXD3EkYxBH1h5gaWx4Lr73w+qKlc2cURMHI=;
        b=sWyna3kXix5MUvRW9FIpVZM8PXhQp0sRIoNuB16FdkusiH7o6o5g8DpiaX3725m3jz
         s9SjlCiplOBOmHPA4k9LtxW66v4wYIwYrt082ZxABqQvMWXpzbzIcHZ+qT+PqA1ymor6
         +R2CeCPVIa2axJg2YQloWBBOP1+VnAPyXctm0GTGddcBoXn+6jsDJDldCu5jpf4NB1hC
         yoARp5iit33PgfBY6b4fDrb++nlKMYEuzvGUQNlXfchsz3PnwTWUMbrYRaNZHKHEaoLf
         PlJkE1J0Xq/BmfxZq4gyhizS4gBtcUX8ST1ELh+Dot5InyN2S6l4gvWawMVi0GocqiSz
         ZXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361938; x=1793966738;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jr3UzJy1RXD3EkYxBH1h5gaWx4Lr73w+qKlc2cURMHI=;
        b=xocApG9mgGPfiG0MK/KglqGb8gmrWCQk110WQ7JlUM3XBo5vP+iN9Pg3nF9l6hXreI
         XOJ/RCvdEFKMFfAgxpbRo/bKsVm24IFQULDY88173jOVwcuPN0I5/zOP/AIPOYi7WV0I
         txH/bFkOp9aCheDIcsSvBsewFHJaDTPYlKybz8YqF0UqJsGxBZzgfLG4ZcbWYSqTYXwX
         XNPJoCld8K3FfAac6Lt9hpE72ihvLQMUy53Mxgi7H4kvcbVAMwhZ294gjLM2anxDlP4c
         v6U3BnulX+ml7V1J5WwhETDV5fPQATdz9UkZXv5gROKDOIgu+fnABUVlu7uUUifdQlb3
         a6Zg==
X-Forwarded-Encrypted: i=1; AKwUvBxNcUK8/bQYLD8cdfLjesi6OkIxvtzA8ZrwzJ4gI69O0TAnfAvD8IXkuxGZ2tvoELmsNBMRhR/htzrERg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJV8MQRLMruWXq1MvNxvTtnP26Dq20qCDoEkfPOr0oKvfza91zC
	gyFt5FEKSX/y7pis8y+bYh1ORKnnCNNlxi06OUA6Ysz7ZlvY8dOCKR2KgUVliqs9
X-Gm-Gg: AYBFou1Qdv/0Fh/xjhMrCJ7mP+Z1XYy53BSnSE48BseOz0RUE3RhXU6aeeaQVZWTCNP
	rtkm1cWYa3o53B10+OvUeQsujP5BBy/oRCJzj66NkjMG88CqVM8l/YccNp7MhKG5q0w2WN/Wj3R
	Xny3SFEIxfEK0+RhH3eq3g0rdK+32yIOYi5cJ5Wmisi2FPyVbbu2qbrTORnMwGz4JvNBEtKQdzG
	axKVS1P5YHDdvOhpwBsNB33uvpJmbOVKJ73z5zMOk65Usv/dM03hvNhyMpT6VlSZY/sS380a4qL
	GEHgsTXFL5WwqIi9Ssx7vh1w5AL+aE61h969J8tX9Q6bfU93YdY/3oVBU6baBjGPShljx9Tg8LS
	MiktE4XQdWza1wipROC/RfxEFmQY69sFRt0GXHzAWagngjV+80T1aafLzJ9DX4yFYIvH/ER3zZ/
	qmsXOHK26OextDxP9JgjBFIHHGdKyTpKuVm3jReKwdKw/duuU4nShRE9qTJjjnfuTSBYwKVdrxa
	cWLfkPa72f2OxCHxFyDOIZg1phbUuq9gYJttMZHeRo2iOlkjWQbje8pQpQ3jacLEfjZMLMGQ+Dv
	2gPo0NUwiw09VQTs2PmPVjJu2bBBi7C651JHrCkRbC7L7Y/TOFZN+f3TchU=
X-Received: by 2002:a05:600c:5397:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4ac1899353bmr43628725e9.31.1793361937662;
        Fri, 30 Oct 2026 05:05:37 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm2853609f8f.51.2026.10.30.05.05.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 30 Oct 2026 05:05:36 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:05:32 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Yiyu Zhou <yiyu@yiyuzhou.io>, Dennis Wissel
 <dennis@dsine.de>
Subject: Re: [PATCH v2] xhci: give back TDs and clean up ep0 after
 disconnect
Message-ID: <20261030130532.36a75025.michal.pecio@gmail.com>
In-Reply-To: <f362a385-e1d6-437c-a31c-fbf4414fa0f5@linux.intel.com>
References: <20261029204324.658845-1-mathias.nyman@linux.intel.com>
	<20261029204324.658845-2-mathias.nyman@linux.intel.com>
	<2026103009-handful-labored-d1ce@gregkh>
	<f362a385-e1d6-437c-a31c-fbf4414fa0f5@linux.intel.com>
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

On Fri, 30 Oct 2026 13:05:16 +0200, Mathias Nyman wrote:
> > And sashiko seems to object to it, is that response correct?
> >   
> 
> It does find one potential case where this patch does not fix the
> enumeration of devices that disconnect during reset.

Honestly, is this 7.3 code being fixed here reliable at all?

As Sashiko points out (and I did before), we are 100% at the mercy of
hardware and USB core with those "connected" and "link error" flags.
Sashiko thinks that we may fail to clear these flags in some cases.
Is it guaranteed that we can't clear them prematurely at other times?

If USB3 link comes back after core has cleared all status change bits
(brief disconnection), we will get another Port Status Change Event,
observe the port in "Connected/U0" state and reset these flags.

Is it guaranteed that core won't clear change bits until it finishes
disconnection of affected devices so that all URBs are unlinked and
we can no longer run into those HW bugs anymore?

If this fails to work, it's another regression vs 7.2 and prior. The
old VDEV_PORT_ERROR flag used to stick for device lifetime. And it
could have been extended to all disconnected devices, not just the
one directly attached to the root port, to fix disconnection of whole
trees with hubs while avoiding the above race condition.

The reported USB2 regressions would have also been avoided, because
old code only applied to USB3 ports and there is no actual need to
generalize it to USB2 at this time. The bug still affected USB3, but
it seems nobody uses USB3 devices that trigger it.

I suppose I could fix the Renesas disconnection issue which the 7.3
rework tried to address with an alternative patch smaller than this
fixup, provided that the whole series is reverted. The preexisting
USB3 bug would remain unsolved for now, however.

Regards,
Michal



