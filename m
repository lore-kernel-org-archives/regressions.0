Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF5F148821
	for <regressions@lists.linux.dev>; Wed, 27 Mar 2024 17:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562320; cv=none; b=QXn1ibpMpaHF/j3HWkMJ6IfQ1uJqaP1w3MBseh8mu488rgw8uhMTtsVncx1XdVk3x+1nZu0egbn1SIfhRMHyoclkGMEtPkW2CojXyYLpuTTEkZEdof5MV6HlErIRCI3yRH5XqfBkmXNeLLghHrMGTp8iJ3OdqHtAHKXfrq9vgRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562320; c=relaxed/simple;
	bh=tv58eYbKG6Sjik/98+xXKHLpRcIzm34KwhSibz5CTq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMjXmtumQqva8OovYq2cjp8YLTgnVo4Z7i596ryc0qmTwD9VEmKdR1MAO5okGWg1pIAX5BKAVLyRBNhcc3cUcfiqi039SLJnRgYIJTmD1r8iNUToMWykyJ/ScjBGB/EUx44/MfTdeZD/kaBIg4Cjj0zsgd4Y3TcW+WWykxTL21s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ewGokGsr; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ewGokGsr"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B3AE440E016C;
	Wed, 27 Mar 2024 17:58:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ZvmgkZ8fctqm; Wed, 27 Mar 2024 17:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1711562313; bh=UjnxM3RwPTHQ3nZLHSMKFiCJIdI25ec1aogmgw/vyrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ewGokGsr/woZT5+oWFTpP7+hvoJ/+7vtt4JenjATr1NZhuuBYTc49vAVyitOdCCRo
	 G2N7WTnBTfIHukjIpDHKthDBZHtLQgGvQmuaNtcelK41Byy22O9aQXrBahUgLvJzor
	 Z6DH4UyOqTKNq3OWTF0HWGb4gJLA6h8wUM9ELTwYHRr0XHqu/HsYjwfIbvDNbXFB1A
	 QiEwGaxSZtX90O0GPlC9Ct1k9DBCFWsJ6W35NpAoJd9Z+QzVJo9xCi/uG8NiZEeNRn
	 KayD9T3yCANLmOFiBl72aG+SExUtzizDm6pAWhVlD3S9v0kAl53GcPaCxb8tHCYBF9
	 aOwfYFieGDBQE3oLN8BeHkhK0iBXeVIhqo2AUo4l/dR4JYO873PY1iKPCB3JUi7GtE
	 4UFQJFTqY/dFpsIwZDtl3reVQeT/WdiVn6MZjoDEQNy1eE2z4nM5GbvKsVWyDR62ND
	 z7M0ZG1DLF9KI96AeSb+F5jxwuuOM8dMiQeEtdX3fKGnomcZ8qEkGmO9gsVosNVUcL
	 9PKZ6kQT7ip+E+mDISdK7sh/S+Rpt2LvKvVw3ZxBy9CC2jbxJRvuVI1W7evgikAkL9
	 5br8QLWv1t9mNDC3C6WTawHMXh3QfFY1joLrLNkF8F1rcU4D1fPC1e+wTEVim1gZRY
	 fZ+9rvtsRRUnon4h9Tajljrs=
Received: from zn.tnic (p5de8ecf7.dip0.t-ipconnect.de [93.232.236.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7924E40E00B2;
	Wed, 27 Mar 2024 17:58:27 +0000 (UTC)
Date: Wed, 27 Mar 2024 18:58:20 +0100
From: Borislav Petkov <bp@alien8.de>
To: Mahmoud Adam <mngyadam@amazon.com>
Cc: peterz@infradead.org, tglx@linutronix.de, gregkh@linuxfoundation.org,
	regressions@lists.linux.dev, David Kaplan <David.Kaplan@amd.com>
Subject: Re: Regression caused by 'x86/returnthunk: Allow different return
 thunks'
Message-ID: <20240327175820.GBZgRePP8JZg9RnOEs@fat_crate.local>
References: <lrkyq5xxrz0gg.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
 <20240314143848.GAZfML-Bbk3_Nxyc0c@fat_crate.local>
 <lrkyqle6kydaw.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <lrkyqle6kydaw.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>

On Thu, Mar 14, 2024 at 05:43:19PM +0100, Mahmoud Adam wrote:
> >> fio --time_based --name=benchmark --size=50G --runtime=60
> >> --filename=$device --ioengine=psync --randrepeat=0 --iodepth=1
> >> --fsync=64 --invalidate=1 --verify=0 --verify_fatal=0 --blocksize=4k
> >> --group_reporting --rw=randwrite --numjobs=1
> >> 
> >> note: the regression is seen even with retbleed=off and also with spectre_v2=off
> >
> > Say, out of curiosity, how exactly are you running the fio benchmark?
> >
> > Baremetal, what CPU, kernel, etc?
> 
> Virtual, AMD EPYC 7002 series processors, v6.1.80 kernel
> More specifically: this was run on C5ad EC2 instance[1], device used
> for benchmarking was the attached ephemeral NVMe.

So I have more questions here: how exactly do you do this "ephemeral
NVMe"?

I presume it is that "--filename=$device" thing...

7002 is Zen2 and when you disable SMT in the guest, you're not
vulnerable to SRSO. Are you running your guests with SMT on?

What about core scheduling?

And how are you measuring this?

Host and guest have both safeRET enabled? I.e., the default mitigation?

Again, if you disable SMT in the guest, you're not vulnerable.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
