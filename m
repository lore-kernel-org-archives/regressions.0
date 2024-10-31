Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20123198838
	for <regressions@lists.linux.dev>; Thu, 31 Oct 2024 11:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730374072; cv=none; b=Sf+u2QqwyeB9H9nKHP5A4Nx0GoDRd4LEzpXRCbO8T+Zj2vcZ7h5hgvo6tF201nvt7NLnRzxLxmmUAh+ofnWE0JkHFFBY/2Ud24/xQDA7/6hZRTYsyTUMvugkdtr0U1V0JffzS8iCpvoCd7+gMziKs0ufkzvpf7y5c+flemx9Th4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730374072; c=relaxed/simple;
	bh=2/wxx2yPHeqzUl3bK4IWTgP7OiPHmrV9sMpSAgHj9dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lISEXZO7kHnfAGI0MS366QxZRGRppAE62hmXW5r4b7oATJfobwN4JZp3T9xUqrxcLdwqnccgYeY6f6twX5irP/Ibzkp9slMPBEMeyM9rHOUcZUHPRcBkIdwqduNIGBLlWBW+gjwypCx4pRODVDuT49Pv0qENF9hSvCBDoVaaunE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gKHAbTD4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gKHAbTD4"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d533b5412so515958f8f.2
        for <regressions@lists.linux.dev>; Thu, 31 Oct 2024 04:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730374067; x=1730978867; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Qinma5kqYmuHBjZm6H5Vna/9c51/QTVcMYek7K4+Gg=;
        b=gKHAbTD4tX+ZC939qY4Z5zVfEp6tLCt2mmB4nCNqVq9nxWG5GzidWjED1UwhT3S6Dm
         +9ePXYFV9Nppm3rBzN0CQp3WBBBXxvQ6pA6K7Zwpd2pttyNlTa/jQbBP94fMRxv6CjKj
         1dFwThHiYr9fS8Duu9lS303HWJ8jGaujasSL4f+Cs9KTTn2so91X1+PR6BVGpFfESLmW
         U41DqxMsF5DtLGMo1Wdw3nZ+RmEGrKFShpIUij4rmYXnL7d0dUzh1xqh3z6GHE9k5Nwj
         i4q51zyRW3WyAw1kUjqLDTosZviQryq5GBw2XBur/R4zv85hQZQwroowzGZImx2hZP/a
         ojwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730374067; x=1730978867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Qinma5kqYmuHBjZm6H5Vna/9c51/QTVcMYek7K4+Gg=;
        b=rbiDVHGJv/Y3LkdBlJEB911vmnp1+3Pc3QA2rIt8hajexrm8DDcpBqg46i23+4ovWX
         qNGzsFA3BeLmj4N8ES1rQr06OUsxwJ0gq2JrV32wcc9zdP86SkrHcW3ZA7Mw90dUvVFx
         Nsf9JraunXH4syLIBBrw1awWil8nqpsJv9F9E5ne41/LMhBYmAF1/rGkQRpmqy9ueIxp
         r7nywJjHeTjfdIZs1NAtEml076w3x5RxABCw/+aTyA18ZkaHPDRxSLY4j6dvdKhezG88
         2u76ohKOeLQUkG/V0NOeplozMCfBiEbO7TFfYZH9m04JoWKe5sbOWRbtT9+PM7rqcS5h
         bvBw==
X-Forwarded-Encrypted: i=1; AJvYcCU441Ij8rQp2UAOJD6atxqxgUUjIAOpfzViDTlqNZw6cMGw+K704PqfAItdlxxz5POCDheu4fIosHceUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjgJNmCK1RH2yQGO5pNQWrxV3OJ4gPTmzh67mZttoiPe7M2ZS5
	VLh5Tr+r3G2KVVWiw7iTJIPQR6gAIPvcb/ETIDzCLLstFC5hqGbTdZyCDCZ22+s=
X-Google-Smtp-Source: AGHT+IHMzU32/E5p1uwxhDrq7bFwkszQjYOIXlfcx9OzbVpxpXnCoF3yBkBjLJDocKcQhGQ24Jv1YQ==
X-Received: by 2002:adf:9793:0:b0:367:9881:7d66 with SMTP id ffacd0b85a97d-380612008e6mr13984567f8f.41.1730374067469;
        Thu, 31 Oct 2024 04:27:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e6b5sm1847280f8f.88.2024.10.31.04.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 04:27:46 -0700 (PDT)
Date: Thu, 31 Oct 2024 14:27:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org,
	Anders Roxell <anders.roxell@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: next-20241028: gcc-8-defconfig : ERROR: modpost:
 "__aeabi_uldivmod" [drivers/media/dvb-frontends/cxd2841er.ko] undefined!
Message-ID: <d3903c31-21ae-4ffe-9969-6faa7e430cb5@stanley.mountain>
References: <CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com>
 <456c79d2-5041-47c4-bed2-44d257524ddd@stanley.mountain>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <456c79d2-5041-47c4-bed2-44d257524ddd@stanley.mountain>

Arnd, can you take a look at this?

This patch fixes the build, but obviously breaks the kernel so don't apply it.
I don't know how do_div() works or what changed though.  All this code looks
ancient.

regards,
dan carpenter

diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
index d925ca24183b..e3131f5c6708 100644
--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -314,7 +314,7 @@ static u32 cxd2841er_calc_iffreq_xtal(enum cxd2841er_xtal xtal, u32 ifhz)
 	u64 tmp;
 
 	tmp = (u64) ifhz * 16777216;
-	do_div(tmp, ((xtal == SONY_XTAL_24000) ? 48000000 : 41000000));
+//	do_div(tmp, ((xtal == SONY_XTAL_24000) ? 48000000 : 41000000));
 
 	return (u32) tmp;
 }
