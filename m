Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E3130DD1D
	for <regressions@lists.linux.dev>; Wed, 26 Nov 2025 03:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764127095; cv=none; b=eaJZhDE8EN5uF+PsqUWhNW1SnYHfCt9A42WdrfO+NgkvpuRdUXo9Ip8c2K2DetqX1VccrzhMcfRs1c0NWD48YdRiM53wa7e4cqSmn4OC1rPDy69VZNt7+R8PjqQ6sdeUP8f3s5spCybDUJsZLTKTR0/2IfiXgOwEZtHrsFsKhUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764127095; c=relaxed/simple;
	bh=MebXQ/i/4CXGFSpTUvGXKnO4bK1YiUe6DcpTQoQ/VGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ck/pNoi++hdFizA4vmkwKmnKHiuMjTQhXyAwV5ukCm+tjjakIBF2MS1isOShrAjheEkL7pi1Ev6OauYPlIm1B6DakpYDhQEl6Ge+uZrxUe5voP5S6tNsBQaLdyztOXjYTX2fMYgJTTO685K2UObFRMHIydj5zcVk+ys/9HKf1Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=Bn3pQGlb; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="Bn3pQGlb"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ee2014c228so50732211cf.2
        for <regressions@lists.linux.dev>; Tue, 25 Nov 2025 19:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1764127093; x=1764731893; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cvs0VVC0mcv4NgOGijtzLsQWvxXXKQp640I94GmhkA8=;
        b=Bn3pQGlbNELvd7vDR4RVoxZX3FeiWvut3VGLPynyGKG3n+wC1k642gti3yhTjbVtnZ
         b3NnGZstsL9HDFHlk5yqScs+4rj2mYDMeNB/eQM47o4zP1AXDSVE70aqrQbDiiUWNUlL
         E+BhW75QTLwP3/dvokI1nxhsx3ilXiYwM77nMfJvf9/rRq3Jw8mpfJRU93K2Xk3Pir+m
         ClU9doDQvoB8f/GqsFqY4Ou4mylzJVB52p3gcvvajDtuJfGg6Pj7w8umzpnA0U1jUIuC
         5IIx0Z/6gxX5W97InSbjFxY5mvu5MPVzyJ1/Z5DkuN7CKHX7jO1Nd/Qctfw8M9sJ/6Tm
         4Jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764127093; x=1764731893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvs0VVC0mcv4NgOGijtzLsQWvxXXKQp640I94GmhkA8=;
        b=ZCASzTdZml0LddkeRHHxefdCZ/uhPaZlWet0OkxlP/fXnSWX5DJr1u4jKBd0lPY8uO
         ciPhWQwPKg3hBeLATaK2BhS4XJSsnfkb1In0mWzZRuas08tDnAVR5FWN4Q6OQWsFzuj6
         5D3wbiuCBm0ZcMxjT036bhb1/LnHosAocVAW1KsQmJ0ZPEezu5W+TMZOHuk8NJ81k/bG
         4lKpVnWRDm+2g6PYpe+rFurt0MHOLI9a0TqUzq8OPIszJIzxsPxixzbwJ+d9do/VknxA
         AKhOi2mpsXyCQOSNajXe2qFXU+waDwJAd0YCWBa+HCSZEt3ZcMzJtqIXmciZmdn/TibD
         ZEBw==
X-Forwarded-Encrypted: i=1; AJvYcCWD9sMAeaP567Yat98Hb39oJGyxGRGYm5R6BqvLN8Pf4GGBkJgXegzXu7FPC8tD44OSL+7WRsUwZB6i3g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8fVL5CPvsq5pa7zKs+faGI++p8YyoMGRSghzXjjm0DqM5KlY1
	dOi0NZSWRN08SiUkRf1Y6y3aiivnSH3SjkC2Vgufw7KZMfgoa3+RL9sGN6QCW6T+usI=
X-Gm-Gg: ASbGnctJOzkg369h3ljlVCRE7pXcoEW+D8VhmHyfYxE683saY41QzNhxajdSrbcTbqo
	ZKz3xOuPGUSwLbZ1rjz5Jl9m/dKFjl3iO3TZFgZJGXg1tSKkcxOjjMrzchCiKzHb89AgWHlV3Qo
	vSa1K1yhxZzKJz9j6Rpdz67pD2osBgoQ2U1zcarWnBW5rm2hxJBLfKm4i6vQweJMVs5WSWCfKHk
	tRv9NwpmBZKVZYgMp28A8HcO5v5MPFdgF0WROK48yfzkD7pxAv6Dfy4sUdEMN1sNX+APxTR7N3r
	M7Df9kpdxLOYhzBgVtz9z5l1A/PeOSvwQDrsOAf1e9ryf2TakudHwESqGdmFmTGhdPbDmcYL/5H
	w/T7N9PcP4/jU0yIqycsF1F9YV5rScnJkcmxukWsFeIi4NPS73D8LYRTtA9v8wAyj+bGExLbl51
	zNHkT6vsGMxGg2DfABLJJbEjlTIE1t5Gg+TPe9xrgnM1hsaaIGHY8=
X-Google-Smtp-Source: AGHT+IFVPZAvlFu8nDpWWVLI1C6FD2IyTsqdkG4yg1n+X5k0lKqQqgf0T0rJLMz2wOCW390Qqgh8pg==
X-Received: by 2002:ac8:5f84:0:b0:4ee:2c3c:6e with SMTP id d75a77b69052e-4efbda49e09mr73391871cf.30.1764127092631;
        Tue, 25 Nov 2025 19:18:12 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4ee48d3a041sm115728681cf.1.2025.11.25.19.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 19:18:11 -0800 (PST)
Date: Tue, 25 Nov 2025 22:18:10 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	linux-rtc@vger.kernel.org
Cc: Esben Haabendal <esben@geanix.com>, stable@vger.kernel.org, 
	sparclinux@vger.kernel.org
Subject: Re: PROBLEM: hwclock busted w/ M48T59 RTC (regression)
Message-ID: <gfwdg244bcmkv7l44fknfi4osd2b23unwaos7rnlirkdy2rrrt@yovd2vewdviv>
References: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>

Any thoughts?

The problem is still present in 6.18-rc7 and reverting the commit
indicated below still fixes it.

I am also seeing the same failure on a totally different system with
Dallas DS1286 RTC, which is also fixed by reverting this commit.

Since the initial report this regression has been further backported
to all the remaining longterm kernel series.

Thanks,
  Nick

On Thu, Oct 23, 2025 at 12:45:13AM -0400, Nick Bowler wrote:
> Hi,
> 
> After a stable kernel update, the hwclock command seems no longer
> functional on my SPARC system with an ST M48T59Y-70PC1 RTC:
> 
>   # hwclock
>   [...long delay...]
>   hwclock: select() to /dev/rtc0 to wait for clock tick timed out
> 
> On prior kernels, there is no problem:
> 
>   # hwclock
>   2025-10-22 22:21:04.806992-04:00
> 
> I reproduced the same failure on 6.18-rc2 and bisected to this commit:
> 
>   commit 795cda8338eab036013314dbc0b04aae728880ab
>   Author: Esben Haabendal <esben@geanix.com>
>   Date:   Fri May 16 09:23:35 2025 +0200
>   
>       rtc: interface: Fix long-standing race when setting alarm
> 
> This commit was backported to all current 6.x stable branches,
> as well as 5.15.x, so they all have the same regression.
> 
> Reverting this commit on top of 6.18-rc2 corrects the problem.
> 
> Let me know if you need any more info!
> 
> Thanks,
>   Nick
