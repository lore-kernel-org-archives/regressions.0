Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3539D1F2361
	for <regressions@lists.linux.dev>; Mon, 21 Jul 2025 21:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753134611; cv=none; b=RtwuK5jUgv0aDF4pq50u3WvJTEgU/2s7P7HUukwe7Q7Jeip4GXYFwK1AxtbkaZo2pxZxXCCT9W19b9d4faC9KMHrXj0PryyXM2rWbwSNqTuBzYuWXa7JlVEJGaVUfodfvtUluGVIyhGbBMmktY8XTcvNEnn2OSWlyI6KV1wNDMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753134611; c=relaxed/simple;
	bh=qhtWDUO4sns6nxCpFEYKNVcTP1ZIn5b3fGq/f+Hx6uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwcDysUI9jop07QNG76GURkTNMT2x7PqM0CzqoTXe2aEm5V5YcyB/f2gOsWKHA/3HZebzuEZ9C76jJztDGa9ZpSvyfCBuQGuviJoTvwuTN+fglO3/iXfo34VPOFH6aeV0lCcpvFit5yyNUrdx+RVdKX0DlwUMUISdoWJYcGMBRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lONL3IaS; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lONL3IaS"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e740a09eae0so4756213276.1
        for <regressions@lists.linux.dev>; Mon, 21 Jul 2025 14:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753134609; x=1753739409; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NjSFTK7/jtmmy4Qgy5FYJA9GOyMmTJFi70ip4qLJxOM=;
        b=lONL3IaS8h955GRj73VgG+/Ys9nBohbv+sojEsk+PtGmzksUhRdByxOOLukZ6MyGKw
         yrxpVw5E6RHHvY00N6/xYO9FXJONgNZLYc8OQFYSjjqnjGoRKmAZ+DfQmx637MQo7i6h
         uf7dsRiTEqtzVZtCSm8lrL0T6v+F1yjaaXnsjYFiVDFkTdy9q9aNBF6uVI4oRodjIpYH
         t1/4fUq/H+GT5lX0xFNQn56t2tH5KwmBp69EaPgHPgmrhyQX2ptD/nT5KzsZYIawfNK5
         IGi451BbfnT5ibdyl/q18VBFT/wCWCAPq1YZ0nUpBheh4+vZ1Zsvz+lFDxwwx5ah4W89
         qVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753134609; x=1753739409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjSFTK7/jtmmy4Qgy5FYJA9GOyMmTJFi70ip4qLJxOM=;
        b=xFiWbJzZLymcgSfWdhZ2IGrff94wsh3i5K6sbGhTiqIYgyCYziKpgWd1u8oEiV4dX9
         YPtK2xiCASAgRFingcM08Cswi/8vC/496Sb+fVXEMzQ//S16zBgkzReX1/p6LzUL+GAM
         Y3Zl04rvX1FPjqYx/rp/SKkgSrq7kbl7PMBv1mJ8iKwtPcEcXzQg3WSSjA70IWDveols
         +jKrIN4kuc2S+qunZ+kenIxo5aDqNMBJpPwvf80xpqaJj1za81PR5ZMZXRT6S32S8nIj
         WTu8iCFVjQYbzNIaeOdf+E6V0EhMv7FG8rduiPj5CAn7cYS1aOPmptBdX0nj1302i30o
         SMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWza438jz8Ft0U9s94uFNM8l/agmeHa6fdjlw9hA2svi07FpsAOk9OWZQQkwYg8duIe9gmS8fGC6lMb+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeSIkX9LjzBo9FTh/ostgCVjyM/1NKBn8qs1VuRDfGfdDgzdSN
	/PtgY8bnbX3gGQnnevzctP3Y2QRfG9tnqX+n2c6d7wDKIlZ8BvSWEKFGo2S/8Ts8kbOXi36TagY
	CDRAN6OCxtDF/UIDONaRP1DK+1HNB62A=
X-Gm-Gg: ASbGncsf1V+FiVcDffKkeX2PdBkjNoaF1z0AZjQBTfDeVV7KvJ3KM5MtW418m7c4U0b
	wFSQOptQp+CyFiP0AttAfm79AT6hcrAm/byyQMX6o8rPhMvx3zbAnLr/uANoNDBYgH8asG6Oz+k
	RsC6ZGVdOl8jM1ifNba/p3gOpiGUulrfiycFMpjfJbBMsAhoGDlg+WHiXArXbpFqv7yCNim4tJF
	7Qfwg==
X-Google-Smtp-Source: AGHT+IHp/QbVQpP/iW3i0q+M7DawEhqXJBs3W2nF9CrWya5gk5Oil5znpkrHUlUK8ishKwyW/R30sNoCM3IK6kLc0uk=
X-Received: by 2002:a05:6902:2289:b0:e87:982c:5524 with SMTP id
 3f1490d57ef6-e8c5f8ac5dbmr19834485276.24.1753134608982; Mon, 21 Jul 2025
 14:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z-XvFvGigpY7JYFn@debian.local> <20250716184226.GA2547862@bhelgaas>
In-Reply-To: <20250716184226.GA2547862@bhelgaas>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Mon, 21 Jul 2025 22:49:58 +0100
X-Gm-Features: Ac12FXxNXBAeAhVAwWwxwk96-aVdQChQ7gw5acnVbXB8GPPK7GVjU3cHaObwRy0
Message-ID: <CAP-bSRZ+Ovj-MRVU9H5_nruA2wSTZ73Z1VXTbf4FFaPWVXP9dQ@mail.gmail.com>
Subject: Re: [REGRESSION] iwlwifi: probe with driver iwlwifi failed with error -22
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kvalo@kernel.org" <kvalo@kernel.org>, 
	"Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>, 
	"Berg, Johannes" <johannes.berg@intel.com>, 
	"benjamin@sipsolutions.net" <benjamin@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Jul 2025 at 19:42, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Mar 28, 2025 at 12:36:38AM +0000, Chris Bainbridge wrote:
> > Hi,
> >
> > Laptop: Lenovo Legion 7 16ACHg6.
> > Wifi: Killer(R) Wi-Fi 6 AX1650x 160MHz Wireless Network Adapter (200NGW)
> > 04:00.0 Network controller [0280]: Intel Corporation Wi-Fi 6 AX200 [8086:2723] (rev 1a)
> >
> > Wifi stopped working in recent kernel builds:
> >
> > [   20.907824] Intel(R) Wireless WiFi driver for Linux
> > [   20.907955] iwlwifi 0000:04:00.0: enabling device (0000 -> 0002)
> > [   20.912024] ee1004 2-0050: 512 byte EE1004-compliant SPD EEPROM, read-only
> > [   20.913666] NET: Registered PF_BLUETOOTH protocol family
> > [   20.913670] Bluetooth: HCI device and connection manager initialized
> > [   20.913806] Bluetooth: HCI socket layer initialized
> > [   20.913810] Bluetooth: L2CAP socket layer initialized
> > [   20.913828] Bluetooth: SCO socket layer initialized
> > [   20.917455] iwlwifi 0000:04:00.0: Detected crf-id 0x3617, cnv-id 0x100530 wfpm id 0x80000000
> > [   20.917674] iwlwifi 0000:04:00.0: PCI dev 2723/1654, rev=0x340, rfid=0x10a100
> > [   20.917679] iwlwifi: No config found for PCI dev 2723/1654, rev=0x340, rfid=0x10a100
> > [   20.920126] iwlwifi 0000:04:00.0: probe with driver iwlwifi failed with error -22
> >
> > Bisect led to:
> >
> > commit 75a3313f52b7e08e7e73746f69a68c2b7c28bb2b (HEAD)
> > Author: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
> > Date:   Wed Feb 5 14:55:42 2025 +0200
> >
> >     wifi: iwlwifi: make no_160 more generic
>
> https://git.kernel.org/linus/64dc5d5e341d ("Revert "wifi: iwlwifi:
> make no_160 more generic"") appeared in v6.15-rc5 and reverts
> 75a3313f52b7 ("wifi: iwlwifi: make no_160 more generic"), so it
> *looks* like this regression should be fixed, but it still appears in
> the tracker at https://linux-regtracking.leemhuis.info/regzbot/mainline/
>
> If it is resolved, can somebody send the appropriate regzbot fix
> command?  (See https://linux-regtracking.leemhuis.info/about/#tldr)

Yes, that revert fixed it.

#regzbot fix: 64dc5d5e341d
