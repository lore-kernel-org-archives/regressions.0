Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6451017583
	for <regressions@lists.linux.dev>; Sat, 27 Jul 2024 07:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722066092; cv=none; b=C4bF1QtS3XTQCHlhWdGuDcWahVFzP5I5IkG3HQvDVSxitvLbb4N1h+laMMpjAOhA2jwn8cDSwdsc6p3YE6hKw0tKFItx795Otjn0gDr7RQ4RA80zmcRMMuWCortKuS+DwBv493JR3cIpjp1NtteMcP3TIdtiXwLo4ra8IM8pQTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722066092; c=relaxed/simple;
	bh=NIAaaqIlicpCGA36yDUXdpFlj2hqhjkEDmoDSywbFl4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qLleEa2CwL1REuwF6JXcjdkOhNgnpJf7LNnKdn3fic9xnIOESBdlSzI5hhMZ3LvEwlfAGK41KkVTPF9jKhSe+k6FMQqvKgc6lMd91mO9UIA+oKS6i1Ir9P5dQcEipkbOjM2Y/9jjzBb+cEISVqPphQLP9pCWBVgXlhULIuCaSbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QtznddPQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x5P1WW8F; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QtznddPQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x5P1WW8F"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722066088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JvJBniXZeHeFIdpZDZlcb3F8Z/9dpvr0e62B2wSOQKM=;
	b=QtznddPQUN4m7/JX+kmovW4psZmmFl3awoYpsrFWTOwg7XoMGpsy9My93QvBNrxnjlX/pQ
	to4cohiTULHunD4MJTWjrHFvUaqqu3LAf19CM4nAvO+536IZxNRqJ8sQAQX6I8UNKqNK0K
	S/ojxJC+88lK1N1Ynogm/8vTDSxEbXsmEAQ3Q3YInkWOUmCe8KmJTIOmcA26e7X5RrWf3u
	fF9mlB0fgbob/gcrrUDLHOUO+x0tcRxv8hPcT+xkumk2tHewlkzMw5C/3eHAqBNdKXYoKj
	FYFCsHkai9+/fG+++HclZmqUupC65BPGcaPLpNSnbmY5FGLa+IDotEk0Pad7Rw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722066088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JvJBniXZeHeFIdpZDZlcb3F8Z/9dpvr0e62B2wSOQKM=;
	b=x5P1WW8FoaQeveeAJ0/xo6SiTO1c2XI7b+TtUhM5IZPQEfXgAT5OaM7cGYo5vPrZQENpq7
	1PSGfI4lpkdY5OAg==
To: Rob <rob@durendal.co.uk>
Cc: Christian Heusel <christian@heusel.eu>, Borislav Petkov <bp@alien8.de>,
 regressions@lists.linux.dev, x86@kernel.org, Joerg Roedel
 <joro@8bytes.org>
Subject: Re: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
In-Reply-To: <ZqQl79UhhSQ5IobX@vendhya2>
References: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>
 <20240723120246.GBZp-b5nHHT0BWmKMZ@fat_crate.local>
 <5e08cab0-c6b5-4169-8d42-ddb0ffb4a6c9@heusel.eu>
 <20240725105029.GAZqIt9aLsIaG7JqN5@fat_crate.local>
 <12df8b45-6100-4c8b-b82a-a6a75bed2e05@heusel.eu> <87a5i4whoz.ffs@tglx>
 <ZqQSmw51ihns03ob@vendhya2> <ZqQl79UhhSQ5IobX@vendhya2>
Date: Sat, 27 Jul 2024 09:41:27 +0200
Message-ID: <8734nvuvrs.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jul 26 2024 at 23:40, rob@durendal.co.uk wrote:
> I have also tested on the non-patched mainline version 6.10 with 
> 'nointremap' and it also boots

Thanks for confirming. I'm pretty sure by now that this is the same
problem as the one in this thread:

   https://lore.kernel.org/r/87wmntkhak.ffs@tglx

That got resolved by a BIOS update, but for testing sake it would be
useful to give the patch in the link above a try on your machine.

Thanks,

        tglx
