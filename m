Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B7D2FB979
	for <regressions@lists.linux.dev>; Wed,  3 Sep 2025 11:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756898987; cv=none; b=DoZLAK1zJwa6OIBlAm5EkQDqTax8v2AysVRr7sK17dS/mV7JYjjoMLsYFqXqDTvY3k+WZm1YdvDs6gAgmHuOrQLNXq0vBmylReMyop6H6KzeD63O0DzSd3O5de/YwYtQgXKLBpRHFoJKqTUfqhL8oZVry0csJmnkLDIVrzNaa2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756898987; c=relaxed/simple;
	bh=rw6wz5NQOjq/EnuLbRuHaXalQE2Zm2+zEhNAEkliz2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtTZcMEOw4nEV6TXxqwOz0kGdUZ+TaDAgqLqyPPyhjj9+T2jBeQj+BDFO3BC2rAKPpl1oemBRwLxAmWQlfCvnCsDdrgmDLT69XknbMIjcPVQ7Zn2XgAMRjWW0uZ+BNM8uhbg31VFEPjTuiTONy1I6QNc+56WvguG+MP36nJdMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fau6Bs8t; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fau6Bs8t"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b8b02dd14so21092235e9.1
        for <regressions@lists.linux.dev>; Wed, 03 Sep 2025 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756898984; x=1757503784; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PN4TTv5XFjvH830QyUEf+r/ZdvnpoSsJPrnKjY9Ngm8=;
        b=fau6Bs8t7Ux7J8v3YprfEJ3iIFjoqKW/JeoZRB5leeiwEGH5UT4FaMFWxGhNeiItpo
         NZX5DEWeaw718VHdWhRG5wYWvMWsIRjCbLxK6Yd0vhL1N/oujgK3N+80rwGiBhMJJFMY
         M4NX5EiDnLfsHxD4I38cLZFVpinIqO6S7bS68en/vexnWORqlA0f4MjbFZTXcv6yMJrZ
         JNfqcbIJcZ6qL9fBoC3deaZWdGkY8wDQ4XYZ4DCO5mQ60O6PrP9k3fPIevm30uFvdNnR
         yqjaYPAn032C0nygxBxEVAfRqxCPgVQ49M/VuZVI8VmjTFuIhxVMFCYdMScs3DALfR7O
         Gv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756898984; x=1757503784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN4TTv5XFjvH830QyUEf+r/ZdvnpoSsJPrnKjY9Ngm8=;
        b=nsiHPWPyDf4yVWMRdZhrue9afRtI2YIcGb2Yq8OLPYxDRIj1kAMmuWecJg1DS86Plx
         +Zu2w0IxDPGuCWJsJ9M4RtQWazjsAZdkKOPCYP046waI9jIrGnygHOMGrOLcTpl2NPTe
         mNA31Bb889J2qRDauhCkKdk2oBRhF4jxNT8qx4QKlyaLPx1XaQiSnRkD+0MEihmyjd/M
         /fDQnQSuV58Uj8tyfTkcQrPm5+Q88ZQSU57uLQd8jRpfdqzXrXtt/cAQ81S0oIoaBjQU
         METg7tOcz3SMQ09bD7UGiAoOnB80xGEG1Ko5p58lkX+xN70nZlCf50odP1LfTEQ8fMp+
         wsQw==
X-Forwarded-Encrypted: i=1; AJvYcCXwXP0Ny4d91ApHyDC2S9VIdUjMKtX1dyeOQpbRiXgvZpKouS0npsolL9ME6Oc17x9yFOjHwz57Yr/iXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsuG1NjYB41MyH8jMjjGhi8od2xVix4P/9QEdFVXVK5GTBP7Na
	ZyFvbXpLCuZ6PnoY44QLmyv/ezX546/uVArG5PT2a2a8wqrJZy5HSaG3sSjDezvl4zg=
X-Gm-Gg: ASbGncsiZvsLQmi1YwzzWbwm4A6aJBKSeNtDrz/JCY9MJPRbq/sEfHKeb8xmgs8KcNh
	LUqtqC8ZMVfWuY5fCZy5RhN9egRKGmlQ+AMOCS658dDc5cNOZf2TQm7ibj04qxG/nembHrN2L9Q
	CYMVpMAI0tUlpv727G4T+kJ4Xvs+m98rbpUGYBNbFydShqUgdNm4bbRoUVRlGr+S/DaYNCtoYh0
	WIfsZu2BVgqT/LE1uAy4hViBZHHZqhHOLfNXhQ3QhL8eadWvU1HgeZKgIidi4iToAV9dQTCgIHC
	4U1L3cWDImCfVTjd6HQnxSV2HotPQPqi8b7dbVRBeAs6D1g8SbduLouJGsAvdlgQcKYzNLJqvys
	qOeRGT8PmJW6Fntu042yyHX6Mkpcpiw/czpVgsg==
X-Google-Smtp-Source: AGHT+IGznYf+8MTlpk6cstRn1GL4tnhUVJ7amBoJ4nIX9Yue18MyS1rMtXsRUivUxsPxvksXGxAf7w==
X-Received: by 2002:a05:600c:1f08:b0:45b:765a:a8ff with SMTP id 5b1f17b1804b1-45b855333e7mr131969965e9.11.1756898983980;
        Wed, 03 Sep 2025 04:29:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b7e886619sm233540675e9.15.2025.09.03.04.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:29:43 -0700 (PDT)
Date: Wed, 3 Sep 2025 14:29:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>, dmaengine@vger.kernel.org,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Vinod Koul <vkoul@kernel.org>, Guodong Xu <guodong@riscstar.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ben Copeland <benjamin.copeland@linaro.org>
Subject: Re: next-20250903 x86_64 clang-20 allyesconfig mmp_pdma.c:1188:14:
 error: shift count >= width of type [-Werror,-Wshift-count-overflow]
Message-ID: <aLgmpIlcBxH3klYp@stanley.mountain>
References: <CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com>

This seems like a clang-20 bug.  It's complaining about an impossible shift
in code which it should know is dead.

regards,
dan carpenter

On Wed, Sep 03, 2025 at 03:38:11PM +0530, Naresh Kamboju wrote:
> The following build warnings / errors were noticed on x86_64 allyesconfig
> with clang-20 toolchain running on Linux next-20250903 tag.
> 
> But the gcc-13 builds passed.
> 
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
> 
> First seen on next-20250903
> Bad: next-20250903
> Good: next-20250902
> 
> Build regression: next-20250903 x86_64 clang-20 allyesconfig
> mmp_pdma.c:1188:14: error: shift count >= width of type
> [-Werror,-Wshift-count-overflow]
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> x86_64:
>   build:
>     * clang-20-allyesconfig
> 
> Build error:
> drivers/dma/mmp_pdma.c:1188:14: error: shift count >= width of type
> [-Werror,-Wshift-count-overflow]
>  1188 |         .dma_mask = DMA_BIT_MASK(64),   /* force 64-bit DMA
> addr capability */
>       |                     ^~~~~~~~~~~~~~~~
> include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
>    73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
>       |                                                      ^ ~~~
> 1 error generated.
> make[5]: *** [scripts/Makefile.build:287: drivers/dma/mmp_pdma.o] Error 1
> 
> 
> ## Source
> * Kernel version: 6.17.0-rc4
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git describe: next-20250903
> * Git commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
> * Architectures: x86_64
> * Toolchains: clang-20
> * Kconfigs: allyesconfig
> 
> ## Build
> * Build log: https://qa-reports.linaro.org/api/testruns/29752023/log_file/
> * Build details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250903/build/clang-20-allyesconfig/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32B39xPuITjxcbak13h2MrLZJP4
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32B39xPuITjxcbak13h2MrLZJP4/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/32B39xPuITjxcbak13h2MrLZJP4/config
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
