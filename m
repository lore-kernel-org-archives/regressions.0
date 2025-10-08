Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5081991D4
	for <regressions@lists.linux.dev>; Wed,  8 Oct 2025 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759955656; cv=none; b=WVgZt4KMAscT/U/DwBNsQ30g+tvgrpapDZ8HU5oFaVBpUej48I4tlsI+DtuKIbaYAGW0VXhWUyJ3BYSovnqoH8QDks47fxIEkzJuQe2ltUmaKCTxqAOeohtfc2A9Fvj6Dz/wFMa2bY1bKDcnyCk/cqk+U6bCk1W5FynOAZu+YhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759955656; c=relaxed/simple;
	bh=pl5VCyT11jkjeEtVnb5qzsRg1m4x5kYwoKSGldcdU58=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b23AZCJkUX8VF359+Ifzq3Xl1RQ3wqIJoxIb30prx7wt4/D+UB85hFzl3bA0+/EGdGMpGmU4hBqociqFOw5f0WMC5zWtrFaJFvN2AlXca8f82YVT3sPYsHYBc2/0Qi/oefhbWNT+PAN6Y5obmEKsJTrBmqwo9uC5AFlSheWHUZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNz3qTl5; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNz3qTl5"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-36295d53a10so1866811fa.0
        for <regressions@lists.linux.dev>; Wed, 08 Oct 2025 13:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759955652; x=1760560452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQWAXybBTwMaPBjbavwbV1DmNtun+M6bhE5nxILpuas=;
        b=jNz3qTl5xO1v27GLeM7ncXVa55qrG4MuLXgXdKFHZ+t63KcZ23AlW/ESYOKWknZ7BH
         NPC8F1ffVhnaHvz1aI1EKdL6Kz+roHp37zrQfalsppM41OMIsdwxSF5DpoxaP2bTROTx
         ZOTZ8u5vOVOcwkxKzuR9nlxswiMs74wS9DIkyJ6imawt/Sar7dp3+j8waYKH6AIHa7aG
         DBa10Du+KG4xRMPeOCNY9H5XlRqkZIn0VLfw94lAMDYTuxcsC8zy5Fz6KWNhZkhx7hu9
         OcCY3KiB/rORgjuAALCwv5UDbB0M7MCQp422zbEyj9UUtd4KJktY9ZvgCJrAAjlrfou3
         Ifaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759955652; x=1760560452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQWAXybBTwMaPBjbavwbV1DmNtun+M6bhE5nxILpuas=;
        b=JNl8jySc1wPMfFLW4DPUfOpBaYAQ+41u/N2z1BDeMSFlvcpL0No4+repShYYf215VZ
         fifhNIpA58N3Zc3jfI63gSABPG6kivQGZwc9pAMzWuc95em03FMwiPY/pNsHrJiBsBN7
         4QSQnKCX8Rt8ActoRvovLd+mLJZWqpjCgKzSiomVrRWGeDW2WyC/U7kp9ydUWJ26thlI
         jMgB2SlPMD74WIJUr8k3FRMQM33JI11IKHSYiDpn3QTye3E1lrnLu54JJUV+VHg16Jl5
         KnxBAbhzDL7IhB/cfGalDhiFiRKULw8eBeevtol5SroqwGWCUlNQYX7ubP25fxv6/t7h
         bz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWD78mPg3sQ8a9gh3tUdpJs5fmd40nr84j39OeEWcNYUm3p+yJE/4tUBDajUG+98YTiv1xfjToGQzAVDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOKwCUxmzoy2nrjcgSgkhtNhn0iFndctCcwqJzKITZzD9vzxXP
	oc1CqvZC6wxmXkseVynYUOVrNJgWI6ZR3TLvJx4yMHO3xPXmpVlzMx/3
X-Gm-Gg: ASbGncsyxbELpJBjeaVwL6Jjq4y0agNZYHmBMhyGkub4RUoK1VjOSY8JQbKATDB5Y5m
	Yc+mcHvlI0ajsOyUO5TIx8MhlNOvFDC2UNpAJLEQfQDAvlEtNACxusDz7t9SI4MSGlmtO7uy8t7
	xTqC+b97FT2hpaq9mzqM9zSaLPcN0tD4xFU85xEUdXmvyty0+5+FbXf/cf5s4DcFBWtGK7v1RkY
	fFj4Z7L9pTL5qLpjn+I1otUJHoq/URH8LF9vMT2Nv26soJznWfA8kj/JY+6jpWjqAHSRQlyo8sG
	GvLD2Uk+krtLzLkJeG9QhuZ9WMcllu20oqLGRDtpaJX4XcFyGCmTxJ/xyybQNDUEn/X9BCmJiSQ
	t+a1yV26Mxtbh8qPoot3yegYcYyB4tDIHv3w3R6Q1Anc+IQj+7diq2rw6fQ0=
X-Google-Smtp-Source: AGHT+IGJr7vlHgFJAyj2pUz1CAOl8EkX5m9/FUX3ukXnaqWAsipQzJctExc3ig76naIW4NSaYWIxPg==
X-Received: by 2002:a05:651c:222c:b0:361:8f0a:6fc6 with SMTP id 38308e7fff4ca-37609cfa0b3mr14570131fa.7.1759955651936;
        Wed, 08 Oct 2025 13:34:11 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b63f51sm22874791fa.38.2025.10.08.13.34.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 08 Oct 2025 13:34:11 -0700 (PDT)
Date: Wed, 8 Oct 2025 22:34:06 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Arisa Snowbell <arisa.snowbell@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB
 merge
Message-ID: <20251008223406.13f16f19.michal.pecio@gmail.com>
In-Reply-To: <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<20251007231709.6c16802e.michal.pecio@gmail.com>
	<CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
	<CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
	<20251008082055.5646dadc.michal.pecio@gmail.com>
	<CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
	<20251008130532.49922d58.michal.pecio@gmail.com>
	<CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Oct 2025 14:16:43 +0200, Arisa Snowbell wrote:
> I am back with the results, kinda struggled honestly.
> 
> So I tried finding the PCIe address from the good kernel and that
> didn't work out, it disappeared and on the good kernel I have 5x 2.0
> root hubs and on the bad one I have 4 of them.

Looks like xhci_hcd fails to register the USB2-only bus at all.
You probably have some noise about it in the log, try

dmesg |grep xhci_hcd

shortly after booting and you should see stuff like:

[ 2.843799] xhci_hcd 0000:0d:00.0: xHCI Host Controller
[ 2.843811] xhci_hcd 0000:0d:00.0: new USB bus registered, assigned bus number 1
[ 2.899808] xhci_hcd 0000:0d:00.0: hcc params 0x0200ef81 hci version 0x110 quirks 0x0000000000000010
[ 2.900068] xhci_hcd 0000:0d:00.0: xHCI Host Controller
[ 2.900070] xhci_hcd 0000:0d:00.0: new USB bus registered, assigned bus number 2
[ 2.900072] xhci_hcd 0000:0d:00.0: Host supports USB 3.2 Enhanced SuperSpeed

followed by a bunch of "new USB device", repeating several times with
different PCI addresses. One of them will be the broken controller not
showing in lsusb and maybe something interesting will be printed there.

Once you know its address you can also try to bind the driver again
with dynamic debug enabled, which will print a lot more info.
