Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D40720C477
	for <regressions@lists.linux.dev>; Thu,  8 May 2025 12:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708829; cv=none; b=tAK4MmGDppnpf4yOBz4c4dHqGXaPaII4gCtfRw+1J65UnFFGD0jpXfuEH8rjzlKoQIvuhloPweYOYRNeBV68g6OvR1YW4B1Ht/Ok7cnktQbkIRbu2Rz6mP9iiU53c+8B6iLkXs2uljHS1Dc0qZ+nQnLXSdqSfVbhUSxpdxi8ZJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708829; c=relaxed/simple;
	bh=rKvDdcEyFMuVbDxsaVe56Ux5vURLprceReNvMRSRIM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfvNVVNH3lMknlwHFDOyYYhGlVhMOT1Km/RO2GncuVrMKs5ziXKNoJ8PJnGhRm7J8DSaVk0ulD5b4vrXi3E3RJ2bvR+0Akkde78OxRxpW9JnesMj9Qf5pjRkQ/VeLF8KNeKVjTrVcewOsPhnyad+DAQ7jSZ+9Jddmo1AfHOBEsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L73yx116; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L73yx116"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0782d787so6417945e9.0
        for <regressions@lists.linux.dev>; Thu, 08 May 2025 05:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746708826; x=1747313626; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1l3iS/TKmQrqa4v6zV9bm1xcGBuMMVrt22SRtsapFPU=;
        b=L73yx116fN48cymNQ7GAFsFvs0ha3iCez+Z4p1MQB2h2eevZnbTuSoc5tpSpS4IZka
         ZuMNsCtsHUd5w9L6K/p0CVDhfPZKT1neDm9y4KlK/YjRDVkFRNnbS/Dvaao50Aj/EReJ
         6PnX6W5xr6X9wqfuFKEW61DvCedpN5hsqo7BDagemC2NHMN30cb3ajuv59GwrlvARHTS
         8Rc5Xk8Y/XibpuC/OhQo9d1YYdLr+jgsOSNOszaosT/Kl8lvz9w+axvIThIvPToIsbVO
         +jynGZszkbiVTTBui5gcSjQNoApNVw4bGqm5OrUpxlL0ahRo6dB/wELu/nhDXrV4taqV
         kwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708826; x=1747313626;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1l3iS/TKmQrqa4v6zV9bm1xcGBuMMVrt22SRtsapFPU=;
        b=uQzGMbK04MAotcv8qijyotApCLO73TBXwKW4UKD+3ktIzN/7Z+r11GXrc07rMy6C9J
         cqhPsslqOP62LopwAgovWnSq+n8twuI84PuIX6MYpQUH2m0R9YfVE93oGsS8o3A5KDC5
         H2mSI3j5gEa45veVtwcJLNEouSGMjmI8u1mHjCb8F6PA8y/Vu1JdiOoqXw9tzTzWteXh
         4b4fKa2650WI3TYE7lb9caBDsgdFulf/2ycOLXkqwQInEK7PAavJuPsrEDQNgvBJ3/Tp
         1JnyCEf+C4+sQ/XhPzJbpf1EXMcmlGysLbKREuNKVI0LYJG2W7gBR62Fbn8KNbyfYeuI
         ZqhA==
X-Forwarded-Encrypted: i=1; AJvYcCWc6aGL6FhQ3LkQ8mlvVsgJOzehsRIAzLKlVfYq3hf+bVGYRy619XQwa/4zpNGx/9QPr89PwS1Jf1DEVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHKrIF48cvTwqlWepAtuRt4zjG79hhUZImAfqIa27o6xvjTCRN
	QOmkt1zz8WwsmBvEcfDhtNrikZqdo9Oo89qGYhy1ym4Apfw+R8aR
X-Gm-Gg: ASbGncushH9n58DWa7ZtnoaXxbn7+/mzDm+NqGSgnA46783SqJgJ4Sw/hx75iXZellW
	mRIoyaqtkEObXmG6tHTpD+qrjRnradYFE28HEsRXtBpPHWZJ1Rj4P0NBPsL5mq683RAP0suoFK5
	XXikmRw7aPXLtUZSUBiN5AY7JlDpNOLwCw/xJogsDMbE3NIN/Ae47BRw/PqgZ1+X6IxWOCDuP3A
	rWQHaM5H9RlqAJnwnfP3Ygoon+YPWKxxugm2QCf8Moq2lqS1Pf7vxkoTu9FyMpizf7q0Fg5C4qW
	pE/886JtWuX0uHfCehuoOJiKi7pwfPTa+D0umT9pSSQ8JQZtan+X
X-Google-Smtp-Source: AGHT+IG5cba62jUROOvRO+O5AK/nVNwnJkll+1lZntviPX9TwJtwpBBNe1ExNq1zIB+0bFYPdgQflA==
X-Received: by 2002:a05:600c:1394:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-442d034bcffmr37384505e9.30.1746708826061;
        Thu, 08 May 2025 05:53:46 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a099b0ffb1sm20154250f8f.73.2025.05.08.05.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:53:45 -0700 (PDT)
Date: Thu, 8 May 2025 14:53:43 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Klaus Kudielka <klaus.kudielka@gmail.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>,
	Romain Perier <romain.perier@gmail.com>
Subject: Re: [v3 PATCH] crypto: marvell/cesa - Do not chain submitted requests
Message-ID: <aBypVwhHHzmqqN5K@Red>
References: <ZwePSPG8aWm6mwKK@gondor.apana.org.au>
 <15fadc356b73a1e8e24183f284b5c0a44a53e679.camel@gmail.com>
 <Zw31JIEyh28vK9q7@gondor.apana.org.au>
 <5db212655dc98945fa3f529925821879a03ff554.camel@gmail.com>
 <Zw9AsgqKHJfySScx@gondor.apana.org.au>
 <aBoMSHEMYj6FbH8o@gondor.apana.org.au>
 <aBsdTJUAcQgW4ink@gondor.apana.org.au>
 <aBt5Mxq1MeefwXGJ@Red>
 <aBw-C_krkNsIoPlT@gondor.apana.org.au>
 <aBw_iC_4okpiKglQ@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBw_iC_4okpiKglQ@gondor.apana.org.au>

Le Thu, May 08, 2025 at 01:22:16PM +0800, Herbert Xu a écrit :
> v3 simplifies it a little bit:
>  
> ---8<---
> This driver tries to chain requests together before submitting them
> to hardware in order to reduce completion interrupts.
> 
> However, it even extends chains that have already been submitted
> to hardware.  This is dangerous because there is no way of knowing
> whether the hardware has already read the DMA memory in question
> or not.
> 
> Fix this by splitting the chain list into two.  One for submitted
> requests and one for requests that have not yet been submitted.
> Only extend the latter.
> 

The board do not panic anymore, but have still selftest errors:
See the full boot log at kernel.montjoie.ovh/477935.log

Regards
