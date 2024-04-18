Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8742AC29
	for <regressions@lists.linux.dev>; Thu, 18 Apr 2024 02:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713406050; cv=none; b=eY+3l8CRKxAMM+ManszKfC+1+0QE4W6SzCeqAE/frWKcl8PUCR5C6YFSynV+FwLrcfIYMyYqLU2cxaa9IzwUV3Pi8Cp6R2IGnxVfmcBtaIbGIdt2x2OwrwMF/MebDC0aswwSz6OA/ZejJTRvZnheWSWf0WwEqKUlr56UurjSgRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713406050; c=relaxed/simple;
	bh=+KEGnBcOMKQg1e6jhwZpTqi+bVvKRdapHRMb2dM0wtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJYyN/c9afp9VkVESA7pKVnvhMZpkEfkvpvhX2SG9l4HeLUBUMEIajlinTnL4wX/U9pqUdgkA6ss1G4K5cNjoPMGXNFShmegfQFF6cjq0cLtpp/MC6u4GItymtASLzPGgTJ8zS4txygTYqc1HNb7NFtHKJW+8oCFmIaezViU0rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNC0bqVG; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNC0bqVG"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2330f85c2ebso280224fac.1
        for <regressions@lists.linux.dev>; Wed, 17 Apr 2024 19:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713406048; x=1714010848; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cZvLjNhi5psGTi/M7oTNlbzmf7LpqbmTlYFheoOKB8=;
        b=jNC0bqVGlJ4eFAtKJsxu+eOOXKYAyL/XLouasxUx5yRqJx1vzQxRxjZ2GYtaKLzvj1
         J2/0/1gJocPmXQR7UgHUtaZoapGiglvYRyPT3HxRigNB73axMkBPxQf7/LSwjBYNAXuK
         loUVzZ3V4dZNnO72Yq5sjcHqXKRMhoHTQECpToFAtjriMLu6rsU9bQU1bn0l0CkfavQt
         KbPwQyi2j3PX7JAgTx5WSjchn6tu3wuui5fdGNj9Cm2zv0BvUgpgWCembAdkijEEhw6G
         UiolsBwmNTfHTYNLXYUlq9cKEGr2cQD7+rNYgR2VK3I1VLgyHksdBp84vnwWytYB9kv/
         LnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713406048; x=1714010848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cZvLjNhi5psGTi/M7oTNlbzmf7LpqbmTlYFheoOKB8=;
        b=VxEk2pRdRYnlLrvuMzH/RRPOBzPzUdMILZDHIqXrCrWno+WfOqjCLtS4RmncCZsrGt
         itT8+MQbWp7IO4LJrF6SCy2KJKZahSX9yDziNvYrAJ4i8WfMLzz/2L0fcD9o7G01xeiY
         7tOX9gfmhvoftoJCJTfW6eT8ZorXmlmPTJkBrXRNQzjbrU2ozRJQTy4KvwsiPuF7tpwu
         TTGXOHeA3DVzT0OrdRtt0VC6QQFDxcSDv4Z4EOvNq9aYhGW+rrFKptvwm39RtirRrBdt
         Fmw0ae5NyxDmAR7wnDaE3lw6BdfjNDT5VHUL8WH3GC+ZWy0WcVeWvkhqJaMQjdQekoM3
         Tp8A==
X-Gm-Message-State: AOJu0YwLrIdx+kE198UKt/LS62sEAa5dM3/Vq/uH+10xwNYtlwyca8Lm
	7EB/Mhtycz4U31ih4DNupG1bWUHuimuhYQGqqkdoYiZ1vzp8gs1pTjDOj1sX
X-Google-Smtp-Source: AGHT+IHkRREgGYfHbnLerfWwG1l/nPL22jRK5el/rJ7qosjGL2kgjZfx5vUtE7jmFBUVX7TkEjKdJw==
X-Received: by 2002:a05:6870:610c:b0:22a:6c9a:ece8 with SMTP id s12-20020a056870610c00b0022a6c9aece8mr1783850oae.21.1713406048246;
        Wed, 17 Apr 2024 19:07:28 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:6f51])
        by smtp.gmail.com with ESMTPSA id kq12-20020a056a004b0c00b006e6c81b6055sm356551pfb.6.2024.04.17.19.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 19:07:27 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 17 Apr 2024 16:07:26 -1000
From: Tejun Heo <tj@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bjorn Andersson <andersson@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: Bug 218665 - nohz_full=0 prevents kernel from booting
Message-ID: <ZiCAXq-jS1Z6vgCK@slm.duckdns.org>
References: <5be248c6-cdda-4d2e-8fae-30fc2cc124c0@leemhuis.info>
 <enqg6mcuhvff7gujjbapdiclicl3z6f2vnggcsg65pexipyr3o@4men5fhyt3vb>
 <28c84b3b-f68f-4f45-8da1-9c3f9a342509@leemhuis.info>
 <7kugx5ivbplwwrcq5zp37djtpakl55b3pfy36gpbsbcx43dpcs@uheu6iv7gm7h>
 <81149f18-0132-4ace-8c71-1b75790a88e4@leemhuis.info>
 <Zh8H_vG2dQLOjoIB@slm.duckdns.org>
 <51942e58-a5a3-4dcd-80c1-6735c7b5cc1e@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51942e58-a5a3-4dcd-80c1-6735c7b5cc1e@leemhuis.info>

Hello, Thorsten.

On Wed, Apr 17, 2024 at 07:48:33AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> > Can you elaborate why Bjorn's case is different?
> 
> Well "not booting at all when using 'nohz_full=0'"[as reported two
> times] and "I start neovim, send SIGSTOP (i.e. ^Z) to it, start another
> neovim instance and upon sending SIGSTOP to that instance all of
> userspace locks up - 100% reproducible."[while no 'nohz_full=0' in use]
> at least on the first sight to and outsider sound a lot like different
> problems to me -- but of course that impression might be wrong and you
> know better about these things.

You are right. That is very different.

> > I was assuming it was the
> > same problem and that Oleg's fixes would address the issue.
> 
> Bjorn, could you give it a try?

Yeah, I'm curious whether it's just a different symptom of the same problem.

Thanks.

-- 
tejun
