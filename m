Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317E7125BD
	for <regressions@lists.linux.dev>; Fri,  8 Dec 2023 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ckcPMCyf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lVp7MsZn"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702042666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X4s7ZeiusFQ75+ddB/nV0kSaPwldS3+7Fx3c/bIy03Q=;
	b=ckcPMCyfSuCpSqtXfoCqtMj9Aog3OIV+xqlWeWzZsg/1bRLK0JLCy776M+ocBH6Gqi4bN6
	8fU6LtLuLEQiB49+XKfQrZcNTAl9REPJ3jsy7rfuTx6RxbrSo/nu2/GOyPu7WCbxud12AG
	5LbWq/lVX60iMTpWfFZxWpOXEjEUqbyXGxS8tPkR6eJGwBdC+47gWRzusyCW7Um3AYq9P2
	wwrzv+bEiQllZ2yR3SsY5SXDTYq0JEolUqkgSQzBoqp6RQGpBOxIcgmX2Tza8DBLKzumKD
	vA1UXzGDp9pEU732dO8maW6npfU6zD5jgWNsW4QNd1nPMx8BtRkjfaI75FMRDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702042666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X4s7ZeiusFQ75+ddB/nV0kSaPwldS3+7Fx3c/bIy03Q=;
	b=lVp7MsZn0YEOnHB4qDDzj52q5brZdaIkWK+lr+m9nTtHjaQWve0oJpD/DB3FNHM5ONC97i
	qJq69adjC0CKT9AQ==
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, paul.gortmaker@windriver.com,
 x86@kernel.org, regressions@leemhuis.info,
 richard.purdie@linuxfoundation.org, regressions@lists.linux.dev
Subject: Re: [patch 2/2] x86/alternatives: Disable interrupts and sync when
 optimizing NOPs in place
In-Reply-To: <20231208132204.GBZXMYfLSaIbn3BvN3@fat_crate.local>
References: <ZXCXc+BtnLzqMbFv@windriver.com>
 <ZUEgAAGDVqXz2Seo@windriver.com>
 <0adb772c-e8d2-4444-92b0-00cbfdaf1fac@leemhuis.info> <87r0k9ym0y.ffs@tglx>
 <20231207193859.961361261@linutronix.de>
 <20231207194518.401797191@linutronix.de>
 <20231208132204.GBZXMYfLSaIbn3BvN3@fat_crate.local>
Date: Fri, 08 Dec 2023 14:37:45 +0100
Message-ID: <87wmtostli.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Dec 08 2023 at 14:22, Borislav Petkov wrote:
> On Thu, Dec 07, 2023 at 08:49:26PM +0100, Thomas Gleixner wrote:
>> +static void __init_or_module noinline optimize_nops_inplace(u8 *instr, size_t len)
>> +{
>> +	unsigned long flags;
>> +
>> +	local_irq_save(flags);
>> +	optimize_nops(instr, len);
>> +	sync_core();
>> +	local_irq_restore(flags);
>> +}
>> +
>>  /*
>>   * In this context, "source" is where the instructions are placed in the
>>   * section .altinstr_replacement, for example during kernel build by the
>> @@ -438,7 +448,7 @@ void __init_or_module noinline apply_alt
>>  		 *   patch if feature is *NOT* present.
>>  		 */
>>  		if (!boot_cpu_has(a->cpuid) == !(a->flags & ALT_FLAG_NOT)) {
>> -			optimize_nops(instr, a->instrlen);
>> +			optimize_nops_inplace(instr, a->instrlen);
>>  			continue;
>>  		}
>
> Arguably, the proper thing to do here would be to convert the NOP
> optimizing to the same 2-stage process as normal patching: write insns
> into a buffer and text_poke* it.
>
> VS what we currently do: operating straight on kernel memory.

Well, apply_alternatives() results in text_poke_early() which is nothing
else than a memcpy() with interrupts disabled :)
