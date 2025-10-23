Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E202FFDC1
	for <regressions@lists.linux.dev>; Thu, 23 Oct 2025 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226792; cv=none; b=PR4PmmIY378OWqdTAp+Oor6GrFm5gnMvOp8qmMKBrMs5LRbyjgGeVnlwUkVsj7lTeZ3dafpmBGvUBh0jA7NPpQBmIHBsicbIJMM+BsLq4P8CO3qexm6DdufVbWqWbWFMbDNjwAhrdBgDiJEUZYaT/4McZc5YUkTLkdPTylIRo4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226792; c=relaxed/simple;
	bh=VlZWQP2vRd5Et2IXN3Y2jcp3joaOd6hd/WT2Ydflim0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdceRJ0y4K/ATnmpOB0Fo0M0M2XjwUXOVIRINtvn0MPKLcnVaJ6uRVFycztDBZbk4B9iEpxFOsKXIi6P9wVe128g8QzkbpmwwYqn34u6VayfnAKq+Gr103yWiHRUXhDTJ6xiKa/HdX1Ew7jCoGLw6k+iXGjE4JFhT6Q7YmoeFlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=HaOBKiBg; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="HaOBKiBg"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-88f8e855b4eso56505685a.3
        for <regressions@lists.linux.dev>; Thu, 23 Oct 2025 06:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1761226789; x=1761831589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OTdirufWMbJmlgZU7Yrv6nTsTJjgQ9dqEPOTcrYAzcQ=;
        b=HaOBKiBgXtnjh6py/Cgpv7XhVeO2de/d0ciztrHBq7T6Y1lPvSAX0ZX0/EwizkQwMu
         ncLQxluCtIIQ5aOier9UoVwmIczzl6WgSf1SwF0u0sbPdeiB3GuYxvVn4mDwnzRIwOJ+
         stzxkupSbesy7aSNThkoDaaZdf4cektLtypyj5CUkWvM9PMihvcIESbMnANAxxfS3Uyj
         oSHLqUdUsfquWPvkiit2Z7kJEQNRpf5y8EB4ngezLJmkgjXae2Qult0I2xtPcRc/XBbY
         YJ0vDvlD/kWM48nbD4/YB65sLAR6hOONJ9zDIskt40qmxNLGNC28WSqkpUf1PWd3yeCI
         awDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761226789; x=1761831589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTdirufWMbJmlgZU7Yrv6nTsTJjgQ9dqEPOTcrYAzcQ=;
        b=KwZCy74bT4jDPBm1XAFNyLKtqJSmBvWW5E3iL88b121fb5ErvqIOk3B+gy8wGgS/In
         VGpnlTaeMmLAE9mMsB2zraqbN66J7GAK9+1HQCY6tbzsvnopZb7OwwmSTJCewREYSadk
         YjsJDN7YxbOfppFUeOBmc11q+8Znn+MonDTWgD2nzcPU1R4Iz1xQ7t5Ca+imvN3Hglne
         Ko+RrKheD9s8HOPfCHWHRbGoDORrsYIAlFLpb9TjUHymq4KWNtOSoZbTRYjUbAA+H/yP
         bP/P5+0IhvPoaqeu20+fSkUHjR2fDSV8gPw8T+8vcGD9QAGeYY96B8WZNoJtRfBbJIgy
         RWbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbIkSeJYBYMmDraGxApcZIF/ZESGRXfWii084SkA0jJ/iuYQUiSgwO1lkswMk200LxXDIA+GcXMhPtiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhaFdQDx0OD2rNKWaT+oM+/LmDv4hr7t3Qxn/yrXRD/oH/SeCn
	4pMQHvpxpqPnLyUhESvIJVn1IxfVZYDwr+QZYomb4bX8JL3S+yNL0m5Mkh4pRRomWAI=
X-Gm-Gg: ASbGncum8xOm4vgfziR9pXCaI8qNnt5bJMxKjPbNzODA+X8ELaDaiN/CmVaUNrLRN+H
	giHPDwPZsFFmxkP44Wi/LB/yiTDCK7Q3ke14I4MzMuQZDoRfAUaODYje5hFbgAjtoVMm239lxh2
	cc4Un0AKdWqFn2SeheRWCGxgFWI9pzb6ySZBkUvOfsXdLfx0CLN5ECaHaysH2wxBFzk8NY1xeBf
	b+cPAjZ7O+kYaZ08NspwcWkJTqM2Qc6Z0uAR/IQcH1G/MBF3D/goBQW4Diq5+Zkl6WiJw6NWQMm
	SS5lTutO+cCJA4BmgbHaks9eOl27z2gWMl1X+0/hOLThB+dIR3inIP3IoB9N7jKCIrmCcBe4NuE
	n1PxAzM5zuZoDgTtpqgZoOGuvZTPb/9x1iW+S0kBFE7I0ArfW1s4B102ML6VUWlsT3/KXP4fZ4R
	0F7L8fVkf/Cl0WX7aSPLGXeZ0dI6g9iQ==
X-Google-Smtp-Source: AGHT+IHv+2FoyHtgNqF1DBafNAWsqVheVNr/d4qFGe2fvEd3Bm7iU47UHmaCg3qy/u+cwC/1tQZFTA==
X-Received: by 2002:a05:620a:2a0b:b0:892:dff8:2961 with SMTP id af79cd13be357-892dff8325amr2309221685a.50.1761226789166;
        Thu, 23 Oct 2025 06:39:49 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-89c0e97efa6sm160831585a.24.2025.10.23.06.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:39:48 -0700 (PDT)
Date: Thu, 23 Oct 2025 09:39:47 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Esben Haabendal <esben@geanix.com>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	linux-rtc@vger.kernel.org, stable@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: PROBLEM: hwclock busted w/ M48T59 RTC (regression)
Message-ID: <ni6gdeax2itvzagwbqkw6oj5xsbx6vqsidop6cbj2oqneovjib@mrwzqakbla35>
References: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
 <DmLaDrfp-izPBqLjB9SAGPy3WVKOPNgg9FInsykhNO3WPEWgltKF5GoDknld3l5xoJxovduV8xn8ygSupvyIFOCCZl0Q0aTXwKT2XhPM1n8=@geanix.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DmLaDrfp-izPBqLjB9SAGPy3WVKOPNgg9FInsykhNO3WPEWgltKF5GoDknld3l5xoJxovduV8xn8ygSupvyIFOCCZl0Q0aTXwKT2XhPM1n8=@geanix.com>

On Thu, Oct 23, 2025 at 07:21:21AM +0000, Esben Haabendal wrote:
> On Thursday, 23 October 2025 at 06:45, Nick Bowler <nbowler@draconx.ca> wrote:
> 
> > After a stable kernel update, the hwclock command seems no longer
> > functional on my SPARC system with an ST M48T59Y-70PC1 RTC:
> > 
> > # hwclock
> > [...long delay...]
> 
> I assume this is 10 seconds long.

Yeah, about that.

> > hwclock: select() to /dev/rtc0 to wait for clock tick timed out
> 
> And this is 100% reproducible, or does it sometimes work and sometimes fail?

It fails every time.

> Are you using the util-linux hwclock command? Which version?

hwclock from util-linux 2.40.2

> Do you have CONFIG_RTC_INTF_DEV_UIE_EMUL enabled?

No, this option is not enabled.

> Can you run `hwclock --verbose`, both with and without the reverted commit,
> and send the output from that?

6.18-rc2 (broken):

  # hwclock --verbose
  hwclock from util-linux 2.40.2
  System Time: 1761226454.799573
  Trying to open: /dev/rtc0
  Using the rtc interface to the clock.
  Last drift adjustment done at 1657523820 seconds after 1969
  Last calibration done at 1657523820 seconds after 1969
  Hardware clock is on UTC time
  Assuming hardware clock is kept in UTC time.
  Waiting for clock tick...
  hwclock: select() to /dev/rtc0 to wait for clock tick timed out
  ...synchronization failed

6.18-rc2 w/ revert (working):

  # hwclock --verbose
  hwclock from util-linux 2.40.2
  System Time: 1761226685.238753
  Trying to open: /dev/rtc0
  Using the rtc interface to the clock.
  Last drift adjustment done at 1657523820 seconds after 1969
  Last calibration done at 1657523820 seconds after 1969
  Hardware clock is on UTC time
  Assuming hardware clock is kept in UTC time.
  Waiting for clock tick...
  ioctl(3, RTC_UIE_ON, 0): Input/output error
  Waiting in loop for time from /dev/rtc0 to change
  ...got clock tick
  Time read from Hardware Clock: 2025/10/23 13:38:06
  Hw clock time : 2025/10/23 13:38:06 = 1761226686 seconds since 1969
  Time since last adjustment is 103702866 seconds
  Calculated Hardware Clock drift is 0.000000 seconds
  2025-10-23 09:38:05.239100-04:00

Thanks,
  Nick
