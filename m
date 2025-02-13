Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CBD2222DE
	for <regressions@lists.linux.dev>; Thu, 13 Feb 2025 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739478268; cv=none; b=BVPosXyNi8UfZufPnXvxDn5HQhrE4QUnB60OeNtfhOFfR0XUXDIysgOTXK7QlQTabB9JSQdtKUfFTv7k2ZbUkaXiP2aApGieyWfkw/k6N+P4hO4OouHANgqd8YZG5wwYt7gaJfYrcmWq4kseL+sda1s0Hk3fFdUgxOK7oxfozJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739478268; c=relaxed/simple;
	bh=lRoN299yI/fhws0lmPKx7+Fl34Rlx/oBOztj9Ak103A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKStWoMr0wwgo33/TypvfkJ7VYft+mrnhan97GrPMh45/764j1TMPQxsIsBiuZqLZSM9E0YOC1XWTXvgMI3SnqLeKICv+Pwm2RXms/KjxryQN5TTX6z0jvMaX3Ykbm1NbkLCR8+2/UVa1ymCwH2z6a9tGtL53jfZI8PanUC2IME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7oTGXyz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7oTGXyz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43948021a45so13891695e9.1
        for <regressions@lists.linux.dev>; Thu, 13 Feb 2025 12:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739478265; x=1740083065; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1p2D48k2Z+ZfCl15svcbQqI9e1in0l2JmLLcSGv3Uw=;
        b=O7oTGXyzAa/ckZPVp/KI9q6VAApMdq6Jx+uwGDqpYr9fbu9+HdTuneVBwvN3JWGT1Y
         agnzn1vDhSuokoNBFK8RAdE/XKikM69fD2w5nQsZ1HkUHna4WcL4NG9irQn+RiRb5J3M
         XunWotZ9oxitaAIfYbO/NEYJRSLrj2JvlEMa7KWHr0xBZngdO2Fa/3EX/v+p6rZelpL2
         X/xqxjBgq2vAus9mvp5hoA5EK0BWK7RAI4S7eV4EuilNaMgYJtSxaGPeoH74T7q8DyEa
         aGBBCzAtRMnHioKfSSSR5qa9b2T77yc2WIMxMhKBlump94EU+fhGh7a3ojG/c6kgtq4A
         b0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739478265; x=1740083065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1p2D48k2Z+ZfCl15svcbQqI9e1in0l2JmLLcSGv3Uw=;
        b=oeEddMZCe3HH0B0k3wN3xew2QhDKg+jS07TZ+DeAqvbA7dajaSR2i5jNF+yui1z0YM
         e+OKHVpGe6dbb0VnMQNPQD+7z0c1l4bADIhadoP6W7ilPSuRhg6oKN5Kf5WIcDn4sH+n
         W0fMeOWwTWyZmWMUi7vksxSnv+aZqtOAUzMFRJjlwtKXfN4+RyziXKisKcXfXIHI9mDm
         KYQzUXv5ZA261ncgJ5xxBGgg2xolZmsxIEl3zP6m/sLuL+mZoQH3rBHXEX8d7LZhcWec
         T6RfKe7zqpSrvkWCBZTBFUHo67CoGFoUK9b0rY+haY1FjJopcLb9gdLgSrdzLWIOli1n
         WwOA==
X-Forwarded-Encrypted: i=1; AJvYcCUKbm8YAW3cF9LKlIz7e4ZbP7MNg19W1Ybcm58bdHPH/DRoawLm8zaXkOyhm5ksSkoPLBunDEr0E/6kjw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFEnzzaD++cK8Wm43TjN8/esnAO3Lig3XbY+Mox6sHnw1VP+w9
	qC+JoYyvJqU3u0mC/78GACo4Rwr3riSllMLaPfOBshuLNaxVxP8b
X-Gm-Gg: ASbGncs2guM/iicW4le+x9JCmJxCA8v0QsxT3c1NQHZd/wneRQf8xbPkUPsSqQF/cRC
	TYe+oQ76WdLVrPJAcrNJRRabAtCqYCUdoXjE8qmvT1wC2tY9JsAXFRvA2gZqqYtMnsed7ZPRGdM
	cpSD9Lcp5Ws7OtcInithqXXVJ/7KckrWsFGdrTTjINav+HaZTJyNdeDc8rIuUI9b9N/USPWRVn9
	dxIDuHk+ZC3VwjKn+OOeatp6svtIQGjdD9Mv0kRrCQxbhDCblz9CU8u/o3X3I8FwTDYdXYRVaXf
	WbuVNPD9phkA5r7osmhODbwlhtg8QFYew6JLG949c5w9HwwX
X-Google-Smtp-Source: AGHT+IFqzGgXpVIXDzJc4C6VHeZK7VT63QgiIWVuvvjrGLY3MMZmxxatDJO1KlqdLNV06ScaVx7+YQ==
X-Received: by 2002:a5d:5885:0:b0:38f:23ed:2c7 with SMTP id ffacd0b85a97d-38f23ed03d1mr6353757f8f.14.1739478265010;
        Thu, 13 Feb 2025 12:24:25 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25913eb6sm2778994f8f.51.2025.02.13.12.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 12:24:24 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 8AC40BE2EE7; Thu, 13 Feb 2025 21:24:22 +0100 (CET)
Date: Thu, 13 Feb 2025 21:24:22 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Forest <forestix@nom.one>, linux-usb@vger.kernel.org,
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [REGRESSION] usb: xhci port capability storage change broke
 fastboot android bootloader utility
Message-ID: <Z65U9rZrZUjofo02@eldamar.lan>
References: <hk8umj9lv4l4qguftdq1luqtdrpa1gks5l@sonic.net>
 <2c35ff52-78aa-4fa1-a61c-f53d1af4284d@linux.intel.com>
 <0l5mnj5hcmh2ev7818b3m0m7pokk73jfur@sonic.net>
 <3bd0e058-1aeb-4fc9-8b76-f0475eebbfe4@linux.intel.com>
 <4kb3ojp4t59rm79ui8kj3t8irsp6shlinq@sonic.net>
 <8a5bef2e-7cf9-4f5c-8281-c8043a090feb@linux.intel.com>
 <2tq7pj5g33d76j2uddbv5k8iiuakchso16@sonic.net>
 <ee229b33-2082-4e03-8f2b-df5b4a86a77d@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee229b33-2082-4e03-8f2b-df5b4a86a77d@linux.intel.com>

Hi Mathias,

On Wed, Jan 29, 2025 at 01:01:58PM +0200, Mathias Nyman wrote:
> On 24.1.2025 21.44, Forest wrote:
> > On Mon, 13 Jan 2025 17:05:09 +0200, Mathias Nyman wrote:
> > 
> > > I'd recommend a patch that permanently adds USB_QUIRK_NO_LPM for this device.
> > > Let me know if you want to submit it yourself, otherwise I can do it.
> > 
> > It looks like I can't contribute a patch after all, due to an issue with my
> > Signed-off-by signature.
> > 
> > So, can you take care of the quirk patch for this device?
> > 
> > Thank you.
> 
> Sure, I'll send it after rc1 is out next week

Not something superurgent, but wanted to ask is that still on your
radaar? I stumpled over it while looking at the current open bugs
reported in Debian, reminding me of https://bugs.debian.org/1091517

Thanks for your work!

Regards,
Salvatore
