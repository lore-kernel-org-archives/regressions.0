Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0293E228C99
	for <regressions@lists.linux.dev>; Fri,  9 May 2025 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788487; cv=none; b=YYrU/z635tfUcFHKySxvsjOzOvqiSF2CrVqO7doNaRWKZCggOnkagAOQYxY1t6UwrfxoUdfnunRSPGkYPXXh5VkA+wpYjtIs5zYtN6qalgeiGlh3ACRLwPpWvPr80dIcLDSOykaCqd5SkrY+C+D7ytWwbZg2CFro1qnH8wLJOGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788487; c=relaxed/simple;
	bh=gRgLFX3wudpilZbhg89XKnOTVJhitrzM2EL48kaXQIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fowYU7zsuty+6rnhZEMPrmqXoBqt9qdSOEH1RirsthnqTD9NYoFkSeM8W9zNeBkgHmnnWRs1QntOgG2KJvEAA+ivpml7iLAP9+BgxPWwKByns69vpyK1ffd6kNvyk8qr0YLpj9bAuf9DTHQYMc8QKp/Zoi7u1T3wTCgCYWKPRic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQg2dgnw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQg2dgnw"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0b933f214so784318f8f.0
        for <regressions@lists.linux.dev>; Fri, 09 May 2025 04:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746788484; x=1747393284; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r53khiO3ex71dGFIBcMlSGwX4XCBTtxUE+p0BbXkqFo=;
        b=PQg2dgnwe8Hl2gydfCfsdf0Dd2xCc3ERr2JT2pSz3+ado5h8ItQDDHWLI5sWHA1P12
         vCT6ELOxM+ITcIEnpio7JR9X3lmuH9uyRxH1Wr2de2iIR4CgCXtqwZ1qy97yn4zwQnBU
         nTi8r8oZrWq8KrjGHL40HP3p69QV/c+7BaRdde4gYkGL8hjC9Pq9/cGWBfNS64N5b7Xn
         Sn6/d4PT3y9UYvYAfNrkHZGKecjU+YZ6NBFMuBC7bHleyrlNyQJ4vUp+nrt6e27aVxtw
         rnOj+QZivXxCXf8cIAI+UAytxsGzMM/fqHnhrUi58eSUZROgGonI8WuyauMP6BGTQ7/P
         7K7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788484; x=1747393284;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r53khiO3ex71dGFIBcMlSGwX4XCBTtxUE+p0BbXkqFo=;
        b=b1aRiPbiaSAtg6lcT27lhA4wJwTn8+puBnUt0RqbGK1MwxtpUYYFBNJv6M9TUdL7VZ
         qF7bkuVDrVSgVaKk6M+zRM5boAA06xPeHQOWVBY1TtasgthEZ0Fau1x+TNYlct9Jcwdm
         k3HEPK4G8OmoLmSgAIH4OvEIlqHAkuzkQpQqeQ94SrpermJyWZjiymM4H2YtxysFBVbv
         F2CZaKEDfqpOORio6JifhfCnCO/OYmWmS4TrWa4Ka5QJm1bINI3PQmi2JYwehGO1dWs8
         2NHJKAPHgiYgjTa9Up34fTFpsspCar3eMPZ1tDuXuOOJaEWsae+0utaEOR4NC7TgR2bH
         NuIg==
X-Forwarded-Encrypted: i=1; AJvYcCUY4Jblqa2cRB1i2SzD8XO3PJYlPiwyCltqPH041wVdC88NzAOwryqltfgtx0r60jBv+lto5j3BLEGjNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZemY5VYYqPSqgBEPUIQS3V6LselJfEr4Y+bByAfNvdoMMPTMz
	Nj12UJZiIF/exueRLgXNKtb5x1QPamw2L4V2lQcpAUuMsl4FZRyC
X-Gm-Gg: ASbGncvP6/PQuVwd3pZVjhA+aNOIaHr3bD1GsKg0XJl3LsngN36ArjuNEc/uI4xl2Fs
	qB5pjsePfO/IPaVNVmuBny2aXYTESaiJ3u692U87S9T0/LPDhYYyqVyy/gP4wNrBsO3xiWQ4dqx
	vUpj/2qfDe7AjDA3CFiVI1fHK6wziuSVckhQK7Pe+txtyF8lX+vp2K04ggU7twNzZYfpLNHHNKa
	HgY5pQrEckvZGYlromSbRfB1GpaPerJTN0EF5oZiCgl+dfCFXVEK9BeEMpvUEehK76r+Jg+GwDj
	VT/cq8y/eldMKzHpnu+anEKHvSIJwmZfQ71IftibEA==
X-Google-Smtp-Source: AGHT+IHxdrrT1mXNTg47HWfTSTmmEC51lBLDoX8qYM2Pqx0cEOFChgQ2wd+oIPWDgDsHqFvJei+Rdw==
X-Received: by 2002:a05:6000:430d:b0:3a0:b9a9:2fd9 with SMTP id ffacd0b85a97d-3a1f64a34c6mr2544261f8f.51.1746788483860;
        Fri, 09 May 2025 04:01:23 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57de100sm2871878f8f.2.2025.05.09.04.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:01:23 -0700 (PDT)
Date: Fri, 9 May 2025 13:01:21 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Klaus Kudielka <klaus.kudielka@gmail.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>,
	Romain Perier <romain.perier@gmail.com>
Subject: Re: [v3 PATCH] crypto: marvell/cesa - Do not chain submitted requests
Message-ID: <aB3ggeQDdaPblUxi@Red>
References: <aBoMSHEMYj6FbH8o@gondor.apana.org.au>
 <aBsdTJUAcQgW4ink@gondor.apana.org.au>
 <aBt5Mxq1MeefwXGJ@Red>
 <aBw-C_krkNsIoPlT@gondor.apana.org.au>
 <aBw_iC_4okpiKglQ@gondor.apana.org.au>
 <aBypVwhHHzmqqN5K@Red>
 <aBytNdRyd5Ywh1Pq@gondor.apana.org.au>
 <aBy06xyzh5kKC48a@Red>
 <aB10PqZNk0L-ly70@gondor.apana.org.au>
 <aB24nSeEJKtP1bO_@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aB24nSeEJKtP1bO_@gondor.apana.org.au>

Le Fri, May 09, 2025 at 04:11:09PM +0800, Herbert Xu a écrit :
> On Fri, May 09, 2025 at 11:19:26AM +0800, Herbert Xu wrote:
> >
> > I wonder if the skcipher code is corrupting the ahash state when
> > run concurrently (and chained together).
> 
> Please try this patch to see if the hashes can work without
> the skciphers.
> 

Hello

Got http://kernel.montjoie.ovh/478064.log

Thanks
Regards
