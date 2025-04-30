Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52DA296FB7
	for <regressions@lists.linux.dev>; Wed, 30 Apr 2025 17:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035530; cv=none; b=nch0YsA6n+SrbTF+ZglpK4SdEXAQu9dga9jxUf5ZBgyhfF6kOKL9HFDMvkL0xoL97LwcfgUUifxMVyuJF+nXG4WX0/uSDhSoPaiX+dLspmnN9SgCqAnBWd4Ztzrj2pTjEkTx2BLTy6R1c7CsxfY8Of02Xe6MbYI8a+CjTQ29Ezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035530; c=relaxed/simple;
	bh=6Qk5aOcjeughcGyqvegbHGnygQ3Y1BSJM0ZNYFBy5Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtq1asxU0PuYY7QCyVyfxna1Z/fyolyEyB2yONeVJHNMcrjWh2JnacD36y7ywLtve9tERm7Eg0XKw9yf7ALPrcSbY0xutD/AZ+VW/1JE0OqGHQyNm2mr6L+d8U8FL6Wk4idczKO3EieuLN2Ptwi1bOtKKD1WuLxGidFU6hlqXzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=lBl4PIfP; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="lBl4PIfP"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-86192b64d0bso6952539f.3
        for <regressions@lists.linux.dev>; Wed, 30 Apr 2025 10:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1746035528; x=1746640328; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tV3++ttVfH4W7FY1HViLXTb1LjmY9pSLMgtourB5A0Y=;
        b=lBl4PIfPlftFh2ODIFrEd0sx86ca9inZe7tdNLANQgXiz/Mm5a1y1dZFy4qDOP9P9e
         BBFNMnBmmghdJRhO1RQwnsbWuqiseS1t/p9l7ee6QKNB9Pb9oPl9XfvyOPdZ7Y6wXj8F
         1NmKeJFTyZPXQoKMmKLJ3wT/dOqKk0+WUR8DONLLmDjuVpRtZ+W0Y4WabB0SE2bgcKiS
         3d7sTQjxoVfZUrKVDDAYE3g6GckAK+AOBjqlAgW0etfiy3LIuRyZTkgP5DRwEff8xyhw
         UBMoP5UVkphjlFOZOVB9kRASoE6A9wZ8TE0GISkSdQDiJQyG3ZP9GM+roRFKFyOLpsYT
         /tBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035528; x=1746640328;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tV3++ttVfH4W7FY1HViLXTb1LjmY9pSLMgtourB5A0Y=;
        b=BbQbIJ2YnYKQ1HoTo+dTSeqWMSEaPzHr9QkQP75Lhg0BRMh+G5f2wtgUQNlmG8BtTB
         SDiHREdsE4L+x1kCJKGPhDgf/iG8/EeKgy6LUAkaKGnlHKV4ZQx4SVWGUv10XuMS/mp0
         gxOF9DogJ8xIJ73T9zKa5GXS29r7qOcfcqhvus4MsEBXQqQGmLQxUUA6Krcf7G3jdmB2
         8IhG2kgz7WaIy+1Gl6cuMyuCPcpZZDjNuWutDkGc5oX26ay8+7q3dKCzWQmClpeypSff
         g0aIUec95UVif+8G1G2T0XB6RUUqGNEtEfYg08AyrIy/0aSwg7+5wULmkWjA4qJvsqb1
         /d7g==
X-Forwarded-Encrypted: i=1; AJvYcCUkKnJ3t6iPk6XZZJdP2jQ39tWwLQLML1qhp3/cN62pLv5Q1+1CaNomqIwtUm5+4RTx+RhKFT7fMCuAqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVDgEImFlHRAcAMjrLTfqO/BmARNX7G13cyrKX7UTw03O1c0Jl
	EkViuznjMPfOtmHSax3q25qFbNE9boX09gVrUw0eTlnW1uOjvq65QgLthVz4xu4=
X-Gm-Gg: ASbGncvs//qgaMjrly8b/9r+U7OH4gE4IwuNGj+hRwN5/jDHxLRVpKcuQxhKrOdpeC7
	J3V2Y8PjuWXIhBFdBixtPRM0WkfzXwYmuNe8ulbql48ymXS960VystR6R4w+Mm0U7+WoGVuxlsC
	PQ6QH4wgE65LA7nmvexn+k2Lkn3x1cWNfzUUGgSvfu9g3YoHn/N/blsIJrqIyfr1lDI4qOuloeL
	gv1eM9LrkZBajRh+hZv5QhSQDoyF3iLVG1xK8f3WWkB7Y6i1L5WVKbGoaaN2HHJ+XSOf16fcYU/
	43v4PEfH5DGtw7UFXZp8sahsCalUAetDaPKGkM3maKHTlpCNJoBvX/GZ03dkf3zUByQ12A==
X-Google-Smtp-Source: AGHT+IGA8d3eSMeZa990sNEOMPBfFmfFJDgS1Kkfj8JknYIKmKzHhe3V9dFO1McaI8Jc02UYFjzRfQ==
X-Received: by 2002:a05:6602:389a:b0:85a:e279:1ed6 with SMTP id ca18e2360f4ac-86495ef01d6mr557928339f.11.1746035527605;
        Wed, 30 Apr 2025 10:52:07 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8648bf2f2adsm83135239f.12.2025.04.30.10.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:52:07 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:52:05 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Doug Anderson <dianders@chromium.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	regressions@lists.linux.dev
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <nchsanp7nc7nqy3kqlu7c5iwvfj6vmrkqbxyjxmoc5eq3dthjk@fusw4pm52auq>
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <CAD=FV=Wc9TnDg6vDb8r5A8dT9TvOzU2kNSKi_6TzTtb0ka=8jA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Wc9TnDg6vDb8r5A8dT9TvOzU2kNSKi_6TzTtb0ka=8jA@mail.gmail.com>

Hi,

On Wed, Apr 30, 2025 at 10:05:44AM -0700, Doug Anderson wrote:
> On Wed, Apr 30, 2025 at 6:28 AM Nick Bowler <nbowler@draconx.ca> wrote:
> > On Mon, Apr 28, 2025 at 01:40:25PM -0700, Doug Anderson wrote:
> > > On Sun, Apr 20, 2025 at 9:26 PM Nick Bowler <nbowler@draconx.ca> wrote:
> > > > I recently noticed that on current kernels I lose video output from
> > > > my Blackbird's AST2500 BMC after a reboot
> > [...]
> > > >   ce3d99c8349584bc0fbe1e21918a3ea1155343aa is the first bad commit
> > > >   commit ce3d99c8349584bc0fbe1e21918a3ea1155343aa
> > > >   Author: Douglas Anderson <dianders@chromium.org>
> > > >   Date:   Fri Sep 1 16:39:53 2023 -0700
> > > >
> > > >       drm: Call drm_atomic_helper_shutdown() at shutdown time for misc drivers
[...]
> Do you happen to have anything that's just a normal HDMI sink, like a
> TV or a standard monitor that takes HDMI?

I can probably find something else to try later.

> > To clarify, there is no boot failure.  There is just no video output
> > after rebooting.  I can then boot Linux again by any method that works
> > without being able to see the screen, and then everything is fine once
> > I do that.
> 
> Super weird. So every other boot works?

On a new/broken kernel, every time I run "reboot" the video turns off
when Linux does whatever it does to make the system restart.

The video comes on again if I manage to boot it up again.

The problem is that I have to do that without using the screen.  So I
can boot Linux via the serial port, or via the BMC web interface, or
by just typing on the keyboard without seeing what is happening.

> I guess I'd be interested in other types of tests to see what's going
> on. Aside from trying some other, more standard HDMI sinks, I'd love
> to see the results of:
> 
> 1. HDMI is supposed to be hotpluggable. If you've got a boot where the
> display isn't working, what if you unplug the HDMI and plug it back
> in. Does it fix it?

Unplugging/replugging the cable when the video is off after rebooting
does not cause it to start working again.

> 2. Does the hotplug experience change if you boot with the revert?
> AKA: boot up with the revert (so everything is working normally),
> unplug HDMI, wait a few seconds, plug HDMI back in? Is this different
> than #1?

I have certainly never noticed any problem related to hot plugging while
the video output is working but this is not something I ever normally
do.  I can try it later.

> 3. What about if you fully power off and then power on? Does the
> display work reliably in this case, or are things different between
> ToT and with the revert?

There is never any problem with the video output if I fully power off/on
the system.  The problem only occurs on a reboot.

> 4. What about if you fully power off, unplug the HDMI, wait a few
> seconds, plug the HDMI, and power on? Does that work? Are things
> different between ToT and with the revert?

Again there is never any problem if I fully power off/on the system.

Thanks,
  Nick
