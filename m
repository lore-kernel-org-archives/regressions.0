Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.125.139.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920360;
	b=RmHPhhKh/WNSqPxxxjvmxJZRDQissiiOGm/FJbQDbtJ+CXk+dkVOG2T6OgOT3YB++mJm
	 juEJsjxO6sSivQG7Bc1l47iGJOS/8+8rBYvVd2Qe1y9WSvp7edL30RaBmuCnudJn0gH3x
	 DD3OYnVsX646WjIXjdXxIsgfUPqEGPicAJXcww72zKpwO6ChbOmrB0Lr4I7dlU1WLO/X3
	 pKj+13E4WMoJBGaZjoplfzHGfVM4Ir5gFxKDLSABW5Zq8A9HIKz6rYYzQRHO2ufkTXS66
	 7W70OHKd0vhfyWZMJaa+HG/BWioMQrZPaN9zSO7kWxHfd2NNEpR2zQPXSTtPlf91dQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920360;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zmYS0GN2id4S6B9+p+P2ma3OGfmv55Yw6pTtpNz0ax4=;
	b=dy7kUiLqdu+waV/ejkX5Cd1cOCIQCY3HNLEO2YhVFiccZ5dCzq5mHBeJw2bzHB4wr+Qh
	 6qxfLu0VSdOAnvt+27bzA4AyLIXslXTsYdLwJfWSt2sG3J3fSBv7LPnSsuF7I7kfVeMf+
	 sjONloJecqobvjyLWV+P7xeWgJGYGwWvDVlu2ValiQ9JF1dMWmlzIzLaVkciK4QAHtcWD
	 iSurijoBXCGBktRCPutIhDSxgcQl5/X4PKsQNoColTVTV1Nw0EBTg9UcAJ0cWDd2XUsZS
	 GdO3TiZea6szfCfEf958ryBMV2acA1csx1GQ0+hqc5ISYJg+so8LSfDbv6YVGXg0zlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sony.com;
	spf=fail smtp.mailfrom=sony.com;
	dkim=pass header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=s1jp header.b=M6+5xZo2;
	arc=none smtp.remote-ip=211.125.139.71
Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1087606A33D
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 12:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1087606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=s1jp header.b=M6+5xZo2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1794920360; x=1826456360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zmYS0GN2id4S6B9+p+P2ma3OGfmv55Yw6pTtpNz0ax4=;
  b=M6+5xZo2zqKfw8JPingnakCO0FG7m5uoOx92DmTWpCXIPxTdmS7hmgoC
   gAaTdykvstOzd7bOy1jtUsHyQkYgPpcu3peyMd6gWVcL7O4OA4zsJWm5n
   VrrTVAt/m2x054vaAE/Ieemq4oQEjqjEFQmaxKZewt28vdxoPN+luBYbP
   heHK4EQXVPCe8/+SNDPmiRG0MQ5lb3uv36C68i8yBcxOnP0kuq3rSU0r2
   iC8W0zcKtY1g6wtxplNdahM42m24ENF9ZbGTxvauGUEkLPuhj4nc3V8DP
   kGz0hRnInzEEfcxSzn/eafvOAkCXoX3liAYnnB/nV9vPt2L0idsUKPyjR
   g==;
X-CSE-ConnectionGUID: mgDIiWA2QzawOw3EgzZVTg==
X-CSE-MsgGUID: 6Eg7HelrQTKsAIl+Ni9TRw==
Received: from unknown (HELO jpmta-ob01-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::6])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Nov 2026 21:59:13 +0900
X-CSE-ConnectionGUID: o/EHE8gRSzCh9O+gy3ZboA==
X-CSE-MsgGUID: PGkxXTqkTACjjzKTNEoReg==
X-IronPort-AV: E=Sophos;i="6.27,166,1786978800"; 
   d="scan'208";a="85562380"
Received: from unknown (HELO jpc00229873) ([IPv6:2001:cf8:1:519:0:dddd:790b:411f])
  by jpmta-ob01-os7.noc.sony.co.jp with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Nov 2026 21:59:13 +0900
Date: Tue, 17 Nov 2026 21:59:12 +0900
From: Naoki Matsumoto <naoki.matt.matsumoto@sony.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, regressions@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	chenchangcheng <chenchangcheng@kylinos.cn>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sasha Levin <sashal@kernel.org>
Subject: Re: [REGRESSION] 5.15.y, 5.10.y: media: uvcvideo: please backport
 5b9c75c794ce
Message-ID: <avxPoIvOXcFZayI0@jpc00229873>
References: <avxKOmxCBLF+7qdT@jpc00229873>
 <CANiDSCuX1+ehTGN=HNuLL9YBTt8tUw6fJ2D1JqfePQGaz+QOzA@mail.gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCuX1+ehTGN=HNuLL9YBTt8tUw6fJ2D1JqfePQGaz+QOzA@mail.gmail.com>

Hello Ricardo

On Tue, Nov 17, 2026 at 01:42:00PM +0100, Ricardo Ribalda wrote:
> Thanks a lot for your email. I believe I already asked stable to
> cherry-pick this
> https://lore.kernel.org/stable/20260323-uvc-backport-bpi-v1-1-5b62c6798ccf@chromium.org/
> 

Oh sorry. Yes, it's a totally same report. I will watch also one.

Regards,
Naoki
