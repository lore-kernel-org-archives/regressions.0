Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2BB1F9F51
	for <regressions@lists.linux.dev>; Sun, 25 May 2025 17:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748193528; cv=none; b=JhyidD3yabsjux2I19ivIiFKePq3rCr1ycsFQepMCbmxw/c3cVqjVabKQ7DIYBrw4KRkKHtKHrtbwxbmij64RIIkVJjzQJH7Sx2VBX4Xbj8w5FOag6R7BTrvb4dQzCtuUfok2cKigiAPl7tyK1tnJeYQdlzIbm6FT724SEA24Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748193528; c=relaxed/simple;
	bh=COq+of+8BuZtfNXyiUexIBrj58KJja2RnZzseXsk28Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BO9ocCmnl2jGX+zY6LB2cnacyh1My/jryd967J4+yE5svdaJexOBZWQKE/iCe+mbRxzOewrmBtaP/MGN2LNHjnIB1iMWHE4ehy4686VwufiSHpZmkV9f+wa/SU0ESCfcQXe99GKp5My7UqwcKpMgaONnScQiKlaCyHu+Q2CEjGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrckEbxS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrckEbxS"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a375d758a0so1350463f8f.0
        for <regressions@lists.linux.dev>; Sun, 25 May 2025 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748193524; x=1748798324; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQtkFrAhszohoQiv0Q39d8Ie0LTEmozRH+F/ZmwBlXc=;
        b=lrckEbxSY4i87vOyKyVn51uD+VUDgpxwlzzi/YZoztk9ftU6IqhpkplcmDibIixIID
         iQz5tWhskWqpf4PVxnyLYaXKHHnxNLeH01RDVPnC/rdZ+Lzwb81fU0IUyb+SQzJnQH8N
         E/PD3NYiM5xQ7hDvzSQ7olwigbEfv6mF6NyOpO6oQDv4Wx0Y+97B6NWQeUNdmePuFbup
         9AI9cabT1vQH3A1Cq0T0QEcewhd2AK7TT8QgInHA5YsChbg/nTKx6/xF9+44/93QWHxu
         TmcdtKrTcG1khUY5nHnU9iTXxZ2+ljGfKHbmP2f9NaAXu8PjGVi6lJtIdOoYK/454PBr
         9fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748193524; x=1748798324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQtkFrAhszohoQiv0Q39d8Ie0LTEmozRH+F/ZmwBlXc=;
        b=TZJAE9Zt6HJQHHPDPsGNjRV44I/ZBtibtlgl4Aslmu7hswB9DuMmFnvO5rYhXnjCNU
         q2VqHHR/OupfS5N3SnGJSGfxIrXm+we3G06cVHflTwGpH0NMcNbCcZcV/b01fMrXKxfI
         iXue2dlHB/shR21OZ7p0uL9bd8iGX1oZ6xiPmif3362GtbAGyHw3gs0yWIUec+Uz+08N
         peytbfOmIZlABtCd3xqqDiUEFQEawoN+xuZ1yfnSD4oKt51XG0ehDTYYQkqHmDN1f4kG
         Ba42Ck4xfMlJxGG0pOvf6thOxHGbrDwLwemVHuD42Vz5gb3PiqOJXZRqhkpfPeg32G1V
         ZbwA==
X-Forwarded-Encrypted: i=1; AJvYcCUTdQQLQWRdFDFNv5yizgc6dbtoHtT4f/9OerqShlDoVRalurGarKpBheCr4fzDdQj735z673L/hYHhgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVzWXmGrQ9drMi+7X3RlEQ/wWKLFI5yrY3F8VoTVpxCMpXAPXx
	0ZUQOtP56beLFwLJKWsVMcUwvE9q6ivsjXlrHt0dYRXwuwVtfz+V9wU7
X-Gm-Gg: ASbGncuoCBDsDR56A/lovPIKB/1qm6r7GVGtZHHPDc0WrtA9x5+9TuBqpfMOhSIjWrH
	Jstoodwgc+sDoOWRgnRKLbEs9UoQm7hI05ChRmzL9TYw7p0/5uyBgctybAMKF+md/5ctJGv+gKD
	uc9z5qoMymdKxNM4bArrarc4vb7PJfFhrmIoVcUxOLk75qT5kWCw0YSUOqSuA9NAjCQ6rCGgo0m
	ccPseSFSb+Z49jdBT+YbghmJchL8iom5yYwehQl0sk9pHN0iKfQn4m1vK4pdbgL44itDwNPsxSz
	ecg7FZ+HoRv+NP6OfrCMMCeBJkZ4CUdwkb0ygVEu4vuIoB6DDMaCUHrL3Wfu8NdajZaoGXgizTM
	0TC5/zXXYrYnRXQ==
X-Google-Smtp-Source: AGHT+IEE2q/fVFjpifs7t/ga1WjBiQLJh3mtGrvBsi7/40oxJN2TB8Sed6XHs3XOjpIAZTnmZ4VEEA==
X-Received: by 2002:a05:6000:4203:b0:3a4:79e8:d1d8 with SMTP id ffacd0b85a97d-3a4cb0eaf18mr4926116f8f.0.1748193524317;
        Sun, 25 May 2025 10:18:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f0556bsm209947455e9.12.2025.05.25.10.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 10:18:44 -0700 (PDT)
Date: Sun, 25 May 2025 18:18:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Kent Overstreet" <kent.overstreet@linux.dev>, "Naresh Kamboju"
 <naresh.kamboju@linaro.org>, linux-bcache@vger.kernel.org, "open list"
 <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, "Linux
 Regressions" <regressions@lists.linux.dev>, "Dan Carpenter"
 <dan.carpenter@linaro.org>, "Anders Roxell" <anders.roxell@linaro.org>
Subject: Re: riscv gcc-13 allyesconfig error the frame size of 2064 bytes is
 larger than 2048 bytes [-Werror=frame-larger-than=]
Message-ID: <20250525181842.2e2c47fd@pumpkin>
In-Reply-To: <692e313d-ea31-45c0-8c66-36b25c9d955d@app.fastmail.com>
References: <CA+G9fYv08Rbg4f8ZyoZC9qseKdRygy8y86qFvts5D=BoJg888g@mail.gmail.com>
	<6tgxbull5sqlxbpiw3jafxtio2a3kc53yh27td4g2otb6kae5t@lr6wjawp6vfa>
	<CA+G9fYsjBXvm9NNKRbVo_7heX1537K8yOjH7OaSEQhGRmkLvgA@mail.gmail.com>
	<6247de76-d1f5-4357-83bd-4dd9268f44aa@app.fastmail.com>
	<7tsvzu2mubrpclr75yezqj7ncuzebpsgqskbehhjy6gll73rez@5cj7griclubx>
	<566aefc9-7cad-4eb8-8eb0-8640d745efa2@app.fastmail.com>
	<hplrd5gufo2feylgs4ieufticwemeteaaoilo2jllgauclua2c@o4erpizekm5y>
	<692e313d-ea31-45c0-8c66-36b25c9d955d@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 May 2025 20:01:33 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Fri, May 23, 2025, at 19:11, Kent Overstreet wrote:
> > On Fri, May 23, 2025 at 05:17:15PM +0200, Arnd Bergmann wrote:  
> >> 
> >> - KASAN_STACK adds extra redzones for each variable
> >> - KASAN_STACK further prevents stack slots from getting
> >>   reused inside one function, in order to better pinpoint
> >>   which instance caused problems like out-of-scope access
> >> - passing structures by value causes them to be put on
> >>   the stack on some architectures, even when the structure
> >>   size is only one or two registers  
> >
> > We mainly do this with bkey_s_c, which is just two words: on x86_64,
> > that gets passed in registers. Is riscv different?  
> 
> Not sure, I think it's mostly older ABIs that are limited,
> either not passing structures in registers at all, or only
> possibly one but not two of them.
> 
> >> - sanitizers turn off optimizations that lead to better
> >>   stack usage
> >> - in some cases, the missed optimization ends up causing
> >>   local variables to get spilled to the stack many times
> >>   because of a combination of all the above.  
> >
> > Yeesh.
> >
> > I suspect we should be running with a larger stack when the sanitizers
> > are running, and perhaps tweak the warnings accordingly. I did a bunch
> > of stack usage work after I found a kmsan build was blowing out the
> > stack, but then running with max stack usage tracing enabled showed it
> > to be a largely non issue on non-sanitizer builds, IIRC.  
> 
> Enabling KASAN does double the available stack space. However, I don't
> think we should use that as an excuse to raise the per-function
> warning limit, because
> 
>  - the majority of all function stacks do not grow that much when
>    sanitizers are enabled
>  - allmodconfig enables KASAN and should still catch mistakes
>    where a driver accidentally puts a large structure on the stack

That is rather annoying when you want to look at the generated code :-(

>  - 2KB on 64-bit targes is a really large limit. At some point
>    in the past I had a series that lowered the limit to 1536 byte
>    for 64-bit targets, but I never managed to get all the changes
>    merged.

I've a cunning plan to do a proper static analysis of stack usage.
It is a 'simple' matter of getting objtool to output all calls with
the stack offset.
Indirect calls need the function hashes from fine-ibt, but also need
clang to support 'hash seeds' to disambiguate all the void (*)(void *)
functions.
That'll first barf at all recursion, and then, I expect, show a massive
stack use inside snprintf() in some error path.

Just need a big stack of 'round tuits'.

	David

>   
> 
>      Arnd
> 

