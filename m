Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C17A433A0
	for <regressions@lists.linux.dev>; Sun, 15 Dec 2024 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734268004; cv=none; b=mSQWjO/yJjELYEODi9E4uSPSywLfqmAWP76im/qRHrgMvxjjjZSf5vja5skbBtCIbOaputJbK4c84fy4GnfKc22G+SmsOoQyfH5+BvyEc0nG4MO9J2OhAdU7+qWEo497BNh8qCo6pmlUGyQ7cZHFuoh9vaZtWcbV7mxEVg21sj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734268004; c=relaxed/simple;
	bh=Uz3UXC3ad9lWmYPZMxXlpUyfhBtQPk1wPl9GDqGvU3s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=u3qFywpH/ZUKqulfrNuD08zMMXMy7AGFiB3QDSjY+QOtH6trmNlpAIRMi3beR4Au8Q4cCWAnrd6JPfA+I7Xi2bN4dhJ0Y+zPLDZG7ZLSNgUkwtiqxkrG17gl3v0jdCRpi8rFiCqIkROCwH+QksbYzZW3TcnPhn+FWbydUKXCT3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaZqHP5H; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaZqHP5H"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43624b2d453so36771785e9.2
        for <regressions@lists.linux.dev>; Sun, 15 Dec 2024 05:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734268001; x=1734872801; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4uVOIqETpLgu1IftPIECanmm5P+qCIbuOEo0dVm+x4=;
        b=EaZqHP5H3XtzmiepEArEExJc5LdNYr2hIJicl8lfzVgg1U9NpzWeMPoXrzRvQFeQq7
         jB7nIt3331VXzkvaoXTLn3b/K7Vh/X0fPhpnFfnTw3lF7Ip7k1TjANIpw6czZwH/l61v
         sZWMA6xySfQxrK2Rm44a97Gcf1sWOZRPsreogfuYVfU2m6M89pTrXMhZz3YxlCCYStTu
         IjHXkcjtSE8nIJXqN8FUw3Mp96PowjuRvpNNUnXkHeCVbWIbbl4+oD2+PrBaL6DMEVhF
         1FB+Pw6a67P4GeGwfy2hSRuGaqSf2FiW/rxZgRdu+mAxQW9IAsLoeYVbUt43hBbwLXg4
         eSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734268001; x=1734872801;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A4uVOIqETpLgu1IftPIECanmm5P+qCIbuOEo0dVm+x4=;
        b=QIVmRsDkT9LjdGT7nqJdqF174d+AqCzhlvDo1oMeU9E3vMzSHRTMgDLWxyzuK4iO4d
         C4dTP8FEN03Ob2MQ50RN7Zg2eHuSHQFf66+msis5m8cWD4lkLL/smunCQVi/TWjRyhxG
         p8Rp9QgZss+gTuW459Urk/dZTzVHf9BLZqW3WwtRrNw/rMEzDdCgL2aJqcP0oczBlO5/
         elErBOM8RWUdysuTDDP3NlGs6V5e9nXyh/VjIRmPTgnlU3IOVksCnRSMvVy9eM+ZSPM/
         cG2BU4puZqLsS0QxrpfEHW6mubf67d4wEgwhqo9lR5s+jX9Od0RkPQ/qEM1i/VHvVdwc
         1OAg==
X-Forwarded-Encrypted: i=1; AJvYcCW21Tfzmy/gfd46m2liVu6iq195lDV0atICviUqOsmANFfQVeB8FqPEF2OCrC/LV1vjKiEUYy7N8jG2EQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxo8VbYLVcienW0Fms3btYBdhk0DFS+4A9igd8H/mKaNEtR5v4
	TfRjsddEQ1WmK8VC+lmxfBrq5AH/G3W+y6l5vA3+xrm/RkyKO5Pz34S7LPG6
X-Gm-Gg: ASbGncsPtEcyC6k4JvllYk8EyEqkFUiBJ0az2j9dNW7L73MRo9IwKX9+hU6VQhU0jJM
	zxZl1yOAdDvLHlLYJ+2T08qhjB98pyMZg9/tXF3Pg9M15P4Q+d92HLh4ZnGJby135DH0ZQG/Jf6
	C+0kXmRv5uGjpHpJwOXF1VRdUlqyJjAKAXjWkfNSmJr+Xr4EExfiQrIvrGORKgW9rHqcrT0P6oG
	ShtFGgFS9qVuK+qk3T8fI7qcMOOhSBuF9fPfVSmPRsKygDfQ54WFECOqUonEYTprcQ58E9h5INF
	Cq4/7+zgPZNFPk1BBrpLWpr8F2xBI4Nu9Y4qig==
X-Google-Smtp-Source: AGHT+IG+kkDedAFwVxbAoEhT782acvDkTzFx+j9v7R2pyj9Jq7Po5tzUc+SnvetmP8NADbWAchG2ow==
X-Received: by 2002:a05:600c:3d15:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-4362aa1b06cmr96201315e9.3.1734268001140;
        Sun, 15 Dec 2024 05:06:41 -0800 (PST)
Received: from ?IPV6:2a0d:6fc2:56d6:3b00:20f3:5417:1c06:8272? ([2a0d:6fc2:56d6:3b00:20f3:5417:1c06:8272])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362557c608sm109721265e9.16.2024.12.15.05.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Dec 2024 05:06:40 -0800 (PST)
Message-ID: <e142749b-7714-4733-9452-918fbe328c8f@gmail.com>
Date: Sun, 15 Dec 2024 15:06:38 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Evgeny Kapun <abacabadabacaba@gmail.com>
Subject: [REGRESSION] Distorted sound on Acer Aspire A115-31 laptop
To: Linux Sound Mailing List <linux-sound@vger.kernel.org>
Cc: Kailang Yang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions Mailing List <regressions@lists.linux.dev>,
 Linux Stable Mailing List <stable@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I am using an Acer Aspire A115-31 laptop. When running newer kernel 
versions, sound played through headphones is distorted, but when running 
older versions, it is not.

Kernel version: Linux version 6.12.5 (user@hostname) (gcc (Debian 
14.2.0-8) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.50.20241210) #1 
SMP PREEMPT_DYNAMIC Sun Dec 15 05:09:16 IST 2024
Operating System: Debian GNU/Linux trixie/sid

No special actions are needed to reproduce the issue. The sound is 
distorted all the time, and it doesn't depend on anything besides using 
an affected kernel version.

It seems to be caused by commit 34ab5bbc6e82214d7f7393eba26d164b303ebb4e 
(ALSA: hda/realtek - Add Headset Mic supported Acer NB platform). 
Indeed, if I remove the entry that this commit adds, the issue disappears.

lspci output for the device in question:

00:0e.0 Multimedia audio controller [0401]: Intel Corporation 
Celeron/Pentium Silver Processor High Definition Audio [8086:3198] (rev 06)
     Subsystem: Acer Incorporated [ALI] Device [1025:1360]
     Flags: bus master, fast devsel, latency 0, IRQ 130
     Memory at a1214000 (64-bit, non-prefetchable) [size=16K]
     Memory at a1000000 (64-bit, non-prefetchable) [size=1M]
     Capabilities: [50] Power Management version 3
     Capabilities: [80] Vendor Specific Information: Len=14 <?>
     Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
     Capabilities: [70] Express Root Complex Integrated Endpoint, 
IntMsgNum 0
     Kernel driver in use: snd_hda_intel
     Kernel modules: snd_hda_intel, snd_soc_avs, snd_sof_pci_intel_apl

