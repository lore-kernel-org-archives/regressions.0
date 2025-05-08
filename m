Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582DC22CBE4
	for <regressions@lists.linux.dev>; Thu,  8 May 2025 13:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711795; cv=none; b=Yq8wMfn5yVabk7wfxlWkkHM3W3TV1VuyiDs8R096VrcXKuyztkBKammq5AbOhzGGLCC8lQMP9t6PtdICOXa0rNpUfD6kuL/M6cyAEV1847bgXzdzz12P4KV5hJsZmZ20oMcIGUHTnFvJB2aX/JJzRKUB6946BpkuDsYNmV8u6Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711795; c=relaxed/simple;
	bh=aCE6iYiciFIdKSqWV0byF7RoB3J0cxLu0LwihXHKXtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tp2zPkaeoRul5D2xBGdJ6w2tJZSMBpbvJPTyj3qFU8l8icvmqsPffLouKsQPcICFlTX3d5lm06/c073K+1/e8KkPFC7yMXd+uzusiKhIY70TVE24fth1FHLKDNz7r+Lp+qh009Xqhrde9GobMze8Jp7vdDnQsi5C1zmkjEeIlXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3COHPSD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3COHPSD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so10821165e9.3
        for <regressions@lists.linux.dev>; Thu, 08 May 2025 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746711792; x=1747316592; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b4tVbEi1qNi8E/gdy3VXy8wc9mnT2zzjATf4UbjgX20=;
        b=I3COHPSDenyTfcQz6xdWcOiikaVCmzkcdhPJXobKSp0whhKWThIqxPRvdYwK6JRG7b
         ztAU6DW5vLf6Ia+4cmlRnxcY+ea5/c90XquvmJ5t9TR0xX2dDMfDe93N6o/pKs1+M+wI
         QhEEqnquf9MxT/9CHgENnbK9aN/OwVRnE6fNNLvDeQgOgb9XUwZR4z7QIoXO/T9cil+P
         5UczugiUxPc4IVdQnDVCWX6CC7BzscBrBeoxRCKnPVUeDRaMm2i6omFhR6ZoP4li7uNP
         5r4ZhXYWWqE3gwYnp4i7531WBSmBfKlUwe2LoTz5YZzu+nnChMGkdl/Hpg//WIq63haN
         H78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711792; x=1747316592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4tVbEi1qNi8E/gdy3VXy8wc9mnT2zzjATf4UbjgX20=;
        b=ofZj2WQrkWJXm7UFqOfWMblamGq+9vXfd1BtkzgL68PX15PnG05tzSL5/1PlnNN6cF
         u8sP0OjvY+fvpufkCPUy8YSX38+9YQsnMsYOw8nxIaE82QzpkUlOQX5GDf4LHD81z8j6
         VTbO3YkIkv6Fq4CVHct/f5nX1uvn6VecRrElyiUzEvZcXCeXTNPmjc6ARDG6/lhKaF7a
         CMnri3e9VLG5Xsma2jYmHC8QK/T+QeZL+Au5fxTdxNw9aG4d6LU3eJZCLUVFbYwb9b4S
         wrM+cTHknrA2T6LrlR349pqnJT59p8teC+is6xWsS4u/HdTId4j0q+VuhuBqs1tMGFNd
         mxZw==
X-Forwarded-Encrypted: i=1; AJvYcCWlEoGln2j+0x+yKtJ9HWQXPmHUr4oQIzk6oTM5BlzomdycLwpPyuGbNSQWqiTmKYbyzwbc4DIFw/xa7A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2b7EC/arsZHWUlrGSe/t17pY0LW7SKl5Ik1uYzW8v+8Tzf95i
	w5us8+o1UKfIn5050KoiZ+fdxOofRkQnSnuvpBDFlEYlRNMBH3/uvt2YHA==
X-Gm-Gg: ASbGnctRHM5lhWoDL9hzvM7oPuCQb/31t5RWrP4PXVzoqTEg+Oz6xrfXC9vw8zm2Mmz
	cSQwzPP9DBsVz/GKk02bIBYlTEOsvHXBnYvhVN6lzAW5MZ0Pbt0D8D3+s+FcdNn/6XpJAFACSZ8
	NBs5ezBXkcvtQQCsSaAx5xjZNZRrP7eNmzksgYCBgqmT5Eo+2IBlMSr33yBNNoe2LgPx3XYm3Pr
	wnmRSeVYEXuGuiB3XPCJ9FkuKFN268n2k46eMr/uZx6Fc6wE1XOQOqfc3ZzovwqMx3qSYXnZtxW
	lKVyZCJGW0ruEjpq8PrnYWrc2ZSDPTfd4E5I3dSB/w==
X-Google-Smtp-Source: AGHT+IHFMBcxHiIp52o0F6tt+d3OgA2roN5kK/YH6p9byXgvoy9nOMhe4gnHT98HwmtQZBwp+sWs1g==
X-Received: by 2002:a05:600c:3b29:b0:43d:83a:417d with SMTP id 5b1f17b1804b1-442d02ecb69mr33139155e9.12.1746711790720;
        Thu, 08 May 2025 06:43:10 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d14e0437sm29360495e9.36.2025.05.08.06.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:43:09 -0700 (PDT)
Date: Thu, 8 May 2025 15:43:07 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Klaus Kudielka <klaus.kudielka@gmail.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>,
	Romain Perier <romain.perier@gmail.com>
Subject: Re: [v3 PATCH] crypto: marvell/cesa - Do not chain submitted requests
Message-ID: <aBy06xyzh5kKC48a@Red>
References: <Zw31JIEyh28vK9q7@gondor.apana.org.au>
 <5db212655dc98945fa3f529925821879a03ff554.camel@gmail.com>
 <Zw9AsgqKHJfySScx@gondor.apana.org.au>
 <aBoMSHEMYj6FbH8o@gondor.apana.org.au>
 <aBsdTJUAcQgW4ink@gondor.apana.org.au>
 <aBt5Mxq1MeefwXGJ@Red>
 <aBw-C_krkNsIoPlT@gondor.apana.org.au>
 <aBw_iC_4okpiKglQ@gondor.apana.org.au>
 <aBypVwhHHzmqqN5K@Red>
 <aBytNdRyd5Ywh1Pq@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBytNdRyd5Ywh1Pq@gondor.apana.org.au>

Le Thu, May 08, 2025 at 09:10:13PM +0800, Herbert Xu a écrit :
> On Thu, May 08, 2025 at 02:53:43PM +0200, Corentin Labbe wrote:
> >
> > The board do not panic anymore, but have still selftest errors:
> > See the full boot log at kernel.montjoie.ovh/477935.log
> 
> Do you have a boot log without this patch to compare? You seem
> to be getting skcipher failures as well as hash failures while
> the original report only had hash failures.
> 

6.14.4 boot log at http://kernel.montjoie.ovh/477911.log
