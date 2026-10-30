Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378845;
	b=LzJO8Z36t9eWsQJZllg/dwSdsN6aTJrxajHqQdQlTNgIzJL1kidt2M+VXeDWm8e/U8QH
	 GarqkWO4Akk+IAcgK826+9ggxj09i21cPkBx+wIzWB773lmOVn11u8vBI0ITLqnVBxYjB
	 ZNe857f5KtoYfs5eq7Gs4neclUYAW6H/ql67yC7RfoDUTmPf6NIB/OWNzSSiLepuWL7NL
	 zK8dzWGUrm4VIpzMS/3dIeYhuoIkmbJGP46cVgjEN+We2f4ZTO+/l+7mtTD16a1/WG9i8
	 8NUpJIDC9pL/8eBaWAk6vZ8HgMhjEbnWMvHt4xMIC+Br0TcPoSqc9JfzAfIlZ4A2zEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FMmE5g1sOpByMOfnDKLbtK5O3vhD4LZZZqXjGPprOuY=;
	b=TmFbnn93hicKi3BATaXnBdHlC44fu82beQjH0TbX7nlJVRiUYnmTYQkYmnJ7qwz+nX0K
	 4jtQreIWBNAdty1llqAOYxYSwvXMgNBus3TwSRZ61Nb496/wfEQB33SBblV1QU088+T83
	 5gi9evxNvYMIbsmh/d2kAwiUINaps1LC/vRfW/+nrP0gGHWrNARn0N3tR1uZUD6PCr4VF
	 Xg02jfQjp6zVKbwKg5iufc2nwWNLp59nhdJvwkuzZJeUTNFRIEbnCx6lahMgrFgF+c1Jq
	 m+w4Q+3kuIJdC2zazRC+s5PYaeIc6CY+5BWlGivcZ7MOD0hgUoxGKJx5gMW51dpJfqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yFOX7/D+";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1335E606A31E
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 16:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1335E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yFOX7/D+
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20edd106so787084f8f.1
        for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 09:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793378843; x=1793983643; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FMmE5g1sOpByMOfnDKLbtK5O3vhD4LZZZqXjGPprOuY=;
        b=yFOX7/D+RY9P+xSron+sf1TFlfuwv4D50qjtw0r3vuoBe+ia2AjuzNRB59kZEowRM9
         gBU+6tcBK7zkAMhuetJ6N8AXFhssGGr01+tYM88PEUxD2P4Msjm23EQ8dUO1y7DUIHOy
         hcLxk2WR6yOFnUH1XWetsJj9Xp0hfHwNdQKKacaaVsv2+q/2SJYYXbzXCU9Zub+jhzPZ
         KFm0Ya+qsc9+khbziMh03HleUxdUpj5ZhjyqMW5MvL/ay1DMs1Vv+MSJmwbJRX79+yyS
         eeBfySgLXV/ivtf5RXuBRe8JRxnw7IC5Qz4e9iCMkpO8arl4R+U0cF6PafB612ePnvtO
         yC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378843; x=1793983643;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMmE5g1sOpByMOfnDKLbtK5O3vhD4LZZZqXjGPprOuY=;
        b=TAE6ZOXSQmmj5nDhq3crk2dw7FDw0NoRvdLxML6Bku1SQw8ql87NVXrXOn9QwkdE75
         jm6K3WFHGPD8b8G6gxrqbEERFZGIcY9ADjMpMIVLcQiHs1UBvSImEacc21bNi/F7c3DA
         Hkb8ZDBt6TxYQC3zfHSVH9CtUxh+eh6xsonfjUNFNIOho7LwggRRhDGy5ONLx6lbmc8U
         1hxQ2KKPHm7R8USRsvaLNV8WYAD2QjUKqwJ+5uKl9Hr7pi1kIMoAztj6QPwommAelmMk
         Og+GQE3/5yZe5DyaATjtR2qz+6+DfILHANvhwE++UvRFq5yIglUGrUy2TLeJRkA3/Mnv
         Mliw==
X-Forwarded-Encrypted: i=1; AKwUvBwtfo+z/oMI5V1EpEfkFFC4I2OeWBDYPWsJfc/hgSnAcUZs7h4qVia+4PGr922jjuoxyj0LSEShLdgq4A==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ4ew4cr2pn8VqiWsxMMvfgplEa8EA8dzPVKwX5rGZiDnNCjN3P
	Ju6TSvRgPogwbGt5c7ex0yvhMIzLF+jhLLWUHqRh5hJ1cHMgHpRcNbupBoIGzX/p
X-Gm-Gg: AYBFou1iMqvojHmnWHBL52BPcAR3Fkkd4J779Nl3sXS6p4ahLPKIoEwzXHCA0WKBqf+
	XcoZoKLAOCqU8BQSrqbuT+J0/Edmpjv5ygdlRDYnSp7vmxPSA4lbsGpBVS9csdHgATc+v+iFNLo
	oLS09S95QRvCLx4AZrlIUODVizsQBT7zuOxV34773Y6p97p5MJH9f12CMK9bldNA7R425Vsmxmo
	IdLH8j8ivBRGyxGvFK3Zhh7zXLN48WDH7EKLf9p82Db5pBpuAsFNi8WadLq6GXNLjWOLGvXq1en
	CD/VgSVMufzeZIewjKsJ/Soj4A2VMQsTW5EsIoE/FsVCSHJ1AnEf2wtE7LpMH08pM32055E8/Sr
	jSYpSJsYTu9nyR2rzpUccs+jAtUEXmdz9udXdZl6UOzcX7QndmK3uD6g/NGpIRNNR0x70fM9E9J
	F5T52sMYqpzt9hWD2BUv/Wjy61TBAs93a2spltGtUX+OOMyv4Zlinv9VukXkSXWntRgLfTbVJw4
	m0p0X+vGsO6An6OSVqw7VNsSctAXt/MZ/5wUr9l/W7ZdqtzEyMwoxHjzE9GFae3BHYCduxOypUf
	vEIS28jDuv1fxPK2xEvWNnunWathV9JSBtklUw==
X-Received: by 2002:a05:6000:184b:b0:48d:deaa:4dbb with SMTP id ffacd0b85a97d-48e6e2fc210mr6951364f8f.40.1793378843333;
        Fri, 30 Oct 2026 09:47:23 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm3901707f8f.25.2026.10.30.09.47.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 30 Oct 2026 09:47:22 -0700 (PDT)
Date: Fri, 30 Oct 2026 17:47:18 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Dennis Wissel
 <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261030174718.1f28218a.michal.pecio@gmail.com>
In-Reply-To: <3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 14:56:49 -0400, Alan Stern wrote:
> You can read the login in hub.c:hub_port_connect_change().
> 
> Broadly speaking, if the port is enabled after a connect-change
> event, the core tries to resuscitate the child device (and checks
> whether the descriptors have changed).  Also, if the child device was
> suspended when the connect change occurred, the core will try to
> resuscitate it by treating the change as a wakeup event.

Thanks.

For USB2, this seems to happen if a reset was queued before a brief
disconnection and executed after it.

We believe the issues reported here happen when a device disappears,
usbhid sees -EPROTO and tries to reset it, then the device comes back.
But what happens to a device that reconnects during probe doesn't seem
to matter, as long as it ultimately gets probed (reasonably fast).

So I wonder how important is this feature and what motivated it? Are
there known use cases that depend on it? Like devices disappearing
mid-operation for a few ms which need to have their state preserved?
Should we worry about things breaking if xhci-hcd begins to act like
the device is gone: ESHUTDOWN completions, ENODEV on submit?

And if this happens to a hub, can we rely that its children will be
freed and reenumerated, or may they also get reused somehow? If they
can't, are they guaranteed to go away before the hub is reset?
(Because that would be convenient...)

Regards,
Michal
