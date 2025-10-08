Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437542F6590
	for <regressions@lists.linux.dev>; Wed,  8 Oct 2025 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759921541; cv=none; b=NQ7A/lm8nGKH/qUji24JSRxiv3dvTCShv/FsWwl88J9vQrxNlfSRrPi1NOEkwSQe/l73AOpZ3F2eto+NAX+2qO1a+uw/ok+xfzGtXr/tsvDugWQ9kPKaqA/596PoBk8VmFZk69tKl/hlir/wXCGZaw1tHjobA0mQpCqlcJRa/Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759921541; c=relaxed/simple;
	bh=MCLypvcUCqxCSri8y0hSV1zE0FDlcOv6mg3LlxDDUMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sxliY56LxmXvPyjKH6XVQmDSUo//mdHhD89MPki+f8pzOZv+Scc2b2jZPfIbEzX5ULs3j8QWTo7kVXvIp/XQYFZnxAwtva9ZOrGHUf+ApQpi4VQDKZTYCeLJZse1jeykXilGY5OjecmSMEQqbYsTji/dLjiMqKeFaD1ZjeQ1NxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+xw+Bqh; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+xw+Bqh"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-586883eb9fbso2715856e87.1
        for <regressions@lists.linux.dev>; Wed, 08 Oct 2025 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759921537; x=1760526337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cunl60s02zzCAri5rtMP9EOgINzWgkvKilD9GCJH0A=;
        b=A+xw+BqheKmM6naGFWAfaWBuqn/qUfNqeDvnWs6wsyLY6PO2aPrbo9s6LWqr+MWXcw
         C0NWyrK83QR3p+gopsoySalEdrT66SzomqKhex/HXAhkO2VjcsjdyqL+IogfMnX54Yv4
         Q0GWI+5EszzB+HWdnvHJWBhJQSivxEGsGI83Gx5kajD2lENMDqAskwaV3Y8iU/S1cmoP
         0UvPAT5NYxrF0CQn088mxu4MBYRLKcygKuKxf7YucUrNv4xTmfw+cQu1/kNpBCtTyDq/
         4QuiPQyoEGAejiuTlaeFtc/jonw+atnFy8mc8Tq+7ppuh7hReVlkKvhH5f7esf89FrR6
         95fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759921537; x=1760526337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cunl60s02zzCAri5rtMP9EOgINzWgkvKilD9GCJH0A=;
        b=QxvzzdQpj7pd7A4bKYtznfOf1/SVbxJ9+TKmG+vdyTtWo2e/X65TaHJzMd4CWpvr3l
         t/Jr43hTEzcaa22utlpFVRCzlVC/u6on7Bn4CU2WCS9BBudD9U86s6lAUnvppSdw8Xau
         5ZPGKDYup8TOtVOPRhvzFCsYcDN/S7dOplHEPNwSuhng2FMaBzvBMMCqpEngZzxtzwdM
         79Ou9HNFWs5/0IdjRCuJ9d1qWeRpAeljmWxt/ccqBjjvzkRqSelVZ/q1C7xaosZQteFb
         EEbt8EkkCenmXhTz8icypTdNMl1RicNb7m3/3fJYt/Xw1ew3MsUSoI1TlhpmjO7hTIZI
         aAUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBw41SbqbgS8av28BDtJg8+lCyjSyTx4vuPSCJDqQUjlnQ2GIN7uZINUzSQbVYk+3Gvel7v0WN9Vmr3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhzWvQKFUVO4uqgiRNP9qpbxoVHMxEGwJjQw5EMpLP6bgtHVv/
	rCiozj8JtxSFS+leBLmZlFsQ5X/5deFRDjrhw5qbVwjqveWaZyEZPy3s
X-Gm-Gg: ASbGnctqQpRUtsXf8vb4lB7zr247u4tXLfkJcgJ8nLOZBfYq5hpX3o2ezlYOO1za+41
	4iwhZNEeRr3y2bkdBwLLSJVZyq4OZVkTbco2nBwj3ZX38B8JRRYHvIOu+ZCr88lw+hMQeJzpS4s
	ZLbM5P9uaVgokBrMgthOfEurBs7po1Wb2RW4W5/tlZcMZvXJbQ5NCHY9UaUys/v8IFUl6vcIqcX
	TCUMV0KB/7X+6cVb4bQ+dphD0/dseHj4SvKQZdIHyIrmSpghKXQcOXmsWv8rIEWB4hr72cwpMLQ
	ewo+TL5ii6zxORxsQyRTTsOFjPWS+jNd3ntoNJWRJlOJhjCPW5qAeIe/qdyv+Sl+bWINxG2wxVr
	NJNk+sYGdvXFG7VP6b+QQsCr5DvvCHxSe562dzYKoqiC1Ank0O/LGTpCHouXrXWQd1DdlZA==
X-Google-Smtp-Source: AGHT+IFNModo0T/aJEgMsL/aTK9vMSfWaMxSVH2Yrn4KRhEDmybHujoDpbgGlI8aeClWYLTlOMbIGA==
X-Received: by 2002:a05:6512:4003:b0:585:2a9f:8597 with SMTP id 2adb3069b0e04-5906d8ed926mr822703e87.27.1759921537089;
        Wed, 08 Oct 2025 04:05:37 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124951sm7122949e87.25.2025.10.08.04.05.36
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 08 Oct 2025 04:05:36 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:05:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Arisa Snowbell <arisa.snowbell@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB
 merge
Message-ID: <20251008130532.49922d58.michal.pecio@gmail.com>
In-Reply-To: <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<20251007231709.6c16802e.michal.pecio@gmail.com>
	<CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
	<CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
	<20251008082055.5646dadc.michal.pecio@gmail.com>
	<CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Oct 2025 11:02:43 +0200, Arisa Snowbell wrote:
> Morning,
> 
> > So the issue is that there are some USB ports on the motherboard where
> > devices work when they are hotplugged, but nothing is enumerated during
> > boot, correct?  
> 
> By testing a little bit more now in the morning I found new information.
> If I replug in the USB 2.0 port, no, it doesn't work. Only if I plug
> it into the 3.0 port.

Interesting, the patch was tested by people who reported the original
problem (empty USB3 root hubs on USB2-only controllers).

Please do this:

0. figure out PCI address of the USB2-only controller, possibly use
   a good kernel if necessary (but PCI addresses sometimes change)

1. boot with some device on a USB2-only port
2. echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
3. disconnect and connect the device to the same port
4. do the unbind/bind thing on the USB2-only controller
5. echo 'module xhci_hcd -p' >/proc/dynamic_debug/control

Then upload dmesg.
