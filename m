Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417A3399377
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 18:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831098; cv=none; b=JJci6hsZnePlZFOzMKwcE9Ne7k9rT+/kgAnn6+9U0ODe6YXduic3CUM2dS+eUgvg0z6HPxTCZm3+NIfZKwjmFNYJbZuRiJmsKAbPBei7hndAgwMbMuDYHignjFh8Ofxe4zC1BeJc+3OFt/AAHIGdJuK0kasYN5bmllYYPFZeJa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831098; c=relaxed/simple;
	bh=eg8iQH53XMr6U9fhAElssnduDO8S6/m8PGLFcG3o0cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQGKMplMr6R9twWUlAsdPE+xpjCvx2yElbfjl9WRyD2jRaVAkibevEGrEyhs/sMaa+CrwxKuEutFaQNsGEXWr0n+i1KXwXuu3lUlDkP021v2FEjBHtS4WIvrSdVorTUJIF3LBPgm7HDD4AABxfOcjIwyLjDIOGbOs5xsF2KfjOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atAw9NdT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atAw9NdT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a168355946so19258505e9.0
        for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 11:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831095; x=1792435895; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ky+Mh+cO5xMBG7Bn/5pO6nl62hMlLNRWkoqZnT1lz8o=;
        b=atAw9NdTMa1au4bJBHs524qlwg8U90aDgAfVYXKkdTJjzgLsNvqx+lboErfTsrdcTU
         VA4/cxVszCPTVcXGD8ETgMfQZpRojXyIk69jq12BpdVYJCBgiNJ6Rk2HX389OT3lmWBD
         bCCN+qLNCK5PGgcj1FLTFnQiO8V4af8E/sd2BgzsUeIhsI/JiRQXb3zVVHS07r8Ojwej
         GV9AXcEuSICwjO03PtX22uoG6KZNdK5bTHdAGeq89IOEQPalgWPbEXQKriSpY7/I3MJm
         WWS2Uc6fx8ZJ+hSSPT/eCLQYyv5kxxFERzHwL5qunV8CnNWXwouSm9v1plqfT647jZPJ
         4WHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831095; x=1792435895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ky+Mh+cO5xMBG7Bn/5pO6nl62hMlLNRWkoqZnT1lz8o=;
        b=v610ahiVBh5ep1vtDIp8hjLorbIXLZH6HxF95dJnbu+BasGxaawkGBk+tme9M6I1i7
         xtdnSYtVJLJiBoRzmeOpKta4b5Bh/8syl/qfD/8aSNXKlBt9IGbPRLvTyeQHqU3A519Y
         JyVLuvpqwf7hklBRpsxQK/MjHP8cZPpw4rIZxPZZhi9lybM3oAUslmW3MBub99URZpN0
         YV4T8+mAmfr+sDlDm9hXRGjropVwLbq5GWW0rmfce0sNNYNAoVANp319MU5/CDSAPdnh
         eR0PFSoDchzma8JoBMzPFA4ypNCh57JyW/uu/6chN2rKQAKbHbl8l0Ujqr4hcZ7TiMVN
         Wz7w==
X-Forwarded-Encrypted: i=1; AKwUvBx1T3B2j2w3ITYCAv/4g7WgjbaCkffdH/Rq37ukLhVzWrP9z9TaRwP5ghxDzI0A9k61wP6TiIImwflgMQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKlip1/xxoLGYS5Vc3hdHobwUZsm7IlKNN2Vhg+M/yeTm4uxA5G
	kddVU7Z4UPgw1CAwrjrlSa+zPB0hK2YZowlvyMz3iN+bj4vYzrNFu8oK
X-Gm-Gg: AYBFou0c2ulhC5RTw3E/awYRgkbYKhTl0mjmVv/bSYRHvseT5OYyC8oVtnfhky/7u0a
	FA6GkX3UmGHYe4AhBTj5Mq5x9VW87e1Bfph/OMjZ5l3f06Zhn/1675O45kLuukwrT8VqiY9qKIH
	v5PHAO7U4xp3aoGx30Ux5Jvff7j6CDJThYhzMcXosguWSvcV4O3ZztuXjTsn57gEdV/vh/mQGC2
	utLjshzwzw1uIan/qG5fxdphbQq13UMQtxg5pHlAapwwEO3msI+TAwwd7JVzqn/o+OWGK8wBxe4
	R9feQYVrK6TsmqNRXawLGWce0Qnv0DCM4dDtpkyzthNsWPd95XU+CR4lBOyzm7cZej+QOclb4m2
	Q/ZsWaaHosOWBlq9/7bgaZNxeJoub5g4LlxuBgle8Ui+pCC0gxZTmxXbCpBJplozt0ZMxZGSIOg
	PHZAS7G61bEp/UtBTJn+T4zLsZ5J24gaYRsm2Zh+zLKqdpPwd6Ja+h6jj+E+5U18+jXQF4RDSfg
	qGIFPKrxuUsx5iq3peHlYmShqdyD+4WrJgQwrn+BzOjZQKQ6D2HyyA0eokFt4dJkDM6YnEVjkh4
	a3bBeFM1ciYwGd3JXooJARse1PNMKnLfPDNEwlef+So7OiP5581gbJ/9nTBAWdFXbQbC7rBOuvb
	7Q1IHd6E=
X-Received: by 2002:a05:600c:6297:b0:4a0:62d:4424 with SMTP id 5b1f17b1804b1-4a18e4a1756mr196491005e9.8.1791831095315;
        Mon, 12 Oct 2026 11:51:35 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a8ab-0f01-016a-c770-797f-eaee.310.pool.telefonica.de. [2a02:3100:a8ab:f01:16a:c770:797f:eaee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm336946215e9.0.2026.10.12.11.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:51:34 -0700 (PDT)
Date: Mon, 12 Oct 2026 20:51:33 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Rob Clark <rob.clark@oss.qualcomm.com>, 
	Jianfeng Liu <liujianfeng1994@gmail.com>, Diederik de Haas <diederik@cknow-tech.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [RFC PATCH 0/3] dma-buf: warn-only mode for DMABUF_DEBUG
Message-ID: <as0r7Q4dHt9gQm_8@gmail.com>
References: <20261005064133.7305-1-kmehltretter@gmail.com>
 <d1ef135e-1b5d-4656-9229-348c7029efbb@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1ef135e-1b5d-4656-9229-348c7029efbb@leemhuis.info>

On Mon, Oct 12, 2026 at 10:12:02AM +0100, Thorsten Leemhuis wrote:
> 
> What's the status here given that 7.3 will likely be released in a few
> days? Note, I can see from the discussion that this is a complex problem
> that can't be quickly solved. That's how it is sometimes. But I wonder
> if the current state of things is the best compromise for now or if
> Rob's revert or some other option would be better.
> 

I think reverting my commit 143755bdabaa ("dma-buf: Make DMABUF_DEBUG
default to y on DEBUG_KERNEL kernels") is the best interim solution for
v7.3.

Christian, Sumit, could one of you apply Jianfeng's revert before the
final release?

https://lore.kernel.org/r/20260926022026.10539-1-liujianfeng1994@gmail.com/

Thanks,
Karl
