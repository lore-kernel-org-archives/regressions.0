Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BBD190685
	for <regressions@lists.linux.dev>; Wed,  8 Oct 2025 06:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759904465; cv=none; b=ZX+mRjpVj8Jupv/v5u/iM/7zI1Ve/fzsOLu27m/d05KEa2211r7ssddP+1cZpLw9DpBoeijW89YstcEfYX5UBiwHl5ZD18Y3lZokNxvqJ+6UfId7zcQQxoHZwGpNZIVoVoQqeBC84dDRjnTZqfj0Chgv1/7NKLiWQ8WYJ43nFc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759904465; c=relaxed/simple;
	bh=N126oxfU8CB/Z/KfJJ25j5usrLom9As8SZR0QXbXq6E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BLqYwrEHCsufLPlcP+ps0vTTC7CspQ4vZjnvre39dUm9diw67XMXx5eETN8TdKjkPPzghyE01hrsuS6TtNlk2LVJK/IqFMo+meOjSmsbihc72+k428nvvAnywoEt2+05GYtESWo7YLMyTdO5dQ0VUcDLve+LuaokS3KWsEAuwug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ebo3cg2X; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ebo3cg2X"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-578ecc56235so4587995e87.0
        for <regressions@lists.linux.dev>; Tue, 07 Oct 2025 23:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759904462; x=1760509262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXdeOIlNt41GOXTqIXLtw7txEKMs3lnhagD2W9H46L4=;
        b=Ebo3cg2XrvXLxhBX32fc1jnOxpD7/hWFfWqYiQp1+E224JV/EkH8cUh9I36kxLLwG4
         q8Q0biRqQi0ragI71RUr1HN419r+yMDmwGYttBCsYzhYNofR+HEsRUh2ytSoPim8wJZ/
         xQX4dbJactVFIEtfkHrLQ1o5EHz0eucnmqMPhSLMkO2huDKH+RT7z9uxiLZifEwY8uj9
         hCNtUE1x7eU9VPlQtjHZmP6deFzDvWGPL8QpCxP2Wf9szZzzUZKXpTeZ5Blkae6OG4Py
         0QM6TiZvouoShfrOvcvkeBikz/PZxMNt3Q6sEtx1tbrEgw+Y1FZgYg4F3eqBAiSBKSmK
         GcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759904462; x=1760509262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXdeOIlNt41GOXTqIXLtw7txEKMs3lnhagD2W9H46L4=;
        b=lWbztDB6IQjokMLx5YltNrhSihiZMiVin3O0cW1IJwP8EQpMnEDaa6HKgoOviaWmCx
         zm2Ak0PypkdrWCfJCbdUE1cCpvkl0getq9KPZzSZYKNLrH0qgPGrC3l2g/mos09arVFj
         pSL15vRwpqvH1CpWo9CIfHI9oeNUBSlGN/NxREA2DO90/jTyfN9RZs+nUXvw7voBdZAu
         YqHhN2DZiGaGdiIgIHYyyBgsKpzb2HHrbLqwVwJGVFTXXnTK1w3md1swkW2UYnI7nnBs
         mj2yS1+mIz6C3ZgZmcxA2lHJ0vt6UboSjMe1K54YJr/36d5h7m5Dk+1ANxrwqrYf2jCu
         Tk9A==
X-Forwarded-Encrypted: i=1; AJvYcCUQtl6CsDPuorMI1ACB5XxjjQ0tl/CInwg2KcB/EM0XsY0S4ehgohkkQC79kuyCwXhVbHd/aqQoW2NYjg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFJ7eAzDs5nDH9na1seGXVRzjgLt7zYAXdb47yvM3FD0cTrjzJ
	qaEKIO006irIRXDpFAcnHl5FN9H18K58loTqM7WH72WU8vZPkoUc66Av
X-Gm-Gg: ASbGncttv5L77vjNHS96uXpPWRHBV1xzpvQLcOH5oZMLgbatxBqMC1/KgLk7JsyGdXv
	tUue9or3pcHNPcg90o5j2q3hN2c/+AdCHqnkoJWzy2t10J05nL7ZU2NEA4hBHGXSvrXtfBbslxX
	Yfh0CjOq5BMATKsT6HvtXadtnUxBrgDe2Mj5FOP28ygvmZ5qaDiI42Tb4/qlfony69bTyo5y7Vm
	JlTwcigJouAdtPXq9B2+42LTVd5eVmW7EhVg2JFfHhIsFXPVRaWjGdCnxB5X1rwPpz1bbvNh6AP
	MxrDEJ+SmWFlYUafCpCSAGznje4UOBrdVgglrpxbV2uN8dobkloUzOuSCEBUdsrHXdACWXlRrgS
	83Gd9px1zq+yFiLA9Ic5MizsxHfwRc+IEbZkmL1Wq81VAdGOMjAKDpM5uAoO9Te1pB9iFJg==
X-Google-Smtp-Source: AGHT+IHrUy7H4L08z4Ynpc01XEkFnHjSGub5khCTp8fN/0b+zp5Kbo0V86XJg4KUOk4WoDFiTUAU6Q==
X-Received: by 2002:a05:6512:4015:b0:57b:517c:bf19 with SMTP id 2adb3069b0e04-5906d88ec80mr616662e87.19.1759904461503;
        Tue, 07 Oct 2025 23:21:01 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113f16esm6908182e87.46.2025.10.07.23.20.59
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 07 Oct 2025 23:21:01 -0700 (PDT)
Date: Wed, 8 Oct 2025 08:20:55 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Arisa Snowbell <arisa.snowbell@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB
 merge
Message-ID: <20251008082055.5646dadc.michal.pecio@gmail.com>
In-Reply-To: <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<20251007231709.6c16802e.michal.pecio@gmail.com>
	<CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
	<CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Oct 2025 03:15:31 +0200, Arisa Snowbell wrote:
> The first bad commit seems to be
> [719de070f764e079cdcb4ddeeb5b19b3ddddf9c1] usb: xhci-pci: add support
> for hosts with zero USB3 ports. All USB-A devices stop being
> visible/detected.

Hmm, OK. Copying xHCI people.

So the issue is that there are some USB ports on the motherboard where
devices work when they are hotplugged, but nothing is enumerated during
boot, correct?

Are all USB-A ports affected or only those limited to USB 2.0 speed?

If you look at hotplug notifications like
[    4.612030] usb 18-2: new high-speed USB device number 2 using xhci_hcd

the first number (18) is the USB bus number. You can then find the PCI
address of the xHCI controller by looking at the root hub (device 1):

$ lsusb -vs 18:1 |grep iSerial
  iSerial                 1 0000:0c:00.0


Can you reproduce the bug without rebooting by connecting some device
and then reloading the xhci driver on this particular controller?

echo 0000:0c:00.0 |tee /sys/bus/pci/drivers/xhci_hcd/unbind /sys/bus/pci/drivers/xhci_hcd/bind

Regards,
Michal
