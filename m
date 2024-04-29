Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B16128362
	for <regressions@lists.linux.dev>; Mon, 29 Apr 2024 15:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403513; cv=none; b=pdrfacuvKegH/UOBaQ2wWUCQuf3zHQSHepwWoiuW7zg3/ldTu92fkOqQ2NObQnqpU5fCYWlrDbXOlvWWe4BTKePeYBX+wBCz4+MLF0MUqN1Df6mNMebkdgytB6Psb4Aw9EXlzwFQcLGqNVb1MSqhugXZZqoQkzUnodj3KOWlmm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403513; c=relaxed/simple;
	bh=2mOGvwx0F2IpPY4iGZ/syNebrU7aiO2c7zkOquYWlm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QViWvkU70SLbhGk9zg6EthnWjeKFvFtlYmIU+kglTDpmwAu5pyW2gUhzTXbjf3nlQ6cITxq2d07e35X0u8eysbloPszCHep4TQtN4V2Ka6pfnQb+IPr+USgFe8eknvsXq7g4OP02pVBhiPyy3fm0ezuXVgOaKg28fWp1Ck2pMOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMDvNdAO; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMDvNdAO"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5726ccca4c8so2546071a12.3
        for <regressions@lists.linux.dev>; Mon, 29 Apr 2024 08:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714403510; x=1715008310; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xU/iLoQXl7tXUx6T6JsQIJsicG3iO7GQdCCzHimssM0=;
        b=iMDvNdAOY8ueQc4QnuGQz8uVXiC9QFCgl26tNr4RrmK+DIB7NJJ7BRGX1txb+gXRm4
         OCbfiCH29gyae8pLmcjbSbsEb6mMwID2satDohy46M2ogbwAHipR54n21Z+VfTRwp+ce
         U0BgR/voVUvLNJN7G9tVDADXNt3SQ73DCD9BrBvn2ZJTRQHXueucDAIxlISU7FZfedx8
         htwqNigjpZ9tNnsXNgojo0ZvcBleDwRfuDBKlwd4zMy0Ep6BLPLmN/E1umtWoSqMZo4A
         uC6PgFXTi9WntrfjbtL7Hn7jCxBe5XCfZi1Md/lJuPUpZtztai5yV2qc4XT3jsa+5lTC
         Gphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403510; x=1715008310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xU/iLoQXl7tXUx6T6JsQIJsicG3iO7GQdCCzHimssM0=;
        b=iAWbSrfWBFxBtZfkMuJGh2T5zkYWSUtiritMwZPalbSs3fY98WgexkkSJkI4e5uvt1
         QVLZCt2N5dPzLNR+kPGg4UZwfnSAEh2kKZ4h73Co4jqkL3MahIxgqvYEmou+nYzcwtQb
         1+frRfvFCa71zNQuJvRhQaS6vk576guEBGWYTN8CnBd+b0ZD2ecJ/dqvmGuJDwBAnioA
         5dvqCsFmYMIbbZ23ujcHuhg1n0DJX/6c/1a42rle/8QHeDUJl8qzvfVe5rdmErTQgGE8
         Isn5yZzpOzovmcCTz+1g2L7TRVstGxI+PCI3UB+/I46rbwqpxdK+yntvjdZQo/ZE/yWh
         qKzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSl8fw/rKM0QgV9Q6Eo7YOFJj3VHCZTI24dHUdbwj0v/SS1qdQV6EGt025CF9HdOu/HKDV669Xv0MSGgIqWgfcg6VPq8E48lrqtaE=
X-Gm-Message-State: AOJu0YxFzoV9k1VzWdHwvg87fdbBwod5KxSNQ277Rmckg8EGMZ+S+UQK
	BfRmqMDCuaJ+1YbwA/IJV8r9oO6xZgy1Bwm3SX4gi9EAt3OCT9eisEqW4gF/
X-Google-Smtp-Source: AGHT+IEhEdiaiCJzabxzHgv5ya2RGGdycN3jCTy0tJ1kx0ZZPY/5fGE7WGoJhcAGrpmB7uFA67IDWg==
X-Received: by 2002:a17:906:e2c3:b0:a54:e183:6248 with SMTP id gr3-20020a170906e2c300b00a54e1836248mr7519853ejb.0.1714403510018;
        Mon, 29 Apr 2024 08:11:50 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id wt8-20020a170906ee8800b00a55ac292b66sm10253316ejb.219.2024.04.29.08.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:11:48 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 5F51DBE2EE8; Mon, 29 Apr 2024 17:11:47 +0200 (CEST)
Date: Mon, 29 Apr 2024 17:11:47 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Paulo Alcantara <pc@manguebit.com>, regressions@lists.linux.dev,
	Steve French <stfrench@microsoft.com>, sashal@kernel.org,
	stable@vger.kernel.org, linux-cifs@vger.kernel.org
Subject: Re: [regression 6.1.80+] "CIFS: VFS: directory entry name would
 overflow frame end of buf" and invisible files under certain conditions and
 at least with noserverino mount option
Message-ID: <Zi-4s-7QSFO1OR17@eldamar.lan>
References: <ZiBCsoc0yf_I8In8@eldamar.lan>
 <cc3eea56282f4b43d0fe151a9390c512@manguebit.com>
 <ZiCoYjr79HXxiTjr@eldamar.lan>
 <29e0cbcab5be560608d1dfbfb0ccbc96@manguebit.com>
 <ZiLQG4x0m1L70ugu@eldamar.lan>
 <adfd2a680e289404140ef917cf0bd0ab@manguebit.com>
 <Zigg4RWtRfQYW1RR@eldamar.lan>
 <2024042912-unloader-slighting-c756@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024042912-unloader-slighting-c756@gregkh>

Hi,

On Mon, Apr 29, 2024 at 12:50:45PM +0200, Greg KH wrote:
> On Tue, Apr 23, 2024 at 10:58:09PM +0200, Salvatore Bonaccorso wrote:
> > Hi Paulo,
> > 
> > On Mon, Apr 22, 2024 at 12:08:53PM -0300, Paulo Alcantara wrote:
> > > Salvatore Bonaccorso <carnil@debian.org> writes:
> > > 
> > > > I'm still failing to provide you a recipe with a minimal as possible
> > > > setup, but with the instance I was able to reproduce the issue the
> > > > regression seems gone with cherry-picking 35235e19b393 ("cifs: Replace
> > > > remaining 1-element arrays") .
> > > 
> > > It's OK, no problem.  Could you please provide the backport to stable
> > > team?
> > 
> > Sure, here it is. Greg or Sasha is it ok to pick that up for the 6.1.y
> > queues?
> 
> Glad to, for some reason I thought this caused problems, but if it
> passes your testing, great!  I'll go queue it up now, thanks.

Thanks! Unfortunately I'm not having a good test(case/suite) for this
myself for such cases. All issues recently forwarded as regressions in
the 6.1.y series were unfortunately only uncovered by Debian users
once we did release the version :(. Hopefully this will "calm down"
now.

Thanks to all of you, for your work!

Regards,
Salvatore
