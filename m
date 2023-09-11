Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE355F9F4
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 13:40:06 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-68fac16ee5fso1207509b3a.1
        for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 06:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694439606; x=1695044406; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9VDr84hSVbwi5hvH4wIjokLGVKj3hqHaN8d1hkVJY4=;
        b=CcmEy8nSE6ofXUU7bh1PTv6D5aloaC4jR2anvlQYhfAqMLMiVkB2nSIdCTTDgO5zwr
         1rZtqGmunil/rGv66sP/2My2qlOmD9nRxChFtdmCtxphf3bRcn+Qh5Bx6QnrvSZtAP26
         z5UCc493gH68wasTbSfHrrQGnNG7DVrKZdTvpVo9dHKvyRK1JEqwpiuwtp6ks41YSC4T
         Cufjrm3qjNES4BPmsmRo2S3QMuGzzYdvRhYJokLsV0XTQpF95IQqwOIawF84yGRGT8fE
         N//d6OiIAut263z8CzyCif5f2LldLOHPAOdkPmEWM9ecYSk4esCH618PxSk83m5BBTh/
         ThbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694439606; x=1695044406;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K9VDr84hSVbwi5hvH4wIjokLGVKj3hqHaN8d1hkVJY4=;
        b=IsSPytm9R7If12RxLMf1Cfqx3DY6bOKiWS5jqJKkdnbsXXCQWHNjH7iJjnEcw0l0Vs
         nL05bNiphtB9BCczF9f0/dlucSX9lQ5sTQnTTn1wN+SA12qhji5HASAKF4rPFYNxJcZy
         WyMXpW8KmyutE5IMet8cCpeEOfBgwimzUSZY0SVSfIyd5ZH1gnatKwOlVc4DUEJIlPmf
         tnqHsrMiE7AAVonUwHp1O0eFnK1aYULZdZfY4VHw24MfLlILTsmjqNmngh15vFZPCAQj
         CzcwBJ6ItoI6fTjixmhEg22Yto3kFagOUDyUrzlQzdPFKoY+Ne8XP7949ORJLw3smqIy
         aUDQ==
X-Gm-Message-State: AOJu0YzsABHk0Cz5xGx1KFVw4XZoInn6spZ+UJe5/LuyBjYB8YM6J5RA
	GvfFPqRb8xtp66nevsrFRK8OIzvOlk0=
X-Google-Smtp-Source: AGHT+IHl+4gbjB8OtkXTZb4JoAUuLBWU7WwHxuNnS5Pl8rXN09CaFnfnRlaNdAWTO0udNuAZHj3BVg==
X-Received: by 2002:a05:6a21:33a8:b0:153:39d9:56fe with SMTP id yy40-20020a056a2133a800b0015339d956femr9510871pzb.47.1694439606062;
        Mon, 11 Sep 2023 06:40:06 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id w14-20020a63934e000000b0056c52d25771sm5473916pgm.69.2023.09.11.06.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 06:40:05 -0700 (PDT)
Message-ID: <514e7d3d-93ed-f2e3-0278-2bbf71e87693@gmail.com>
Date: Mon, 11 Sep 2023 20:40:00 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Mehmet <mehmetmutinturk@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Input Devices <linux-input@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: amd-sfh module causes reboot and shutdown hangs randomly on hp
 aero 13
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> My laptop (hp aero 13-be0024t) hangs at reboot and poweroff requiring physical poweroffs (long pressing the power button) when attached dmesg output is generated. But this seems to be random as sometimes I have a dmesg with no errors related to amd_sfh and I can cleanly reboot/poweroff. Blacklisting amd_sfh module fixes the problem. This problem started with kernel 6.2.x and still present in 6.5.2.
> 
> During shutdown/reboot console outputs:
> 
> "Failed to umount /oldroot..."
> "kvm exiting virtualization..."
> 
> but cannot complete the process (waited for more than 1 hour).

See Bugzilla for the full thread and attached dmesg output for both hanging
and no hanging conditions.

Anyway, I'm adding this regression to be tracked by regzbot:

#regzbot introduced: v6.1..v6.2 https://bugzilla.kernel.org/show_bug.cgi?id=217900

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217900

-- 
An old man doll... just what I always wanted! - Clara
