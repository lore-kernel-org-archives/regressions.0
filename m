Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793447267;
	b=cHq5MyLLaV3Om/oAzANcpCUuX7neMpXNod8uNWG3lCvPCYiRKxqAsKnN4AiI7zU7PeOq
	 8Boihjem/bhkBi76YF9Y2DJiEc1ehW3LMpiAiLSGiAP5wdMphi5XNKb0eMmr9OBV6sSTx
	 ohoyiXejJQw/tOKnBjwzD8nh/7K6KfbN82KfF//tx8+pPYCj/ey+6rKpV0SANKIrwMg6M
	 RQD1i0yLWLtF82euaIBfAuBLIvZlDAtG115ozMxSWZoObWGWe7eoVIflq5ySZweJYEyFp
	 1Ri/r+Mdt+wurQM+gx9X1KY0Te1wG5YDT6f2TJutQC6h1TpG/vZb7VY8mU2EN4C9XHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793447267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3y75OJSM9/zxmcC64Ykr6WF/StKDRmUno9+CzVe16ow=;
	b=sh2j5I3wGjLlBF1RGCvx1zmNbgsLopOTElrEWq18Zrs9dQ149as/yYrtR7FgdZwVtYqd
	 UgqhOmnOSCsLKapGnkC8h4GdkNN7OIsh/mrJGpqeKoALZfO5v2qinByy5xAiq/l6opMn0
	 bObDA4nr7ykCtmRpqdo4WreColNf6baWOdF6q8U6AjgV5P53JeWmoPzOGuPHAI3ZIAT+I
	 b6xVifT+ukjkqidhzcqsZ17gKu9Z0htBvXh6BacLzFe12jUGBuApvlamtPuFUvHTM/QYD
	 S8Iw/O4I8qMIwyT2dF8wflMdT8VZbYmt/7zy+1pEBoCvd2kUGjuqS2Jn88yfOKBqLjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x5IMtu+N;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC7C606A31A
	for <regressions@lists.linux.dev>; Sat, 31 Oct 2026 11:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EC7C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x5IMtu+N
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4aa3a2a5a15so1453175e9.2
        for <regressions@lists.linux.dev>; Sat, 31 Oct 2026 04:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793447265; x=1794052065; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3y75OJSM9/zxmcC64Ykr6WF/StKDRmUno9+CzVe16ow=;
        b=x5IMtu+NNpa93qS2YBJn0+7mhp/2Fcw3rtoS7d73Pys08lkpaM4UVRRfFLUvVrAjBj
         KbXNhoMXcLwgtXekxJzNLJtJAaWFLE3Z0xrvQVffAS53Qh3eFpKViB7DHkkugriOfKpy
         yvbQtVdggMaBt18E+mRjiQCj8hlJz8qOq1Wu0LIqNdzZSVqj3IPN9+vPNaOmeUh3F5zg
         6i4ETo1ZMX99gfTEOGDNRpWW7ehdelsLDUEv+Zpr1NtMZoLSkW2FbAG0JsKWOuHSQ8H9
         v3i99AkKdD+M2e8/Q6i8gwSebCL/wEs7kh83RJxNWqGJ6/OSmEXS/kHsUwNHiUPRzjgf
         vMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793447265; x=1794052065;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3y75OJSM9/zxmcC64Ykr6WF/StKDRmUno9+CzVe16ow=;
        b=bd1qMV1XnBHw0oRRLwfvZR1fEDJs5tdAYH4mnwELyPJWs8EzkhOuK8m8HstUSfET8x
         zLqf5IDXeSuYVPlZpCgCSj1hQjXPv+GfB099qs03qs5vDktOLsMDK1zezrt0Uiuv2wO9
         hUFhQOnkZ+uoNcmRMRNOJ7cIZw+d1eov0VMDuaUFhNp9VDQrsRvKEcMWE3b6rojstlS/
         V0s7HGxl1FYbIrN3/VJEg4KbOZ1NZSALRrinbNM1j8TdIKAzleVloyWaN4T6RDefAbXB
         sZW0alZUjFjM4Z0fMPvWotd27h53QqUZJpCy/6fYfkBEBHgj7YYJN8xfMgSr/DRKvfuG
         0sXw==
X-Forwarded-Encrypted: i=1; AKwUvBy5kpWtOdhGzaKK10f/2Kn4X5UXUfZodO5K4BYwRj9T7iJRRRkuG5xlgjL9lJIyuhsKlgA/WoZ/061xOw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ35Z960OTSnUPerfFycTTA0l3Sfdin4/OAOLCOORBq4g5bvi43
	bVYKSRzuH5RX//uFTU3NVmH1TeXv9CYuE7dKjvzmOYs+hzfJ1SP2BCfz
X-Gm-Gg: AYBFou2twe228uO8EJrro4R9ZTEgqXKScKH+ckkxnzIHfwXHbRflkXdFKmJRF05a143
	CaqsTcXqJPIeoTxB+a2AnYPBJGHJG+34wmGD6GyUByi7vl5Kpl3dwXaLNXpSR0vRNyx4zEula3I
	M/5PRPK9eWKq812fCeelGqTSWLPM2ZWfMC4ozx93zFxSN1QPcJ88c0yWSx0aB0fFu3ou8vhzdJ7
	6ti3HjdVwLx7PGiY5m97fuPgVhp2YJPgP6N6w5kY7F4BArwNSdvKzmJBkhYLAOWsaEHKp8bGHYu
	80waVCTS9VD3dZF0xUmb9gu4UW1BLclXeBELhRYJMtW/QDycXLUgADM9gEX+Y9//ni+CDyOQHNq
	8lsxQLAPpwX45p1XCTU1cdUWMhB8/r35jE40ve/G9vKeZ0ANaslhW6JUc8JL+BDkoMZvLbh9CsD
	YCcfdWUAdY/3IrvLIgV8FlUSBHA3IRnSqa2+y1HYZ3yargDwu0H0yiRshPT5zLxAjNonnWwV1OG
	HldIn6/bayQ2aHuUVN5QHKNu3ORMpxFHahGHGy0wNSwCUv2JiYCPRyJlC/BKp0cr8SqiuRBypkp
	mkv36cgSgH+6TTblgSGBI+9aGip75sinkd0kMRF9XIoA5t1BqGBki8dV
X-Received: by 2002:a05:600c:34c5:b0:4a0:13d8:cd0c with SMTP id 5b1f17b1804b1-4ac16acdfe0mr108560615e9.2.1793447264836;
        Sat, 31 Oct 2026 04:47:44 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm8374016f8f.9.2026.10.31.04.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:47:44 -0700 (PDT)
Date: Sat, 31 Oct 2026 14:47:41 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Stian Halseth <stian@itx.no>
Cc: Frederic Weisbecker <frederic@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Breno Leitao <leitao@debian.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/cputime: Don't warn when the tick period starts
 after idle exit
Message-ID: <auW3XbhjMjakWAhT@scheduler.schedules>
References: <20261031081408.3378884-1-stian@itx.no>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261031081408.3378884-1-stian@itx.no>

On Sat, Oct 31, 2026 at 09:14:07AM +0100, Stian Halseth wrote:
>  kernel/sched/cputime.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index 9e0fb8633d823..17f3cbd5d403a 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -478,7 +478,12 @@ void kcpustat_dyntick_stop(u64 now, u64 tick_start)
>  			kc->idle_tick_overlap = 0;
>  		}
>  		tick_start = max(tick_start, kc->idle_dyntick_entry);
> -		if (!WARN_ON_ONCE(now < tick_start))
> +		/*
> +		 * After a switch from the jiffies clocksource the tick can be
> +		 * armed more than a tick ahead, so the period may not have
> +		 * started yet.
> +		 */
> +		if (now > tick_start)
>  			kc->idle_tick_overlap += now - tick_start;
>  		kcpustat_idle_stop(kc, now);
>  		kc->idle_dyntick = false;
> -- 
> 2.43.0


TICK_NSEC = 4

         switch
            |
            v
Real: 8 9 10 11 12 13 14 15 16 17 18

Time: 8 8 8  9  10 11 12 13 14 15 16

Tick: 8 8 8  8  10 10 10 10 10 10 16


So if we enter idle at real-12, and exit at real-13 this happens:

last_tick is 16, so last_tick - 4 = 12. But normally, last_tick needs to
be 14 and tick_start needs to be 10. Or am I missing something?

IDK if there is a better solution tho.
Maybe fixing it from the root would be better. If its even possible to do it
cleanly...


But this code works correct.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>



Thanks,

Kayra
