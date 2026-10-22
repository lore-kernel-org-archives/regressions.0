Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792647796;
	b=FBRdIBac3APXowxiQsnHFKLbVv1WHMhVqd/puftj4w+FT/4+aqeASwP4Okvsyoz1b2y1
	 AjB0r+gRobohmCI5ASK0DQblcfyFyVRj6PWOxTEz4GXVyKdJlyXhNUB84Z45dGxk2AqDC
	 pVPeQ3rw2/oWUIRkx6Pv/LzLQwbX83kncSNfnO3e8Yn75bCKen8IVJlZn0qG8hzCDIEGa
	 t5LaV3Rxyo4tbhTHgCWkh8ef+RPukCpvlRqMClVs/OXd2wPOnNe1A4w4GMdQTltE0KSfO
	 eaQ0fcglF6t916wIzgSqXZrAKCPT5RgQJPFcJV8QdryiQX7bcBq0AW28Pv7YuQS9MlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792647796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1K/YYZH4czm1jU+b1K7rWbHbwEBfhgBh/2z0QlPDjh0=;
	b=Jx1Hj8qdsG+9XDp+PITtM2MLd8cLQKk3h7any9eVj0KhQRHQq4V91geTRgpjKV7rFxog
	 ceu8IWWy0T6kcizR3gqzbFfChPaZhmOemB+kdWtKEcVgFdymn5AM9oI7q4rBpRhgIZZ6X
	 NA4+CR335iuXaFoTaGYk8avylx/LA2wEwDN43W6jQKs+pfS8pG4+UTEuGkGDvbw/T0OHr
	 sjlLSkfFBRQ88RMIdH4b5MXAGFHr0EE8TwEV33FOlqcuDckPbCrQeJlkxVqm7524ygEWc
	 +Kb96rSnhomwMYVik+vuzOz2yKaFp024F5Ocy77yoQ/O/jBmI6l9xKk+KlBleHc6wZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i9iSJCIS;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9795606A319
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 05:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9795606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i9iSJCIS
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so14244825e9.3
        for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 22:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792647794; x=1793252594; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1K/YYZH4czm1jU+b1K7rWbHbwEBfhgBh/2z0QlPDjh0=;
        b=i9iSJCISqNQ1/6+T5YskdZJyyYjlweXKHnclW4TAbfzuEqglEmDzqWZ+v8eXzJdaMm
         U42aMh2satA7/u5stB3KRWgVzJDSOmkbBCZ8k7K8jNDcUUmf+pNMuRGo4NQ8gO3/aRa3
         Qw7A+7+FQsOSjMFmd1sLbYH2OKaBOK9Ws33rSYtbajXhFHENMmQ06rNCnlQBQDYC2ZRY
         Pcjt42Qvy4ADz97QhPP6j/Mkc9GueGz0TU+SJWvy/J262saKS0mBVRL1RoUAkf5gVovB
         XdpLEq2sMmUc1yTVQahh2hQErGtk07JvstTRUHRGuxE3iTU2mGusERjkQxRnyVcitzdR
         Zzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792647794; x=1793252594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1K/YYZH4czm1jU+b1K7rWbHbwEBfhgBh/2z0QlPDjh0=;
        b=Er3hOZm4xR8p5Q80Gf3E2wb/lJMKPtslkgxADBlwKwAdOdCpNJmFOyC+TSnk4j3hx3
         LdhOaVPA+U+KJdS6xR/j0kYDDaoBLOFdVElvVXwJvcqZq6wX8WSwmJdKXlaZR01HyN70
         08boO/SoqnPYp1h2FBnVK4ESu/pTyxTt2A25tADAYCvxqOTFbAR9jGHuaAlDRwM5u0tb
         czvCd6xpwislZFYAEHEw0c/ji2qK84soy8OfYxmxHoeiH1ghkc8qpGCeDKP4Ep8qy84N
         H/K8t2WpttA5RgAhNyLH9OVGveFguchU2j3aEzuChChy9PXqrzfMTjm1eAm04EiUDlAq
         TSwg==
X-Forwarded-Encrypted: i=1; AKwUvBxzXaNAem7xX4/SqQugxavrMPLdf85rO2mBpxj/9SzErw1JP2xEF+NL1+iSYimlktHvFmWShHQji7RZVQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKl+PdFmToqDsS2m3uk4xXXlDIwodlMhXyGTznF6ru6los0nsIC
	a0u/vkhY0AHrJs4z/tkFeOUHKxFJkniSYCgWo7bJfbwDxHVJYjXGgXxO
X-Gm-Gg: AYBFou10uxTJ4S+VvvVjBvbvxJ6qiPQIxAi9C16Z165Oo9gScyS4+1FbAlE4tFqopJG
	fYLFqJXG04HzRX/0aHxl3WkMNMHkJyYvBFyxcV514vooxDZHnNfmuszjOgutaoHKcGSZ+gLS1ye
	mpy500o3icdeZOSfHDBbjneSc1q+Qsi+crNrdnN3gQmQPRCQYU0/8bk4Iy1yBD2InPimmvnoBG7
	1Xug9ezIDfDyQ/ODru3x2vNbIM8KrkMM0ULvwfHPxAx9ph1I6xWUoBrV+4K5Dpm2Fgk8P/2RgWg
	x6M5SROId1G58u9kxgjABeys8K/eVZ/5HA8N978uObRGBIRBGKKsGnHfjbeI66a4s2feShd4p0y
	DdjrKXgQ5SgJ47TcChWv/6QpRgoHC8AJVs4JbJHTxHXnPhHTYOt2MrBhlqfR+uXOW2TgnhOUoPm
	7/xPlKomKlMM9/ARGcNHHJF+vF6+TLeeMw6xD4dQVgL5E9tL16VXuB3uoDPpL7W6jAdoaWeHh8K
	frhCAGg8O3a+xaYjqR9YXyPz+LayB8OU6wNu5yQoKuW2GF9jgGDu4+CE1IeqfL3gEZmWfYyFPK0
	VBkBvbUYQ0iw7+wtu+g9R/bYHEPuNW6ryaFCSaU5pLVefvZPV2/i8IUKRpeLrhdshAdGjIxV3r6
	3Y9rpw5gqYLDcY3f5jBM16AnKaCWsl0VOaXN2SaLf4vG+b+xGOylxoMKcWIADMCOPShNSjKyXR0
	YjMQ==
X-Received: by 2002:a05:600c:4713:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4a1fd8a675emr87635575e9.1.1792647794024;
        Wed, 21 Oct 2026 22:43:14 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b4f9d9sm43385995e9.11.2026.10.21.22.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 22:43:13 -0700 (PDT)
Date: Thu, 22 Oct 2026 07:43:11 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Jiri Wiesner <jwiesner@suse.de>, 
	Daniel J Blueman <daniel@quora.org>, regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] clocksource: delayed watchdog can mark TSC unstable
Message-ID: <atmhdRzqx5t8PYrc@gmail.com>
References: <20261010065509.72916-1-kmehltretter@gmail.com>
 <87a4oeerwm.ffs@fw13>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4oeerwm.ffs@fw13>

On Thu, Oct 15, 2026 at 08:32:25PM +0100, Thomas Gleixner wrote:
> >   busybox-79 [000] ..s1. 15.168486: clocksource_watchdog <-call_timer_fn
> >   busybox-79 [000] .Ns.. 16.269726: clocksource_watchdog <-call_timer_fn
> >   busybox-79 [000] .Ns.. 16.269820: clocksource_watchdog <-call_timer_fn
> 
> I did not think about that scenario obvioulsy. The code is resilient
> against long intervals between two measurements, so the easy and
> straight forward fix is indeed what you (or the LLM) suggested.
> 
> Thanks,
> 
>         tglx
> ---
> --- a/kernel/time/clocksource.c
> +++ b/kernel/time/clocksource.c
> @@ -673,7 +673,7 @@ static void clocksource_watchdog(struct
>  
>  	/* Could have been rearmed by a stop/start cycle */
>  	if (!timer_pending(&watchdog_timer)) {
> -		watchdog_timer.expires += WATCHDOG_INTERVAL;
> +		watchdog_timer.expires = jiffies + WATCHDOG_INTERVAL;
>  		add_timer_local(&watchdog_timer);
>  	}
>  }

Yes, I tested this change on v7.3-rc5 (72d3fcf802c4)

                              baseline   patched
TSC marked unstable           2/3 boots  0/3 boots
watchdog gaps below 250 ms    3/3 boots  0/3 boots
minimum traced gap            0.231 ms   505.484 ms

Each boot had four QEMU TCG vCPUs. I used PTRACE_ATTACH to
stop only the vCPU 0 TCG thread for 800 ms.

Thanks,
Karl
