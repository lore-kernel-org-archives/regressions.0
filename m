Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E7D221578
	for <regressions@lists.linux.dev>; Mon, 25 Aug 2025 06:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756101762; cv=none; b=n5zBJwLy1BvaZeBH2Z8Xu7CVZjS1iMyBvDUx30+I/QwZtMA4MzMt1lLW2R4kN+oSjVY2KPt42w8Bm1cE+MxfMXwCAPrvd/GkOXjX5gPa+wIzH0d1JzlpAt3MHaO+A/JcJ0QqFNJl9GKyO+1l837MuEq5UUG4i2pddNkYbnyamm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756101762; c=relaxed/simple;
	bh=Q8hj22B2MpR2JFzyBxlgxl1D95+tk574OJ1xEorYG0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sz1SyANtYU4VsI0xOaGr1bnqsC1cZ4ncnVEefc/U5puBWYMtBr5RpnSv25eZxMeOK1bvkLgcCfwOFVUt5tqIWI6s3VQ+BW9fkSPjXEkirZ1cKavxpSjKkGaaENJi2brKPKTl5E4mMRoNEdV5KPUvDj/2J8BlLvHfI/nxLPgNXtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyY4boVo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyY4boVo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so24426495e9.1
        for <regressions@lists.linux.dev>; Sun, 24 Aug 2025 23:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756101758; x=1756706558; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5DyuRX2zEK/K9xsQep6iSkKr0C42JRzdyda0+bFIm3s=;
        b=MyY4boVoOGtkPj3TwPc5LqfGdkDEZs7T6r65mvLd0gt9cyofvhVa08f8wofrhgBwHQ
         oQC/CrgNeFLdpLpFiS/rbvT6HRp9PIBa77HSZnhG32j3K8eH3As4+kRcISsg64RlSwEC
         5pn0wClbBfNkWZd5mDt3thDTSoiVzF1C5Z8/j+WQGAzjpXh2muw25H5fflapv5uerRmh
         OjFs1Adf0Cz8UiwkanZqE9PVxcYivZHDM/t76LuqiySHSw2/pKXAy7er+57rapPGkB5q
         kmPdJh8ZedvsQEZGOGXVyBd0tHqKZxptJJH3AJ3dCmpyJ5UxiKy/+dIWLeV0lZO7ge1l
         W/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756101758; x=1756706558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DyuRX2zEK/K9xsQep6iSkKr0C42JRzdyda0+bFIm3s=;
        b=cFMoPmLlGc+GjLxymXDthmM0laO+83Z0OMnmJhsrFsS5qrZZhPAOgKrdxi1/CJdn3Y
         HQMLfAkFrokte/JaQQh77lVc30b+9aJCDOhr5JCpVJCqGVE+0cNwR4r7CaSm/3UREKOS
         fMcGtIiLPivmDmV5mcJm7E2pCdjkeFFhF5gRvetXs3IvxOcxWze7Aj1ocKPO5Xrf/+ay
         7X9MlEbFoqzc1PIKBFtcVxUvJbEqhxU8WBoUldMzpDDd6lvxPW87l7BNhWf4zWUyDGyw
         UcU2WeMfo2FicyRCnACBFlajtuGudxD9wvWIfYCbpbskyLwyf+OGupJQ2xZIoOkal9fN
         r8+A==
X-Gm-Message-State: AOJu0YzJN3Wl5uHwaQ20eyWK/wXN7X0hv4Buh4EU/sZoyv5i9UaLtor5
	Nv7i7jB1Raj+r6nfWCQBOrzLLsMyFSYNhiNBARsIkWGmM6BmOQltG/WW
X-Gm-Gg: ASbGncsvr54UYmGVwXQ+NuB6t6h/jkDQ5ek6HrN76+lEc4Dl1kRCWUZYsyzSNZ6ucHm
	yucQ4MyOVPwYoGi6bRnpxCJ46qmVFfR/qi7/fFmnQxvJiBTCxCFcl12mcHUAp0erBqCxBdA39Qi
	Sz48XNNTyCePLxI4jBh4jDsyZ+rDpUVCVr1iBMjaNG05UZCErvPO5JgPIcJmtYfVwgLwNYZRD4C
	NZo6zMubC731vCL85xpHG21vaW5a4td3JEeTQADmBlYfEtEj1wkmUStg86ReaMh0PpQMvQ6lIAa
	MJH3aafQFs+EaQHrqol74mhIp2qSE/Ms2pfOOF0kM+SpJ2/wtFKYn4HtnGgUGOUIdIsZFM/4GJQ
	SL4UVA3G91a7IaL5FB5F+ABm0V41nbX3wQzM=
X-Google-Smtp-Source: AGHT+IGNTe6zPGTVY8MUfMP/Fkn+/GW7mAVSeut+h3YojmOGNkurifYNNXvSOJwskSim/u4d8P6+2w==
X-Received: by 2002:a05:600c:4e8f:b0:459:e370:d065 with SMTP id 5b1f17b1804b1-45b5179f623mr82250875e9.15.1756101758296;
        Sun, 24 Aug 2025 23:02:38 -0700 (PDT)
Received: from localhost.localdomain ([45.128.133.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5744e9b1sm93229695e9.11.2025.08.24.23.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:02:37 -0700 (PDT)
Date: Mon, 25 Aug 2025 08:02:29 +0200
From: Oscar Maes <oscmaes92@gmail.com>
To: Brett Sheffield <brett@librecast.net>,
	Brett A C Sheffield <bacs@librecast.net>,
	Jakub Kicinski <kuba@kernel.org>
Cc: regressions@lists.linux.dev, netdev@vger.kernel.org,
	stable@vger.kernel.org, davem@davemloft.net, dsahern@kernel.org
Subject: Re: [REGRESSION][BISECTED][PATCH] net: ipv4: fix regression in
 broadcast routes
Message-ID: <20250825060229-oscmaes92@gmail.com>
References: <20250822165231.4353-4-bacs@librecast.net>
 <20250822183250.2a9cb92c@kernel.org>
 <aKmzB57MKbpXh-_Z@karahi.gladserv.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKmzB57MKbpXh-_Z@karahi.gladserv.com>

On Sat, Aug 23, 2025 at 02:24:39PM +0200, Brett Sheffield wrote:
> On 2025-08-22 18:32, Jakub Kicinski wrote:
> > Thanks for bisecting and fixing!
> > 
> > > The broadcast_pmtu.sh selftest provided with the original patch still
> > > passes with this patch applied.
> > 
> > Hm, yes, AFACT we're losing PMTU discovery but perhaps original commit
> > wasn't concerned with that. Hopefully Oscar can comment.
> 
> Indeed. This takes it back to the previous behaviour.
> 
> > On Fri, 22 Aug 2025 16:50:51 +0000 Brett A C Sheffield wrote:
> > > +		if (type == RTN_BROADCAST) {
> > > +			/* ensure MTU value for broadcast routes is retained */
> > > +			ip_dst_init_metrics(&rth->dst, res->fi->fib_metrics);
> > 
> > You need to check if res->fi is actually set before using it
> 
> Ah, yes.  Fixed.
> 
> > Could you add a selftest / test case for the scenario we broke?
> > selftests can be in C / bash / Python. If bash hopefully socat
> > can be used to repro, cause it looks like wakeonlan is not very
> > widely packaged.
> 
> Self-test added using socat as requested. If you want this wrapped in namespaces
> etc. let me know. I started doing that, but decided a simpler test without
> requiring root was better and cleaner.
> 
> Thanks for the review Jakub.  v2 patches sent.
> 
> Cheers,
> 
> 
> Brett
> -- 
> Brett Sheffield (he/him)
> Librecast - Decentralising the Internet with Multicast
> https://librecast.net/
> https://blog.brettsheffield.com/

Replying to you both.

I missed this regression when I tested the blamed commit. Glad this surfaced quickly.

Just to clarify, the issue isn't that the destination address is "mangled".
The removal of fi = NULL inadvertently causes a gateway to be assigned to
local broadcast packets (see the call to rt_set_nexthop), which results in the
observed regression. __mkroute_output is still correct for directed broadcast packets
due to them having their own routes in the local table. The regression can easily be
fixed by setting the fib info to NULL for lbcast packets.

The submitted selftest only fails if a default gateway is configured, but does not
set one up. I'll submit my own patches to fix the regression and improve the
selftest shortly.

Oscar
