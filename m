Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4B9388396
	for <regressions@lists.linux.dev>; Sat,  8 Aug 2026 19:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786216703; cv=none; b=dkk3BhcdRSq6qnqqvkeaNWY23vCXp9X2uPurGzup6NjJef/FtIkoWbtXzWkArRsMp0jDz2fRBmoIklM4jm45CJH0ulZpNrqeGuJ9sNnn+pyYUTjqLcuy0YecHkYxjDqm0OHxupo210gbwAj+QvReoNW964k78b58igKehqcAG88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786216703; c=relaxed/simple;
	bh=kItp9Z1e8JBemDwqeOPjo5Xxl2mgPRr4PDK1h4h3tHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsE98Rh2Qt7ssO7rrPRtD7y7AI43zeu5tk2MoXRbqYFDmmIhv5pbJOy3zavgw8EuNLne/MjM+DWbeNb3cn+q1t1Ku9Yg700EbcFsi6XDxt68cTQXxwogzgMbJhIXLMBlz7SSIZAAiHYpBH18Kpou/NPdbPYKhXdSSO4VgUtxWV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CoYlmFy8; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CoYlmFy8"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9063b380982so7432746d6.0
        for <regressions@lists.linux.dev>; Sat, 08 Aug 2026 12:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786216701; x=1786821501; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rLFxNt6cekVDYhRViYWogX3gp+Zn05f4HEhIaap8PSo=;
        b=CoYlmFy87FTfI4/Ao1zcpePLFFVvliemVXS6HAlddiasKy+8C6ni7ghOF4o27Unw3D
         bJKP0RPTJKxz6eNJ5DcJBXbXAZ4teymC80Cb/uj9noEsHC4vvHbLe58QbcHN2y2lBFaI
         1Y04XKGBcPhbScQMm4BaPS9OJEF4TmcuVoVK6niXazvhQvqM2+I0AU02UgqQk8fUTfI2
         eFarHQXa2ZPiKhGxW5tzaZHg5BLLMddP+WJUSR/wsh04l9zUFxUIQMM4N1FdXskixIBm
         oE1M7e70UFJ6HMz5iY+xGr6OpK/jZPy/2KUNNt+a+mHv3dpgMx9Eom9RhIg+3NOPV6/p
         I3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786216701; x=1786821501;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLFxNt6cekVDYhRViYWogX3gp+Zn05f4HEhIaap8PSo=;
        b=F8eMv1pcPWeyOW/GtStGOqzkh8N7r7I7RYtZs/Wxl0jZxrYg2kHtnZJ/gsn6sNuLqU
         jV65WNmgmcz4AjeH2cEg9FcPeueEdMxnpdHq3MMJeEmf2rguB5V/LIGTjZupvXXLPj6f
         /6gMTHK+YigP+SV9qISBWDIRKa/oQ14mlGmzfkTiMQX6+gABoJgWA7PP56YmofeLU3wE
         dsuaCN3ne92ddzdpa8rbgxueYrWuzLHq0Hs1Q/Ob1y+4gaxxE+yBQneRgYuGpvxX4RCR
         pxPrX6etl2HahBI2pLXnk2ScB0EWkKTby6OQCbc7VFqUqCyHB0e+mu462lNmoX0pQoO4
         9zNw==
X-Forwarded-Encrypted: i=1; AHgh+RrHBLxB+aFSB4U7PdUeXMbJ54oA1HTJAyjAdGvTO7vymx+wcSpt6cfWhycZCtPkwjS2lpwBuq4VIK/f2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFyi9iFfGpzOdwz3zBOcGyPxlRDLdOdX/Fb+g1Au6N0mjvbeMJ
	qeBma/K3Q2mMzMpmg2J4CuvVZHIBZCTgI1zpF+T56dhNqcXrZWusd7oJ0zrdRPKQ0Q==
X-Gm-Gg: AR+sD12iVQx1cf9zmmm0eiOpogPZQ0xZ6PTKuhUOk497vFbaRVQcwBNpbFZUAZd/sAU
	jkW73Ygi3BFOaoaMrWnLYkVvUi2CK39OZOo2glcLmWyK1sXtVIh0aTOWaBloJ7N2ikCzGJdM1/6
	+wKK5tJ/LBWFY+RGvBT7PA9IzGzNtkij8wY/NHhGSHR/6Q9aMhNgCr6nroGglO0j6XI3iLOmfOP
	SuNP4Flf95ptWQ19bUVDaEC4ucl2EOoIDmnwRaWvSiI3hv6jK+HZVXzIl5L8OywsjNBOpp60ZVz
	iQp0UGqCiW+dzDV8oMJ/Bvtzz3L1IupEgPWPvGBFzW6dKQGTy6SEb5Q4bIcNQ6HqVq/uTvRmbf7
	pUxg3Z2q65pUaCZUQuHZEXj1cLMKQbUIsT6N9WEjZqtepCYgvO0e5u7Jgylw4HCWkV0VaRbnk9a
	7UMbfyKCIAALMhoRIJrB/+6aMNxgqrcEALoC2rZRYjUkDFlXA0QDFWvLYRe6j+uQ==
X-Received: by 2002:a05:622a:609:b0:51c:1a11:75cf with SMTP id d75a77b69052e-52ce5f7ed9emr323594671cf.7.1786216700651;
        Sat, 08 Aug 2026 12:18:20 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff8d1sm36588246d6.25.2026.08.08.12.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 12:18:19 -0700 (PDT)
Date: Sat, 8 Aug 2026 15:18:17 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jamie Stephens <jamie.stephens@gmail.com>
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>, jikos@kernel.org,
	bentiss@kernel.org, regressions@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
Message-ID: <be3775ba-3e7f-4548-aa1b-4710711f8aed@rowland.harvard.edu>
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
 <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
 <anIhyHL4Kl-DX2G_@eggarch>
 <CABWMpWQEfycicrctrW3RD1yNf0rv1ZrioY9FcjoZZGEz4GAm_Q@mail.gmail.com>
 <CABWMpWTn3H7UKqYzr7JP9tkQCEJHsXX-F103nyyey_srn7mvHA@mail.gmail.com>
 <CABWMpWSkJgmoZACA4LYEbmsbEGJMYLyixwv2V3tZbneeKBxpWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABWMpWSkJgmoZACA4LYEbmsbEGJMYLyixwv2V3tZbneeKBxpWg@mail.gmail.com>

On Sat, Aug 08, 2026 at 03:14:38PM -0400, Jamie Stephens wrote:
> I also completed the test with a separate PCIe USB controller based on
> the ASMedia ASM1042.
> 
> The UPS enumerates normally on the ASMedia controller and the kernel
> identifies it correctly as the CyberPower LE1000DG (0764:0501).
> However, on this controller the failure mode is different.
> 
> The device and HID descriptors are readable, but the 504-byte HID
> report descriptor is consistently unavailable. Ten consecutive runs
> of:
> 
>     lsusb -v -d 0764:0501
> 
> all showed:
> 
>     Report Descriptors:
>         ** UNAVAILABLE **
> 
> NUT behaves consistently with that result. usbhid-ups successfully
> opens the device and claims interface 0, but then fails while
> attempting to retrieve the HID report descriptor:
> 
>     Unable to get HID descriptor (Pipe error)
>     HID descriptor length 504
>     Unable to get Report descriptor: Resource temporarily unavailable
>     No matching HID UPS found
> 
> There are no USB disconnects or xHCI errors in dmesg. The device
> remains present and enumerated on the ASMedia controller.

What shows up in usbmon (or equivalently, Wireshark)?

Alan Stern
