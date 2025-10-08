Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F882309B9
	for <regressions@lists.linux.dev>; Wed,  8 Oct 2025 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759914177; cv=none; b=rTGRmZgdsNZpGu90B8TprXiXmU7AmlU9nUhJHlUnCRRVa4fhsz1tRXk15Nt3nZRBCi2CrGI9a9IO5IAGHirgg7+HtLGsgAVm284WmVSnbjW8JEquqfcWY6neqnx7Z1Ywb6gh8EX06Iu3eujYImpn4fdkjtWpyFfCDINxbkpzTdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759914177; c=relaxed/simple;
	bh=kF1TctwsFK2boTjPaOPq4WDnTfl9gvF+EoHMxWRsNws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GiESkJgJGZ+hh4Xt89RieYYyYxDT+IkP3fFOFG6aRpSLw/gTHzwuXia9OanSlHqw5jReYMSeNPEWDZPpDgaWFJekAgJ1laQ+Swur0TwqP1CE98Mb2uWdFYT3zZ5dBh22t32NrjVhlTbSxGdDxVqcDpBOED62VVutUfBpWUvknm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fgdzdeos; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fgdzdeos"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54a80b26f88so2739471e0c.0
        for <regressions@lists.linux.dev>; Wed, 08 Oct 2025 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759914174; x=1760518974; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UNISjFhZVOyxNmzWk6Oc8rzemD97BELUfRbJibpGUYw=;
        b=FgdzdeosdOAMsO1kQJKT4UiU3D34GIAam6fhJS8rFdUgAlO2A93YnjvaI9hpFuL+D6
         ggYY8pEDy1CkTPSEKA67Ex5ulNOa+HG4LIj6g11pqLNLsSYS4F7erpKtjuSor4F7fNDw
         KM1TyPBbeLHA1sT1q5zAfgsER5SZNOZ6FmBZhPIVLaZ0KE1PVCSU3A21dWdfsddo71mg
         pI0hJGxmgmIq+khMYlcYz1dInWk9NSrNGbyim6FqePwxJYZGqOuOQ8p1raoSz83/zz/n
         YuSSIn14wjbEDCaBOF3RW0Vv+nVC9G8Gi8WSSqoKnSUFhh289+LizudBFFRRGE12beYN
         p17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759914174; x=1760518974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNISjFhZVOyxNmzWk6Oc8rzemD97BELUfRbJibpGUYw=;
        b=pHwYv+7STpnMDm1QO3M0MqUg3ar8HQ3xiB+yfy8lnf0hUH5UPTg4q2ym8a14CwYJOw
         G0oz29IV9XWoezyFkE9nlqw79t0BB26stJKR4Ex+1v9vksM6N3WxxESiWzCw+b8bm1KF
         3EumBk1t0u2Ji7u4x2jf8rIkBiLYTbkpCoWn5H3os3CGF085fk4j2NLXkJbQTA0cI3wg
         l6g7bJpAelPL+atJxE6j+G6eC8BOQ+z18+ilaFuBw/Zq6yfUvb8AjtwDzhiPoeGWzQjp
         0Nxz+roZli+JiF7osjTGHqBL/hADKlMtb/u/5NR/+uO1gTVyIBne04sbWor1CKG938eq
         O8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN55K1U9IhtGrdQ4JZkcU4P70DSWC9SxjYY+5HvmzpZQ+UNLcvHKLu05s908gddpP0kkof/ZGe05Rgsw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt+geWQQRgauGzohxzqBgTIwd7c+slWTiaYnppoJbzzVb88SQi
	gpAB/cBbzehUiVRMsf6YsBpZIZwi36OVkY4E50zPyJpXtPE5AuUozzssp0pW1NBj2igWb4UfT38
	ZMQfpYMoHswXTs8ojfW9pirIO9DLs9jM=
X-Gm-Gg: ASbGnctAGUFcXvV/tT7uP3tMh8F8LSrtuF0kIZywOuQpg1SwsbsvWH9nyh7PoqGg1ir
	i7arLd2CyFIqAYRIh8oi5MOTakJhd6ItRtnJtwH2Arj4UL/73E8ktxAv7jMAxkFPeQi1SryIp/x
	0fkYopJYISEEAtrl3GWqQjbYNxIN3RcJ3waTaMyiImCMvO4ua83P/yRPA0Y7EUpE31uoAfwDuup
	wJ1NhVBWEC3kLILw5RcqBU60ClQMsA=
X-Google-Smtp-Source: AGHT+IGXBLTVg0GZ4k7Ne4HnzkIHCspOdJBHBxUkydXCzxxJtFtgkwkOq9pkNh3HOnTuK5M+tBY6pKsALsEm8wucb/0=
X-Received: by 2002:a05:6122:1d04:b0:54b:bcf7:69f5 with SMTP id
 71dfb90a1353d-554b8af1c5dmr923583e0c.8.1759914174573; Wed, 08 Oct 2025
 02:02:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com> <20251008082055.5646dadc.michal.pecio@gmail.com>
In-Reply-To: <20251008082055.5646dadc.michal.pecio@gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Wed, 8 Oct 2025 11:02:43 +0200
X-Gm-Features: AS18NWDS6Dn8ycOWuXPvCmeT8vfwMyrjN9hBZW0G9KxUQ0-xsrdIjuyKmIj-qyM
Message-ID: <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	Niklas Neronin <niklas.neronin@linux.intel.com>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Morning,

> So the issue is that there are some USB ports on the motherboard where
> devices work when they are hotplugged, but nothing is enumerated during
> boot, correct?

By testing a little bit more now in the morning I found new information.
If I replug in the USB 2.0 port, no, it doesn't work. Only if I plug
it into the 3.0 port.

> Are all USB-A ports affected or only those limited to USB 2.0 speed?

From what I can test, yes, seems to be only USB 2.0 speeds.
Tried USB 3 flash drive and works on boot, if I plug the mice into USB
3.0 it works.

> If you look at hotplug notifications like
> [    4.612030] usb 18-2: new high-speed USB device number 2 using xhci_hcd
>
> the first number (18) is the USB bus number. You can then find the PCI
> address of the xHCI controller by looking at the root hub (device 1):
>
> $ lsusb -vs 18:1 |grep iSerial
>   iSerial                 1 0000:0c:00.0
>
>
> Can you reproduce the bug without rebooting by some device
> and then reloading the xhci driver on this particular controller?
>
> echo 0000:0c:00.0 |tee /sys/bus/pci/drivers/xhci_hcd/unbind /sys/bus/pci/drivers/xhci_hcd/bind

With my new discovery about the issue, I don't think I can do this.

Thanks,
Arisa
