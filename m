Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A8540D590
	for <regressions@lists.linux.dev>; Thu, 23 Jul 2026 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797521; cv=none; b=t9/8cz64unWeIBd9fCG/jLqUmoPs6XIXNYr2QLANMuJ9mY1kW4Jnx3TwMDgxO9TpWvbj/yrE5NAIoW26SmSWIk9xW7Xi7c5m2dO5d327Yb8Rd08qOrBL2SCPrQhynss2Hv/Ei247XvzOnt5+UvOIF/4GByNFiuzYYmF7Y+6SAYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797521; c=relaxed/simple;
	bh=LuCbOJEq9s4gUkoOzNekTbMB6Teey7IN57xuRmPy9vY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D/qH7R5y0W+2ZhNbDgo6pcR9NhbPZ8k2lUsOF7pw4u8f0dZmVFdRxPFDBJdluB3/RpcdaSo48j5KzsN60jXVtgmGqXRo3F29xHOJfgK/svRpqrEfLm+JgCEla/H55P3BfdGlgXSIxyauq6AnwXHobVcX34ybbCjGcqjUG8cwPAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gi7kS30g; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gi7kS30g"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so5318885ad.0
        for <regressions@lists.linux.dev>; Thu, 23 Jul 2026 02:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784797520; x=1785402320; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LuCbOJEq9s4gUkoOzNekTbMB6Teey7IN57xuRmPy9vY=;
        b=gi7kS30g/UIFi+3ly/QyAu7iaoH5qNbpz08Yfr7+KEWAFqVw2iDkjx9x4by0JwGGzK
         +WknDZ/CpS9Ywrl+YYlJmdbcEwbGTjpjeewTgGyKW0xr1MAyViQwGdLh19o/VRSj8Kmq
         CiGe90rqcuuE4GahsRbLAr9rz+yqDv6fIzuYIKC0f4PuuNYa6eQIyiHek1mIXpZfaClK
         NRCd4q3x2p/tDkXT6puue/NXqZjJjRy6Cw5w9G6nmcdlJIUYvpCpGgsKWxFbYR5FWzCg
         //9kQ22WG9Cv4MNj4UsWocbu9kbGIln58gSeFi7pD7PrbKv5CQuxmdHowFThlvW4N8Rl
         bQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784797520; x=1785402320;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuCbOJEq9s4gUkoOzNekTbMB6Teey7IN57xuRmPy9vY=;
        b=d7yFTlyGGoiTsstPsLc1y9HMwmg4di5DOUXX6U1VEKkIrW5dtEyVCmBQzjaa5wz50r
         NWjF18AWyMhPiTj0IZY7v81mbV4WAnYaxL0ADDpPQpiXb/n4tgnb2Ezl7DXqm9xQHN7n
         ecDd4MzHwVNIK+wn5XBxc4N7i9Af2dcJWnr6RTdOxY0A/+Tzsku5CFBrPs8DY3mDKeyF
         qfoWqgJ5OCi5+Z/snDiXf1kqbMXuQnov4+K49AGtDQesw1UJawJ/Gh4jkwLLvFaehofR
         0j9UtTxzwS1AeCqYBMh5RjljIM+Af0Hy4AEyzPq7Trd6ExjYz67zaD+v4yxpFpJMCIVA
         cIFQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8NhEMXt79F8FkW7ak4UNh6mf+oISZ0XofC6Oz2Dwbw46i9w+QeRxXxcZHD2OcnR1RnMECDHZJekSq+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIjQEHJJA53kzYoVJwcMBHcRa3xIw8zTUKIyzFjxu2rF+amuj3
	sRoOz/tTHpobxpFkxqk+xiaNqEQF5hty72ieeyrlJUNp1JS1wFMlz8lh
X-Gm-Gg: AR+sD13nr8n9oQaHGCS4z8iWgtl+EUluhcR719nTwwYriydc0aeauiO4cDfkaEb/QnZ
	/qj6Wra5UuuFt5WvQ6etvbA8LmHOThIU3PrfduVYQC60zJ9KsEx0F2FDmqtlJChCa0hywWubNPa
	/mjg+nOpx5UC98FD7CWeRxerpb5/h6g0wLKFvORzSoQahAd8YY0j2CtrscC/SBJDWlhbXqNR42F
	ZtGE8GgWpvKRxvPkh7zP250G8cujLj3WU+Zjb+rK686Djb4sTCiuFzNurcUKU+m9YHpkWJ6LPJv
	+zsIBM5jvrdXWeupUe43oIhY3PQhYtS1l95nQFQZ8+SKs2qmJ37/9falleZT/tgKQxrxN72rTMI
	tNW7CnTVFpJ1W9s/GeE2qHvGoWoGU9ZA3FINDJUWehOPIW468KGlAgMOvcuHj/d9Lww7SYIzNtK
	OUJh+rjvNsK6frLw0HQyYcAMXxLFE4gPBpnvIJqkub
X-Received: by 2002:a17:902:d54f:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2cfa74886a6mr25002765ad.23.1784797519561;
        Thu, 23 Jul 2026 02:05:19 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd7fedsm29671005ad.24.2026.07.23.02.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:05:19 -0700 (PDT)
Message-ID: <71f6059ecc89d0b16f8542d73ad8b183a2a4db92.camel@gmail.com>
Subject: Re: [RESEND][REGRESSION][SECURITY] bpf, s390: verifier/JIT mismatch
 allows unprivileged kernel memory access
From: Eduard Zingerman <eddyz87@gmail.com>
To: Min-gyu Kim <gimm78064@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Heiko Carstens	 <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>
Cc: bpf@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 security@kernel.org
Date: Thu, 23 Jul 2026 02:05:16 -0700
In-Reply-To: <CAGKGUv=sOuqQtA1Ub-5JXfA4FPosJFYKAQE4B79cK+P1erxqtg@mail.gmail.com>
References: 
	<CAGKGUv=sOuqQtA1Ub-5JXfA4FPosJFYKAQE4B79cK+P1erxqtg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2026-07-23 at 17:16 +0900, Min-gyu Kim wrote:

...

> Root cause
>=20
> The verifier records an ALU32 definition in subreg_def. A later 64-bit re=
ad
> causes mark_insn_zext() to mark that instruction for explicit zero extens=
ion.
> Before 107e16979905, a cache hit in is_state_visited() propagated the 64-=
bit
> read to the alternate path's ALU32 definition.

Hi Min-gyu,

Thank you for the report.

> Commit 107e16979905 removed that propagation when register-chain liveness=
 was
> replaced with static liveness. The static live-register mask does not tra=
ck
> read width or path-specific subreg_def information. In current states.c,
> regs_exact() compares only fields before id, while subreg_def follows id =
in
> struct bpf_reg_state.

Hm, the stack is tracked with 32-bit granularity and it should be easy
to adjust compute_live_registers() to track the width. I'll give it a try.

> The SCALAR_VALUE case in regsafe() also does not compare
> subreg_def. States with equal tracked scalar values but different ALU32
> definitions can therefore compare as equal, leaving the pruned path's ALU=
32
> instruction without a zero-extension mark.

This is orthogonal to liveness mechanism, this is also much older.
I think this is the true root cause and it should be possible to
construct a test case triggering false-pruning on <6.18.

Thanks,
Eduard

...
