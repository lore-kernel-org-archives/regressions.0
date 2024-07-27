Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001EB6F30B
	for <regressions@lists.linux.dev>; Sat, 27 Jul 2024 15:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722093966; cv=none; b=XA/JZdIxsQI+0H2NjgfDH0pUZBFKXSOAihSzbXnEVngN91+snc+1PSXR3JeqXn275QQJA2Ia7onErwQdyRHhv7rFcVU6hhs9EMPX37XpruqEue57Gn+dgXwK6JhRssptUyTpeojp+bPw0Wrm8SF2yQ3dI3ZE73Uz8B3BRybE0Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722093966; c=relaxed/simple;
	bh=6Ix1s+AVGz6wDsnUm6i0HdhNS3ztG/sjfgw3BzlyB6M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hnNkHcUP71MkfWXcrSN9PzSnqZJCHX0F6yNz11/l1H+MuSajMG20oJk5gv0i8UBchCQvPDLxMwfPTnz7qQ1FKl/+ksrjrvX1geoHodPhsVAgWqpgKsRSMN8iUJrC3+mUhnnhQpuhJV/mSVE3e1i0MngMX/KUbUcgH8DHdA/8N0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ux8XtPbh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=h4fSZpwW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ux8XtPbh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h4fSZpwW"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722093961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VyL7MxaA+QGgU1riTsg1IZBE28dAxxUE5qKAWbW7svU=;
	b=ux8XtPbhgCI4I6Y8U+7AvrPYJSuMzVoi9pOj/CTg2/InRr6PgEHhmeWLKMlPcnUrkMMol2
	plyU+vq+8dEYpFSnHuDG6ihx10r9KFxF2QQN7RIXCJC9jB0YD7lOorD1mZbhvoLT1S84gR
	ForW3rA6PFcVOyMGvIjcq+KBF9m5lF7z72+OA2a7kqk6s/MTJZmLoO6c0aQna8dZrdPMcr
	9PGkLH1guOEa76lLneXg+1Dwu6XF3FlA/+Avzw0BkwomvRqfjuhjJKjm/+rf4SYtidHzOO
	9cA/bc3iIQzP4kTBZAGu8zA6hDDdnxzm5P7M6e+bWSSBq5JDTGkBJATcWBef5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722093961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VyL7MxaA+QGgU1riTsg1IZBE28dAxxUE5qKAWbW7svU=;
	b=h4fSZpwWoAOQKNJ1WohtOzu2f7pNuUljIB+zMzA22uI7DsrSkNWpzxJh6bM4un+UdxZqPG
	RfNDYJQ8sY8FCvBw==
To: Rob <rob@durendal.co.uk>
Cc: Christian Heusel <christian@heusel.eu>, Borislav Petkov <bp@alien8.de>,
 regressions@lists.linux.dev, x86@kernel.org, Joerg Roedel
 <joro@8bytes.org>, Tony Luck <tony.luck@intel.com>
Subject: Re: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
In-Reply-To: <ZqTufKvJKvotC-o_@vendhya2>
References: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>
 <20240723120246.GBZp-b5nHHT0BWmKMZ@fat_crate.local>
 <5e08cab0-c6b5-4169-8d42-ddb0ffb4a6c9@heusel.eu>
 <20240725105029.GAZqIt9aLsIaG7JqN5@fat_crate.local>
 <12df8b45-6100-4c8b-b82a-a6a75bed2e05@heusel.eu> <87a5i4whoz.ffs@tglx>
 <ZqQSmw51ihns03ob@vendhya2> <ZqQl79UhhSQ5IobX@vendhya2>
 <8734nvuvrs.ffs@tglx> <ZqTufKvJKvotC-o_@vendhya2>
Date: Sat, 27 Jul 2024 17:26:00 +0200
Message-ID: <87cymyua9j.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jul 27 2024 at 13:56, rob@durendal.co.uk wrote:
> * Thomas Gleixner (tglx@linutronix.de) wrote:
>>On Fri, Jul 26 2024 at 23:40, rob@durendal.co.uk wrote:
>>> I have also tested on the non-patched mainline version 6.10 with
>>> 'nointremap' and it also boots
>>
>>Thanks for confirming. I'm pretty sure by now that this is the same
>>problem as the one in this thread:
>>
>>   https://lore.kernel.org/r/87wmntkhak.ffs@tglx
>>
>>That got resolved by a BIOS update, but for testing sake it would be
>>useful to give the patch in the link above a try on your machine.
>
> Yes this boots.  I'll look into updating the BIOS.

Thanks for testing! It's definitely the same problem and it seems to be
affecting Zen1 CPUs with a stale BIOS/firmware version.

While updating the BIOS is a good idea in any case, I'm seriously
pondering to get rid of the logical destination mode on 64 bit
completely and just default to physical destination mode.

I'll send out a patch later.

Thanks,

        tglx



