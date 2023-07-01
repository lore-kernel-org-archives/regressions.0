Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A49F3C3E
	for <regressions@lists.linux.dev>; Sat,  1 Jul 2023 18:14:08 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1688235239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JD38xCxcURuqxts/lkjR/QpQZDXYE/wmw0ZfR83W7Fo=;
	b=uD4wsGUHae2oZvk6FGbYhHmtN3+NhQR7+g/FoyE/bSi4Mynb0Vsg5MhXc+KU3hp1B90ZDQ
	Hh4dD0z3aEHRdk0vNKZeAzhuJYaJkr1i8X7RJYmwHrt40wuzOq1fFSgOaOQEpq/GHnWLMo
	CAQHkRie+hYHTt5dwbEp66VCAUtpm4y1KMtY2WilBTRoJTEDnvJ85bG23JOqflhNH9TqcR
	mfMHDWsshyagsooQrM0RpFxnHOVPUpGMLe5AezmDDNVWOGBE6g8iv7re0YNp2AUaZ/956R
	eMh/SCbSN0SCJgRs7M3cL3z5EIDZqs0CwNHQzUCzJo/DaF5EkbE1+BUzxNEGiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1688235239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JD38xCxcURuqxts/lkjR/QpQZDXYE/wmw0ZfR83W7Fo=;
	b=OERvq79vtLZRKwO6aj63Z/tyH8iFslzVMB1gSTXH79Aeja1IT2Urnxm1pNYf2Bi62TewIg
	YeA4J6ywBSUpYbBg==
To: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>, Bagas Sanjaya <bagasdotme@gmail.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Regressions
 <regressions@lists.linux.dev>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>, Borislav Petkov <bp@alien8.de>
Subject: Re: Fwd: commit 9df9d2f0471b causes boot failure in pre-rc1 6.5 kernel
In-Reply-To: <74014a7a-7d91-0854-8002-faf32d9c65e1@leemhuis.info>
References: <4d9fb4a9-6c48-600c-f625-8ef66208090a@gmail.com>
 <ZKAboYIj6pAd9CMO@debian.me>
 <74014a7a-7d91-0854-8002-faf32d9c65e1@leemhuis.info>
Date: Sat, 01 Jul 2023 20:13:59 +0200
Message-ID: <878rbzxzx4.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jul 01 2023 at 14:43, Linux regression tracking #update (Thorsten Leemhuis) wrote:
> Bagas, FWIW, there was no need for this at all. Regzbot would have
> noticed that patch automatically due to the "Link:
> https://bugzilla.kernel.org/show_bug.cgi?id=217602" in the patch
> description (thx for this, tglx) once it landed in next or mainline
> (just like it noticed
> https://lore.kernel.org/lkml/168813193932.404.2885732890333911092.tip-bot2@tip-bot2/
> earlier).

I just looked at your tracking site and noticed a small hickup. There is
"Noteworthy: [1]"  [1] is a link, but that does not really work:

   https://bugzilla.kernel.org/show_bug.cgi?id=87jzvm12q0.ffs@tglx

Makes bugzilla unhappy :)

Thanks,

        tglx
