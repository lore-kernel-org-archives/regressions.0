Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7682136E496
	for <regressions@lists.linux.dev>; Fri, 15 May 2026 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851254; cv=none; b=ehigz1pw810TKt9JntAHbP+cEefgFUMRmNWSOkruVDtgq9aDfPjBkbhf9ZQyRuDumievT79ph3vYz0vD77PDnMead7RX8o4pWYzymZukpbFmoQ2UD2oZhPg731+Wi13P+AibvjxMgHoFX4h1CzfM+CgAW02M1DozGNCel86XV0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851254; c=relaxed/simple;
	bh=EUjHVdOL4OnxkiFEE9a6tRvO0ZDZXORiHe5u5drmdcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SaVLgbJX9fg4qOOw4aqZOG0fXbVgPcBFUhojyO3AlnuIlm2i6yGjdzf9x+E+Js+9IPN7xFI55w8qG0CgDqmJB/mPm024jTuN9SD6fvCpQzvs19mkKVlEuwX06LrZcgrCxmrX9dVVxWXcAzSkFerO7TaC1W2pQFeb/PRyywIRlj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=qQCB2oJQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="qQCB2oJQ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso75306035e9.2
        for <regressions@lists.linux.dev>; Fri, 15 May 2026 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1778851246; x=1779456046; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8hzVkH/JruLQyMtnsvB/kmo/8/tYX8ehTN6GhMa4cU=;
        b=qQCB2oJQpbIIUhuojZGMcv97SU9QkpSn6Kbnh2iQGh/wQ+OaVdi28LX9HkXdvPNiau
         apzALDG4RHggQsifSBKETVNpvbPQfFecC4YZsI60VuGpPOONrZ7UK8IbVaVMatHekzCZ
         2Tdqyo/Qk+st7L5T3ASfWPsX6u1f7LsH9iyzl4B71aH+80oV34K2CBai/AUyHdP1r4/b
         3pPzQw1hUw70uUILx8c6KVGJVi6jWy7ErxRfQ0oJgJCs7a8I1S6X6pPHhTSoSaK6y5IA
         WwAkzOcZ4GHTAoVGGcyk7yQp5I/wVfzJFVOf0EFUrFfW5GBIcIodGzFwUFXx7jyuHBq5
         +rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778851246; x=1779456046;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8hzVkH/JruLQyMtnsvB/kmo/8/tYX8ehTN6GhMa4cU=;
        b=AdOUmLX9ryyTR2g4vxBf9Au61ZVY0Q4C3nZRcFjJNyV2lWKx8TABhQped6iGLpfdJn
         l6WJsaKFtSHBvILCifxYjtuhR7nAb13MOPGFUvCvvyvUsoEPdazH3BYltJ1hN+3zHHJA
         7IQYwJd7ga0FtCinU3NtJ+5KwHsnlcRvRU4lzpxjZ9zbEYu9lfji4E89hhyrjmhdDJHy
         TUgOzPUHv+BQIEe+LoHF+DQfB9f/VNJNQqH+mJ2UKrbMomMYp2ob2Jw+1qO3w/T8tlrk
         TWNXHqCQdvTCsi9M7iw/VJUxHxkLTcLGwafh3Pmlwgz6MmukA+fLpNJCiavDIqMGJ/0N
         aCrw==
X-Gm-Message-State: AOJu0YzIyAPBrKiGmg6Yh2lC0L/V/Qe1rV8uUWCOE5WS3hnMIgTyEwcq
	h8DvFKKAwAHyJwKQpsB7ZL2ikWClsCnTYs0d3iAVo6pLBuEYDX88HanuXX8ICPF0
X-Gm-Gg: Acq92OGNH1PbqzUZp5yhzmQJTtRLj9QScpXUF0P9qXdp1N+aoe0V/GM3AamBuhS9Iau
	RsYcFcWcSnMUeo6ZlPTHJbL/hue8rR2OlpxPRZst+sFqouKXfDj3gm04lQGDnUwXYL+oDYyRMu8
	/PNuVYWyNH/zrm6ETSUilLjaf5VWkuJsgS5g3mv8hp3zHrHyb6WrsX83W9AUcxAUPRWg2g7gFdV
	sti+rW4Lfm2UjjKQOoP7RLgNlLYu59Qv1XRU1emy+6YYASubaHXZq0YlQ2GMA6JLqQJQu/WmhLk
	ONa2MCmqbJl4pljrNIl1ODSRYxKjKPFVZVFM6Kpkn7N0xl4diIRPET0R9EbXmMOpaeiROSOZUmT
	tQiLyBKQz5oq2JyUFIWoj7xrD6DVB9sEx4LJFvEcrM03IAFWy3+c/tZBzEApA2T7516NUjKO6V1
	ZDcjvmxwpOKi+sBDCnoPXM8r1Gqn4wOLGc8eInp/d50cwGHEEmDP3eMHr9mIpa9XYicRhIDLXda
	j8PIcuSV3U=
X-Received: by 2002:a05:600c:3e1b:b0:48a:6fd4:d3d4 with SMTP id 5b1f17b1804b1-48fe6626c48mr46512445e9.29.1778851245713;
        Fri, 15 May 2026 06:20:45 -0700 (PDT)
Received: from [192.168.200.7] (p57b87516.dip0.t-ipconnect.de. [87.184.117.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d0bsm13548577f8f.3.2026.05.15.06.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 06:20:45 -0700 (PDT)
Message-ID: <b5c9390d-e365-4a99-acc0-11d9fde8f17d@message-id.googlemail.com>
Date: Fri, 15 May 2026 15:20:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] bisected: 7.1rc1 breaks backlight control on
 Thinkpad T480
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
References: <d2de7933-e650-4b19-8d88-90d66693dcfc@message-id.googlemail.com>
 <233da598-4172-4f16-9fd5-67590984616a@leemhuis.info>
From: Stefan Seyfried <stefan.seyfried@googlemail.com>
Content-Language: en-US
In-Reply-To: <233da598-4172-4f16-9fd5-67590984616a@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 15.05.26 um 14:13 schrieb Thorsten Leemhuis:
> On 5/15/26 13:47, Stefan Seyfried wrote:
>>
>> I found that 7.1rc1 broke the backlight control on my Thinkpad T480.
>> Bisected it to
>>
>>> 40d2f5820951dee818d05c14677277048bd85f9f is the first bad commit
>>> commit 40d2f5820951dee818d05c14677277048bd85f9f
>>> Author: Suraj Kandpal <suraj.kandpal@intel.com>
>>> Date:   Tue Feb 24 08:43:22 2026 +0530
>>>
>>>      drm/i915/backlight: Remove try_vesa_interface
> 
> FWIW: Here are two bug reports that contain proposed fixes for what
> might or might not be the issue your face:
> 
> https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16043
> https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16015

Thanks, will look into testing the patches floating around there.

For now, this

  diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c 
b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
  index a8d56ebf06a2..c4ac46559669 100644
  --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
  +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
  @@ -745,7 +745,7 @@ int intel_dp_aux_init_backlight_funcs(struct 
intel_connector *connector)
                  return 0;
          }

  -       if (intel_dp_aux_supports_vesa_backlight(connector)) {
  +       if (0 && intel_dp_aux_supports_vesa_backlight(connector)) {
                  drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Using VESA eDP 
backlight controls\n",
                              connector->base.base.id, 
connector->base.name);
                  panel->backlight.funcs = &intel_dp_vesa_bl_funcs;

is enough to get the backlight control on the T480 going again.

I know nothing about that code (obviously), but maybe 
"intel_dp_aux_supports_vesa_backlight()" is wrongly determining VESA 
backlight support on my machine?

-- 
Stefan Seyfried

"For a successful technology, reality must take precedence over
  public relations, for nature cannot be fooled." -- Richard Feynman
