Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FED7995F
	for <regressions@lists.linux.dev>; Mon,  4 Mar 2024 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709582443; cv=none; b=Nqje7AK3+v0Gxt9Xv9TUcU4cByuA0wndvfn1Qe9lbiELz0n3w1iGdDvksJNUsxcxUP7hENh0XhCS45327W8zhXakpXuEEKxp2gidWTwyH/Mar3ibNfoaoPYRciUQD0ZEVTZ3DTC5jAmlNrRKTl8YjRuhBw9J+OliWzBiWj+ZjO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709582443; c=relaxed/simple;
	bh=XvM+66VhbbeNHen8cDDRkVqqLC5Yo36gqh2E2nY94W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2umr7jkIOvi60dCSSRzsB2GjHcuJglFQJDhqLgNKFxVV2j/DfO5lvYolGWpuWUhah9KgC4h6GHGNNDtBECynIPv3H+wo+hBuuZNN9hbxJQOLjSAI2JzI5DNjoQ6EUehaT/pJC2j9acr4lHXDBnejUUk/5bl2h374ZGOdv61UXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuYc7DBX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuYc7DBX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-412e72b0d96so6703105e9.0
        for <regressions@lists.linux.dev>; Mon, 04 Mar 2024 12:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709582440; x=1710187240; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgHCyC+Ikfdy07nvjol19ApsqbmdnmuhNond4BBAt+Y=;
        b=IuYc7DBXd6BXL0ya2RjYOZriWaj0n+aJPETnXnCY5fEZgspZkVzEmCJzO8RTDkL0u5
         HzT/ImoYeayw3ElXe7aI46vbz33oAYV9wWCbdOaTdZ3UGEXctBM4ijsYaffMu7B1LoBo
         uR04Iwqflkh+sihYBRd5NxjXYzsUG+5dPxKquk2q977Gptvp5kzJLO0xukddn3SuuFuU
         OrJqfFu5fzLhl1KTuVDAXrftpiM45QPRchsN6TtrLgqUa9HUhXE49KMla23nRJnrAlhw
         mJc7Utssu8Zzzpe4ji4pH7irj9mwDqmaz51NC7FufUo/c3Ry4mUwS63tfDLda/ETNmK4
         hjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709582440; x=1710187240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgHCyC+Ikfdy07nvjol19ApsqbmdnmuhNond4BBAt+Y=;
        b=pxlSEB2jBzO+m39iCdmjjDg92u8t1ew6wJogSPsMBqwSf4wUtxabrQHjBvkH0zAjJO
         SUQBZz5NtnooIkLKvkVShOdt9oMWpjFyWrwfGLJWfUGVkbXeMHVRNRCy52TIfIj2CknV
         Nn5M8u52w7GjKc73BDmM5VaFZGjZXoaF3LH29X9feFu4bFb+UEJPC7Q7eWt8E+ZyPGHt
         FsCFjYgTxoObxT8EEtQmeCINO+ZkRUZR37b34hXPat/5m4rNqOoKFiTcgxwB0Q1pt7Ci
         ecqRK9PmayIYYH11TBD4u290+8Jxih570cle2VSKwIZEH8knyLj3X7BwwuTrulSccQv+
         yZ9w==
X-Gm-Message-State: AOJu0YwV1pVPc4JQLN54442ECLO1aIvLNIcTu+z7nA97TJMzF9cvBI3b
	I6Wo82jZqmLJzaU2+VDaQhfu6pPwx9Tbi9lNNvl+K47jTioAijI2
X-Google-Smtp-Source: AGHT+IEG6VFBumkdiKt3bV/gFyaWTxyNPWjZ8t9eO9T+jnNpADN4tBLH9fymg1RHv/pFVFu+3LqEsw==
X-Received: by 2002:a05:600c:4e8b:b0:412:b83c:d97d with SMTP id f11-20020a05600c4e8b00b00412b83cd97dmr8154909wmq.16.1709582439907;
        Mon, 04 Mar 2024 12:00:39 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id m11-20020a7bcb8b000000b00412dd56e0desm2428259wmi.1.2024.03.04.12.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 12:00:37 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id C6ECABE2EE8; Mon,  4 Mar 2024 21:00:36 +0100 (CET)
Date: Mon, 4 Mar 2024 21:00:36 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: regressions@lists.linux.dev, stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ben Hutchings <ben@decadent.org.uk>,
	Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Srivastava <yashsri421@gmail.com>, 1064035@bugs.debian.org
Subject: Re: [regression 5.10.y] linux-doc builds: Global symbol "$args"
 requires explicit package name (did you forget to declare "my $args"?) at
 ./scripts/kernel-doc line 1236.
Message-ID: <ZeYoZNJaZ4ejONTZ@eldamar.lan>
References: <ZeHKjjPGoyv_b2Tg@eldamar.lan>
 <877ciiw1yp.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877ciiw1yp.fsf@meer.lwn.net>

Hi Jonathan,

On Mon, Mar 04, 2024 at 06:39:26AM -0700, Jonathan Corbet wrote:
> Salvatore Bonaccorso <carnil@debian.org> writes:
> 
> > Hi,
> >
> > Ben Hutchings reported in https://bugs.debian.org/1064035 a problem
> > with the kernel-doc builds once 3080ea5553cc ("stddef: Introduce
> > DECLARE_FLEX_ARRAY() helper") got applied in 5.10.210 (as
> > prerequisite of another fix in 5.10.y):
> >
> >> The backport of commit 3080ea5553cc "stddef: Introduce
> >> DECLARE_FLEX_ARRAY() helper" modified scripts/kernel-doc and
> >> introduced a syntax error:
> >> 
> >> Global symbol "$args" requires explicit package name (did you forget to declare "my $args"?) at ./scripts/kernel-doc line 1236.
> >> Global symbol "$args" requires explicit package name (did you forget to declare "my $args"?) at ./scripts/kernel-doc line 1236.
> >> Execution of ./scripts/kernel-doc aborted due to compilation errors.
> >> 
> >> This doesn't stop the documentation build process, but causes the
> >> documentation that should be extracted by kernel-doc to be missing
> >> from linux-doc-5.10.
> >> 
> >> We should be able to fix this by eithering backport commit
> >> e86bdb24375a "scripts: kernel-doc: reduce repeated regex expressions
> >> into variables" or replacing /$args/ with /([^,)]+)/.
> >> 
> >> Ben.
> >
> > What would be prefered here from stable maintainers point of view?
> > AFAICS e86bdb24375a ("scripts: kernel-doc: reduce repeated regex
> > expressions into variables") won't apply cleanly and needs some
> > refactoring. The alternative pointed out by Ben would be to replace
> > the /$args/ with  /([^,)]+)/.
> 
> Hmm...this is the first I see of any of this...
> 
> The latter fix seems like the more straightforward of the two.  The only
> concern might be if there are other kernel-doc backports that might run
> afoul of the same problem, hopefully not.

Ok. In the sprit of the stable series rules we might try the later and
if it's not feasible pick the first variant?

> But this makes me wonder if there are other stable kernels that are
> affected as well.  I guess that, despite all of the testing being done
> on stable updates, nobody is testing the docs build?

Only 5.10.y is affected AFAICT, and the reaso nis that the cherry-pick
of ("stddef: Introduce DECLARE_FLEX_ARRAY() helper") in 5.10.y (as
requisite of the smb fixes) requires as well e86bdb24375a ("scripts:
kernel-doc: reduce repeated regex expressions into variables").

3080ea5553cc ("stddef: Introduce DECLARE_FLEX_ARRAY() helper") is in 
5.10.210, 5.15.54 and 5.16-rc1.

e86bdb24375a ("scripts: kernel-doc: reduce repeated regex expressions
into variables") is in 5.14-rc1.

So it's covered for the later series, but causes problems in the
5.10.y.

Regards,
Salvatore
