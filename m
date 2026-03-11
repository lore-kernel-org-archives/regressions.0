Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCFB35F173
	for <regressions@lists.linux.dev>; Wed, 11 Mar 2026 16:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245553; cv=none; b=dza2KA+YohThoOkerqamh/BZ7md6O1yIkrATmD4iMLP5rcQK0QLO0kpqfDpk23xYPsbsXIpmUB9eUlIC9dxbrQP1xWRe2Z0gqr5hfnxvlXekDCoo4+7xtBcPQdKkUlo66WxZowYvK7dqdUEli+S5kKcXVjhJmhPdcaM/ATaCFuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245553; c=relaxed/simple;
	bh=zXYXilJ1hbpmx1D0Zw4urqw9JRsY74/33FC8/lHVvyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxxxYquUBWQFvaJZoot4WtTOzaic1EBn19LCEoaHkpNz9V0syL4OyCn6aJDiS29iiTE4rNJYrTZqznrmz/+WFourxNVpDqPhoSgKMfRKXrp7AknxH/FfJfXsI+MUqZ9qegl5cRPX+PGA8AQQsh0kkLnmgH5kEDQXbcd27iKtVfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HVRfZrFS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HVRfZrFS"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso77385e9.2
        for <regressions@lists.linux.dev>; Wed, 11 Mar 2026 09:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773245550; x=1773850350; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wdb8PCOlgls8g32Eovg/NZwMsiR9gdwY/Koklz9SGq4=;
        b=HVRfZrFSxtC+35f4pmwRreV2PbvkppXgUIP8IjfoLSqSjAxYwUQGLFGsbvAbWwHJ5G
         YFn4PNC233QE0aVfvK/Zkd0TldgDTMw3Eyx4+7gacQqvKpBG7BvE3A41Jfvhny/5Fbh1
         1qiok00p7RW+dE44iQ9CFj/v+AYbpQNiAzRgjMd14Oo/s3FLEa59aW2WWWOhWYQMOiOH
         MMbzq0SJIDhJWrY6jzffPoIf6VMey2p6PjMyNbzv9vRcNp0jBd0FKFvydBiepzFnPf/X
         FkH4ZawzGJUJRcRuPhEjD5gbjLD2Qhzlsa3DW1Du2CLFVMLGv16mD+bvjW3u0cLw/ytN
         /73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245550; x=1773850350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdb8PCOlgls8g32Eovg/NZwMsiR9gdwY/Koklz9SGq4=;
        b=ZVvHfooseeSCh9uTq2Ees9yxCHzdO+gt9Hxn2QPgCDI2D202ofrkhpTl28hEelOkRX
         5hfXPx93ocPTnWtYYj4vj2u7vFIwsZAf9OP7oWXlm+m7jiZGvI8uWLFP99f+zMvtb+Xp
         XAlYBkzTWYHh8vF0IuIWrIwHBQC609RbJPEzlb+qm/NZSaC6qDTHLEWuHSOddkSStAoo
         YI8+Q9YuuZG2v6qkOb5ZP6O6ZM+t231+WLIWIAdMNUNI1pavsSUGSpFDxI6m2XaqGxpE
         RkMGQqA21uunAbL5DyzwuJaINTOtbw/KRVUgQ1Wjmrl/em3pvDDwSFyh7zsBdRM0AOlw
         Bm8w==
X-Forwarded-Encrypted: i=1; AJvYcCW/PdrddvZKSLKINiyZR1uUUu1aL80intzvzdbcIA/iIB74FgQhyN68Py40cWD5rfTXvfxib8Uniygogw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyqcb/zsf4j1CCvudqPnR+qYHxuvf9NVuoxgF8NCSbw/7JZOJ9T
	/EPLWXpy85gzoMmZkr6att5w7F6Yh0S1iN5/fVODtZ79G30LNRRkKe48qoK8T/QOMWQ=
X-Gm-Gg: ATEYQzyBQKkwdmm53vX+8AaWNHatTEswsf7ZsX7C6tJ0jr3ZyPFueVaoDpYhP4IEgs+
	05DFz5+lHuHr//ESJEdNndHnsr1UwTS2n0NaK+YBGwbqlg1++d8HStfc5fpH1QDuAkdj2+tzzxS
	uvxUbTPdgKxtI9cOmbOIKxjDWM6V6Q/h+LAxDTj/JTfASNvj98Q19Y8cNzcGpNna90tAlLikPL8
	m9HHpX2nh7zsqzQ4VX8kuryQAIMWTqM31ABEWiy+PqgVe4NL2WkQ1EQt68hFBmsIPYpWxKxTTQ5
	zHPaQDKjU2IICYcwi995v4fQFB68yZy2oCr4AaFRASndV9go+oJi/vx81axKG6xljzHoEy26snr
	L/zWDvD6ftDVjHhp9BVhSFTMIcAtLo55Oqjr5EW16P+W8fV8PFIFtMiRF9nSF5rKGEjE8Q0jYQo
	FBBTbI/kMyPXwTxJVPpTtl/2ZeKc39yJApq0JAu5ts4A/PZuQzlPdzZrU=
X-Received: by 2002:a05:600c:8715:b0:485:3f1c:d8a1 with SMTP id 5b1f17b1804b1-4854b0b327fmr55640975e9.9.1773245550008;
        Wed, 11 Mar 2026 09:12:30 -0700 (PDT)
Received: from precision.tail0b5424.ts.net ([2804:7f0:6402:b103:6a0a:3e1c:778a:5cc7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128e7c1780bsm3380311c88.7.2026.03.11.09.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:12:29 -0700 (PDT)
Date: Wed, 11 Mar 2026 13:12:25 -0300
From: Henrique Carvalho <henrique.carvalho@suse.com>
To: "Dr. Thomas Orgis" <thomas.orgis@uni-hamburg.de>
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [REGRESSION] failure to reconnect on SMB server restart with
 custom TCP port (not 445): Host is down (at least since 6.6.95)
Message-ID: <lbexcljami5n73cz7oevuarmcvwbchtolcvlx27w376lparasj@kcfy45dkgt7g>
References: <20260310235642.6d9798f4@plasteblaster>
 <c66p7dr6vlujvnwczbnrmqx7monkdgdnm4rwewm76aibn7jza3@d3uik74dei72>
 <20260311091653.358b213a@plasteblaster>
 <20260311094836.5ba141a3@plasteblaster>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311094836.5ba141a3@plasteblaster>

On Wed, Mar 11, 2026 at 09:48:36AM +0100, Dr. Thomas Orgis wrote:
> Am Wed, 11 Mar 2026 09:16:53 +0100
> schrieb "Dr. Thomas Orgis" <thomas.orgis@uni-hamburg.de>:
> 
> > Do you need a confirmation with 7.0.0-rc3? I guess the picture is clear
> > enough as-is. I've started a build and can give a short follow-up later.
> 
> I can confirm that the unmodified patch works with 7.0.0-rc3 in my
> setup.
>

Thank you, Dr. Thomas, for testing this and confirming the fix works.

Can we add your "Tested-by: Dr. Thomas Orgis <thomas.orgis@uni-hamburg.de>" ?

-- 
Henrique
SUSE Labs
