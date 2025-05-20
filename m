Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF8F1A2396
	for <regressions@lists.linux.dev>; Tue, 20 May 2025 07:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725371; cv=none; b=WAZL6N3se2LtbkWAqwC/Ecuy3COkiLfC/7hcvdDygSpGvfOiwELpQ3EjP0C5hDh9tZM6bRTAaxU99yMV53DzLWtnWF1IKW77Uh4VKGBToOKXVsXHbhVuqVlj+ldY6mBfJchInkgqKIpNX2zVxzKuGGu6cyOm0tcug8G7SZfxkbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725371; c=relaxed/simple;
	bh=64nSeznQ/80kI+TqqvrHQheS4AVHuJSHiUdaas+H0vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I96OM57U7npA2eqOFahsRaILiSCSHfnAQm5yFhqmGolauqSTN5jr7DCoCLb9Vv4IFagNXO9d3Ja0IYS9CST/nwzJiaLsTYsptu+5AyHlJBoQfRuoKyPYRPH3rXVNvmJgyoCWP/HGN1eQWUj8FJQbzrU2pCcj3a079weyZ1x8xmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAr9ztB8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAr9ztB8"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6015f8d4b7dso6833720a12.1
        for <regressions@lists.linux.dev>; Tue, 20 May 2025 00:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747725368; x=1748330168; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDIRhWdKVMpUu59ujm96cXSr76HpSQ4ZrAeN1Auu11g=;
        b=aAr9ztB87scOfWzf5mMvVJDM+HsreksNT+vVQIEElhXTWot1wedShzQ4tLFstJ7Pfx
         2SuWwwwzuPI9nyn3H6n9QCZ3Ow/50Fa6IlpwfveBKLSuOaKCqBtOIsr/e0uC4wDzesuJ
         fH8ZouLLWpUhgWAiP63Nz5DBK8eweRCwjEVZrA5bWlRehXk3IkcAXTkS9RsAkLG/rNTK
         zsae+u83niAXE9IbCNMZ380XKaJJFCH+IkJsYXt1kHFDjxGoESY8fe7+qjUZyZS9yqUD
         KVvnJcdB9MxepNv7VCLFivTyNdnW5xa6Vm7en/eUKQzmBSZMt/MCaRJq4fXaVATxDsKr
         MRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747725368; x=1748330168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDIRhWdKVMpUu59ujm96cXSr76HpSQ4ZrAeN1Auu11g=;
        b=GNGfvFt6mw8jTEq7lWDrHhSFXtd52EDKODtH5vDDJWkqdlKjbPKl3NN1RdvTSjK8nV
         ye+bPa2TQYZG8q3NYVTCPTm1zvTao4iKtQW58teiUBfug7dVBT3au/PAQrm55wtF/T1t
         MWflMU22BbgaSni8svlkY7SWht3Imd0zuhfzluKRNCF3MwrV/NOkN/Fu6A2Z272L2Bxf
         S27FASITYWG1kB+mPlGXPKtVdUqOCAbPoypCEOA4yOrPxvkz8vZOtaXoIVzF/pJSeN/d
         AWhi0Z24em5xYBVcAsnltadYc9cZx9AEgvdnALoLO6//FRgfXZ5RSNm5Hb/loP+HkrBN
         Ys9A==
X-Forwarded-Encrypted: i=1; AJvYcCUWrdHcSV/EAaXjqpPuFaZrvIwtD+pvdFWw+foorj5oKjycNUqZu78Ruvnl3RqjoprCCvA0TJnWSd1UDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKU5+2uJEgyOL2fVX44B380NtFCtceVhwrlszlgcX1WQqERCwq
	A5rDoUmmmIHT7RE7mdoT9w3F5h1RsHSGvdgQob13CUMXljT51+EtZ4m9
X-Gm-Gg: ASbGncuPOYjaqdrAVgshuGaaGRkE7y6CLiR1fvIRZJLHg+9yoQC36U8eZpb8X/74LUn
	7p2i5dkQt9teU3SiCXm9g9wronvcGSJaD+JxVrBdFe7iede2nIjPuig4Cvab6zEw3kJP2fUSlhj
	JkRHsP72Bhh5yfWIW75EWOo93P2pvvN8xMaiL9mrWxjQyDUzRz1Vk/mycHHFu1omPm3mCX4JWYa
	5Ivn8MmUK5nEQ40CH14PAVUDFS7WFExW5zeCjUO28lPTju9kqd8C2xb4J70KiJGN8gziDbfuFXB
	Dnuk6LDfno7fo/X5BGMtf93+SHfVOTjB4P2QTQAdT36ExX0T9p+AJe1+00p7szdXiy10jP5xMTc
	ca1A5HHEi
X-Google-Smtp-Source: AGHT+IHVOlAW6lgxwfSXJ2mOzRf4cxrSKL/D38SFAUPj/n/z1oZNclDU9+lGnv4dlctwse3NYQjUmA==
X-Received: by 2002:a17:907:1b0f:b0:ad5:5293:f236 with SMTP id a640c23a62f3a-ad55293f282mr1046955066b.3.1747725368115;
        Tue, 20 May 2025 00:16:08 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4c9e62sm685303466b.155.2025.05.20.00.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 00:16:06 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 7942BBE2DE0; Tue, 20 May 2025 09:16:05 +0200 (CEST)
Date: Tue, 20 May 2025 09:16:05 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Christian Hesse <list@eworm.de>
Cc: Roland Clobus <rclobus@rclobus.nl>, Lizhi Xu <lizhi.xu@windriver.com>,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	1106070@bugs.debian.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [6.12.y regression] loosetup: failed to set up loop device:
 Invalid argument after 184b147b9f7f ("loop: Add sanity check for
 read/write_iter")
Message-ID: <aCwsNSEoxfs4DOvi@eldamar.lan>
References: <3a333f27-6810-4313-8910-485df652e897@rclobus.nl>
 <aCwZy6leWNvr7EMd@eldamar.lan>
 <20250520083438.295e415a@leda.eworm.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520083438.295e415a@leda.eworm.net>

H Christian,

On Tue, May 20, 2025 at 08:34:38AM +0200, Christian Hesse wrote:
> Salvatore Bonaccorso <carnil@debian.org> on Tue, 2025/05/20 07:57:
> > In Debian Roland Clobus reported a regression with setting up loop
> > devices from a backing squashfs file lying on read-only mounted target
> > directory from a iso.
> > 
> > The original report is at:
> > https://bugs.debian.org/1106070
> 
> We are suffering the same for Arch Linux. Already reported here:
> 
> https://lore.kernel.org/all/20250519175640.2fcac001@leda.eworm.net/

Sorry missed that one! Ack, so let's continue in that thread (worth
looping in the regressions list though?)

Regards,
Salvatore
