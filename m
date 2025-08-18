Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230C48C0B
	for <regressions@lists.linux.dev>; Mon, 18 Aug 2025 21:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755551471; cv=none; b=nnzscybNiT54MvKCBjxB/0Iz9vHvOenMJwsmvkg5b9cQY+FY5Za1M0KJQlet0I0Ra/L2xlbw6nD7+N60oBIe6RLRucSxzEMlVspsHBxjxLJBj16lARJqqz4dHNi2y8yyis+uA8a+lFcEtunxe0HIAuIrAmgJjlGTb0l3Tv9ozbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755551471; c=relaxed/simple;
	bh=UJIyNxUgKpmKm2iPEBk8lYWBVJ6uUVk8tfvKgZYRrW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gajZhETMUATNS3gEczcqveck00YjFV5NEdtxVV2SVZYQQGbicAH8h6bMYErzRZXyzazdgmWRvfuKt8CZWxiKG8taWfAICtdgTIdRisCSZ+kj3X7bbtq0hjFgMZXjjvE2epGCnAYq3okmuliwA21hqXmnaqDMHQ/G7OHA7p3Ia0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBB0dwWz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBB0dwWz"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55ce5287a47so4183473e87.3
        for <regressions@lists.linux.dev>; Mon, 18 Aug 2025 14:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755551468; x=1756156268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UJIyNxUgKpmKm2iPEBk8lYWBVJ6uUVk8tfvKgZYRrW4=;
        b=QBB0dwWzwNBeGopt2VbapbEwrwcprYatAH22/try2wAMWMelnxWOYXT89uVFp3NkNH
         cpwmxnrWpCszDxoCQeiD65CM7rhpkkJ3lwI7xd5OjYF57JYrivld7zjBDsfmbMyIpgIJ
         EzoDP4Hl9THWIq/L47idWlgUmrqU3XD2MBeVLMMGD6aL+3EN/t3bp1RCOL0/quMUZcec
         ocShG985oCH8tna94rmg/WshmvoPyafKE2yU4Z0BoDkr7FkGpbt0sZHzqf4p2PO8GLF+
         2lHsbNN9uu4hG39dR6MIhs5easoYeHyjXXprY/cgm7wuhwi39IzNVVy+Se5N8wPkTKzd
         9bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755551468; x=1756156268;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJIyNxUgKpmKm2iPEBk8lYWBVJ6uUVk8tfvKgZYRrW4=;
        b=BhulzO5Uf+rbu+keSwv7zBQx92ks5WUpY4wd12NVo4RTkT8E2OG0butaevWxAFeoK3
         ptLkbjs7B2vzS0r3nPcfW2tvOm9bLrMGcyLfSkkQRsk+Z9d451l3ru6JoF24QoTkwOCx
         bzO/NkM89X6MZ9eM1jiGkcIIg9L3/+99zJQq/8PDXMmrfk1/fmPRpOyd+xwS847mYjiF
         gUq+lZq67cPMhCXNqz1vChTQ9n4Zr4hXNCgpWs8tUFiN3YiQ3Xm0pt9Ss/OahnBJrARS
         WPu8YsFR5GB+KpdkvyR/Ct+UBQw0Q+h21wt02dSwKnTrPX2B1H0KCjxpXhggiBG+X2nw
         gtnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWROz/MTbq8e6F9WHlOHrsmEntkN4VL/CM0wLQv61PMzPbUj/1rCSBCjZ4coihZDp+o5Fc2lezPqo9BAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4ysavZdX3L/VUp2BNieO3R/eSA8J6EqTNvrnUeDQvrzX7TuJ0
	cXy7HsEZQi3Ss/Vl/qV6WSPLGf+ABb5ltVsQ2gPWTA/katPipXqyhcM7
X-Gm-Gg: ASbGncsiyQ6E5TF7+I+GItub4jurQuBJlV/qSnLtNpDLaxtwZiF3EYhDL/EgSz+5aaj
	xjs0E96sNVj/fGXykaFSCXZTFLPt4Ph0jjwkavkEXCfoh4KRS4rPEsEBzKN3v7fTekEieGlU4yE
	ySyu7gXW3YirhsBTUy7ySoOaPMDl0tGvU/PiNVYQZX0CeFLvrEe1iDOtNEflr2UlOrNHCJO0Ej0
	w3SBXL7jNMy8M/ov1Iu90jGmS+F0CXILHBZRoEA+GcSuQH1pvPpsR4ERObK/hadeiFzC4P8HR1E
	G/mYuadgxchR1AXDy90HtAgmwiG9Y8GOo+zBpxp2CzhZNyf/e1hU7J24S31QhKgPv7u2oOwuUna
	UFgFGqBWIpdURf4OfVsyWRwSNeaAYIqbEmOE=
X-Google-Smtp-Source: AGHT+IHyb1FrQPxz3w4i0plT2sVm/OSdfFLcWlAkcbyUv9AoYYMZUyrDcNr5CaZKgQX06WcX0WerHw==
X-Received: by 2002:a05:6512:3411:b0:55c:e5c3:1a44 with SMTP id 2adb3069b0e04-55e007db76bmr79328e87.48.1755551467880;
        Mon, 18 Aug 2025 14:11:07 -0700 (PDT)
Received: from foxbook (bfd208.neoplus.adsl.tpnet.pl. [83.28.41.208])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a41d30csm21776721fa.7.2025.08.18.14.11.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 18 Aug 2025 14:11:07 -0700 (PDT)
Date: Mon, 18 Aug 2025 23:11:03 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 regressions@lists.linux.dev, Christian Heusel <christian@heusel.eu>
Subject: [REGRESSION 6.16] xHCI host not responding to stop endpoint command
 after suspend and resume
Message-ID: <20250818231103.672ec7ed@foxbook>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Two Arch Linux users reported that a suspend cycle makes their xHCI
controllers die since the 6.16 release.

Link:
https://bbs.archlinux.org/viewtopic.php?id=307641

Posted log snippet:
Aug 16 12:12:53 talc kernel: xhci_hcd 0000:00:14.0: xHCI host not responding to stop endpoint command
Aug 16 12:12:53 talc kernel: xhci_hcd 0000:00:14.0: xHCI host controller not responding, assume dead
Aug 16 12:12:53 talc kernel: xhci_hcd 0000:00:14.0: HC died; cleaning up
Aug 16 12:12:53 talc kernel: usb 1-8: PM: dpm_run_callback(): usb_dev_resume returns -22
Aug 16 12:12:53 talc kernel: usb 1-5: PM: dpm_run_callback(): usb_dev_resume returns -5
Aug 16 12:12:53 talc kernel: usb 1-5: PM: failed to resume async: error -5
Aug 16 12:12:53 talc kernel: usb 1-8: PM: failed to resume async: error -22
Aug 16 12:12:53 talc kernel: OOM killer enabled.
Aug 16 12:12:53 talc kernel: Restarting tasks: Starting
Aug 16 12:12:53 talc kernel: mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
Aug 16 12:12:53 talc kernel: usb 1-5: USB disconnect, device number 3
Aug 16 12:12:53 talc kernel: Restarting tasks: Done
Aug 16 12:12:53 talc kernel: random: crng reseeded on system resumption
Aug 16 12:12:53 talc kernel: usb 1-8: USB disconnect, device number 4
Aug 16 12:12:53 talc kernel: PM: suspend exit

I tried suspending my PC packed with several xHCs and none of them died,
so it may be hardware specific. The log shows this Intel PCI ID:

Aug 16 12:07:31 talc kernel: pci 0000:00:14.0: [8086:4ded] type 00 class 0x0c0330 conventional PCI endpoint


A bisect effort is ongoing and c0c9379f235d ("Merge tag 'usb-6.16-rc1'
of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb") is bad,
so that's where the bug likely came from.

Any ideas what it could be? I have none, looks like it may be another
utterly unobvious issue from a trivial cleanup patch.

Christian (Cc) is the Arch package maintainer helping track this down.

Regards,
Michal
