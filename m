Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784C51A4F30
	for <regressions@lists.linux.dev>; Thu,  1 Aug 2024 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722525969; cv=none; b=N5+J/qY8P04/G5j/vsZNW7bodI6YxyoMECUykpIWO1RAwkAm/JlNaVyQjPBhZ2Jk9EgR3fpKKLPri953LPuoqtHapD/L5BEOLchn6Nb3c64tLxPW02nFTz746pvsOrvxPxXbTcGsYvpbeZQrHmD/5zfxMbws6V369izXs0s0Yl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722525969; c=relaxed/simple;
	bh=R93pHP072SK7QJJ7HyWepTn6TkGT3M0R9Ju9YpXM1jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3nwwHy94JmeHtXMvDv+nOZBs6BUBaL8QLE80yLU10QzjDFtB+rTYsFnFd4n3PFffM+QZZPSrkMvVcfb0mbQX7N1VwDMTx2vffyE+Nn1I7NMXi/wa39r3M5z1imXOisWsG2UhK9d48chvqkyUHkEXnc9oHWUzWoohGNTcerEctU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nsKXQQkG; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nsKXQQkG"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3db51133978so700013b6e.3
        for <regressions@lists.linux.dev>; Thu, 01 Aug 2024 08:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722525967; x=1723130767; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NdZF/DtZnBoYnBkdCQ2kKbzbppoVZ6B+UZkFoAdo3p8=;
        b=nsKXQQkG89Vuq2u6V6emWiu5ODPsYHvzsn0wNdNERR7pUyvp0J5EtEuWl30Bn8XI5C
         O8/2+PqtVtInasMhBBdOHsworxGsUr2eKEsCGgDVbX7nQDlRo/IGaXryujmtxcLOaj7S
         YBr7icIQx10JFB47TZoCr6eJsttgaGcppcWhlQOvrpiiXgHh16vQW92C74kcv1J2Uknv
         gTFwrT4ExzWvP8XqcFdGepi3n9CdrTy1tpHoOnQC3SARsJ+iVBwXedQnGIyZN3GxbQlr
         xDn+KhrhbP8aSU7eAmQus5rG4bXmaX5e8ZU7ieWKsB1OPSu07goiy7cjW846reHZq/sN
         66+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525967; x=1723130767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdZF/DtZnBoYnBkdCQ2kKbzbppoVZ6B+UZkFoAdo3p8=;
        b=V/fhsBm8UYscMc3rtuWcXLXJ6Sy3Mi7eIn6lW3uZG6Zui6DU5EifAlu8R3aEyLFIGI
         ZUxZrpoRvB1M84hLRP+ZdGLnZhT4IAqI8JMojDo4I5EgARwlUKsGvH19yJmagS/JYGNh
         CHj31coBYK+iJYlfn6CvlmnjuR+2gXyAtdtCb6yZCluZyR8MUddwKLXiuOAIBtCFnEg5
         L/vlZ8UjCmMJXYKOoYFSVWg5OLTUT0ClHKgCJGdELJY+FCYateRiDO8x9KjwAsXL5mzh
         RpefmQ2UgtzQOtgFyaftFSrih5b/3zIXh0cKjDWlZeNzN/dn76k/QGwSDr6t8OJFKP8u
         jy4A==
X-Forwarded-Encrypted: i=1; AJvYcCXM+7ell7badHkQIUQRuvuJljBbsc2EXqQlu554dAX6owthUn1bSLLwiJNasQm4Sgmx2TSXm6YpRQj/0iLIOVNPllfpRQRsQRdVljs=
X-Gm-Message-State: AOJu0YwRq7JpJiYwgbYpDBbuMqvcqzLMn7IsU5naDgjdYeSq7YOMVXiS
	TKXWb6Ggvu2qdlSAWcn+ChJV5UxEDlkUcr5MICpbN8E3ELfibqFlVyyjtj7e71A=
X-Google-Smtp-Source: AGHT+IHBMeZxdmaY1Tz4aYl0ORJfyOwbMMZr65eQOrL9+mRM2tod3ckdr6LKuPfBXK+OG2tKVdeSAA==
X-Received: by 2002:a05:6808:1a06:b0:3d9:33d0:cc4b with SMTP id 5614622812f47-3db5577bd58mr724105b6e.0.1722525967524;
        Thu, 01 Aug 2024 08:26:07 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:920b:58f5:7792:ff2c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db41805faesm1144700b6e.30.2024.08.01.08.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:26:07 -0700 (PDT)
Date: Thu, 1 Aug 2024 10:26:05 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: i386: kernel/sched/debug.c:341:57: error: integer overflow in
 expression of type 'long int' results in '-100663296' [-Werror=overflow]
Message-ID: <e11ca9f9-d780-4d92-b9be-d549f97b4e67@suswa.mountain>
References: <CA+G9fYtE2GAbeqU+AOCffgo2oH0RTJUxU+=Pi3cFn4di_KgBAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtE2GAbeqU+AOCffgo2oH0RTJUxU+=Pi3cFn4di_KgBAQ@mail.gmail.com>

On Thu, Aug 01, 2024 at 08:42:07PM +0530, Naresh Kamboju wrote:
> The i386 kselftest merge config build failed due to following warnings / errors
> on today's Linux next-20240801 tag with gcc-13.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build log:
> --------
> In file included from kernel/sched/build_utility.c:72:
> kernel/sched/debug.c:341:57: error: integer overflow in expression of
> type 'long int' results in '-100663296' [-Werror=overflow]
>   341 | static unsigned long fair_server_period_max = (1 << 22) *
> NSEC_PER_USEC; /* ~4 seconds */
>       |                                                         ^
> cc1: all warnings being treated as errors

It needs to be 1U << 22.  It's probably more traditional to write it as
1UL << 22, although they equivalent here.

I can send a patch for that.

regards,
dan carpenter


