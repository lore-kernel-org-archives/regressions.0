Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708BB29D26D
	for <regressions@lists.linux.dev>; Thu, 23 Oct 2025 06:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761201373; cv=none; b=gHbtBq2+0hh/KT5ER9jSODKjFqDCaW5qz+686hKDbOKFA27zoVxop/t1P6sewf8qOASdRNBqF/j6VKWVpVpuAw1rwRlFzEXXgazdhDnZaKlrDsp6kFF0nHBjZrjk6Qhrt7VLImP9GKMR9HmvUld/74j8QtshosB/jzG6bw8uF5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761201373; c=relaxed/simple;
	bh=r2Viw6f2wM7wXaaEqitsHmbdKgJ2vJCMjUuyyb+fcaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p38+RZhAQR1Apy+YVjW3KQowpqGFLyEnCCX6NzPzhYdV9zcQgkG7p46NN+7Lagn0ntcRwArdk990SnTWj1GVSiHKBsLH9Zn/QxidXzLKv56wIRQAJxdqJEjTeDKQUAZbwHOdeyiur18PPYnizXN3FRYePfGlIeS4i4dgNyowSZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e4X6cXUN; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e4X6cXUN"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6cf25c9ad5so329101a12.0
        for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 23:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761201370; x=1761806170; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sEWNT+gUT9HJ4EFz82wI/Nf7bJ0v9RjqwdfJhrsf0gs=;
        b=e4X6cXUNXvBtksZRXwsTAnOMwdKRFdRSGFuE91vqah6C1kCdT86bn6e8yXL/3npDpX
         /WdXWbrWcqKGsL8hd5uRuNFnuAl65hXagkWQCvcHl1kkwbg2dKJNsLXN6pzXH02OMzZm
         NY37Un/jtHOLa5vopYVCmupB+ltARqnRfywfEi/EJ7i0+Ng1qmu8xcY2UIbQoqHFkKEF
         8g03eDA7YhN2nefkn8tjKbcdIu2AEPpGXAhvID/MdOuEgqumjNlaALo+GCuybs9mu65i
         tEH7yYPqQwnlFMgYNiSCkmiIMfcJhvqG46YTaeLusebXeE3Ml43wI+YKQVpGMMHrIevr
         dlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761201370; x=1761806170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEWNT+gUT9HJ4EFz82wI/Nf7bJ0v9RjqwdfJhrsf0gs=;
        b=GN2CszH2b3KHJImv663y5bMuM9F62EkqUKZg6bsx/5ojq9ERAib+cBl5Pnh6f0xx4+
         864CBJcemDOpQ9gtHBv6RNuYcilmHQB3LNXYIXeEcXThXilvTnhDcSnH1xyLOKHO2qRU
         YywENQjlnVT58jAn+ML1EbPp87hYv1wafLObWJaeLwDbTHaqfK1tOi/f3kqkGZCQyelv
         VE/xFZNlom5kyZjMf9kjdR4r9FB+h8V6NQWz4fm8GhBCIuWSEUGxcZa8P5qWnFgy+gg0
         p/LJPusiMIt0NwZ1jCxKQcC3TSRt0JcQMAPNjKp7886ifjvfiDfxwGI70GpmDnova6bf
         aKZA==
X-Forwarded-Encrypted: i=1; AJvYcCUJJkleLZqRGn0/9veKLHJ9R8m0fym+lUJokOXfkJt4Viu6goDvcQGy4GO8bg1Q+qLiNkunqG5NlsRAZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEtOYgEhDJJuofcI/LOr6Wnxwxctjy8jg2eRPwI33VTqWlykgb
	yZh2Go4rPfClbYiTXzhlEBHkCc+LMJCMDDWw2r9vcWtVKe8h0g3EfmkSLrmCRIlV+WI=
X-Gm-Gg: ASbGnctbtpujmnr6S9bZ5L63WiaeKQW+8OuWGaMS33HMW4L+jK+H8DFZs1v4bquTjZ7
	JoRgPR5+ji4NI1ANQrygKGpXHfguQAuhWxoDxoS8PxQDu8u9xGKDSfbRFApI4xdD199jXDbPgQp
	wtATfun1XKlPpfN2fecA0zFLBnTsm7zLO6llYbJB0fdBTgL/YHQffYJ6QQIcmvNMz8oDBTNyFU9
	6yjIyE8xRLs939YGG03Ew9WdBMRV8QJxwUFEKLZjiyRX+ZYFlVW9eec5pfSvDFgXFuZOH9iuxcx
	kTr09tzfOle3Wh6IrbFbVLfwvOYPyC1lM/OLYPLpcdghRVgW6wun/aad49K9F9Ysmvd//vp3AdR
	0xMurOBDvZRJ3ShiXP0yp8qdFxAR/LR18Mb9QvVGkvQoG20Ottav3KAsaR61wEs6OmHCJ+gNT+N
	uSrGaTcgDqf3gj
X-Google-Smtp-Source: AGHT+IFPxzD0L54FtzksWCteNTtzPPxqNVcq7p4fjIjoBI+DwrPKbsfF7hPTY9gqWPp0Fxc0Y9Jeyg==
X-Received: by 2002:a17:902:db11:b0:240:48f4:40f7 with SMTP id d9443c01a7336-290cba4efc9mr358978975ad.39.1761201370245;
        Wed, 22 Oct 2025 23:36:10 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dde9880sm12210885ad.26.2025.10.22.23.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 23:36:09 -0700 (PDT)
Date: Thu, 23 Oct 2025 12:06:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: KernelCI bot <bot@kernelci.org>, kernelci@lists.linux.dev, 
	kernelci-results@groups.io, regressions@lists.linux.dev, gus@collabora.com, 
	linux-next@vger.kernel.org
Subject: Re: [REGRESSION] next/master: (build) cannot jump from this goto
 statement to its label in drivers/opp/o...
Message-ID: <tficx5oz7gtakb5ffd3j5cikjmrfw3js53r4k2xhoxi6z5lok3@a64sj3k7kovf>
References: <176119914391.5792.9020817346274859760@15dd6324cc71>
 <20251023170911.0df27b1d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023170911.0df27b1d@canb.auug.org.au>

On 23-10-25, 17:09, Stephen Rothwell wrote:
> On Thu, 23 Oct 2025 05:59:04 -0000 KernelCI bot <bot@kernelci.org> wrote:
> >
> > Hello,
> > 
> > New build issue found on next/master:
> > 
> > ---
> >  cannot jump from this goto statement to its label in drivers/opp/of.o (drivers/opp/of.c) [logspec:kbuild,kbuild.compiler.error]
> > ---
> > 
> > - dashboard: https://d.kernelci.org/i/maestro:992b985637471b20dfed6cb78dc938315a3ba8b6
> > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > - commit HEAD:  efb26a23ed5f5dc3554886ab398f559dcb1de96b
> > - tags: next-20251023
> > 
> > 
> > Log excerpt:
> > =====================================================
> > drivers/opp/of.c:1545:3: error: cannot jump from this goto statement to its label
> >  1545 |                 goto register_em;
> >       |                 ^
> > drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
> >  1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
> >       |                             ^
> > drivers/opp/of.c:1539:3: error: cannot jump from this goto statement to its label
> >  1539 |                 goto failed;
> >       |                 ^
> > drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
> >  1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
> >       |                             ^
> > drivers/opp/of.c:1533:3: error: cannot jump from this goto statement to its label
> >  1533 |                 goto failed;
> >       |                 ^
> > drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
> >  1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
> >       |                             ^
> > 3 errors generated.

Fixed and pushed. I didn't check with Clang earlier and so missed this.

-- 
viresh
