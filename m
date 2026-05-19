Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53FD369D68
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 23:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779233159; cv=none; b=GoxWtg36NIfDvAFLsH12sbct4q4lXgx0eqbQyyrof4NN0aAkgdhd3D/yJ6AcvPMVuomYa313/JbMIPDgNTC41tIuUSBQN31tC/ilp5+6OpAAs9sfg6O40PAvkrR/npGAXuWPHAo6rXuN+ZGfreTEpH1ryXXu+UDHbwAzDBRxZuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779233159; c=relaxed/simple;
	bh=qzAr6/WsgFKssqlPCxXSDzt8GyeSAbibXjHXxB4WTP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qr638imO9iDf5k2Cwmakfy+tjc+m8rlaS4rbY+ElsUbTPCuRs9K/Qkqivm9V+g4jrDUH4uKKE/9Krl4oBsUhwIm+R3tSAVJEgYXi9c3ZlaR8vh2wGluvonauHBTK6UdmmZhq/F5H1MnrH4tL91akOct9C7TMKZuVGHpMLIdZdBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCkVCIHc; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCkVCIHc"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-134ac81c445so855555c88.1
        for <regressions@lists.linux.dev>; Tue, 19 May 2026 16:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779233157; x=1779837957; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3SS2yS5uCTePausm4fGtWUlfakc5T6xBGkbwj6NS7w=;
        b=HCkVCIHcXAYUlsHJLhWyW6jyKIsDEGt2b+9Dhbs7CBKTcr14IeM0lAu5p2BO3UyOCk
         2I0Hl6ukMORga7xPbWQ8xc/xZUu7jvpu9em2JUmdyuxuplc6HpeAcGerLUeJxWgBki0v
         WkcsX3+6e0dftGrNFQONwZDsH68vA4x2ix6jlL+S0crfmAGxF1rxUmQIfgNH2P/OCUCr
         o4jAbRrSqbhl/D/8PBZHd3nxfM7ZuKs4r4ibCRSwoX3vxkSv41fD8/lj3Hc8+D9cTjEI
         HKkfdzCaUAYymJ0sJ3oF9atTDDBEyPnGLM4efR1dZuaUwvZNE0TA29ARvVhHR/5TJOv+
         R/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233157; x=1779837957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3SS2yS5uCTePausm4fGtWUlfakc5T6xBGkbwj6NS7w=;
        b=fwE3w3Y2uzqVEWBZxVb4p0hvF/P231b+mVK3OJA53IAquTFHSogJPTMH1CQnV8oBYI
         VbXH0/32/WCF1l5iHoAygwh14IWaeuEay1sQTEq8ciQhOLBGErmiduGNYt2DLyb//ZjQ
         HRq1V84oPBmsA76BpK10rO0KeC8xvc/9e98ddK8Mcn5frgKQX7GPz4TMZP6fCQGASJgA
         0TtbhycxixEBsW6A7gWzpRRxAC4kFnRKEz9RV7QbeVuLr7T6r/JCnjkDN1XPjz1sfqPW
         WQdBYBM9KSoS8I1zSU8xVimreG2g10/fykG2d5z9cNUTSjRHp0QlFoE/9vPJlVIsPMff
         7mRA==
X-Forwarded-Encrypted: i=1; AFNElJ+d0xnAE2/qiF5RcZcVYYC1shkqhq5ZAdWfDFxxSmqrafG/Xlg3MuugVeHZWfuu+f1IVAl8vUCm3TTqPw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5cwu/bQEY2T2nhwhq33C8GhWTd8lDGjcc0kXNTCYXQYJQ6XiT
	0gKEvKsyM+HUpwTwipfveWntJBAXp3VUFGQwBf2PWxmgxl0NFih12OAc
X-Gm-Gg: Acq92OFXM5ZUwo6rpEjIAC9Gnu/ld/cSNMhbTJjrqAx1tDHeq9uK5jxfl024lM7enbu
	SMyFhV8LBRMts+5e6+rohOOZQOfXO++t9HT697oQOafklp3232nfTNn8EZMtGdW/bvC5ExfpHgW
	KD46IkndtrGx0sywq+qtngykONW5cIVFwTdNXq1PlvBP5TJ1sgBnXkfaEWrXVWO2FCG6cLY3egB
	SkmO0ggjAfhiwFvo8NAwRX1zdFA3uB+0GydPCDa/KVMmWLlqSWAxaqp2fr0NSt1mqjlKPFrVPvS
	w//GsFUCmRL/+eXfgZK/4ea1LvC9Nhob48SQRtrniItL0wnDtEaEq7y9t6GA+hn649od6jtv57m
	yT+Bd+ZX+So+gGtkjjrB1iAviXEnrhErDwdlzERgfdDuqdJbnAcP1Z3JzVUDdAOC/h00PUeO8gl
	1HafyxSzMjXJUGPs2j2hLcUvoBFZxrXQ==
X-Received: by 2002:a05:7022:43a4:b0:134:a701:de8 with SMTP id a92af1059eb24-1350441871fmr9821327c88.5.1779233156752;
        Tue, 19 May 2026 16:25:56 -0700 (PDT)
Received: from [192.168.21.192] ([67.170.89.46])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm25577758c88.3.2026.05.19.16.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 16:25:56 -0700 (PDT)
Message-ID: <10382506-3f57-4b33-8356-34f23fb5f153@gmail.com>
Date: Tue, 19 May 2026 16:25:54 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2 1/1] sparc64: Fix comparator problem with timer
 interrupts
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, andreas@gaisler.com,
 thomas.weissschuh@linutronix.de, regressions@lists.linux.dev,
 glaubitz@physik.fu-berlin.de, linux@leemhuis.info,
 torvalds@linux-foundation.org, davem@davemloft.net,
 sparclinux@vger.kernel.org
References: <20260519022421.5978-1-unixpro1970@gmail.com>
 <20260519022421.5978-2-unixpro1970@gmail.com> <878q9fxywc.ffs@tglx>
Content-Language: en-US
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <878q9fxywc.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

Thanks again for the careful analysis of the comparator ordering. After 
applying the changes in the patch I confirmed S7‑2 and T7‑1 systems no 
longer hang; timer scheduling now behaves as expected.

I don’t have bandwidth right now to finish the remaining tidy steps and 
I’d rather avoid delaying this fix. Since we worked on this together and 
you’re familiar with the issue, would you be willing to take it over so 
upstream has everything required for approval? I’m happy to answer any 
questions; if you’re busy I can ask the maintainer to reassign.

Thanks again for the review and the clear explanation.

Tony

On 5/19/26 7:22 AM, Thomas Gleixner wrote:
>> On SPARC64 the check:
>>
>>      return ((long)(new_tick - (orig_tick + adj))) > 0L;
>>
>> Is safe only if retries make forward progress. The comparator can
>> take effect with a latency, so the moment when counter == comparator
>> may be missed, which can cause delays or hangs on some SPARC64 systems.
>>
>> For clarity:
>>      exp = orig_tick + adj   /* expected comparator value */
>>
>> The current check requires new_tick to be strictly greater than exp;
>> equality (new_tick == exp) is treated as not yet passed and the caller
>> will retry.
> That's confusing at best. You really want to explain how the ordering is
> similar to what I described in the analysis:
>
>          exp = read_cnt() + delta_ticks;
>          write_cmp(exp);
>          return (read_cnt() - exp) > 0;
>
> If the counter advanced past the expected expiry time, after writing it,
> then the caller will retry, as the calling code does:
>
>       return tick.add_compare(delta_ticks) ? -ETIME : 0;
>
> But it won't do so when the counter is equal, which is causing the
> problem.
>
>> By contrast, using:
>>
>>      return ((long)(new_tick - (orig_tick + adj))) >= 0L;
>>
>> causes the caller to stop retrying and assume the timer is scheduled;
>> both equality and greater-than are accepted (new_tick == exp or
>> new_tick > exp).
> It's the other way round. When counter >= expiry time, then the write is
> considered failed. If the counter has not yet reached expiry time,
> i.e. it is smaller, then it assumes the timer is scheduled.
>
>> Signed-off-by: Tony Rodriguez<unixpro1970@gmail.com>
> It would be nice to have a link to the original thread in the change log
> itself as that gives people quick access when they are wondering about
> this a year down the road.
>
> Thanks,
>
>          tglx
