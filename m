Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041089;
	b=xymZVHFcD4xH/NdSv60b5niuLoKZdKb26TEILojef3ax5M5DtWrKrE21z8mmKpzH8TfP
	 O+GG5FieFpuLyqNiaszcP/OCwzr8XHFkGVKQI62d9uSsik3KXATluGPImIgyM7WtVshUZ
	 vz92vcaTGHhLqJxsqVOlrlWtpd2HSbY/5DYGbntueKCvCc4tZNdrvg/ICFpwX56QghM2W
	 V7tSMeOG1bvyOvB9B5Qz2p5EOSsvTnLmxWTnAzkMy6NeV1apjqDc37jwxU/FVXUBg9KQA
	 JxFDuRshs3edINpCGOn2nPhQB0co6aLicU1okfZN0YGnAnvfM7G10a24zcTC2K95JWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JKUJ8LDBgbQxcz3WszEduXS8OXow7pgRlAV/qt5NPP8=;
	b=bGNSORn/69s5vJMyGU30qcjEDqDrYhTG6H+U671HYu4Re1Bh4ngbeih3V2vRpbFM/XnH
	 j+8yy5e6pdNKE3yJjsWMdYmTwEWfNZ22X4d/vepuin10I/LAaYx5181qAJ4M5DW8hQGEk
	 h4bn0mN5qUnTD0JxkP8MRUgw2IF4fTZaXCAMjB1pLRsweKy5J/716k8+fBQZcba4WbKdv
	 ICrslmb0G2LR3N4k18A+ttCTDeGfwRLv/pJoAXRFpQkN4zPyB8HDAnAqPKC4HSpoHdjjy
	 Gj6pWKT1ZkY0R0uoquXHtx83Vh3ouEToaaD5U5zfadGBRzZjDuYitqICUm5Le3XpzgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eud20GzH;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6F1606A31A
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 18:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F6F1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eud20GzH
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53664b4860bso36249301cf.1
        for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 11:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793041088; x=1793645888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JKUJ8LDBgbQxcz3WszEduXS8OXow7pgRlAV/qt5NPP8=;
        b=eud20GzHCO29qG4hlpGC1CGl7e+ausp9bMWkFbh/7PNORGgaPK9JzJeYsaTuGQtyww
         idGlggPs4twsveycLhDv/fwBP/ljTh3dhJuIr0enUA6G62jFpJgh++xNqFNDltTEy/xr
         P8yjEUrlxpogpuFHSHdGYtrFfp3tB27kX66H19vgFWiWkmcxf1tmQNycG/Ol15ZQBsKm
         5bnR5w6+FUMIKbEY7+XIHHmcK0AIYc0XJYQrKPfF85m5/aBfPmDJjyIvwsomljqs8S/R
         rwkrW7dFp3rzMN058T5yw2x/jTBGuUj7pPgYyG04/B3q0WfoTAisbA8CvqAgqpCKYFOt
         tVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041088; x=1793645888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKUJ8LDBgbQxcz3WszEduXS8OXow7pgRlAV/qt5NPP8=;
        b=mPnQcdYILaYpc4uFnOYQUyVcd45gr2UwMP5TzfYUA8/ZTpbpI4m8ie6A7A1HTLGaLG
         DyA6VzuXnWDIfxW7Fgx2qqxwE2pJ6a5mi2Wbtt14cWJr6a7F9W7HuIPcWj6nzeS5ivwa
         eGjBihRwoF1+1SRN76ScTLRQGCdXOPewcn8e/GbWLh6szOyW5VB4INA1gdkwdeTphpRm
         GGUhcUcLl/3C24PFYKvZo9q2EOmngbt8CQ9ZiyIFU6bW+Z/3B3KFe/0PYDTJEoCpdH9+
         LhcVsFTdUgZnyC8IzNc54pUu3nmn3J9ZI1ugqcynfTQSx29j4RogFxbTlfvEoPw/h29P
         c4YQ==
X-Forwarded-Encrypted: i=1; AKwUvBymgwQ5mHVTeQzldVNIX/LDo6IuIBKjXlslR3PdbnqzaxJTj4Qft2YdN1GZU53qVfVwyvAsJB6RkVJCzg==@lists.linux.dev
X-Gm-Message-State: AFq9FYL6I5pdmJpAZ377mTh0YNdq8CAVZltPaY4NEAqGBrbv9RXCnUk9
	lv8qpvlxQCmBLuLEKOCd9HCD5KRdmJoCzd8466ISJRh4kAHWUbXuEvquf67bISH7dA==
X-Gm-Gg: AYBFou2JIOwyAHHnOiIAYiKegEuMog3hSTbin9LEEkhqReItOgUjHuezNuAG4E2MQax
	BIsfxIEoXYlZn2n4qs+oyQX6zh2IRE/uovvBHkQt2z3XwCsGRgV8Vqz3MiTRK0btofS5FroZdXe
	UmrKA7nP3VA1ENEJNPUxRod99AZ71hryQZp+OzbOt5Y/h82ReP/doVhMu7Wx+WCnH6wX/FgjXsu
	jW0HKKlbJyJeJfn3ttHTbX3N/FOomK0w1ME8me5f1qppkUcnm5G7zBIPkHBI2rWsuHLhzhE4s63
	+hEyD9b3cMOH0Z8PbL8Jg5uRBb+d2jFmh7LwgXYK1SkgKkYLzEnL+Q2QKNcVluvB0zL32+ORDVZ
	359qB5KvJIpJ6V5FhwFHMAYZKK9dd3vjTR4kPPtc/LUdjGOZUbmuIiQ3oR+YXAHgv1gqe2GhTDB
	+sGyxWcMtyzh7FSzpN8vVSrVKX5XuE7xafSWuG28DgxbFRpdsqEIPvNiIbe/eEZzGysqFvDB8SC
	gN0S3cNX1Y3IPBa4Xs+lN2cfLBI6ERAratvFLfoBCCpXsi5mxgCXebAjlKNR2A2TPfHgcgm65we
	64q9Ju1b+VZOGkI/jBTtu7A=
X-Received: by 2002:a05:622a:580e:b0:536:9140:e2be with SMTP id d75a77b69052e-5383b6130d7mr126015701cf.74.1793041088189;
        Mon, 26 Oct 2026 11:58:08 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a7cd7esm79875376d6.2.2026.10.26.11.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:58:07 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:58:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
Message-ID: <25e5ff9c-8db5-4e6d-ab7e-900b7b6af05a@rowland.harvard.edu>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
 <20261024203558.3181711-1-yiyu@yiyuzhou.io>
 <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
 <20261025111410.2c14fcef.michal.pecio@gmail.com>
 <7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
 <20261026105139.6b86cb3c.michal.pecio@gmail.com>
 <3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>
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
In-Reply-To: <3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>

On Mon, Oct 26, 2026 at 02:56:49PM -0400, Alan Stern wrote:
> On Mon, Oct 26, 2026 at 10:51:39AM +0100, Michal Pecio wrote:
> > On Mon, 26 Oct 2026 11:18:34 +0200, Mathias Nyman wrote:
> > > > But is USB core really resetting a device for which the hub has
> > > > reported disconnection? Something isn't as I would expect.  
> > > 
> > > I suspect udev, xhci virt_dev, and thus xhci ep0 ring stays intact
> > > even if device has a short disconnect during reset/enumeration.
> > 
> > But this doesn't make sense, right? If the port reports connect state
> > change, we have no idea if it's still the same device or not, I would
> > expect udev to be discarded. Or is this some "USB persist" magic?
> > 
> > I didn't want to dig into the hub driver or bother Alan, I hope we will
> > get that debug log showing what usbcore is doing there.
> 
> You can read the login in hub.c:hub_port_connect_change().
-------------------^^^^^

Meant to write "logic".

> 
> Broadly speaking, if the port is enabled after a connect-change event, 
> the core tries to resuscitate the child device (and checks whether the 
> descriptors have changed).  Also, if the child device was suspended when 
> the connect change occurred, the core will try to resuscitate it by 
> treating the change as a wakeup event.
> 
> Alan Stern
