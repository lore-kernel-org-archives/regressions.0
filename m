Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3731C1D5CC6
	for <regressions@lists.linux.dev>; Fri, 12 Dec 2025 23:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765583316; cv=none; b=lbR6N3vkbDuHiUg28P8djV4HbN8A+lPC5O+m3NXxpz5QN5O1Msh+Cbps+12vswIjxIyAI17xZhSEwDESss9XTLpFGQ/iEIFmLQPK2A2sJGmcOPGwlO5qWpoz4mMvUvAP9eIFIquyJXRXNZrBKF3jmdoISGcsgkRMjY6TpY5mj2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765583316; c=relaxed/simple;
	bh=s/tBHiYOy2eC7/UIVWnocuiWDk5Z9I2ep7hg/uuwhFM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sd13yBWpM+ct5QrX8Z38Mv6r9+HUPWVBABqTpuSYnxB8C9YGZzRx+D4NaMe5J67aDAowKKtuGbneGfNZEyqxjkQd0StIK2Jv+lvhsqao27KjSIvZDpyU/fQ1nJFDNA70ZzJyxrJXFkivMYulrsLGBCAM7Z0CkdSpX2yAHAMlWz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b=vdOCz8lN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="vdOCz8lN"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f30233d8aso10882545ad.0
        for <regressions@lists.linux.dev>; Fri, 12 Dec 2025 15:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1765583313; x=1766188113; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWP8BFs1bgT8Z4A6IjuNlfDRtFMEro3mFLBqE6tL2Ps=;
        b=vdOCz8lNFCnCA57aE5iI3MyYxghahdJi5dfU8Ahi3BJsX2TpDwFCjzSgOBFvTo+d0a
         9dezzQfyoAfi/xhLDFtTFMp+hhf9/R9olAfLod1qelCPs6tsfbpM+QrbJrP9YpOx+91C
         e2WeJtAAFR8yaH8/4BaqFGj28RoGUZ2kk/YJ8L5BURzSjjfisHqB0X55PIBjGw/fPmz9
         qMb7KcSNrT3jKcZRm4QRSP6/wPeYpeg7q2hTSu+1JH5AT6I3NjnKk0PZcubgW69uz6Na
         Wv/8hHhoK8sTypBigItd3dLJpEyQKH1oPyxUa7KRsWKjd+aFikXcIVRkmuuK8rLU/B1Y
         dZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765583313; x=1766188113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wWP8BFs1bgT8Z4A6IjuNlfDRtFMEro3mFLBqE6tL2Ps=;
        b=JbzO+78kZL6BbQ6QUDH5WjTfUa9oPpnU+HbvJ1ADAnyN6gLiWC5sbpkl/ftiRXEpl/
         Xc6P4zFo8GxeQIej7r/dz18tFjxDBCIhJzqvSKpolZCxX/TA1S9jJOWt5wG9aFlyB6Qv
         WVwLSQbRCMec9w+YndVKf7V1FuR1tNm2gU9MjnIkgm2nwVbDAZyS59VFGbrfA4De4+JS
         TIQbwFnmyklxwaEYtM4uz/fPMjL3vnarXiNFQPoPrXh6Vj5f2dd9llhNkBZyTrdQ1HRI
         jDOtzlrvbmIB6bu1XjFIfMpSAKMUKphCIQrqF9ebC7N+Ei4vByw6OFaBPFQ+bOPcu0fM
         UxPw==
X-Forwarded-Encrypted: i=1; AJvYcCWi0+BCa/6GMkQgU5wBULgOHiTvTLadecux1kVXsCzEb59QTgrUPCf0XZl74zfSm2ZBIaii/bl6aBqljw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKs1XCaZ7kRmvbXmh5h18oROEH1V2GmnPDtWQijSBNayNL53vK
	N28x0FHLOIEngSyhwfK0473qzI//RuW1TdFq335xWWw/KSjH2zhLl5eqIafpGs8LNmAnJmOH+ih
	krvFg1vw=
X-Gm-Gg: AY/fxX7ChZeoqWI+jLeABeNZ+IHMzB0ZAjzRiHC1Evi0Ahu5ViWAtEJxWMmRrnR5/zj
	6X3142exFdtp3DORUjUzYLlmo+XPZsU0XhVTGpTM47LGy/P6vgnvkwJ6Am+G0rpoU4sdBLTBsnb
	XzbcIYBtB/dro4c9Ov3G16F+GxDTsuSc2g4r6wS80Y2PjBMB/ImwC1O957MV8kfdIhrInAgUmeS
	+jR5kBlJgvzA36BX9tZ1QNSb+CN2Sk7r1WxrIDezAsm+2Ui2Cvnqawx/2ICPIy9hG5Vzp/Bvh4e
	Cb624/uiNFxbva5HdomYjH/vLdJuTj/0FVIbdBqlzvfns7XIZCE6Lenj/AW48mRJD7oRW2g6yX1
	gSyxGa5yiuDo+qdKk5iiPssjGMZ/zdHhAGzMuFc3/+FuFgB0rQu6AxYSrGvWKPT0y7bMngaZVh7
	zQFECvAcY2U/KMEL9+BJB+gefflrhYcQBfEgkjHHhHOrEckCRva3RpBrYhT7g=
X-Google-Smtp-Source: AGHT+IH5DZZVRCULf6txAGDp1FIo3v39FvSWX2YSJi9J8wYZkjZxPxwUqn5V5CjP/NoiB+w3TzKOrQ==
X-Received: by 2002:a17:903:11d0:b0:295:557e:747e with SMTP id d9443c01a7336-29f23caff8amr38947595ad.40.1765583313480;
        Fri, 12 Dec 2025 15:48:33 -0800 (PST)
Received: from stephen-xps.local (p99250-ipoefx.ipoe.ocn.ne.jp. [153.246.134.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d38ae7sm65484845ad.35.2025.12.12.15.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 15:48:33 -0800 (PST)
Date: Sat, 13 Dec 2025 08:48:27 +0900
From: Stephen Hemminger <stephen@networkplumber.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev, Linux kernel regressions list
 <regressions@lists.linux.dev>
Subject: Re: kernel.org tooling update
Message-ID: <20251213084827.634cb60f@stephen-xps.local>
In-Reply-To: <f1bb8d04-9949-417d-9726-64787994d40e@leemhuis.info>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
	<f1bb8d04-9949-417d-9726-64787994d40e@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Dec 2025 14:30:37 +0100
Thorsten Leemhuis <linux@leemhuis.info> wrote:

> he update, much appreciated!
> 
> On 12/10/25 05:48, Konstantin Ryabitsev wrote:
> 
> > ### Bugzilla
> > 
> > It may be time to kill bugzilla:  
> 
> Thx for bringing this up, as I a few months ago again looked somewhat
> closer at the state of how well our bugzilla is working for the core
> kernel. I didn't post the analysis in the end, but to me it looked like
> the state of things was round the same as it was three years ago -- when
> it wasn't working well, which was among the reasons why we came close to
> abandoning bugzilla for kernel bugs[1].
> 
> [1] for those that don't remember, see https://lwn.net/Articles/910740/
> and
> https://lore.kernel.org/all/aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info/
> 
> 
> 
> >     - despite periodic "we're not dead yet" emails, it doesn't appear very
> >       active
> >     - the upgrade path to 6.0 is broken for us due to bugzilla abandoning the
> >       5.2 development branch and continuing with 5.1
> >     - question remains with what to replace bugzilla,  
> 
> To me it looks like most subsystems don't care much or at all about
> bugzilla.kernel.org. This made me wonder (and maybe you could gather
> some opinions on this in Tokyo):
> 
> * How many kernel subsystems have a strong interest in a bug tracking
> solution at all[2]? And how many of those might be happy by using some
> external issue tracker, like those in github (like Rust for Linux,
> thesofproject, and a few others do), gitlab (either directly, like
> apparmor, or self-hosted, like the DRM subsystem)?
> 
> * Does the kernel as a whole need a bug tracking solution at all to
> receive reports? We for now require email for patches, so why not for
> bugs as well, unless a subsystem really wants something (see above)?

I am the default target for all networking bugzilla submissions.
Would be very happy to just see bugzilla die.
Right now, all I do is do a quick scan and respond to the junk submissions
and forward the rest to the netdev mailing list with a note on the bug
to go there in the future.

Issue tracking is not in the workflow for the community.
