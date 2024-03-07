Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFC321A14
	for <regressions@lists.linux.dev>; Thu,  7 Mar 2024 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709835252; cv=none; b=UoKPuUzIdAVPhPK+xKgd6Q1qAHwpuUt3vBwn6OShc4EHmtBzVT8mW7dgRsn5w0GEiiSfe9Z99XeNHN27B+eFOJ7nQ1VfgzJt2XBMQgwBuO9q+0rB6Af3PcxvpILc+WHe5IP/IA6gKSZCfRsXujSXQmrgOpoFlIxRvmZueKvKlWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709835252; c=relaxed/simple;
	bh=cu6HE91SMw7pgLLILBNFoaMUnUyoviAkBFKyhfhTaYw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhyWIfp9BdEu/k2mRyNUsXVOJiW9RnP9R6pzCzm0Tg0+7EZbSTpgu90jM7OusBISOnCyJyV6G94p50O/En2VCKs3ZGapH0nWMPunoquh+yEtK/5rBdaw2dMDTo84SWwNXXiLmK3Z+cVGb+u5TKP21IPsshvHFpJ35VI+WPleJdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d53Eb3+V; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d53Eb3+V"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512e4f4e463so1624383e87.1
        for <regressions@lists.linux.dev>; Thu, 07 Mar 2024 10:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709835247; x=1710440047; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cu6HE91SMw7pgLLILBNFoaMUnUyoviAkBFKyhfhTaYw=;
        b=d53Eb3+V/ChtCQAxhDLyuz9UqNUcdLbblCRwLjOtg87J4/WRlzrHWGAyyZQ/4UQza5
         de6TuTTKlt3vAllEsCeriGdzNng8AvPTQ1jtl1pjIka2rgsG/+5ahivePKRaN7BYgyEU
         MsqWfh0w28/I4w2qdm5sB3ErwsWfrica8JgNOn1vI0ly+tQ2Kfu7qWyX9ozknbsdM9Cw
         gIXLVISthgLvRDoC8K76+OXEFK40EywRzxYeB864Wf/YpwHA/szlIq9RZoHHBFKehD+Y
         fO1a+N4ZXrKfOkL20NjbUxUYgqJ/LiUoo0F7pTqhLIPvEHOgREjzxuPgYDfAz9F85gFN
         6t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709835247; x=1710440047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cu6HE91SMw7pgLLILBNFoaMUnUyoviAkBFKyhfhTaYw=;
        b=uugDPsvUxsuY5WsFrrwo6tgxE4DmiCde7oOSIY//WiYNkhH1kmMAHMZ/uUexhtm2w4
         bA4gB2mP2vuXzTnSyVAdM0ngtoCTrXaEsjMdKf3nFcYCD8LuayugAUb+Vrgn1I+DW5vo
         hpjp2MB6xUZq1BYNi3jtvNQ+Z4tIVSazs8bT8cb/+bwEZtCVg7QtJk/matqHkw9VFOjf
         3VR21XZqbamwzGkvUr/KITU142kOK69XSYd91V1ZfCtldsDg04nH7Q+jYOZ7RPgI/cx8
         LtChZlvUHTzwgoTEEbuX2ek9914HZGXT50c/VMpQmTV4oT/gKuWJV1zu3jJyjJqQSbDk
         3hvQ==
X-Gm-Message-State: AOJu0Yz4MUCXl7S4LWiP5PiJU1+IGpGIou4VONUGCjmNUa3l8OV6ILXi
	kzsypt5KC7AIfNSBaQLf+Nby84MyGrGDcVC0w7Jsg3lcSzoV1ZR1WpaiG2bP
X-Google-Smtp-Source: AGHT+IEQBWWBHJ8RuT7qMXcXOG3o6zq+Mu8S+LvujsXV8vAzlpEWO9s3S6K/QTiIORsmKWq5cOsJDA==
X-Received: by 2002:a05:6512:1149:b0:513:2329:4308 with SMTP id m9-20020a056512114900b0051323294308mr2589625lfg.14.1709835247113;
        Thu, 07 Mar 2024 10:14:07 -0800 (PST)
Received: from debian.local (80-44-66-160.dynamic.dsl.as9105.com. [80.44.66.160])
        by smtp.gmail.com with ESMTPSA id bd26-20020a05600c1f1a00b0041313c55ba4sm1217696wmb.16.2024.03.07.10.14.06
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 10:14:06 -0800 (PST)
Date: Thu, 7 Mar 2024 18:14:04 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: regressions@lists.linux.dev
Subject: Re: [REGRESSION] Divide-by-zero on DisplayPort MST unplug with
 nouveau
Message-ID: <ZeoD7CrI2ujoidW7@debian.local>
References: <ZeoAPFIF6NClUl4P@debian.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeoAPFIF6NClUl4P@debian.local>

#regzbot monitor: https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/36
