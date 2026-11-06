Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984550;
	b=zZEsm43v3SvbxzUWXizWCj7oMSbvgmwZyKHWNyXwGleC0rb/8KaVZW8Plys20F2D2LHv
	 j1+2sYgNLkpg2AS5pXkoapQF0ONdCmuVQIA0tQeKKLxeALv6VK8kBrvLYTVf8nx0ARcaY
	 l4W/GHWmgE+KExmavtTfCR5liVlusKqUBsIpwtq+j7tMjn4u8nteyvmighHTZJ7xqb1dU
	 VMfr2lRFC6BCK0v/VsvQL445MKS10FHJJskkOdeQoP57unpFV1VDfMzU+rJxpRgpJxH/h
	 EYlPtFVs0dvCV/wQf6bYGCt/vtvUTX+v7Wtj4QV/3YCZ9CrA0z7/UAxBVlBtBuAJ1BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/qZTKeMtYLlan9SFU3DlCAiu7yexd3IDtiotPT8o4LQ=;
	b=3fJrvAa7hFyiEiLrshT1od9+Dg39HwLNfCUcUBpUzCDNogjniNEgsnlBvR18hmqMcMK4
	 chlxF1CUdXG/7AJqzzr9hrtiFBCmgiQYsfOaosJHPDS1PqhQI/lnnseev4wEk1/MnrGoD
	 C31uT2b4AtIQ38U6LAeUrc1/rkS61/BkuN9d8p/duzkb1er56S1L1DXqLxuMsvxAMO8pt
	 9rUTu0YdAjj4/OOwz7IwcZoN6tUfjwuSkBsxFUH92fyQfN+JRcuMDdnhrLVaVyVN8qC51
	 gzgxb17DzdEB78Yako2hzfiQq4lU1wTYhyxVLf1NXUfmEy7JDDAluQAGm4Wnd1pdOHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=jasoeHTc;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32455606A337
	for <regressions@lists.linux.dev>; Fri,  6 Nov 2026 17:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32455606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=jasoeHTc
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91eb46044c4so6466226d6.1
        for <regressions@lists.linux.dev>; Fri, 06 Nov 2026 09:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793984549; x=1794589349; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/qZTKeMtYLlan9SFU3DlCAiu7yexd3IDtiotPT8o4LQ=;
        b=jasoeHTcIyOa7pIdx6WJ5JZD0xdiE6e/B0Nq40updWzB1QsKhDdFakZISBhmK/9VOr
         9JtRj0mFi/dPErI1wL3utrE5/X+zHF3nKz64UUEdxhoIOduTnuoEcR3bnWuSzjgiz5uC
         jsSUuPMfw5aznNwh9PAZIyReNaxIvgmkMxrd07yOMMG1s7zfSbYyuU9jDaBox/5itMJn
         Oi/vOexPuBc8dSfBas4RyT1s3sWiuXp1DKk7r+UtJG7J/NVR8zNRt9d7lBKFV1g1v3IB
         M3e6S/Ao9wSD2wPEcl7Tqr+nnKSXyvwvvgS7ctEcBG2tLpaS0RUkXQZ3TJJL/LHq/6ko
         H5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984549; x=1794589349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qZTKeMtYLlan9SFU3DlCAiu7yexd3IDtiotPT8o4LQ=;
        b=ouo6zNegJ05tiOEUC04KZseIWEZqg4JwtiKGEkB1RRU8pEpcmEg2bylWqHKHQbaje0
         0UrY9OuhL4zK+sGf6ktDEdNHAcpqvt7d76le99TIVKZQ21hG4RWX9FKSGGrbwAbwPsgL
         p8HF3sD8lYzqTbWF8A5COiSTU0DfEiN4k1zNivBtquLaQmpN/Z0Xnc9aMHGAMDQwR4Dk
         DND39x6wprjLWndjA2ehpU7vvMgwHNGiXQUJF/MIYoxIORjmEHO97QFUSNxNfb1ixz7S
         eBHibo+SYbgDPt37H5BP1vphyNaaDxAbA6yqv25IdlOInJj5mfhNRo06aqg3+tYPiUpy
         lU6g==
X-Forwarded-Encrypted: i=1; AL+hErHOiH9yMOmAv7Jt97OHyfoHrnPuHfwGSTskouLDfpsKxI1Qh1PUAY8IRd3YjbdOo/D/oLPxUP6z5ZUecw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/zu4AWH52oT1swySegZCuhaPvKfpcxHZtUbUXzsxbcd5ZHs/pT
	XB04uV+sly2m8RO8qECDmCwd8hL4F0cgw/POiPMC1ua3he18weFUO+et+RcqSl5TCQ==
X-Gm-Gg: AYBFou2dcq8+kybfoTtmCVKddxFF5Lz8VHw+DLO47VHwS1HYukQT3cyrbnRfIWxCpGo
	6RazFRTdOghvPpVf0Lbe3y6C7aWnYrBvA/00So4s5WmMXgY6fi4isokH68+XJ1tb743IbsbpBns
	IreJjtMSDLJIHhtsibqBAKlj9/MnCPdc9mHmLnT0H+GQS0QpcsDrmlDkA+qKpFa2lIsDIFZfMHH
	wJONK8WoxADxvV2pKbXVrxF9l0+Jcl01OeTtHQYlUHa5bXpdWwW1+n56lV3ZTCUPTIsqiJ0+bFC
	xKqAkGvts5cQ0LyAAYzZp2B187YGX0/ycPmin9JIjnMhchpvkPz1k4n5MjJaOhmSYQFzR4rSMGV
	tq0B9/qA0Y7XnQWXvs/X4MfIi1gL4/Mwn+NrAKfzvmduHKJT4XEHyusV9rMMGqPbS+GOE0GV4uM
	XuZ6tpIug5dwmYfmgSxl0ahVNQF/v7sLrPE3nna1+3IDzH1prVSEAXGHYYerQCuAdnJLoI3GlrK
	JEaa1BIzvDfi38GCRoisqwOdLJ3jjBqn7SqXN8CvAWtYh/vxaTNrDSYxTECjczIiLEh+JHaDYD0
	zrce9IFxRzOfhrrrO5vSZdGrVwm5
X-Received: by 2002:ad4:5dc8:0:b0:91e:9463:7194 with SMTP id 6a1803df08f44-91ea96643b4mr48110016d6.24.1793984548922;
        Fri, 06 Nov 2026 09:02:28 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6aa7a97sm24230156d6.35.2026.11.06.09.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:02:28 -0800 (PST)
Date: Fri, 6 Nov 2026 12:02:25 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v4 1/2] usb: core: export the generic device driver's
 operations
Message-ID: <c267f8af-78eb-43b5-b6f8-98af6749db22@rowland.harvard.edu>
References: <cover.1793941292.git.jjc@jclark.com>
 <c1fdf2ed4c508b08734c7a9de002336f60d3b865.1793941292.git.jjc@jclark.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1fdf2ed4c508b08734c7a9de002336f60d3b865.1793941292.git.jjc@jclark.com>

On Fri, Nov 06, 2026 at 01:12:50PM +0700, James Clark wrote:
> Export usb_generic_driver_probe(), usb_generic_driver_disconnect(),
> usb_generic_driver_suspend() and usb_generic_driver_resume(), and move
> their declarations to include/linux/usb.h. This lets a driver whose
> probe may return -EPROBE_DEFER leave generic_subclass unset and call
> them itself, so that it can defer before the device is configured.
> 
> Say in the generic_subclass kerneldoc not to set it in that case.
> 
> Signed-off-by: James Clark <jjc@jclark.com>
> ---

It's ironic that the generic_subclass thing was added to support 
onboard_usb_dev, after some debate about whether it would be better just 
to export the generic callbacks.  Now you're going to implement the 
alternative solution for onboard_usb_dev, while other drivers continue 
to use generic_subclass.

Oh well, I guess there's nothing wrong with having two ways to do it.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

