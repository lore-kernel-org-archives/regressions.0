Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8471849CB
	for <regressions@lists.linux.dev>; Wed, 26 Jun 2024 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719409115; cv=none; b=o8rXOkUj5CpZoN08G6KnQQ9hPtHewpx/NawnBDgPH8Q7AA7ddFX9s4/YdhU8orwgFpVojX+k9HGD5aas92PS8UF1qdiQ0u9ynLYn6pz4nvFIssBHfJuAOAScWPlStcK+034qtmfeecyZ/qSIoSuVV6nnko8s4W8GCuCqgPzPnlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719409115; c=relaxed/simple;
	bh=0GBxfrcHHTAQoKsHFH/S0ZP6WsOUz+LOET6DcgRPCwc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZC0qJrYKtlQg2J2OH8WOQw/FthmTOz3DjrpAIxFmSGag8K1jSi2ccTvYxSt3xVDTHrSENDc9RGUldYCct1z0x7g81jaV13ARfbCiCmDGLQZf3ijgV9UrhYnixaf1XQbXupmnZnfvU6q/vEWd673Y9N9R/NnvvgxSutwgo9vJJFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NU9sa4ay; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NU9sa4ay"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ce01403f6so4047469e87.0
        for <regressions@lists.linux.dev>; Wed, 26 Jun 2024 06:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719409111; x=1720013911; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xcG7knP1Gs0T4Jv/tUigyPx9nzWz8ywBIZJPbRtn4wg=;
        b=NU9sa4ayOllxpApHhh5Xv3EEy3mPSWgP/m45Kx/DnyPEUvcGj9ms33AIGv/JoknkBP
         i+vdVOsbniC1MDJml0azq98DAEall1/0s5Ni71v97n4OQQ/ms1pwc2O2c+cJuvw7k5Xk
         wCdcm6o/oDink5p5MQTX9o771id5heES4qG/7is2mTX3rKPU/n3xvah/xcKkQFAJBc1l
         93rEgNNP41JpM6QG5ZgQYnMXmqu+lyVtxFjxWrqIuRHSH3WQ3Sv2G89gDgRyGERMjoSx
         dC18yfDcvXWE41T3x592D6xcoWDhk1YQRk3VIlXnLTHh64/kOaqNtDq8lYlE2mnKlkn2
         6vAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719409111; x=1720013911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcG7knP1Gs0T4Jv/tUigyPx9nzWz8ywBIZJPbRtn4wg=;
        b=kW956HgHNu0QQdhWSe07tkwVCzgXRPseEjka01DbmMF/MU+6QTEuAJznGd/Zxvghl6
         NT/ewOH6NJ3Qo4/RF3pCkXzcM7zPdOZEeaoH1DHYFjbRQe3I3RB8H1qVGFj+BlczSpew
         GtztxA30g8IEMtQGR9GAYuJHcKxgUpnuN0lwGdKgiMxLfoNe7wyXSZAbodElX7Tr8ICU
         H1wwB/AnL+W4+jlRfPJTvtjRN/wjXV9zd0rp7tBveiNgaKfFjTiXyzB0QoR/j1WU1YqS
         tQfHEPitYmrTfy7bt1Piut+JpWEG/52lmr7q7d6vFW/tshRUe9cSQPTaIdEjEUzd73LL
         WpkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5rNrTsSUJDIsZqss1rBOae7EElGbbS/tODU98JcM1D3QLpw/yulvc50rYsDKXELF+1wtMLAuT7xrX7tD9qQcsGepAEPBxcZZsP9I=
X-Gm-Message-State: AOJu0YwCxbSlgT55zBKAFpMlbnqWvMorYEgZys7HCZEr0h13DkIMSQLn
	XCCW8UJMZbR87bYWggIvYWAlqTgB1UiQ466/ROz9L0rpEmgBZznm
X-Google-Smtp-Source: AGHT+IE+5sPbVuM267cG5j/0wGO3vAZT1hiCp+Z+H5L32tjwN8f+2LxiC6ZgFtSIQl/ZAqA/xW72Sw==
X-Received: by 2002:a05:6512:34c5:b0:52c:a88b:9994 with SMTP id 2adb3069b0e04-52ce185eca9mr6076090e87.44.1719409111184;
        Wed, 26 Jun 2024 06:38:31 -0700 (PDT)
Received: from pc636 (host-90-233-219-252.mobileonline.telia.com. [90.233.219.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49e7sm1566340e87.34.2024.06.26.06.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:38:30 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 26 Jun 2024 15:38:28 +0200
To: Nick Bowler <nbowler@draconx.ca>
Cc: Uladzislau Rezki <urezki@gmail.com>, Baoquan He <bhe@redhat.com>,
	linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-mm@kvack.org, sparclinux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Hailong Liu <hailong.liu@oppo.com>
Subject: Re: PROBLEM: kernel crashes when running xfsdump since ~6.4
Message-ID: <ZnwZ1EL54DzsGf9E@pc636>
References: <Znq/8/HAc/0p6Ja0@MiWiFi-R3L-srv>
 <ZnrjZRq5-_hemrbD@pc636>
 <ZnrnADHvOiNcZv9t@MiWiFi-R3L-srv>
 <Znr1IQ1mssdNNXbv@pc638.lan>
 <ZnsjIB2byIxSgbjc@pc636>
 <20240626051206.mx2r4iy3wpexykay@oppo.com>
 <ZnvcToH1h-sVtikh@pc636>
 <20240626100342.2dudj6fjjx6srban@oppo.com>
 <Znvyvof4CnFETJ-v@pc636>
 <cc70c1e7-aa1b-45a7-8edf-20dc4f3b75ad@draconx.ca>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc70c1e7-aa1b-45a7-8edf-20dc4f3b75ad@draconx.ca>

> On 2024-06-26 06:51, Uladzislau Rezki wrote:
> [...]
> > Thank you for pointing this. Below is updated version with extra comment:
> 
> I checked that I can still reproduce the problem on 6.10-rc5 and with
> this patch applied on top, xfsdump doesn't crash anymore.
> 
Thank you for helping and testing. I appreciate it!

--
Uladzislau Rezki
