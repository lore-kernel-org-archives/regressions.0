Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFC526C385
	for <regressions@lists.linux.dev>; Fri, 15 May 2026 04:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778820447; cv=none; b=OCwYKDWbMt0xKRZYxdWHvzx2HA0GcNRUHRXLDSn4cUIbIqyZrDo6KEAcRQ5y2n0Ck/YB+nEYSQ2GK26VDYjDvBcSKJhhA515ci7wNJxkIf3GRpKpEZPSpDNQe61ixCK2ZkKfTiKpIQi7dH+14t3PNF1ggnSquvzRIjXnfHmWkeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778820447; c=relaxed/simple;
	bh=NijvWsrsHsPGHfADGjxWbC+hgUsKNBW5ghHkDQqiP8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0Vu/SKbn6/c6zNwVDX5KklRCZEX/TcKd7KUlH/dCGf2Lp63hfS6znbTC57Vrny13NkZ07elmVr0qK/925v60Kh1WhSz1tEkAIpov1HRaTjCp+rHmJPCznvMbsZ2W4MaYCPZnlm/6lwA7oLZkC8IskHof2rZR2nq1A8beJDKzjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2FdmPbr; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2FdmPbr"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c15849aa2cso11954273eec.0
        for <regressions@lists.linux.dev>; Thu, 14 May 2026 21:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778820445; x=1779425245; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WvZB5T4clNth7fcajE013KijBJD905/lgIzRhBekpSE=;
        b=p2FdmPbrwinaN1CIHXWSYoQfefLEpsQQPJHMbYgd7zG4xFi6PMvns1QV9hwuRXAchw
         Ty/vAmnNG1I+RGcQoqzZxBaPHrSNs5F0NhYIBJLlO3nBKkBwFyJa5viH+xcU6tM9RK5j
         eZThsK6ZC2p4cjGX6+D9V1B56unKKqRAI4WPuGjvQjWQhNzL9t4NOEM1m1R5xcqHC/7G
         050xTDWH1KWLqG9+nyi4NPO8wWdLZUF9OzGh/p+7kPr+3Mg79sFhPZo5zT0IYmYx2JFy
         rk6sNW2BsS4cxLMytpkq+tlEmHHRs4U7cUNS57Cm8tHnr3TlcSx7/BaN9hznJUxxLVpY
         DetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778820445; x=1779425245;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvZB5T4clNth7fcajE013KijBJD905/lgIzRhBekpSE=;
        b=a7P7UDolYOixHret0r9F++44m5ShHdriyrZ+ZA7E8Q+w9TIp8oYPXE8wCFKkIxHDhN
         fAt0O8ebA6jOpPRm8Jsfn8IYoem+yBAqZFt7nUBUNfnq+k+cvcjVrlXCwmcateM55cBu
         DORIMAu7O+lSAyVGNHAMqfqDF10m0OGat1L2wCiL8MJcPkBwlC/JENV3CsX8dJ7TAdtQ
         xkIy09dA98hekeFxY4/0hb89opjqQyxf+OwqKq+f7FTNmc4B1u49S1IB+KTEouiMUl8x
         ki2SAro809krQDyTGxOhmeWVKvf61EKG2HfQn/BA6TBn8/4+v0HtMLUOdHj6VF67PUzx
         0b1g==
X-Gm-Message-State: AOJu0Yyw3XgLKkFI+8zRMxMvELyyKFj3Coyh1LsPYYauXb7ISGAbEp/X
	9imYhdOveyhRaTb/yRyGmSCkhAocB+zzfaF53LbX+jKAqU2PBh6RRa/8
X-Gm-Gg: Acq92OH9IxqHHMNRgta+RhkzEgIRMVeMiZYpUxAwkLTgJsT2VYPK+tc4mmsR5C+fGU0
	BnRqkah9hjJJpyo0ppchhFelJGxmATeFHSYz15Fb3LROLeur6oXaeJaY5pz9JWRRBfFVsvw6S34
	gJD8p12ld39DHdanhtKOTMN5FqP7G+VXdAXZsoZnTOg3ZTvWmuLndRUrYn2bCXQ6brDokng3x+1
	XB8o0YoLz1NlDCAYFz1KCciwhe0gGcm9I1TyANbYqpUvYibLiH7R1heU4cZUx5OSqHIeZo5hi/V
	GkN4F15nvlug4vzdDPFyiPXE/zOkUCASEmb1zyM83LOdie82MvFblvTDzLkcO5Kjgpnbet+BYSa
	KtI5dP064UYbb1+rmZxFXPuEoCiY/OgUNaznoA0GiFGW1ceJSYurFQ0CSDcSR5K4zsfDj8ieYTD
	eenOORriKrUqR34BXceuQi5Hs9EuA2tw==
X-Received: by 2002:a05:7301:1983:b0:2d3:f3fc:bb6b with SMTP id 5a478bee46e88-3039818ee3dmr1245826eec.1.1778820444974;
        Thu, 14 May 2026 21:47:24 -0700 (PDT)
Received: from [192.168.21.192] ([67.170.89.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bc9d4sm5528796eec.23.2026.05.14.21.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 21:47:24 -0700 (PDT)
Message-ID: <0669f754-a313-4aa3-9923-0c374d49feb3@gmail.com>
Date: Thu, 14 May 2026 21:47:23 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: the stuttering regression in 7.0: should I have done something
 different
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, sparclinux@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <ffb44522-f01c-4be3-849d-27dc17fbca7f@leemhuis.info>
 <D5D19776-C809-4284-9417-F9A860877B98@gmail.com>
 <1c165caf-36b4-4673-97fd-ed86bef17b88@leemhuis.info>
 <3332123b-9e11-4895-9ab3-1707fba5815c@gmail.com> <871pfj9cmj.ffs@tglx>
 <a7a0d78b-435e-43c8-b436-5e7f4dd39dee@gmail.com>
 <088e6cfa-0167-4748-af6c-458ade2f303a@gmail.com> <878q9p82je.ffs@tglx>
 <64f465ca-6117-4375-9c4b-af771b8205fd@gmail.com> <87tssb6olo.ffs@tglx>
 <e45438e7-8501-4c10-95ee-07f118de8a51@gmail.com> <87qznez3tf.ffs@tglx>
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <87qznez3tf.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

I’ve completed validation with the v7.0.7 release and v7.1‑rc3 on both 
S7‑2 and T7‑1 systems. Everything looks good.

Thank you again for the debugging guidance and for the feedback on my 
original patch addressing the timer starvation issue. It was a pleasure 
contributing to the resolution.

PS: I agree that the second patch we discussed isn’t needed—the systems 
run correctly without it. The following patch alone is sufficient:

Best regards,
Tony Rodriguez

--- linux-7.1-rc1/arch/sparc/kernel/time_64.c.orig
+++ linux-7.1-rc1/arch/sparc/kernel/time_64.c
@@ -146,7 +146,7 @@
                   : "=r" (new_tick));
      new_tick &= ~TICKCMP_IRQ_BIT;

-    return ((long)(new_tick - (orig_tick+adj))) > 0L;
+    return ((long)(new_tick - (orig_tick+adj))) >= 0L;
  }

  static unsigned long tick_add_tick(unsigned long adj)
@@ -277,7 +277,7 @@
                   : "=r" (new_tick));
      new_tick &= ~TICKCMP_IRQ_BIT;

-    return ((long)(new_tick - (orig_tick+adj))) > 0L;
+    return ((long)(new_tick - (orig_tick+adj))) >= 0L;
  }

  static unsigned long stick_get_frequency(void)
@@ -411,7 +411,7 @@

      val2 = __hbird_read_stick() & ~TICKCMP_IRQ_BIT;

-    return ((long)(val2 - val)) > 0L;
+    return ((long)(val2 - val)) >= 0L;
  }

  static unsigned long hbtick_get_frequency(void)

