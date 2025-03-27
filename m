Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DC22080D3
	for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743064835; cv=none; b=U9LZcMUWYYSaIeuAaExJc98LqSiC0BYxRR8CeF3qIgsUQlltKc95FZleyYvMdgiRiw8bIeX3vrLUPpDStTBkyM666KAXt6GQisbnn/3hzvLI7Dspt0kUFlp8fVlf/mKHdrY5UwVkbKUD+DFBWXMSH2OT81kLq9dkn5c9TO3UWWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743064835; c=relaxed/simple;
	bh=tX45f4SgJzV0BzxhEgpd0/lEHTr9TcXiXqeGEs6DGTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cm/PiF2H0o891LXBvQZNBd+NQqrRjjnl9Qo1ogbK4awlkuHENbqzo2j5mfvK4+nREG0x84/0VD9weXcoEmBZu4g6xGJVZRPNvDguy/27kfymvK1cke0oXAscDChv75JGH5GpIjxRGc7203gWtK+aomo4IbbgiUWnoBp/otR6/4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ojidz8VE; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ojidz8VE"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-52403e39a23so709647e0c.2
        for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 01:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743064833; x=1743669633; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drLMpc31hHP8DJqxvldHizaDERYv7LoBBB4sM1BPDHc=;
        b=Ojidz8VE4prKt3JuyRfKkwdTIFe/GzLDXqRAFVvNFUuqAkfpULDeyRg02MBHOAz792
         VKOaXD9PInPgTFUeU8gVa3NFwpOBSbAR8Lr0bHv2TCJ9BknNyIO2JRzZMDY8f7s5vmg+
         ZPYnBHhm8vnBsyelRBpm36qkcv+vr/Ei2PEMxoeAUxZP4UKY4U6AwkPOkBOul2k5R7vG
         f9PioWlk+Qnof6j7aoT/LVGXmgcaW81BYSQSuVfDKDjKD7dT4irh1OViIro3/Hu3nfcb
         e3RYnbZhnGL4QC4NmcmbSUeaHB6ZW06ItT5Eg2x9k6aW6XKniWxOLQR5ZOrL8fWFfNpC
         0JKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743064833; x=1743669633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drLMpc31hHP8DJqxvldHizaDERYv7LoBBB4sM1BPDHc=;
        b=MRw2cHC9teCdeD33Lyfk3GAias6rrGmQ75Z6GL54WjAXCOoRFnapAUjjRZfnEcEynV
         /p2I4QixHJe1dkiVCwMXoZMPJtxjbpITU1uPQaf4TkJA5gP1mSjXlWpW9Nl/LPJkOQmn
         RiMZluuGxeKm1BsNF8vtCBjgM99zm4qwf5wiOg8UCJIUAZ5EX++i3bohaHoKEZVgC0Rr
         D9E6Ma7t49WsCiOZJe6PoK1w5U0EqIic92EjvGJWlkY8O+3iXdPh95+5RS/LwhXyJQOW
         qLtQAvOlGT+BhXjFiqt1tp9oa2R8ycQ4725mawJbe0RqiluINqVRQ2T0uMoq0HwRGGAj
         dF8w==
X-Forwarded-Encrypted: i=1; AJvYcCVXbKGkn3toLuOAOlrGfvSUFHerH7N0JpOFq7occzesbb4zWYPUE7a6U5FvU/FbrujYuxG7NNNhAHDAxg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLyIrSOo8sqOTvQTP3wxxVW2kVCYJdfTY1ygc+ht5pHq2qaRgJ
	0ThmNMWptCs/zJnsDWHTSc+T0xLHBJBXbfVc3VBKluOqsmUp5WmeHz4KjeGE2lZnU2TeTvkFOY5
	MR8LY4GKC7gFXPjoNhpYx8341f4PChIyJSgRQMA==
X-Gm-Gg: ASbGnctKQanXuIdYFJClhwtPSKjbZlhVppauSUia1EHzJMAvrxsQNNYv1dV49AJIPzI
	tFK+qVMlz85PnftknniCIwOU7MvlgWMftWH9NU9QA8/VDtO4p3CeYx/U6fPt0PnCBQgUvUV6ij3
	yBL9hMnuTzW+syVu/xz1v5UliowepmwZg17sdpzuAS7hEXNCvXkg1MGWpkPF0=
X-Google-Smtp-Source: AGHT+IGOGcjqwfMP9mXiNbxB6MtctF0dET/SKTnUAdsnVBHT+F80EMzrMsZihZOJ8DAzX0n8EDiMCpkMZMySY3I6Ims=
X-Received: by 2002:a05:6122:8c02:b0:520:9688:d1bb with SMTP id
 71dfb90a1353d-526008d082fmr2054719e0c.2.1743064832775; Thu, 27 Mar 2025
 01:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYs4-4y=edxddERXQ_fMsW_nUJU+V0bSMHFDL3St7NiLxQ@mail.gmail.com>
 <b6df035d-74b5-4113-84c3-1a0a18a61e78@stanley.mountain> <Z-LDdPeTsnBi8gAU@macbook.local>
In-Reply-To: <Z-LDdPeTsnBi8gAU@macbook.local>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 27 Mar 2025 14:10:21 +0530
X-Gm-Features: AQ5f1JpOCRetHukvs6jfAS61Q6C2j3250sLzDARLwQB5DraQTDosJm5QyiXZRkA
Message-ID: <CA+G9fYumyaftJ9FaK+74g5iw-v9RV4qDT-SLg1XGk8G7ub2EXA@mail.gmail.com>
Subject: Re: next-20250324: x86_64: BUG: kernel NULL pointer dereference __pci_enable_msi_range
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, PCI <linux-pci@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	shivamurthy.shastri@linutronix.de, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Mar 2025 at 20:23, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:
>
> On Tue, Mar 25, 2025 at 04:56:33PM +0300, Dan Carpenter wrote:
> > If I had to guess, I'd say that it was related to Fixes: d9f2164238d8
> > ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag").  I
> > suspect d->host_data can be NULL.  I could be wrong, but let's add Roge=
r
> > to the CC list just in case.
>
> Indeed, sorry.  There's a patch from Thomas to switch to using
> pci_msi_domain_supports() for fetching the flag, as there's no
> guarantee all call contexts will have an associated msi_domain_info:

Thanks Roger for the clarification.
LKFT started noticing this issue on the Linus Torvalds master branch from
March 26, 2025 at git describe: v6.14-1979-g61af143fbea4

Anders bisected and confirmed that,
  # first bad commit:
     [c3164d2e0d181027da8fc94f8179d8607c3d440f]
     PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag

>
> https://lore.kernel.org/xen-devel/87v7rxzct0.ffs@tglx/

Lore report link,
 - https://lore.kernel.org/all/CA+G9fYs4-4y=3DedxddERXQ_fMsW_nUJU+V0bSMHFDL=
3St7NiLxQ@mail.gmail.com/

>
> Regards, Roger.
