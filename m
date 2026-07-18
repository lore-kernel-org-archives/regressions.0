Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE402E3B12
	for <regressions@lists.linux.dev>; Sat, 18 Jul 2026 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784363364; cv=none; b=F9f1QfS1vttl94Qfvw91nnGk+S6e/Et881nGTPeqiY18scmogNeKZu0aV2epIzyry/dHUpnBiBFbLpk7nj6AvP96sw86ZHxL+C1VyU8mne6RfpBUGKybr+B2V2mQswNz6cIe+FIci2UI3g6pCdJkEiHBux3h+3aXs3bSR3cpt6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784363364; c=relaxed/simple;
	bh=bwKJTQJCKMd9LGy69EDnfYFH0Jeh5NUlf7jASPN03u0=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:Cc:From:
	 In-Reply-To:Content-Type; b=uJiMsxslZ9U3XK2C2B1ZXC0WiswaXFe++7zpsXRailjhR1AXgBNdKI9AC3eOygpXlT0ChF50cYZFXwTEYwVTZTOnqfdzlU9m39rdFlo1PtbezHEzpj1Sp+7bErB2THgtMVCl4CTRVOdSEIEn3sbU+U2YhiZMnxKoxiSGyw5amDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BM6gUVbx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BM6gUVbx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49546c690ffso14842845e9.2
        for <regressions@lists.linux.dev>; Sat, 18 Jul 2026 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784363361; x=1784968161; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc:to
         :references:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q97TUmV2DQk8THGELBHc6YQIVtcyBA12wZnwktioMfo=;
        b=BM6gUVbxm4iwMXurkXwcaSXrr+2/ibfq5Dp/u9+grbytHf7Bj5y7pc+I6wpwdSOfgU
         JObvQjxAOIAAlqsyzai+zQ4rmL6z4MN/72x1RlE8t/mxed7d4tRwT0rJJ1D+W3F5z435
         1y37DcmlQdceW/LqI3BJYuSrOZ7Xf4341Ov6G/6IBJzdP7k/3PXFa5WfIKzWAktSOfiA
         nBAm5nKzlCkn6kvTnE6KjcveeRPSs3iftwmEZg80pM2tkL/4E5v8KxqThPYPtDo9bGHn
         tI8DcIYAYVGAtdMUd2/MjwAUJqoQnWQ+fkPxf+I5l92+SKXtRqWl8QW2pvT7shctFWcI
         qYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784363361; x=1784968161;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc:to
         :references:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q97TUmV2DQk8THGELBHc6YQIVtcyBA12wZnwktioMfo=;
        b=HaFN+a4tRVfxjOYWb+YKxwv+w4pyV68Q7Vd6lK91kmmQJeJY31Cv4EOGxBmSyR1ZHC
         o+S5Oj/l3szP0/LJqvEQO/2bAyFZHreO4lXSlFpu3/v576iEvqvKlIgAveBG6zr/VVL0
         96zefvl+oRVZPJfpJXmV86CJRpV52fTU4EGLz7g+vKLU9+GQ5V5b3j/XPzFh5TWOn6ZF
         JdBbMgEtBy3xWKTVqA+9t+Osl3rwvX8UQjcE00HmlWdnA0/iGpP9nQtIrfYBn7F5sAm/
         a2FodJcGYyF9iTS040RR1fK56lNvzngwjMyZOSH3ueu46pt5G72eeHevAhH0+rFkqs5g
         kG4g==
X-Gm-Message-State: AOJu0Yz5bhVQFc5eVHOLyGB4FTO09ASjBnsGgEXJcI1BAfBmGPR9HjwZ
	bZXnO47TF8zklxr5t0USm/EkFbYTAA4aEijCGptErJZaHTO4Jr8uTaiLqkTydhQJ
X-Gm-Gg: AfdE7cnr3KfFY9Imn7ZSCqFJpZetr+WWk3uifkSwBLN2N39JJ+1/0J6d6wb9/g4131a
	h6PORqpod5GFKByPv1sTW6rAW5umxc0Aaex+GfyhU2XKY6jgrpGbzXRlJzh+KRFvR1PeGB9Nv9D
	MYL7tIcZJPftO5OICSQxifFNkAoGZNuAPiTFih70PBmzLW0Y3LymH28pJDh0HwBG5hgE3S0wg/2
	rS/vQBPfF9o2+r0C56byVf6viJARA/J4I8ZKIpAwSGDERccgkZcysfZkl83cA5ophLZjoDYNYeG
	6zht24/tAOovrgs0U74zuc9LyQXMDHeS400kJj5lytJ0AV4z84N5vb6Bac17EKVJCWnsa2DOqK0
	uieWrtDKHMbw6nEx38pAA3z8KjVKFnV+MfJWTeJqN9IhdDDJIIUccdLmesKJHuZt8N+E/yyuWec
	zDTfidCBxLaL9eEQ==
X-Received: by 2002:a05:600c:c494:b0:495:4df2:b8c1 with SMTP id 5b1f17b1804b1-4954df2c89cmr39549365e9.35.1784363361134;
        Sat, 18 Jul 2026 01:29:21 -0700 (PDT)
Received: from [192.168.68.67] ([82.65.196.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm73741625e9.0.2026.07.18.01.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 01:29:20 -0700 (PDT)
Message-ID: <5e456d33-7e8f-4e54-9149-ac3cff229445@gmail.com>
Date: Sat, 18 Jul 2026 10:29:17 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: linux-image-6.12.94+deb13-amd64: does not detect ScreenPad on
 ASUS VivoBook
Content-Language: en-US
References: <0dd06508-cb74-4152-8798-9fc5f1c4999b@gmail.com>
To: regressions@lists.linux.dev, regressions@leemhuis.info
Cc: 1141604@bugs.debian.org, luke@ljones.dev, corentin.chary@gmail.com,
 hansg@kernel.org
From: Ponali <ponali2k@gmail.com>
In-Reply-To: <0dd06508-cb74-4152-8798-9fc5f1c4999b@gmail.com>
X-Forwarded-Message-Id: <0dd06508-cb74-4152-8798-9fc5f1c4999b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit




-------- Forwarded Message --------
Subject: 	linux-image-6.12.94+deb13-amd64: does not detect ScreenPad on 
ASUS VivoBook
Date: 	Sat, 11 Jul 2026 19:43:19 +0200
From: 	Ponali <ponali2k@gmail.com>
To: 	1141604@bugs.debian.org



Hi,


I have made a list of everything that the sysfs attribute can return in 
6.12.90:


actual_brightness: 70
bl_power: 4
brightness: 70
max_brightness: 235
scale: unknown
type: raw
device/driver_override: (null)
device/modalias: platform:asus-nb-wmi
device/uevent: DRIVER=asus-nb-wmi
                MODALIAS=platform:asus-nb-wmi
power/async: disabled
power/control: auto
power/runtime_active_kids: 0
power/runtime_active_time: 0
power/runtime_enabled: disabled
power/runtime_status: unsupported
power/runtime_suspended_time: 0
power/runtime_usage: 0


In 6.12.94, only these files change:

bl_power: 0

max_brightness: 255


These files do not report any information:

uevent: [Blank file]
device/cpufv: [Permission denied]
power/autosuspend_delay_ms: [Input/output error]


For both kernels, setting the brightness to 0 has both brightness and 
actual_brightness report 0.

I cannot check the minimum brightness through uevent because it shows up 
as blank.


Regards,

Ponali

