Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BDF192B74
	for <regressions@lists.linux.dev>; Sun, 27 Apr 2025 19:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745781108; cv=none; b=LOBvi8QfR1oI23R4d1GZC7FKZWg4TZ765NtxYBTYiXtWSE4PZ4dGs5+02rlS52JgeaNFaM3g8PFyZJ2NSocb8ghZbqVa+yxpV9EcKfEI/hpHnTKFO0rEnPCFxu+L7Fk6/qdfdMrBo5QWf4okezr2k0wzzIM2YKzlSRM2TU7ZRm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745781108; c=relaxed/simple;
	bh=ha+CD/QWZdr/qEctAEVQgT/2LNKeTiY01reuxChdQPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsO8thC9+MHKr9uaxGJWubpbda/z3QyCTBi+c0X2p/KQDRl1I3ZG5L5ONASm3IouZj4Jkyi0w49cYSqUoSp1OTRlEPwAbQw4SvEEaisSWORm1YYCvYlTmRKtBDRAfUz1LIxGJubag6oq8kKxFrh1ZBz9Hv7veMiO4nSoQ78jKnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcMfur/b; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcMfur/b"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af59c920d32so2560944a12.0
        for <regressions@lists.linux.dev>; Sun, 27 Apr 2025 12:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745781106; x=1746385906; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xq9WjFUkY/jJtaOUyR07QLAr3NdXDaHUkVXWwbHPAjg=;
        b=DcMfur/bjgTagsmMX0ITNlSTVba2AT4CMRTbqoSu3fLYxaDbXM33Uw5VF7J6QAqZJ+
         ZRkmNwGDvTHJChFNjIebUfq6hNGukvRX4G53M+EjpsbXahmkxZmGYfUH0UDzPaMusk5W
         uhqKhczsMOFfDpr0IymuGE82WKyxKJZdpDYGx2/Z9lTTFH2kXYDU5+auphA9vWipIcSN
         OtVNxWZq3NBnUom/d9wRj/xSanowleLHxKJkxxYDeDAX0CSlksiiJzSbU0nm7tyHYnsR
         4f0I0L23pqqazvCKi4NNdUn3ut0oMKOUPx2GMaIyw+L89MdLnxzItU/7KyWWX8iqnD09
         iexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745781106; x=1746385906;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq9WjFUkY/jJtaOUyR07QLAr3NdXDaHUkVXWwbHPAjg=;
        b=NQ9DzqbR6g+J6l6rdVQwzPwdqMXCTKjdZHwqxVsDkfa+9K4GBW551QtCty/BaXdMK3
         vUCNDl9wbc+Tb9tnJzPgdtj8XEIRXeI9SGp9akUF9fIGfcYEHUK8vsViuOKZYM93tq/M
         rRWgkQxkz6n0w7Di8fMETGxAOzH1xk0ISTULkvZJqFEZHwYhKJuvNDrpoygk4rA5VZ4T
         IzgEUOtlkOJTOE+akY6x1lfWlkIDDdVTxV+BzqbahjX532b7LC8i4snbM5Ib+ZOIvsYS
         wx+PTc4Ati/SUizRuXroQs1t91LxdZieLgkVddWVdq+3sdZJwcbCvFveslhD7Vu1szhV
         TV8g==
X-Forwarded-Encrypted: i=1; AJvYcCUXnp6ZncnGIM+LDWU+tduRthBoqy4+/rjHBL4zBkBV5I7dXw+s5YPgCua4ETKihwN1P1mzMixof6AtEg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8N7wfd2NvaQE4yY3MIFvdG09DIwVKXlazxNSvtbZHXTOWz4I7
	P+nsKqqLyBd4k0fcILcj6SPzPF+XXqY6Ujr63upGgpIrsDfiKNBu
X-Gm-Gg: ASbGncuwsDJqlc4mbTyeuPJzhsXvCTa3iIlH50zF4iY+4SZKRkctCjeJp3tJw9nTof/
	foHaWLJhCCuKs14sYDhLmcYh4YwkmzoOAm+LSf8fl8okuBpf4GJHiNfkszU6hweDe/IEZqqyxsl
	DKeDwkp/xcR9Zx4I3mfGVlo2kvcDhoHN38JCdYXZcUvMY8aTjN2uQ+de7AwhkmsUa9fVfSPEmed
	m8g8C13Z5SeyXna+KPIU8l4TssmRATiQLFGegFrn2Z+8dUWv6pcmNVBooPxT1Evq8VDm3cNgLqq
	eLuS/eefViEEBvI5BH+tjgVTee+IQmF952QkCc0T4tR0W9s=
X-Google-Smtp-Source: AGHT+IHWw4FLxxfNF5W3Sze3kOT43PHacUq2v0g0M9nT54cm3v8n2ibQ9X8LDKKBv52lTDeX2ALI4w==
X-Received: by 2002:a17:903:184:b0:223:3630:cd32 with SMTP id d9443c01a7336-22dbf73e790mr143727105ad.53.1745781106559;
        Sun, 27 Apr 2025 12:11:46 -0700 (PDT)
Received: from localhost ([2601:647:6881:9060:19f0:8ab0:4510:f0a3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76c96sm67142215ad.38.2025.04.27.12.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 12:11:46 -0700 (PDT)
Date: Sun, 27 Apr 2025 12:11:45 -0700
From: Cong Wang <xiyou.wangcong@gmail.com>
To: "Alan J. Wylie" <alan@wylie.me.uk>
Cc: Holger =?iso-8859-1?Q?Hoffst=E4tte?= <holger@applied-asynchrony.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>, regressions@lists.linux.dev,
	Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Octavian Purdila <tavip@google.com>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	stable@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [REGRESSION] 6.14.3 panic - kernel NULL pointer dereference in
 htb_dequeue
Message-ID: <aA6BcLENWhE4pQCa@pop-os.localdomain>
References: <89301960-1758-5b2e-6d91-81ef06843e14@applied-asynchrony.com>
 <20250421210927.50d6a355@frodo.int.wylie.me.uk>
 <20250422175145.1cb0bd98@frodo.int.wylie.me.uk>
 <4e2a6522-d455-f0ce-c77d-b430c3047d7c@applied-asynchrony.com>
 <aAf/K7F9TmCJIT+N@pop-os.localdomain>
 <20250422214716.5e181523@frodo.int.wylie.me.uk>
 <aAgO59L0ccXl6kUs@pop-os.localdomain>
 <20250423105131.7ab46a47@frodo.int.wylie.me.uk>
 <aAlAakEUu4XSEdXF@pop-os.localdomain>
 <20250424135331.02511131@frodo.int.wylie.me.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424135331.02511131@frodo.int.wylie.me.uk>

Hi Alan,

On Thu, Apr 24, 2025 at 01:53:31PM +0100, Alan J. Wylie wrote:
> > On Tue, Apr 22, 2025 at 07:20:24PM +0200, Holger Hoffstätte wrote:
> 
> > Meanwhile, if you could provide a reliable (and ideally minimum)
> > reproducer, it would help me a lot to debug.
> 
> I've found a reproducer. Below is a stripped down version of the shell script
> that I posted in my initial report.
> 
> Running this in a 1 second loop is enough to cause the panic very quickly.
> 
> It seems a bit of network traffic is needed, too.
> 

I just tried your reproducer in my VM since I don't have pppoe setup,
after running ping flood (ping -f) bidirectionally for ~10 minutes, I
still didn't get any warning or crash.

I also tried to reduce the bandwidth limit you set in your script to get
traffic throttled, still no crash/warning.

Note, I just used the latest -net, without applying any extra patch.

Thanks!
