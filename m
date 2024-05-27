Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028E813AA4D
	for <regressions@lists.linux.dev>; Mon, 27 May 2024 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716804390; cv=none; b=pnSh0j4oLPiy7oO0mUolwia9qxknHTfRnh3hnzfs5DX4PY7imyTcMgUP9mSPtHam0cSNS9H1o0rlR5Y7JEJRA8livrjLBXku1CGuEQw0/2Q30dbzYVJGxPZB3+QF+BXT/KJ3sWg1bW/QqP+5DUSh2N27EWoVqDleTgpijypXk2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716804390; c=relaxed/simple;
	bh=s81Hp7fR7mtMdUe/8mJY+IkuwsfZvR041uPaXPXdv3A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XapbGLn0+Oa6oaKitEurOiXFyTg1NUjBvs6Wf+efkKrLlpXD5D7j9W12MYYtA6RCeSPqpRH4znafocNyxdpElKlDwCjGECHJUSml/HiG2LiwhO1EsMgtfwOxWIKhc8kiepDujjqItj97E7Z0Nl3Hr7QoHcivQmKN1/8pkdaiDEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gLndVvIH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XdH+e1ow; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gLndVvIH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XdH+e1ow"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716804387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J06T3Dt3jm5Q9jl5C+QpzgdSZJHlI8MN+rNBRUfEuas=;
	b=gLndVvIHQM1EXJc3/cD70rLZBZ9Se+CPfEABxksxNSMEnjyi0U8GHH6N9vbUFzkN0fjLTV
	s4CwGeOtsKaC4lcjsLUBGQuI4xBJPNwntr7SQB/eo0L6xukdYZyf9yI85OCuqPaiBiL8R5
	ZKN9dSVZZGZkAPXdPO0/W5YF4jyLPGRj+Ldn7q6lcNOIOcFOqhYhN7Ousd2JvpocdMqrHq
	3Mzeu9STH+m30VADWkxw9M6FL7Wn2kaomWeLNC11ZUkF/0fAZYr4BHAybnAlhtVLJISu0B
	Fp+sa6RbJUNIOehEZp2KOw0FnbQ4KxKDyH22T5Ic4SiISrk5dzX18EDpdeRvpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716804387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J06T3Dt3jm5Q9jl5C+QpzgdSZJHlI8MN+rNBRUfEuas=;
	b=XdH+e1owfPR96WdgAZjXUWvW1d+qnBDjhOFtoAYS19UZ6sU8eAp8GDEH8qcVoNp8dlaLiF
	FCVCzOwfu7QYxnCg==
To: Christian Heusel <christian@heusel.eu>
Cc: regressions@lists.linux.dev, Tim Teichmann <teichmanntim@outlook.de>,
 x86@kernel.org, stable@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED] Scheduling errors with the AMD FX 8300 CPU
In-Reply-To: <gtgsklvltu5pzeiqn7fwaktdsywk2re75unapgbcarlmqkya5a@mt7pi4j2f7b3>
References: <7skhx6mwe4hxiul64v6azhlxnokheorksqsdbp7qw6g2jduf6c@7b5pvomauugk>
 <87r0dqdf0r.ffs@tglx>
 <gtgsklvltu5pzeiqn7fwaktdsywk2re75unapgbcarlmqkya5a@mt7pi4j2f7b3>
Date: Mon, 27 May 2024 12:06:26 +0200
Message-ID: <87h6ejd0wt.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Christian!

On Sat, May 25 2024 at 02:12, Christian Heusel wrote:
> On 24/05/25 12:24AM, Thomas Gleixner wrote:
>> Can you please provide the full boot log as the information which leads
>> up to the symptom is obviously more interesting than the symptom itself.
>
> I have attached the full dmesg of an example of a bad boot (from doing
> the bisection), sorry that I missed that when putting together the
> initial report!

Thanks for the data. Can you please provide the output of

# cat /proc/cpuinfo

from a working kernel?

Thanks,

        tglx
