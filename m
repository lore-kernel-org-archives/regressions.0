Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F0D3FD969
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 18:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785869775; cv=none; b=EsA3n8Z1cewAc6sBUnCvuUvKqHddhblR5NeTonqcJBiw8QckfthinkCYowxgeIp396uHOkO9nHztbnb8Bc/ix7hZsvyVTi+eMF+3nb95sYoZd6kUAQahNCyT8o/bHSrxQwLbScUsmLkvgLl2bjznOh6hbNSzpC4siYo7wj16cMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785869775; c=relaxed/simple;
	bh=r9cidioRLvGUYzfs4Zyd6EFYb30JbstKdtKisMEz5nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0o6Dap6C13C336hQNzOlHMP/TAiGQvJ4DFohxlx/COh/W1kL9Qb6YcSs745XnSmrS9UuL961FNT4w159VvBgzF18JRdLCzzsMp3EI96SzlkmFeCxVt8wyF2gzCkggjF9oE3gpKKAR+8Rrg9xxRm4/No605kWYvpBy+QTJAVIEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIMU7HIx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIMU7HIx"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cad8076b01so2449865ad.2
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 11:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785869773; x=1786474573; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mTSTWCov6kNGaDYzEBELBFA8avyhvK+w+2YbcE7eTeI=;
        b=gIMU7HIx0BSYWyeaBxXr+lks6Y5oB2T6PzoKeIMtM+areIpQzIA8xVCjHJ5/Z054Dv
         w1Mw6ZgUTvloAsnivN17NPefEsGI3tJYWFVsruNj98WL4b/eX0FLdklFyJdDwOnST8Ky
         ODz4Zwvzyz8QMzUhnppXsrOYUfo8r7u4MHkmUSRjTBQ0+DHFyAmln8eLDmvZz6NU6zst
         v1HUwgDISwLXzCynlItT2YqII2BamFFy96Mw9BokVTlOfLXo2zK1nMP6v1rdGmP/IBkf
         QGltTvz4jNulg83pSSkky3chKvzMYjcnDpLFz5nV55OuTuShGF9fb+EfRQLgAo/nX4Su
         77pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785869773; x=1786474573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTSTWCov6kNGaDYzEBELBFA8avyhvK+w+2YbcE7eTeI=;
        b=QueQvKFUkVcMt7efEJcmHeGjskDa9q34nSQ8UhRdV5SDUQVXjFtVXuZI/N8b7uRw8p
         fdMM5Yk94zn9TuiVAVaNwKBnhgGm0sw1opXt2Q++TUOG6SCazgbI9ZTLbZ8m081UVNny
         TCACY+Q8wedTa3AlyrQjDPXqPtdYkCT/8wd/G6rwx8jfg6hr+ueiId3IeEqDeCr/W0sS
         fap102UHtZHpCE0n8Y/RrbA+FKwTQARsBNt5d3aHg+XBWvUoKywh0Y9nar7BCK7ISeSN
         rj7gh2WuuWdtCF2G/Sn3HunFNfwkVd3OzMI9x+sXoQXR2xrO2D9YQtIx6XYj2Q1MvzJw
         SGbA==
X-Forwarded-Encrypted: i=1; AHgh+RqNSmFvN7hVHSbKZWxUC8NTjN1DyygHMJgKqSvt2zRgZM9lUTDPOcDQ8qewbBsuQYZDe2g+D7zc6Yx0uQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3EUv1Squ8uS795TrgJDI6oKLLx0Ev0mL1RTtQTIp4rTmEOMYv
	5XOmmf9v/ZLIURxRBHUbGvqAWOOZRVgs7AQskMYOUpwPne4HudOj7CXB
X-Gm-Gg: AR+sD10dpU7V57Ni7sl0cd051pNb3PR6OKPsrGVLQn0P2eDhtnfDswm3Of3zO36QWPn
	PXGWdjAaiXk82b6m51CdgZUWlDDnl/qGrPBLk9NB7O2DHPX8/kZjg2QX4VgN83wevQtQlDpx1Zo
	cEueOYX7tYalk957wQSxYFu9UMZiw9+5lOUqmtXhqljTEPDq/OagU46TTBZaG1G6mmNm4xaea1P
	44hvQwQvYBwncvVBy1aXUXH6nnqIbPcHZ87Z5hATMWsttko7+/VSBIoeJ7wDiAxEuvY9i1J/H3n
	3Yt5iBxmO2YQX2nO6gyzMWI++x3x6U/YiStS2eB5PhRhB0DjwB3EjtvkSL/Ak/QNU+rb7jPx4C1
	z7jf3+cGrIEesMFDGAFBQeRH1+9J5boQc2SnPWuEm8696zdM6sLgIY0ORBj3sh5UmbNIBrYTCoK
	m/Klk84owV0WGDT7vxfNvmbyhTp3R7JcD8UcyJEULVEZ18duvv6qxhxvllW5lRxMKpuyy4Z4Pow
	ERgKZIgaUDsobo1P+L+Pys4qY6r9P1km53Mgdw9Uw==
X-Received: by 2002:a17:903:2392:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d0cc930281mr4087045ad.2.1785869773407;
        Tue, 04 Aug 2026 11:56:13 -0700 (PDT)
Received: from localhost ([2409:40c4:2007:21a9:9627:a686:aad0:561f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b761asm11792932eec.1.2026.08.04.11.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:56:12 -0700 (PDT)
Date: Wed, 5 Aug 2026 00:26:07 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Jamie Stephens <jamie.stephens@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, regressions@lists.linux.dev, 
	gregkh@linuxfoundation.org, stern@rowland.harvard.edu, linux-usb@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
Message-ID: <anIhyHL4Kl-DX2G_@eggarch>
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
 <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="iutcx4g65ls3ovlf"
Content-Disposition: inline
In-Reply-To: <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>


--iutcx4g65ls3ovlf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for the report,

On Thu, Jul 30, 2026 at 03:28:02PM -0400, Jamie Stephens wrote:
> sudo lsusb -v -d 0764:0501
> 
> reports:
> 
> wDescriptorLength     504
> 
> Warning: can't get report descriptor, LIBUSB_ERROR_PIPE
> 
> cannot read device status, Resource temporarily unavailable (11)
> 
> As a result, usbhid-ups is unable to reliably communicate with the
> device and NUT cannot reliably monitor UPS status.
The lsusb failure and NUT seem to be seperate, lsusb failure could
simply be device property.

Few possibilities I can think of worth testing:
1) It may be related to LPM, the device may be advertising this but may
not be handling it properly.
2) Commit 8020c41b39f5 (usb: core: allow ACPI-managed hard-wired ports to power off)
lets acpi managed ports be powered off even if hub does not advertise
power switching. The UPS may be sitting on such port and its power could
be cycled out and leave it in a stale state.

I'm attaching two patches to see if they have any effect, please apply
and test them seperatly and let us know the results.
And, as per Thorsten's advice above, run git bisection regardless.

Regards,
Lovekesh

--iutcx4g65ls3ovlf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="01-no-lpm.patch"

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 87ee2d938bc0..2c07e1cb7e05 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -374,6 +374,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Midiman M-Audio Keystation 88es */
 	{ USB_DEVICE(0x0763, 0x0192), .driver_info = USB_QUIRK_RESET_RESUME },
 
+	/* CyberPower Systems UPS (LE1000DG / CP1500 AVR) */
+	{ USB_DEVICE(0x0764, 0x0501), .driver_info = USB_QUIRK_NO_LPM },
+
 	/* SanDisk Ultra Fit and Ultra Flair */
 	{ USB_DEVICE(0x0781, 0x5583), .driver_info = USB_QUIRK_NO_LPM },
 	{ USB_DEVICE(0x0781, 0x5591), .driver_info = USB_QUIRK_NO_LPM },


--iutcx4g65ls3ovlf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="02-resume-reset.patch"

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 87ee2d938bc0..8ccc5fc6060c 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -374,6 +374,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Midiman M-Audio Keystation 88es */
 	{ USB_DEVICE(0x0763, 0x0192), .driver_info = USB_QUIRK_RESET_RESUME },
 
+	/* CyberPower Systems UPS (LE1000DG / CP1500 AVR) */
+	{ USB_DEVICE(0x0764, 0x0501), .driver_info = USB_QUIRK_RESET_RESUME},
+
 	/* SanDisk Ultra Fit and Ultra Flair */
 	{ USB_DEVICE(0x0781, 0x5583), .driver_info = USB_QUIRK_NO_LPM },
 	{ USB_DEVICE(0x0781, 0x5591), .driver_info = USB_QUIRK_NO_LPM },


--iutcx4g65ls3ovlf--
