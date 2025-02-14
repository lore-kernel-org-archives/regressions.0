Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34299267388
	for <regressions@lists.linux.dev>; Fri, 14 Feb 2025 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739548559; cv=none; b=L/PWstZSUjQUlSuOh7hkV5MQbyVHCUkgt6QjqNPCGFEP+iOGraCEEh/iOOzX+qbtDmL0aAKgZ6CmgvMYPoLJHY3GX259wW+4GlYqZtP8e/ZOaiRHu8U6Be8LGTS7aDbG1+ILnah0K6oXpBbWxaAESL3J5tbCwL6lvsAVpHaGIKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739548559; c=relaxed/simple;
	bh=p/kPHut2qHfzfKzb7Xznt3VAJj0sGjrRew/U5IZb5kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTAL/X/kbquyamFS9f6h60/zGASpWLefiJkjEUf7sF2rMOOJCYG0D3pMTQWdw1MBJGiH+McHlqttC3ZLFExmLFqBIRwtdBBj+UncMMnQfLuHQpmoigxklWOjqCTKdze5HuXoyV9iGe1YnCpjAMVkHFKvZ7SK4B8zdHw+FBuSb2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWvN32qz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWvN32qz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394a823036so23687705e9.0
        for <regressions@lists.linux.dev>; Fri, 14 Feb 2025 07:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739548555; x=1740153355; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BabzqMVj2y+OlBwwIhPLHmR51YcJ8bOgLXov4FeaX8M=;
        b=VWvN32qz/eIvgH153kaSkjetWAK439Xv5AkXdxIopgy00O41hDeSpUzRhHyfCZe6ad
         SKttCtoUQHTVbz6fpUpYL10g9WPrrf4++yaWaejNBzHd1DCzIlovnqXejw+Fg86Evd5+
         pnpOLAFUjZ83oAY5ysAriVqh1D7VMLqNFT73Li8PFd/TNuV1GImXLiTDNFQ0whSkmh6o
         USXFsixUUz75MKk+OvKA+2w2Rs5avdF3jnthpizwuUsuCkEZlSOsfRPY7Yhoi5cHKSXo
         YKzdKs5t8G74NasaabacJdsVh77ECKuu1Rmwyd5nKWV2ngATKPZUy+dAsjpYp2Pcq+s0
         Uuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739548555; x=1740153355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BabzqMVj2y+OlBwwIhPLHmR51YcJ8bOgLXov4FeaX8M=;
        b=pJLLbnJS8hhXthLYrtOEr+eRcaHy9UNQQxJBDv9+qPIrXcbhsI+fC18wIeKd1WeqIw
         shkx2UgMbdl3jvOr+qHsquPHeelUBGcA90mxtHwIqsfqr1kiLV83S1TWDDuvECtFidoU
         vrIvTr/RMPbLIImFMA88c2igMIXLQliR9nbUuV99jJcdDUyqr3SpsqcCC0dKJabGKXvi
         dpXJ6f0y0bD/PPDYx7kGJRX7ezFyjRBFPEVyecgtsKKLYKuG5eu05npKXGaDDASWC8mf
         h4Ej4BlpQlgqlkMP6fNWvx2Aju+eXYQmsTwJ8tIdIEQN+MSbS6xisDP+3Tn0X/aQI1A9
         ubBg==
X-Forwarded-Encrypted: i=1; AJvYcCU5dAIJ6aTYrU+iYlRZ+DayExH3is78bivrnFqEDAZQWkc3uDKbyl6IBXSVpiqPM7JYp+RrLqV1x7ZSEA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu6Hh7fWlu+A5k/9vEFxogyrnyvJkQKfBvOi5BEFRT9+4wHH4h
	t/D8WMDFerhAFgjH9ZgYDRmw6YsdMcCjyHKACbCiyUvBPM4/3U97agj02BYu
X-Gm-Gg: ASbGncuQxynEkDCWqR67L+TDiVVE0MFIWnuSXKeuTlfKoPSS+9sq066syWx69PyC+UQ
	fm3IWWZoW3Dm+o0fw0/zXWvrGfi6UprQmuZEiOUEaDIE2kkWufhJ75TQVJE0dK/Q7GKtVYiKWbS
	6FaSJNTfqXy6xKKyFTD0o9h5Gk2wI7S7n/Y4Lt+V22iZ5Wj0829gnMZEeVvUFn5jVYN/TvYajk7
	KRRngAXtiWrOuFgEG7xFtVpkvqUbtyCBCOoHgGoL8J7tB/s0aW0qvsnAFxfQRPoke3El19KZKrR
	jWjbtHrJm3kDdNMLXbOOC9PHCnDciAH/N+aZgtYJcP+ZH766
X-Google-Smtp-Source: AGHT+IG9jRk9cmkBRz1ehmcym8NWsRSbA5wy5EE6+AQlwQIxNX7/S/c6g7lrbNl80HdHwNFwZDlONw==
X-Received: by 2002:a05:600c:5950:b0:439:5b4d:2b2e with SMTP id 5b1f17b1804b1-4395b4d2cfcmr115326695e9.19.1739548555157;
        Fri, 14 Feb 2025 07:55:55 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396180f199sm47311355e9.15.2025.02.14.07.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:55:54 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 6E025BE2EE7; Fri, 14 Feb 2025 16:55:53 +0100 (CET)
Date: Fri, 14 Feb 2025 16:55:53 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Forest <forestix@nom.one>, linux-usb@vger.kernel.org,
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [REGRESSION] usb: xhci port capability storage change broke
 fastboot android bootloader utility
Message-ID: <Z69nif2-5Q5p8Wkv@eldamar.lan>
References: <hk8umj9lv4l4qguftdq1luqtdrpa1gks5l@sonic.net>
 <2c35ff52-78aa-4fa1-a61c-f53d1af4284d@linux.intel.com>
 <0l5mnj5hcmh2ev7818b3m0m7pokk73jfur@sonic.net>
 <3bd0e058-1aeb-4fc9-8b76-f0475eebbfe4@linux.intel.com>
 <4kb3ojp4t59rm79ui8kj3t8irsp6shlinq@sonic.net>
 <8a5bef2e-7cf9-4f5c-8281-c8043a090feb@linux.intel.com>
 <2tq7pj5g33d76j2uddbv5k8iiuakchso16@sonic.net>
 <ee229b33-2082-4e03-8f2b-df5b4a86a77d@linux.intel.com>
 <Z65U9rZrZUjofo02@eldamar.lan>
 <f2563e57-1982-4a64-a655-236dd4fff208@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2563e57-1982-4a64-a655-236dd4fff208@linux.intel.com>

Hi,

On Fri, Feb 14, 2025 at 02:29:29PM +0200, Mathias Nyman wrote:
> On 13.2.2025 22.24, Salvatore Bonaccorso wrote:
> > Hi Mathias,
> > 
> > On Wed, Jan 29, 2025 at 01:01:58PM +0200, Mathias Nyman wrote:
> > > On 24.1.2025 21.44, Forest wrote:
> > > > On Mon, 13 Jan 2025 17:05:09 +0200, Mathias Nyman wrote:
> > > > 
> > > > > I'd recommend a patch that permanently adds USB_QUIRK_NO_LPM for this device.
> > > > > Let me know if you want to submit it yourself, otherwise I can do it.
> > > > 
> > > > It looks like I can't contribute a patch after all, due to an issue with my
> > > > Signed-off-by signature.
> > > > 
> > > > So, can you take care of the quirk patch for this device?
> > > > 
> > > > Thank you.
> > > 
> > > Sure, I'll send it after rc1 is out next week
> > 
> > Not something superurgent, but wanted to ask is that still on your
> > radaar? I stumpled over it while looking at the current open bugs
> > reported in Debian, reminding me of https://bugs.debian.org/1091517
> 
> Yes, patch was here:
> https://lore.kernel.org/linux-usb/20250206151836.51742-1-mathias.nyman@linux.intel.com/
> 
> Greg applied it to his tree today:
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=159daf1258227f44b26b5d38f4aa8f37b8cca663

Thank you Matthias.

Regards,
Salvatore
