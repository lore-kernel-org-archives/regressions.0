Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C9649C4D1
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 18:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373318; cv=none; b=ARJ+uMelbI1uqqMpb17gpNYHz4Tpsp9dGU+yD413rZgEbrEjj1sLTTtn3BxDHVhMDCBFz4PvjJxC5oJzDTUjGDqB2rNoHMcRnskDS8RyQmTdbyQEQZS31F08QDf8tCQqxEj/zgFjaO67syT/fd07FTr3WCSOJkG/b3egLPntLMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373318; c=relaxed/simple;
	bh=3X+93BwJddB9py4mR0joP3nCeAIwwXvBE0mNLCtpoZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+a3jy6TKOhDefQIA52+Ri39Ax2dnNaislQBAix6Oi/utQ6TGplyTXgVZGM5WnEH66Uk2qy18BeNOS3LQADRtarbwmRTW938MsWwJUN9lT5lhy+QDoPFrElBkFCUyJMAZSIe7256B6YJMGnZBizXpomHgGGiCYRY03rTgbUjjRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NS3OzQM4; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NS3OzQM4"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39682983a0fso1830986a91.3
        for <regressions@lists.linux.dev>; Wed, 02 Sep 2026 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788373317; x=1788978117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3X+93BwJddB9py4mR0joP3nCeAIwwXvBE0mNLCtpoZs=;
        b=NS3OzQM4Ks0e5zAZhFNkGXHIeLLOU9SblLM7Zx0DW3QMjygEdqamotI2uQg5UWeiCN
         b6c+inyxMLTYR/OZU5dA/SBO6Pwo3BBWVVRgV+mdkpxxtWKDTQ0Pfeh1z1H1mEbdLchs
         YBXNmPh6HxxpUAdPCelCgTi2QJZJgLoIjiI76eZ4ctGUMK+X/E+c4OtJfQPgUvRagg5e
         1Lgf1RaMRvWFFVMgX6B1yr37e4OIdh8okkKvp+H4oBhQTycfXLd+CSnu9b0uZWrkhuir
         gYatiMA7nYpX4lHMXU7r6bSnQjiEBygfAUXCi+IJ7MsQ/vJSzBoSbCFkIS2PRNeQm8/+
         2lNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788373317; x=1788978117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3X+93BwJddB9py4mR0joP3nCeAIwwXvBE0mNLCtpoZs=;
        b=tQfmTMDXuwOulkCTdRY7b8mEwsTEZFgfHxmxzSJtmpmEMdIt6lvjxcijVhAWCGgmSa
         Zo7XRaD++FoFdYXAiVfhNL4m0yejXPoTzZeh+Ziz/rM2L/lkcU8r2479yE+VLRWPEByX
         2S83se11Ti1rU2dB5v/+LuWAY4BV5BLImObxk/RCksyFLhTEIsz5uHobEvJYc2/t4ebd
         fMnHAorzGfHKzissVBAdQLoE+h37ZvuuKtp4P6EHzAi0oKPzA67xZmyUVo0l2T8OjDP/
         xzKdtNwamDc38XVoQKYla2Va6oQ9hQF77YGAo5pHZAf3f82jFMt01loJQhqVJnyWPZC/
         4aHw==
X-Forwarded-Encrypted: i=1; AKwUvBzmlb8oFyrHnaoqeuetOh+259oIAB6CdBlS4kK6LjZawPSegunrlMQWxWebFSodVWRIja5P8g2gNvTE6g==@lists.linux.dev
X-Gm-Message-State: AFuF++lbOQ1FX/cAv5RH7yoaGhUBjTdHlNH+w3TjFEhgnzfxmfqoyz7e
	jBNQQ+oz/zaDEhI00via1rJx6iE66YnXdPyjupcUBSlRoh6tkajjqsKX
X-Gm-Gg: AYBFou2OHjeEbbAtq5l32XxHbETSEUUE1/mpye3OiFhgF0uiHgT4kSSKk8iS7qFe1ce
	xzuSnVwfUGMs1yTpU9fQu7/uQia1UiByIhAnU5uYNV2ymbqpiIqG+obBiYNwMPQpp6nC1wINPkJ
	Ki5ENJr4fQz5gBrcXsn41t1PYGY+aiRH+0BZtEqj0QObd5h1yBOLf85nL9w3uQ2Z5yqYjMVagfo
	SVU6VscqSMIcQ8dN8x4pPMwASNSaPxM38bgSwX2leWtLSi2njwdvkvAv5d3WQYXn3i4B1YStDa6
	p9TYl4/rz1ybZrvoT7BKJ0UlDe7KPuoLMAsZ9tHM9UxPQznc5lSDovurD/SMzOxYXVgbyictguN
	4dS7ziGJpYt+BLjU9jQpsr5sh64OQLvyw+kHvR+cuaNO9BFl+dw0wRlOsP+aLlUI01/I9uLsQSq
	4kNkNsmxIX3hp/28dflGG2igQBTJg59URDaIRyd5HAbgj3oEDhOH/LIbjfFwmBvzvL2k6NctMPN
	dx027ePFraqfhPEg9/DVWwSGGCotq3UTE6y8A==
X-Received: by 2002:a17:90b:5109:b0:399:e97:8d5a with SMTP id 98e67ed59e1d1-39aee152d79mr10767129a91.25.1788373316382;
        Wed, 02 Sep 2026 11:21:56 -0700 (PDT)
Received: from localhost ([2409:40c4:d:5c19:7852:60e7:cc2f:a6de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f7d77sm8745198eec.12.2026.09.02.11.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:21:55 -0700 (PDT)
Date: Wed, 2 Sep 2026 23:51:51 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from
 runtime resume
Message-ID: <apg16LtZ-ru9MIBQ@eggarch>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
 <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
 <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>
 <apbrp8EaJoIfEg5X@eggarch>
 <1be8e57f-9abe-4b34-bc09-e7934a2fa1bc@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1be8e57f-9abe-4b34-bc09-e7934a2fa1bc@linux.intel.com>

On Wed, Sep 02, 2026 at 03:10:41PM +0300, Mathias Nyman wrote:
> It's possible PCI side or pm core already provides some easy way for xhci driver to check this.
> This specific issue is currently not on my todo list, yet.
Alright, would you like to me to work on this? I could look into
that side and possibly come up with an approach.

Thanks,
Lovekesh
