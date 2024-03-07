Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EF3138497
	for <regressions@lists.linux.dev>; Thu,  7 Mar 2024 21:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709847176; cv=none; b=rGD8OZMpuStRXpt9LGrZbpDQGl34mgIbIkSq/GAta7GfwxDjMxVspRrHbT3sR9XAHjWxdCZOTWbwODDMPvS1CimIXO2buJ+15D1PYNfI8W19GLRwZFOeyuZs7A2KofqrvGNg3L9095cP/8UmrwrIoTC/sQXgiPE68t5bY1GgXc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709847176; c=relaxed/simple;
	bh=T1acbK4syDy12qynlLt3cHonJ2RsscIuuNF0FA+iwB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9/jaDVd5v9C9UlXppOg4h59eltrHFvFdNzkxDdNwbhZc9041n/lCnbBm5bL6UpKW7mp8ASvfBEu7rw8dzfpDJs7ZHckiso7THg4H0y1y+M3yy56X6gf1/H28TZDVf7t3wRqBNa4uIKnCHNxY6xvYCaMUQUitRVZPDKS0Q6EO+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwCfeFqX; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwCfeFqX"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d26227d508so18298261fa.2
        for <regressions@lists.linux.dev>; Thu, 07 Mar 2024 13:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709847173; x=1710451973; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsLM3ni1DoQObcnwbdIeTZvE2aHaqZB+Kv3fZAxgw7k=;
        b=mwCfeFqXMz/ZDvVm/USXCaqmh8SHea0Pj4YvxymKh8t6D1fB4JZrD+53SGfQeyRYYs
         fsyQlTm2Wh5uUygT8tUm47XGaHMQCZv3CLKMwpTaeBC2Opk+IiDwa5uze3Epm+7wssia
         TAKde02avxyXvlYjHcpYLUJn4lpg+GN9t3IBsbjWPTLS7shFkdb77LxuqQxTb51rQmPe
         pFK7LKIG14Ef8uOcTw6u39i89APty48hxUeOwM0YZYI3f819Web+Jsf7ZIr3qlfT9Ky5
         ze07ow61GVoetc3MFqb6OpuNJo/mZKJq0QqwOmNssJM2UwtZwQyHCFoikW59u1czJT36
         G70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709847173; x=1710451973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsLM3ni1DoQObcnwbdIeTZvE2aHaqZB+Kv3fZAxgw7k=;
        b=dNy3LCfOkON2RMgQt89qWvZqN5w93krpHRE5RYVt3oVlPTrke0Dm0izodCIoFmI9XX
         s17WbH0rjB6eWUFeBB8OO0XP2HTKMl1lfFhwfRv99Tz3cyxhThKnIU1iLrYwni3kZMqW
         gCgW2Hx9w+6e7c+OjdZsVqvTtaoUQ5cDUwTZB8ord0Ba4bhM2SWLZWsHa5Z7xBb03F2L
         fOOFVyXN3FZT2zo5VEwdlylM2epNGVkrnWV1zUnS1rDx5xq694p9ZZp5Aq9L1aEY9x45
         W2ai7sncqTeCoPItfQJ6SHd6+ss0R9JTCFOzw/uhuFn1KWGgWmB6y2gwoE6que94x7A9
         sfMQ==
X-Gm-Message-State: AOJu0Yxt/FHdoLPAYm4JgSlwNsk4cxDFQDzIf6+tbluJ1J/IkY/cUKri
	nJiWU4k3wxD2KA1GZWG3nGgLwhL10g+TznfAnPwBOowY0+Fu+APro8hfS3jPz4c=
X-Google-Smtp-Source: AGHT+IHVDP/rfhfesJ39r7ZJoG3nWsfYfY7twQ8eRzBQ40SS0p8G6JnivZBifvJe0eXxbZJA4aZRFw==
X-Received: by 2002:a05:651c:10d1:b0:2d2:47e0:4432 with SMTP id l17-20020a05651c10d100b002d247e04432mr2354846ljn.1.1709847167830;
        Thu, 07 Mar 2024 13:32:47 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id g3-20020a056402180300b00566ea8e9f38sm6968801edy.40.2024.03.07.13.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 13:32:47 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 78209BE2EE8; Thu,  7 Mar 2024 22:32:46 +0100 (CET)
Date: Thu, 7 Mar 2024 22:32:46 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux x86 Platform Drivers <platform-driver-x86@vger.kernel.org>,
	Linux Stable <stable@vger.kernel.org>
Subject: Re: Fwd: Continuous ACPI errors resulting in high CPU usage by
 journald
Message-ID: <ZeoyfjOdHECxn6ck@eldamar.lan>
References: <Zd2bsV8VsFJMlbFW@archie.me>
 <f7f6bcf7-c919-4077-88f6-bfffe112ba72@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7f6bcf7-c919-4077-88f6-bfffe112ba72@leemhuis.info>

Hi,

On Thu, Feb 29, 2024 at 09:49:08AM +0100, Linux regression tracking #adding (Thorsten Leemhuis) wrote:
> [TLDR: I'm adding this report to the list of tracked Linux kernel
> regressions; the text you find below is based on a few templates
> paragraphs you might have encountered already in similar form.
> See link in footer if these mails annoy you.]
> 
> On 27.02.24 09:22, Bagas Sanjaya wrote:
> 
> > On Bugzilla, danilrybakov249@gmail.com reported stable-specific, ACPI error
> > regression that led into high CPU temperature [1]. He wrote:
> > [...]
> 
> #regzbot ^introduced 847e1eb30e269a094da046c08273abe3f3361cf2
> #regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=218531
> #regzbot title platform/x86: p2sb: Continuous ACPI errors resulting in
> high CPU usage by journald
> #regzbot ignore-activity
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> That page also explains what to do if mails like this annoy you.

The fix for this issue seems to have landed in mainline:

aec7d25b497c ("platform/x86: p2sb: On Goldmont only cache P2SB and SPI devfn BAR")

Regards,
Salvatore
