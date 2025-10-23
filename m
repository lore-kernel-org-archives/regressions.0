Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575A525A343
	for <regressions@lists.linux.dev>; Thu, 23 Oct 2025 04:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761194718; cv=none; b=FAAeLXAJJvYrZ/H8cHkNKmsG4manNNyu0Mtz/XtRBtsq2XjUtoYXZdIPyIUrtS/nTND46w8TQ1t16l8/TzZHvYZDfVikIjdb9Gc+/i/mXskqH3UulbkPo0bu1oGQQyIxeLjxY/iaFDckUEI/Fi0Yv1QpGM+NQKQr9QYycenob3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761194718; c=relaxed/simple;
	bh=dDXZ4wlWh0zWE73CQei9SNb/wNKyNyNkdvTY21hhmRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KtC0MuUiOTdj8slxCb8519dULUr9Z+8DfD3kEO9xaEa8jvDA2Kx99psV++YakvunaRPpziHj3zIAP1Lf7fE5EAkSKX2Iq//EbL8vm8GnJ5hk/km7etslcyGPcbWyvjDHJrW32FMlf1H3990VKEuO4p43yOAoSqrxx7eA9KeCsa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=wluLfcDE; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="wluLfcDE"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4e8922b1bfaso5250931cf.1
        for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 21:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1761194715; x=1761799515; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxAw5CcaNyJRUdL9g50f2nQhs9yBUN9LI3kQV7R+EXE=;
        b=wluLfcDE+qDp/IwzW8oEBwCHbxjAo6S+fOh6Tn/UrPJgcNTVQtBf5IWTLJxwnYeXd7
         lAsg3hpX9W7Hbf+ahz4kPMjFnbg0OHrCrsezIQyK4IMZL9tg2ZEn8sJQSlYz2En2L59s
         QVtTnZxYqHno9+UKkF9nag3SrdqLi63xOk/NkVe8PTsvNjfrQNv3gCczT+hyuIDi53Qa
         XSVY3M/rKmrf75ABSwbk0MfuLqQ6EKIrvFHCLF0aSAGRKkJV4lRAUnph4i84YNfzwEsO
         DVtQ6NnmHVCIPYEtDGDRS1ghzQf9bmzky4/jt25JPAv88WtT0EmQyBrry8In/cCx5JvM
         yimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761194715; x=1761799515;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxAw5CcaNyJRUdL9g50f2nQhs9yBUN9LI3kQV7R+EXE=;
        b=Xm1cz9cm1qFpB9eco2svAZ3lbU6QkL50RlpQfYHRPGDFL0nSztEVr5Yz2DjNg9rkLk
         CmfWh/2y+JEKlS1O+H0unqcVu9otAFhpKFne05OEst6PI2hc+wqy/uAMsP78R4hMhR9r
         w3Xu7nTdTUVc97w4xJ3Rqmr8MvvstOXIyHT4rMGAe4LfkgpYDNXg1qFg/O2hF12CCbpw
         RPl6AqezsKKF2XLkhYe3tB8GdV1FXUNuT5LQN65q/eJ6f28Vh1Srco3IoaLRQxatyXce
         /CrQcwedjpsIv6/IU7dzM+LpQ5iO9K13a/9GWHcJ7JJgJ3wnaSI42IhGbKc/TTsojI30
         RvHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6qzpyf1BCXIq9/+8dFPlW1XxexC+1e3ICGPWrLcY7JWqFYUwluId9mTTi8Bo7D7+AejDzhzg3s6fnDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVKxvClicY2mxK+uDMIdg3A7GcAhtw07GX7VahCt6Lzjn1CMPN
	448RtfVUptEqGfBbIzMoAieJ+Wb4dkm9PiMhQsX+GF8gbe9IeIOSiV9bLkIhcqwhvUI=
X-Gm-Gg: ASbGncsGL7ByM8jDSZFXV7AB6X9yn1H0hUKWA1WztJmvBRztrgWhFZgX9ESZgCcf1xd
	kpN7eVFRXr7u2MS50PjWDc1ZizK57JVkO9LeuY3jLUrvlFUbb2HPllpB/J7XeUcMBNzYS/XxiYa
	lo0+wkevA4lfSm2fBGg/fxrjYb15H/fMxysCknPTs04iwwIBnL3Sa0xNjO1H1hJAkie276Iq1cN
	JPpGBpxmvT/zwUdk4eliu2w33hKMHrFzl2+CCSMNNcUKxyHdHeJAv9zZf6/nnqz4J43jj8alVSD
	0MHWlZqOpX3iB0UdUAR/gi4M9mE/bJUJHmu7izfyTUOlfgDjpPvLn0XD98N4wC/KnJRjPs/rPey
	N/fn4hn+SRXpthjz6uObtmA7+gtvKwFuPgxiam3iE4Yg66nuSDX/GKWLCiP4kTh1cp3BAk+Md+u
	UB+59ARTIpth7AtPwMVwthNAZKPUGuBQ==
X-Google-Smtp-Source: AGHT+IHAxwX1q4xENozHdVwqKqZ7TDRt7Gbja+SgOkIQM2H6Yykm4zUm83IbTesCfNfk5IdGOKlPzg==
X-Received: by 2002:a05:622a:138a:b0:4c3:a0ef:9060 with SMTP id d75a77b69052e-4e89d27666dmr281053671cf.26.1761194714911;
        Wed, 22 Oct 2025 21:45:14 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-89c0e688d64sm87480285a.21.2025.10.22.21.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 21:45:14 -0700 (PDT)
Date: Thu, 23 Oct 2025 00:45:13 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	linux-rtc@vger.kernel.org
Cc: Esben Haabendal <esben@geanix.com>, stable@vger.kernel.org, 
	sparclinux@vger.kernel.org
Subject: PROBLEM: hwclock busted w/ M48T59 RTC (regression)
Message-ID: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

After a stable kernel update, the hwclock command seems no longer
functional on my SPARC system with an ST M48T59Y-70PC1 RTC:

  # hwclock
  [...long delay...]
  hwclock: select() to /dev/rtc0 to wait for clock tick timed out

On prior kernels, there is no problem:

  # hwclock
  2025-10-22 22:21:04.806992-04:00

I reproduced the same failure on 6.18-rc2 and bisected to this commit:

  commit 795cda8338eab036013314dbc0b04aae728880ab
  Author: Esben Haabendal <esben@geanix.com>
  Date:   Fri May 16 09:23:35 2025 +0200
  
      rtc: interface: Fix long-standing race when setting alarm

This commit was backported to all current 6.x stable branches,
as well as 5.15.x, so they all have the same regression.

Reverting this commit on top of 6.18-rc2 corrects the problem.

Let me know if you need any more info!

Thanks,
  Nick
