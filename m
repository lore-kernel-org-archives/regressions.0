Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED071EB27
	for <regressions@lists.linux.dev>; Fri, 26 Jul 2024 10:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721991027; cv=none; b=gWrAi8MjR3xFDJT1Ko1vIC2FxbkTlrw8/i4xYx0lR8myEYmpHECbGOHaVIV5vyx+IUy4dTUlD1+x+Cono9VnAGebgQUjwNwZve7pSREMYffMxUjPJyiiloIuAHRSZIO2EKBtBC+vDxNOiY0P45qYtl0t4HSgorY8FsNYERER0mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721991027; c=relaxed/simple;
	bh=fSuZcw8xULDazH27+zPDCwbYwWURWNC60vaQVstjigA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V/1pnQGlcdJoZ9A3xCwcQbDKg6akvIQZhkk/Tl8WoAqznFP1Rcg8yjk6MLcqd5/xKOmwz23UiXj8/9k//IZtVwuWrcwCAnK/frAFhfbGiSz6p/Cxx16B//j+62m59z2vz7XM5h+xzluFavEzSRGZWa6MzfA4pkP+/l/c9KzkUUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qO5ImvIi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CYub+ytP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qO5ImvIi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CYub+ytP"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1721991021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+P7B0DY3fi9zXs3haukCheyvWE/Y2gVIxFKCOUogMbU=;
	b=qO5ImvIiaeBnqMYqRB8MlXodk2xEhYpYlNYf5YVQvyAbcFvmAFMWb8FLe0hda5pQVzu1l5
	W0JA03pGiX/m03ycfEj4oMCzL/uePV/4od3vuggTPyzow22pB2dhvOWSnmRCYhBV15VdZF
	EkJR/wqjaLS0NH4nQfdkKuddklkVjKIqojGkCBcamSptutHjwvfAISB9+ACzBhSrpd+dJW
	iu7bXOtMGAzyRpRt0WPQu2OC71wk2ejfOPG4O9DkiEEDpwWC+DnNL9ixXAH+bv6Gv2Y2H0
	HG4sAtNnoAAlSu3vz4ufXpKhwTHCyjL+MnXRVyyS+1w+ND4Ws7GNar925AxBlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1721991021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+P7B0DY3fi9zXs3haukCheyvWE/Y2gVIxFKCOUogMbU=;
	b=CYub+ytPWHCi3KV66Jn4oyHF0hMmvDxLM5vHdrkcpszqVGwdkO/VYWoHE7zkTQ+PM1Sahe
	Y3toe/ju4KYOvtBg==
To: Christian Heusel <christian@heusel.eu>, Borislav Petkov <bp@alien8.de>
Cc: regressions@lists.linux.dev, x86@kernel.org, rob@durendal.co.uk, Joerg
 Roedel <joro@8bytes.org>
Subject: Re: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
In-Reply-To: <12df8b45-6100-4c8b-b82a-a6a75bed2e05@heusel.eu>
References: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>
 <20240723120246.GBZp-b5nHHT0BWmKMZ@fat_crate.local>
 <5e08cab0-c6b5-4169-8d42-ddb0ffb4a6c9@heusel.eu>
 <20240725105029.GAZqIt9aLsIaG7JqN5@fat_crate.local>
 <12df8b45-6100-4c8b-b82a-a6a75bed2e05@heusel.eu>
Date: Fri, 26 Jul 2024 12:50:20 +0200
Message-ID: <87a5i4whoz.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jul 26 2024 at 00:01, Christian Heusel wrote:
> Sorry for causing some confusion on that part and I hope the above
> outputs help with debugging this issue!

Not really. The issue is completely unclear and nothing makes any sense
here.

The only difference is the resulting number of possible CPUs.

[    0.026516] CPU topo: Allowing 4 present CPUs plus 12 hotplug CPUs

versus:

[    0.025251] CPU topo: Allowing 4 present CPUs plus 0 hotplug CPUs

which really should not make any difference because the 1300X has only 4
CPUs.

So the bisected commit is the messenger for some other problem
presumably in the IOMMU area which is just papered over when there are
12 possible hotplug CPUs enumerated.

So in theory the same problem should happen with a pre 6.9 kernel and
'nr_cpus=4' on the kernel command line. Can you please verify?

Another data point to be evaluated is whether booting the unmodified
6.10+ kernel with 'nointremap' instead of 'iommu=off' on the command
line makes the machine boot as well.

Thanks,

        tglx
