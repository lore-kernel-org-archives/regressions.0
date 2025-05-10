Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D35213237
	for <regressions@lists.linux.dev>; Sat, 10 May 2025 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746875669; cv=none; b=Fh9IuY7UZxP9w7BAxN+z3ei0zDBZAl/68A1uvW4MTRhDJ/1R71RewNgFdkMZRzXvbqNeg2As0UvsdETTVMSq6gd8EFiO7lCuZkKoDiVfgGHijSKb0aQKp7FL/rLJy8bHw2EYfZQFRqQdKnHcuDrEKVudG74eme8Z6P9RtM7YXu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746875669; c=relaxed/simple;
	bh=JVuJZLECwi+3pAQ/GOlAuA3lFmiRAQSy82wsmLkDmag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXhUpkbt9GAUNQnVR+4ztiQqe3nnMJvum1wjCDFZ151wMDcQlc8eJvklmGVwGFbXqqmbj2Byv+0yStmd51YoakY7sEDVQ0gQjmOaJFPdBbWJ6p9qoQAgNasrUI9ufWX7Pdp97da7542UEM2EpbAJR7oLivCe/ldPeitpkP5MANM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNsIkz2R; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNsIkz2R"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so28858435e9.1
        for <regressions@lists.linux.dev>; Sat, 10 May 2025 04:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746875665; x=1747480465; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4vTd4IdGZfOB83BlB3xpUMaXO+byPkXDIaPQinyrIOc=;
        b=MNsIkz2R0X5GlobgjWrdv74Vp6jucof9a0W4EeoHYZwyMwfKaP+0CalJZi82CIghAF
         s/qHQFjGcRo6uPcpU+KyC84746GbQ8lNrxYEv1Eoz6b3txTASvnCoMJyMIZDcHG+Rmg9
         i0n22o9tMqqJeEHuhMj6sG0Sk9pZrjNBXeJ5lazhPSEBwj44NbSaj8O4crDcLKTDwmho
         J19q4MuHTr3AL9YIYUfR9nQoG56ytxbGi5nzCGC1sFd+BCTFq4J/wEGoYG4fQStmtlSG
         EdBeADlEsJVd5hx/NcstnkwEz5KBDgi/vQE1JS+N5fQ1N9mLHBxxlrvuFSVLZtzBlV4R
         VbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746875665; x=1747480465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vTd4IdGZfOB83BlB3xpUMaXO+byPkXDIaPQinyrIOc=;
        b=EKd7/dJ0DEnRsn7KVUked8A/vKBwSflu7yYQqV9z+IXa5GDbUKH1yDNK7mE/ntDfkw
         jI0ooO2aE99/wFgrYkYRuuJ6Bn0r+I7qgc0IgLUm1tCEKf0oLfzcqI3Oucm+chWPpvDw
         Jwfm5Cxmld9vXCFriIICJTiJMTzk+r/BSgcm1U4R6soVcDIjQFgoUiHVLXauBd2UUD4X
         jqZUZEBHmpV/9EYASfrSohB1HoDUs3UAomjXZav29/GScOKD5Hdt6fmMJOPC9HvkBKnT
         waVHy5U0YoVaQhWsQiRjW2aPrcQdF4G4gjvarQHyfCKasTusSyGoMuUk20tLiHc/nofz
         hhkg==
X-Forwarded-Encrypted: i=1; AJvYcCUPWt/FR4+SopdFJd3yzaM+5mhbU54fWo5OtPJbEuRdw3IkMJpoORaPFew0uV5P88sK59rBmKoM5sct+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTC8O9vIuCCR4OaEsPMjzZGtg2rJIiCibGSqlqpQ8uQxTI+I7H
	i5dgZqCZHXE/DJHWtcgG5V/Gh1WpwoYuC0HnjBVx32JxRpSUyD9u
X-Gm-Gg: ASbGncsfQSscXDBJBnsrL4dvgqo0RzYpDtLUwWSOnmezp6xBMqFmDjaa/5s8KAn6Gz4
	QqRnDXrYtE/odBPsO/8O7DVLOruWDTTsF8zl9KOgpwq+58Z/0GABGqdCEVn5GM97hS7EJI7aPI8
	f/tl0xVPWIlhO0fyxBkPNbVzWD9MkJsa1HyVQa43chDqMSe4a15UbW3MksJDYeS0xzD6C1jUCX4
	/RGZYLP4xBvZRqwGHE0ktcydKFJteOd/Bc+utFSazFiOY+7Wfh9VkY6RF7gvVABnyml36Q6vHoP
	iX4ISkc/Ku+1oJGuzH5BcVHxP82XBP6mWmpUn38pFUv2Kfzv9qU=
X-Google-Smtp-Source: AGHT+IEgW6PcLowUSY6cHDwCiuTzQxA1TVJYACarfPwPu1Vm8zE5kVz6VaDYg7EAeFbWII/CCQGalw==
X-Received: by 2002:a05:600c:608c:b0:43c:e70d:450c with SMTP id 5b1f17b1804b1-442d6dbbd6cmr56265225e9.22.1746875664772;
        Sat, 10 May 2025 04:14:24 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442cd32835dsm102727445e9.6.2025.05.10.04.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 04:14:24 -0700 (PDT)
Date: Sat, 10 May 2025 13:14:22 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Klaus Kudielka <klaus.kudielka@gmail.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>,
	Romain Perier <romain.perier@gmail.com>
Subject: Re: [PATCH] crypto: marvell/cesa - Avoid empty transfer descriptor
Message-ID: <aB81Dh83fZoKa2st@Red>
References: <Zw9AsgqKHJfySScx@gondor.apana.org.au>
 <aBoMSHEMYj6FbH8o@gondor.apana.org.au>
 <aBsdTJUAcQgW4ink@gondor.apana.org.au>
 <aBt5Mxq1MeefwXGJ@Red>
 <aBw-C_krkNsIoPlT@gondor.apana.org.au>
 <aBw_iC_4okpiKglQ@gondor.apana.org.au>
 <dd55ba91a5aebce0e643cab5d57e4c87a006600f.camel@gmail.com>
 <aB8W4iuvjvAZSJoc@gondor.apana.org.au>
 <41680c5d41ed568e8c65451843e3ff212fd340c4.camel@gmail.com>
 <aB8t1ZTVBexqGlcm@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aB8t1ZTVBexqGlcm@gondor.apana.org.au>

Le Sat, May 10, 2025 at 06:43:33PM +0800, Herbert Xu a écrit :
> On Sat, May 10, 2025 at 11:38:16AM +0200, Klaus Kudielka wrote:
> >
> > Patch applied on top.
> > On the first attempt all self-tests passed, but on the second and third unfortunately not.
> 
> This patch fixes the extra zero-length TDMA descriptor, which even
> if it doesn't fix the problem, is obviously the right thing to do.
> 

Hello

I have tried all your cumulated patchs and got: http://kernel.montjoie.ovh/478197.log

This is the git diff result to be sure I didnt miss a patch: http://kernel.montjoie.ovh/cesa.debug.diff

Regards
