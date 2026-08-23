Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D9A31C56D
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 17:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787504732; cv=none; b=Bfctp+wVPX+PjV1xdMctSexy3guTK7fJjw1/rbFILMXsV2sfgRWvzBKH2lstEzA8AEqvyrhSYQb0hMzJrNbijU4X2WH3CP5Ggk18n+Kar82CTIeRi01q7/kfv62Nx4yemvoWR5QEBFCidSY5MYt3SAE/3OH1BUTE366uUwzKaL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787504732; c=relaxed/simple;
	bh=tZ3kOiXAkP3ZajzR9DGtBNJIg33EF2ByFAZEw7fsQVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DT1iPqkJGVEw6Iz5sPD4ihyGeVqNas/yqzbS7C+x3B1VlvF8KcpRLk3yBilPu6JqfdkZSaiWIRH3tPa3yAHgzjBRpoOSXz2qTSTMoyOMTxh7aUU32MerFKguRFhF0+qWQWDRbNbEbNO7RmVBl2JTklDJiCaS71p1aUUfriylXfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AER+liEB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AER+liEB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ce98cb8165so25181545ad.1
        for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787504729; x=1788109529; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pYrUZlO7IqIkRYhROYYB/AOAuFYaRX4X5UCYzj5mFMc=;
        b=AER+liEBZ/tdJ3Ym+SXRZhF/69pTgRfycAf6lzXSwjcs/UAEMKnz1CH7VcwH6UHonU
         hqJONtCfSok+/FYYELvAganckb0gKWumvMcgMyQIO04b9i19B03X6f2ADYLOUsKoYE5p
         QzUW/c9/5tWJx6Po1pAtTOb3kwn41dZtWV6SxCF05v3SsPWevSKTOOh4j0ZSDqErwN31
         1WggRwxK7gQA/OFQJemRPG3+cQkUcSiyT80MVPKbx+C9lAhVWkNVrX7D1gu+64C25G4q
         y5v6rwybxzVp/byUtD85sI8ChEN4A5zUO+K5+SIp6F3SN2yNAoBTTdP6/XKbqClBV9Vj
         hD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787504729; x=1788109529;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYrUZlO7IqIkRYhROYYB/AOAuFYaRX4X5UCYzj5mFMc=;
        b=KL/Uc+36hg8tF0Hxpg0DXrzUfLl1cQS+ZVyuyPyY6b9JGpvjqpTaCiRdT4j7PHQlhH
         F2R0Zeio/kRsGcH4OgPHWG2oxWb+O8/BF7uWmblJ55JQsB7IycZrmADMH3J1lR8/SsPH
         hYZUlHn9eyzXIHugx13OK5Y+Y9MDfrUYonPA9h+bkxSKwt8p3olZ3t3qPZTdbr4gKNuJ
         z3eu2sQbnSAcXyV2m8USaSM6fBr15q+h9DCtqEJJ+qhZogV7YYRwNJCIDoYVTEUbwb2T
         TYNsSf4r05556ePwVv1XUJlsrYYV9FYLwRgsKe2Hv2lnO3Lord/WyuiUON30E8ThaCl0
         Wwog==
X-Forwarded-Encrypted: i=1; AHgh+RpqUiQ6EtOKKkEeDsIojSCd50/An/hYrn64LGSFsjm1ctY4QPxF/UHe2gI3gq6yuq5k1sQvMdm+4fLluA==@lists.linux.dev
X-Gm-Message-State: AFuF++ntxGKuyhYYOergnsuD44uvsqW4QtQ1oLTOVfWDrnR3DOqknjSV
	dujR6PDLcaipfi6e7GldCdncheqkGOvy3YPqklNZyeF5ZoMqilbbcduVdJYat3mt
X-Gm-Gg: AR+sD10lTSRTYfeHBBT7zSLQFTXCgp/KIJ+mJoKW8j+aHGDseMWeznwRUMjJYfwHtTH
	cxL8M9Y8cu21QEhQLdQWkNuNG3WYqBdQIAWSY7tADTyoCJaCznOOQM+MBoGsfQ/QGOoMT3QFA3H
	hYFVThMEQKtpPL91+WTjWEpF5K58fIEQk71JC6qnLq7voZ7N2JryGEVVTwb/xNDimuosYkT3r6j
	Q3ziwaOI8EDg0nejVOE4yMT0cYg8WZe3Ok6EF6+qgkGhVuW3fZoACFqS6QY3EPw1XdBqyxb7Avj
	XYvm8rxU1aWrLGYs8QHRROImHNq6ZJoKTOrFuIGAOUuzOPtikiDfVpc7iuXq5q6TpxYzAN/IVVx
	d0FlAC4U7+t3BI96r+mXE7vtOzyZ00drQgXUu43d7ElRuW/Y8hmuLyUoNLAPAfc1CVWoMuwKwhr
	9THgNaRxmfwsBwi4UiYtU9sru89h/Fb4DwDtP1j396uE1P+Ud7be6Rfvk0OGfOQTqLCMjiIFkxY
	bHkpVhwFAkq3Y07uHzl0v58glfF
X-Received: by 2002:a17:903:b45:b0:2ce:a6a4:451b with SMTP id d9443c01a7336-2d61a183641mr202719365ad.11.1787504729357;
        Sun, 23 Aug 2026 10:05:29 -0700 (PDT)
Received: from localhost ([2409:40c4:35d:a0d7:1d3:cd30:d9bc:b5a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm26172029eec.16.2026.08.23.10.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 10:05:28 -0700 (PDT)
Date: Sun, 23 Aug 2026 22:35:24 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mario Limonciello <mario.limonciello@amd.com>, Forest <forestix@gaga.casa>, 
	Slavik Dev <developer.slavik@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <aoser8dLytrwqBC2@eggarch>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
 <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823174059.46fec036.michal.pecio@gmail.com>

On Sun, Aug 23, 2026 at 05:40:59PM +0200, Michal Pecio wrote:
> But I'm not sure what you mean by "1Hz stress loop" and why is slowing
> down the suspend/resume cycles or moving suspend from close() call into
> a work supposed to create problems?
> 
> I would naively think that doing things *too fast* is more likely to
> trigger races and break the HW. The whole issue smells like a HW bug,
USB2 roothubs still do 30 ms cycles and are harmless, only stretched SS
ones kill the box. So if speed were the issue the faster ones would be
dying first and pre regression kernels ran fine.

About 1Hz, adb scans the bus once a second,
every open resumes the root hub and host controller out of D3 and close
puts it back this existed before regression too but with 30 ms of
close() and slept for rest of the second and now it keeps it
in D0 well after close(), the suspend itself happening later from the
delayed work, so this d3 - d0 - d3 trip of ~230ms repeats on
each scan. That's the loop I meant.

> Can it not become a problem for external hubs, under other workloads?
Possibly yes, but nobody reported that so I'd rather scope where the
harm is proven.

> Also, what if we connect a downstream SS hub to the root hub? Will this
> not cause the root hub to stay awake for 200ms again? Problem is back?
The root hub itself skips the hold since the check is on its own parent,
but it will be kept awake anyway while the downstream hub or devices are
in use which is normal activity based PM.
If heavy polling behind a real hub ever causes trouble that's probably a
xhci/platform level fix anyways since real hubs can't really just drop
the hold.

Regards,
Lovekesh
