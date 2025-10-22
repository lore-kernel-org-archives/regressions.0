Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44E12FE075
	for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120536; cv=none; b=Zw0CQlNZXlFL3y99f2WHCPE2K2jDJ5OMVCS6Df8C+VoZhYOSQ2BtrB7/HYPosGJIe6+UkawtGJsm00VtHoBEtXJQRpgK4JJueK4BpLHL/FSjaJ99zeYX3ltjmAxITqVP1vu5w+CJY0q4LUc7VrGu9Y/M65mcfoOVNEc7e5+Ih90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120536; c=relaxed/simple;
	bh=yHZI+oRRybgwHU8EgfjqgnH/F8s2S0X03JL8R3MevwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5GRD1Aux/XFoKH4AdpfmVKeKbi06zwXs1TZZG0CjABWWuzx0a+xhPFXO/sUXRbGnKlz/4dulJ5801mNM6rgf88oSLfCnOYNzfbjXvIR04BdA6IP646J5pGCD2Tn1aGJTKgfFpqBmyPe6XHOHeTovIFDClcOYxVwYJW9t0VTYgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=KSAC3Fzf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KSAC3Fzf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so20214265e9.1
        for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1761120533; x=1761725333; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UcnB1vPCv4/5O7NSkhwvuNPMqNZtj/H/Vxellyl6lWw=;
        b=KSAC3FzfIaJdbNEkyddtNDCgZag0tYKiIsWrG7FWI3W4pp/V5XCDhTauTGA+X2dEHg
         vgqG0bP/TyAJIfI4RfmxW+1w71/aNFpKzsVA9hDV5gN2EXCcwPdhnTNY16UKfSitoDNq
         0zSVhBfOgLENkJvnPnOXTjvLLiDbpRno4xO/sCYyeAzsVw9yAV2YbXWXSVBUYCawGoeN
         mmZGhQ2ElS+Bl2yZoyIKhA94wlHGqssYpmp1KMXRYMOfQD2LruW1QQCtGMdPKcHYJSad
         +R2eIPpZsqIT9IHfB22AIGzlm7+5dME4GgSmz+qDdZx6FiH6U4c2/qtKNq0bVsgu49Li
         zVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120533; x=1761725333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcnB1vPCv4/5O7NSkhwvuNPMqNZtj/H/Vxellyl6lWw=;
        b=MbieXrS4DeoBoZdRQKMlDsW/xvVCkEAAhQrJkRd1v9e0KbK8U2Sj0/adnZmk5uYdlx
         fdOquQhHSqUr5h2M7K2YgT7h4QSUeYO+ooINgsNqG2DmhR2lkOaP1zZtvRrsN3YrioJb
         e/VcUgiD+xaM1+rEKXMUMgY3B39fYlDg77jwNneB/fox/LlnRECPQO4bKHrwQpa1g++D
         OQElU2ghymdLWx/Cw/1c+aiyo1KiWFb7weR7rrgJovMcjgqCgOFuhKq8crgr8znisTpB
         dp6+Y7Dm5v9WZsxnX2+wZH1ZOvRErNY4+6HYlrbiK0whAHW3UWvHveqB2QV1hnuYwuco
         w+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVqLn4R1e5UpAcG8vdT6J/zw8OLrvoiPu+7oKVkXnMspFGcaNfNQhBEhWwS3jk3FUdznAp5rBdeW38bCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwS1KU9RVgB/yfXnoz7O4M2GWOMk9J0C+jjSiOxSWnOMGiZaoOl
	sHL7X+REenJZMsCaD/fPz8gy/vcNRaUFMH0Oq5Zb8KJWfD+F0CnYdqI=
X-Gm-Gg: ASbGncuBKuBLcCbSF9ipGnHipyrwkTeIgSS/b3C4VCcRX1ZSPzRhLeqd9GrX3F4Pms7
	xo0377qSHfiSrSzXxKklKJ3XtBJ7SucghclzlxpXo99ZTH99mt1GieGu+V6SlxMEz4ZxyXBDvlg
	mIrfrHNxu2W0CoawFEyzkD5iJA3X/lLD3waAoEmUnN2hkXD+F0Ll7i9pcrdV7aYxcAjsdm/DJQQ
	rjtlwVetykmGGNSBtG7hpFbU9c2i7Zn9lZsHeTfu96ysBmL3asIsRW+XoIfumP6rAVe33N8nSFT
	hyghkVjo/9XwbGAYJRsrygCUZ9T132H5dyg8NZ0jxKz76a9t73sPFTGZMQ9YUzqrJYiMGv9diyb
	jbpqQATTQc9KR3FM4ogYRHn9qAwqGKZc/HN9bQTwFmMOQey6veMIJWZp4/qddmTEx2gpnVXCb5k
	PJyzK81It2qMY/h0lTC7EokN38Ap/UH4jceALByB+7Y8i5SSJYXb/WRaRZS4e57A==
X-Google-Smtp-Source: AGHT+IF/cCvzRlFyWOqSA/Xn2hsqVgkC6A23PcoYB3/ncn63CK7+kyxojS9N24qzW1KCsixw1CexVg==
X-Received: by 2002:a05:600c:6085:b0:471:133c:4b9a with SMTP id 5b1f17b1804b1-4711786c79emr171726605e9.6.1761120532780;
        Wed, 22 Oct 2025 01:08:52 -0700 (PDT)
Received: from [192.168.1.3] (p5b057850.dip0.t-ipconnect.de. [91.5.120.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428a534sm35770345e9.6.2025.10.22.01.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 01:08:52 -0700 (PDT)
Message-ID: <798ba37a-41d0-4953-b8f5-8fe6c00f8dd3@googlemail.com>
Date: Wed, 22 Oct 2025 10:08:51 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [REGRESSION][BISECTED] Screen goes blank with ASpeed AST2300 in
 6.18-rc2
Content-Language: de-DE
To: Thomas Zimmermann <tzimmermann@suse.de>, regressions@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 jfalempe@redhat.com, airlied@redhat.com, dianders@chromium.org,
 nbowler@draconx.ca, Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20251014084743.18242-1-tzimmermann@suse.de>
 <a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com>
 <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

thanks very much for your quick response!

(adding Thorsten to CC)


Am 22.10.2025 um 08:51 schrieb Thomas Zimmermann:
> Hi
> 
> Am 22.10.25 um 05:27 schrieb Peter Schneider:
>> #regzbot introduced: 6f719373b943a955fee6fc2012aed207b65e2854
>>
>> Hi all,
>>
>> I have encountered a serious (for me) regression with 6.18-rc2 on my 2-socket Ivy Bridge Xeon E5-2697 v2 server. After 
>> booting, my console screen goes blank and stays blank. 6.18-rc1 was still fine.
>>
>> The machine has an Asus Z9PE-D16 server mainboard with an onboard ASpeed AST2300 VGA chip with 16MB VRAM. I have 
>> attached an older HP Monitor to it via old VGA jack/cable. It also has a second graphics card in a PCI-E slot; an 
>> older NVidia GTX 560. It is not connected to a monitor, but I have configured it via kernel command line for PCI-pass- 
>> through to VMs running on this server (I use Proxmox VE, i.e. QEMU/KVM virtual machines). Currently, no VMs use this 
>> yet, and also no VMs are autostarting with machine boot. So when this regression occurs, the server is idle. Pressing 
>> a key on the keyboard does not make the screen come alive. The server is running fine though, and I can access it via 
>> SSH. It just has no graphic output anymore. In case this is important, the machine also has a ASMB6 BMC (can be used 
>> via http).
>>
>> I have attached dmesg output from both 6.18-rc1 which is fine, and 6.18-rc2 which exhibits this bug. I have bisected 
>> the issue, please see attached git bisect.log.
> 
> Thanks for the detailed bug report.
> 
> Attached is a patch that partially reverts the broken commit. Could you please apply it on top of the broken kernel and 
> report on the results?
> 
> Best regards
> Thomas


Your patch applied cleanly against 6.18-rc2 and the kernel built fine, but unfortunately it did not solve the issue: my 
console screen stays blank after booting. This is regardless whether I do a soft reboot, press the reset button or power 
cycle and do a cold boot. They are all the same.


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
