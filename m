Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD44368
	for <regressions@lists.linux.dev>; Fri,  1 Mar 2024 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709296275; cv=none; b=WJK+Mg0Cy+0oTsJaqv2CbUQA9V6b/wsj+wCyzjmjpNCtD1U/ymYUrVJlG0YtQt4Tv1rRN4cx5NJksZ07o3GjaE7jzemJr0WaVgkoHRULxPDw4za3ooTY8EENzbxBJh+GCEICKeHApe8wilo1F5ve74wC3rprkOV0m2hcwPwfWU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709296275; c=relaxed/simple;
	bh=8RnPvClv7KQ+Hc7khmpr12985u/duy/3v/TKfh9A88M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M7bl3P6q36aolLpPvgUoJbp3sr32b7aa7AtRWtFJhhE9/WzqsB2oNZBY1lYYPODuQ+7nV1rteeaweuBJAb+gAuPXhkd9cFra2I4E2fCUwV/0nOvsG02weewWlQO4FZOIgUWn0XIbP5peEVIdc3yMiF38IXR3q47lqEdzhqiar9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADAiC9eP; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADAiC9eP"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-563d56ee65cso3347653a12.2
        for <regressions@lists.linux.dev>; Fri, 01 Mar 2024 04:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709296272; x=1709901072; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qOvH3P5HGSrpjjPMuyCiz1PZ+rc7XO0ytGp7zjRcMjA=;
        b=ADAiC9ePEqyQtYmVWwV1a5/JyQxIMAszefR21o2dP7XVoXYMkixOCAC6K01/rKi3lf
         pZ9Qtzl7XZsxijlhMoWVLYFmLFA6JG2kUrUmBNbITb2dUeusPTcRygKgf6/uQTnLS4yv
         HnsdNpkae5pkCFgQj9djKobF7v8DV8ZovLs4tg5uWm6DbNHF+0qPv2+Zkvaxa5mGMhSC
         R9jhPeSs9fDZNjy9ZvAgCZ6XpV4AHTvmmOGCOhE13ByvOsW+25U51GjB4hG2KfFn2lb7
         KSnyFBU7cN9NRimu8k4d4cObp+PwTxVBaCvA4tMnNjmR98DeYXgtJ9JxTAyQuR/OjgtW
         5JfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709296272; x=1709901072;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOvH3P5HGSrpjjPMuyCiz1PZ+rc7XO0ytGp7zjRcMjA=;
        b=r78/TodDuSaxLj90s0wyKb9cDX5ByMM7UY1fMfhQHV8O6uahtOosDlmNxpwlijtaCG
         GIymZqo7sU5tfAFZzcSUH0PguvLzURajeEPIiRW+05iY2VXhy6iFiZGaT0Wwno1xoKi0
         ONiuQ3BAmPXsaVMUF0JJ56i47Nccej5IT3Tu4r/VS8MxtoUkxAsFrsAbtHtqGOYDCW/l
         TB1izHImJBLkz3Yb575tNPFxFB5vBlyCd+kvvhij7qyF03IysXIx6IlrOj55o2X7ztiW
         7LfeNm0/NgGp8uwYFHi6HaVu/RA+9qjiX32HxbhFlKSn1IRpRIDAJKM3OtsBWjNLyz/a
         YrFQ==
X-Gm-Message-State: AOJu0Yx809z0e0N+K/e4eOUOr33H45BBxZpBWvhFZNvbTM9zvMSHONAX
	qOlYJTKYToEYnkVOKNlWLAd8kI0N/jVkWBmsqA7gr/py2GZV+xvp
X-Google-Smtp-Source: AGHT+IFd140UexM9EOnEMJHomFWLoVYeGO7aw8HyZ/c5klK42r+DtIXPre1WNqulSOjeGkGfj4x07w==
X-Received: by 2002:a17:906:ccc8:b0:a44:1a51:a1fd with SMTP id ot8-20020a170906ccc800b00a441a51a1fdmr1069869ejb.64.1709296272204;
        Fri, 01 Mar 2024 04:31:12 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id mp7-20020a1709071b0700b00a440ceb4110sm1673266ejc.183.2024.03.01.04.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 04:31:11 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id D1E30BE2EE8; Fri,  1 Mar 2024 13:31:10 +0100 (CET)
Date: Fri, 1 Mar 2024 13:31:10 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: regressions@lists.linux.dev, stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ben Hutchings <ben@decadent.org.uk>,
	Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Aditya Srivastava <yashsri421@gmail.com>, 1064035@bugs.debian.org
Subject: [regression 5.10.y] linux-doc builds: Global symbol "$args" requires
 explicit package name (did you forget to declare "my $args"?) at
 ./scripts/kernel-doc line 1236.
Message-ID: <ZeHKjjPGoyv_b2Tg@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Ben Hutchings reported in https://bugs.debian.org/1064035 a problem
with the kernel-doc builds once 3080ea5553cc ("stddef: Introduce
DECLARE_FLEX_ARRAY() helper") got applied in 5.10.210 (as
prerequisite of another fix in 5.10.y):

> The backport of commit 3080ea5553cc "stddef: Introduce
> DECLARE_FLEX_ARRAY() helper" modified scripts/kernel-doc and
> introduced a syntax error:
> 
> Global symbol "$args" requires explicit package name (did you forget to declare "my $args"?) at ./scripts/kernel-doc line 1236.
> Global symbol "$args" requires explicit package name (did you forget to declare "my $args"?) at ./scripts/kernel-doc line 1236.
> Execution of ./scripts/kernel-doc aborted due to compilation errors.
> 
> This doesn't stop the documentation build process, but causes the
> documentation that should be extracted by kernel-doc to be missing
> from linux-doc-5.10.
> 
> We should be able to fix this by eithering backport commit
> e86bdb24375a "scripts: kernel-doc: reduce repeated regex expressions
> into variables" or replacing /$args/ with /([^,)]+)/.
> 
> Ben.

What would be prefered here from stable maintainers point of view?
AFAICS e86bdb24375a ("scripts: kernel-doc: reduce repeated regex
expressions into variables") won't apply cleanly and needs some
refactoring. The alternative pointed out by Ben would be to replace
the /$args/ with  /([^,)]+)/.

# 5.10.y specific regression
#regzbot introduced: 443b16ee3d9ce0a3ece0e3526a5af883e5b16eaf
#regzbot link: https://bugs.debian.org/1064035

Regards,
Salvatore
