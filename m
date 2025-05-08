Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00E7227EAB
	for <regressions@lists.linux.dev>; Thu,  8 May 2025 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708572; cv=none; b=f5PEokyPp2LHUUP0EpnaEuU4EvJly5GYvZ4cGetIZ/PAb69emTg1sBGEhrXmpnBp8mEAqc1DyrHvrRPa4LJgcwyH22mVx4rXM36OruM0QDedfZlHX7A8MTegm2XJe05fa7/B/06tZ9wS+kQOzkPn27cryDyPxCRy6TFcpzz1j6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708572; c=relaxed/simple;
	bh=58sdXjoEMjFVCflGE7ncCGuTV1pF4ageHSg4rQYhGrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSNyITYz7CGCpJFS7KTu2r5YBJCca7f+ZRimiaYe6JCKIj1bxWUXJKUazxnHyAQ7Neo5pT6IH8haOYeW72h9r32PjITXPnhngGcJLAbdyhjL83EF4XZu9XvZYtnhpQS4Jn7TXayU7Nk/5cyngI4puWJj54aur+IhyRF+tLnJ51s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JInspk8v; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JInspk8v"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a108684f90so293806f8f.1
        for <regressions@lists.linux.dev>; Thu, 08 May 2025 05:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746708569; x=1747313369; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g/Zo3idQAmdiJtBVtWzs8q7ppnKXkar6x4EUIEKDs8I=;
        b=JInspk8v1yky3ODf6QbVyVWku9q308dPGJQC2zwKOjNFaSBHBWtkwzP/oLYK4tN6nH
         eNMOFlj9ExepNyie8rvpyPuWiygQNUxN+Fo6WOffu/m8WvAXAoooVfU69CFTfLwgeCJs
         BjYDe1JksEb+Pe2qsErCxmTotwFrU1Ux7tH0P9i2XslxqSh3CWQ+2f2uqhmQlnQ4CRrM
         7YQTGlQrk5HoPXjhhwT81zNvwinTBF7HwVzVGC5dtrwY/ll8xOQjyzOqFsI9AVXuo04X
         mHi3guUiwFezWBkMgD/5kW/cMeACrGg2ZIau+xWA8EpOO+T8cM7ZvqF9QsI731JiLRFl
         dHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708569; x=1747313369;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/Zo3idQAmdiJtBVtWzs8q7ppnKXkar6x4EUIEKDs8I=;
        b=PwC5JdIVhpml7NcKvLuYLn+AB0WXVDUsKj5Oxec6qtvSNZj/C1pFPdDHBGbpOL6N3k
         QhIrcgHNI2x4ca8z/HblTJpkPX0Y7piuY23m7j5e23+VmxKbRARVgm2+I4NId4etCJyz
         fu7pa4QCnFM7TFHfpP7v3zr6e+QWn7ev0I9w0V9jqj9DfnM1IiYcwLZi0dirU97r5r2e
         /Lsa0v1TePtgakGPv2yj4tChSVXSzm/5pYUf4bFd1u2vFCIz/fV3h6oABY+6TmrYC5q7
         QSoIL3zoItVm/PU7sCDq72EyjqtYPAOo25kheV7ZYbsZ4wQbfvdZE9h+N0TBO3k2Hxln
         VWhg==
X-Forwarded-Encrypted: i=1; AJvYcCXyy8oFh8IJeJQNw5/j4e7cyyAGoRhFpyGk1VUzYxPvt3uJsRdNORYwGyvlf8bLLcsp4RJvJMcJXvBjwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+FUMAzwhTJiNiEE3CO+KVzEtCh7pRxUU39wz9dycadjKttO0e
	EZvIzrA0dPvm6bwPiHEnRD/SFBKlwtFgsGaEmEwrFN2qcFX/gvRk
X-Gm-Gg: ASbGncvw0Q3qlSQ4CqmaiL4ZITm4TOO7w8OjhHk4paINH/z7KBZBOeXgn29Seng+EEc
	AjKjVH4mJ7/ysY1RVU+zI8XJveF/ErPKV4oyB4VJ9jYncxU7J1dWkeXY4oP/28dfcKnzQcJipVM
	jmAZb1Yba9Q02v7+eKch0cbpzV9XDPOd4nnMSC/lFI+typLloI8cDSIfPVb7hq3x62wCR44k0nw
	yxmcWUh9gmFzo52AMG6be2GRet1pVGnUhKHJEBtME5z/YE2Qvpwrr/aaWTVnkY7BrmAoISv9z+s
	2tS+maGlaridyHnn3lV1Gq+iqH6uJghQsxLCWMaAHQ==
X-Google-Smtp-Source: AGHT+IE4V0eQOUc88VL5le6hnYa/WX1pFmGHFpO8rruXlZMME8banCaS9znDvFn5HounZoV3whgt2w==
X-Received: by 2002:a05:6000:2207:b0:3a0:90c3:eb0f with SMTP id ffacd0b85a97d-3a0ba098e52mr1870423f8f.12.1746708568626;
        Thu, 08 May 2025 05:49:28 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a0b9af4ba1sm2879628f8f.59.2025.05.08.05.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:49:27 -0700 (PDT)
Date: Thu, 8 May 2025 14:49:26 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Klaus Kudielka <klaus.kudielka@gmail.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>,
	Romain Perier <romain.perier@gmail.com>
Subject: Re: [v2 PATCH] crypto: marvell/cesa - Do not chain submitted requests
Message-ID: <aByoVvwNq2DMw1oi@Red>
References: <ZwduxHxQtHdzz-kl@gondor.apana.org.au>
 <ZwePSPG8aWm6mwKK@gondor.apana.org.au>
 <15fadc356b73a1e8e24183f284b5c0a44a53e679.camel@gmail.com>
 <Zw31JIEyh28vK9q7@gondor.apana.org.au>
 <5db212655dc98945fa3f529925821879a03ff554.camel@gmail.com>
 <Zw9AsgqKHJfySScx@gondor.apana.org.au>
 <aBoMSHEMYj6FbH8o@gondor.apana.org.au>
 <aBsdTJUAcQgW4ink@gondor.apana.org.au>
 <aBt5Mxq1MeefwXGJ@Red>
 <aBw-C_krkNsIoPlT@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBw-C_krkNsIoPlT@gondor.apana.org.au>

Le Thu, May 08, 2025 at 01:15:55PM +0800, Herbert Xu a écrit :
> On Wed, May 07, 2025 at 05:16:03PM +0200, Corentin Labbe wrote:
> >
> > I tested this patch and my armada-388-clearfog-pro panic with:
> 
> Thanks for testing! I didn't realise that you had one of these.

I have started a bot which try to build/boot automaticly all patches touching hardware I own.
And for the moment it handles only linux-sunxi and crypto patches.
Happy it found something.

> So just out of curiosity, does this driver actually pass the
> self-tests before this patch with CRYPTO_MANAGER_EXTRA_TESTS?
> 
> Is your system SMP? How many CPUs?
> 

It fails to pass selftest on 6.14.4.
It has 2 CPU

