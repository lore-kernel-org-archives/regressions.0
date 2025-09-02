Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9177132F77A
	for <regressions@lists.linux.dev>; Tue,  2 Sep 2025 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756802801; cv=none; b=ZaHZ1nc2QmyEelU9TnDeJ0wPDPtw9YCz5KbCnbyXD8UvnYEwtgpDIDOg1e7rLgpt2R3jpYwcCj1dCOZBbnYvwPQdhU5qkF52TVAEfvcTaljg7XD3VbVTNdYVWV2512D1s3Z5J1zPZmAw2Mz9DvUny1PUfzUvJKfesnoU7MQ9KDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756802801; c=relaxed/simple;
	bh=s4eky6q9u1BXZxYko75UYJ/WUeBzhtybjaqD82y3H98=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HZLjpD1VwuLSM+EaacDESuThrptlR6PIADdADRaYHryhaWq7lqOJ0AAJC+r+JrP2fZtHS9c5i7mn6HgJY6MDukb4xmfGCIq8F24aD/2k3Fl9rJnrtx+xNQprF/hKqTldtDhGGIjQCTXxjFRrAMxSi6tXTopRYhQLZpwUuk1bkaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSTWWq9P; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSTWWq9P"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-336e44ca0e4so14015471fa.0
        for <regressions@lists.linux.dev>; Tue, 02 Sep 2025 01:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756802797; x=1757407597; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4eky6q9u1BXZxYko75UYJ/WUeBzhtybjaqD82y3H98=;
        b=MSTWWq9PH8i84QgqJgcShVgU2Kry5+CZ3kS0bZSJnydKEzLUiF7I3/4oGMjSuPuqxW
         huf6e6WwBWFRDzyFHq0wBMsvZGNwygWa9NEzxCeakjg1/R7plA/olPbxxUgnK0mK2K03
         ASr2AEmh0b6PFi7qxMLzu/40J+S0GqrzEqnSleaI4Bh14O02yx9izyzoo1MH+8hFlC3I
         vsGQaGK1BAFRm8OXy8nBqinVTJ97IG0R8fgkoDupE4tzVXsP9Y/0VPfSDX1ZoW+F5Vyt
         sQwwlsaopBgZ0/BqNfQ84xErn8KTRRpNLDzb0VILEugIZo/je6smX6FM9ZeTlbSIwSsf
         ffkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756802797; x=1757407597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4eky6q9u1BXZxYko75UYJ/WUeBzhtybjaqD82y3H98=;
        b=KjnCf7DKW40StvIPmdWQPZJb9bjymGwC0Bak9ECMMjA3uz+maVOxcjmHKbi0TIxbAm
         7hYm+Uj+On3hpFYgeFvcKsp5WMTgbvOgnixI5k5sSC8mkEJ6QSoaOaKfaREmPqjNokKl
         9WP0cSc5ac48SgeYPX2saM5L5AGL0ONgc4jAGB873Se5IlQRaFplc7ycgYQpHAXFKN12
         GkL1u3IOPGYe6vz4RZhmWhqxBxichBxXiIjqDI9WyxWgGmNC46l3Rnkg3bn4XZcB+Tmw
         8oKsbQQgRQ8lqmD2Aa+3fC3OoDX9BxRw8AYddiWN6elGJ3ocEgKGcBiA0+VCNYuKHZ9r
         W2dA==
X-Forwarded-Encrypted: i=1; AJvYcCV2jnu9MWsDc/60MFGtBRdul8KjRuowIR/H52TfP2IPjGmDXyaGvTTNRmiBG0+FMFEC6p/UoCbGv8voWg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yykerv8rnRP/dtE19afLhXsi9Rg+9bOG62PzpPcreZqUrHwgyIc
	+xmhP0haT9q3ru5wWeRDsDr1oZo8U4wL5wubpyFBg4Ws7fVX3FRq8Zbg
X-Gm-Gg: ASbGncuSrAjSR9WCMEuqCcdKmj9SYGWV0L0bP2Ss6/A2fIlrmIM2zyqLaJPHUZj8mVm
	7/f1iPbNgIIS5H63LlCvs9s1bOvQLzB6U9n8Og2kmbHk5e6lDEkpEu2mqnFI/Em30D0+8UxXiXM
	+D87cOVdOs9tIEvKGw3OsHduhQbl5zW6FrvSpk3y0V2t23t9IQcKS/6mSGsnT7lTxupJJmuJ1PE
	Ff7LrwwK44qOAu0sbuwl0NgTD80ljCORi7lCxCZ12wTv4ziK+vdjNqsjlYd4E7+i194DAknFrnb
	RV5CZEbx3d3feBGblFTArbMZtB3bSHXkI3WtWgxY6HTC5r1aSNJVssF7VEOC14Jl60y5ciqgaR9
	A7XeVHB07yqvAmii37DBkjKdd4NTq1oVBMdEbStxjmP4ddA==
X-Google-Smtp-Source: AGHT+IEWkjCf0Z51FrqQEW46iV1npHMsR7joGaes/VW9LCMYKAgJpzyD7fQSexSvMByintFTLgo7xg==
X-Received: by 2002:a2e:bea4:0:b0:336:b941:4ab1 with SMTP id 38308e7fff4ca-336ca964751mr30846691fa.17.1756802796338;
        Tue, 02 Sep 2025 01:46:36 -0700 (PDT)
Received: from foxbook (bey208.neoplus.adsl.tpnet.pl. [83.28.36.208])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f5032c9fsm3267431fa.32.2025.09.02.01.46.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 02 Sep 2025 01:46:36 -0700 (PDT)
Date: Tue, 2 Sep 2025 10:46:30 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: "David Wang" <00107082@163.com>
Cc: "Mathias Nyman" <mathias.nyman@linux.intel.com>,
 WeitaoWang-oc@zhaoxin.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, surenb@google.com, kent.overstreet@linux.dev
Subject: Re: [PATCH] usb: xhci: Fix xhci_free_virt_devices_depth_first()
Message-ID: <20250902104630.6a9f088a.michal.pecio@gmail.com>
In-Reply-To: <446082a4.7dbe.199098cd654.Coremail.00107082@163.com>
References: <20250829181354.4450-1-00107082@163.com>
	<20250830114828.3dd8ed56.michal.pecio@gmail.com>
	<5051e27a.2ba3.198fa7b5f31.Coremail.00107082@163.com>
	<f9476552-a6dc-4f1c-91da-b15c8f0d9844@linux.intel.com>
	<20250902093017.13d6c666.michal.pecio@gmail.com>
	<446082a4.7dbe.199098cd654.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 2 Sep 2025 16:30:48 +0800 (CST), David Wang wrote:
> About the change from "<" to "<=", I did not observe any difference on my system. Is it because my system does not use up all slots?

This too, you would need to fiddle with devices (or connect enough
of them) to reach Slot ID 255 (probably the highest on most systems),
depending on the xHCI controller and its ID allocation policy.

But also as explained, this bug doesn't make things go boom just yet.

Except if combined with your bug in an obscure edge case:

1. A high speed hub has slot ID HCS_MAX_SLOTS-1 and some TT children.
2. Another high speed hub has slot ID HCS_MAX_SLOTS.
3. We start with freeing the second hub.
4. The loop is entered and leaves vdev pointing at the first hub.
5. The first hub is freed instead of the second one.
6. Then its children are freed and UAF its tt_info.
