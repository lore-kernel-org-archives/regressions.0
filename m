Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1BC3537EE
	for <regressions@lists.linux.dev>; Fri, 28 Aug 2026 15:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930699; cv=none; b=WwIdCfVeo3XlqSGaUvCwZ4RIUSjeeHRCUxKG5lJh7Wt/np7ZxL2x3S1Ax/9DvwKTWysKgdqWKc4BryQJqUDrPzyZ6GXHrqucuaRxm6Wvx6GPAhlIPRxlbnYNriOduUy+2vel4G/TVct0XIV1s3GUKvbL163hroJyiYxk/Bc6Z4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930699; c=relaxed/simple;
	bh=tpyZvgdIuReJeSrdOPCyYr8fsLpfLCii8h1S1BKcev0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XvwY2xT7yRr6H24aRqVz0UfwjCJs4NvGdEqShArSnfwmLYXWp12Qtzs93aBwGC0DZliIe7nVxoTWPVKs5D/fnrXmxsdJw8vEz+kN7bzzelYhNOPQ5uVXYr1OxjWQADHKx+deZQe6NoOEQB1W9Ms7/rx2MnJS1DQGkwIyyFjP/rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKtR4C9C; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKtR4C9C"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39647184c73so2187110a91.1
        for <regressions@lists.linux.dev>; Fri, 28 Aug 2026 08:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787930697; x=1788535497; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9a+pZojUOO4HpL0ROFDlkkfxxX7L9GiDlhrWObpWAw=;
        b=pKtR4C9CpR3Pl8G6Ck6Zyc7MSWCzgGtIeAeWk3d2mWTnnruqYE4FXRTQnSACPhMART
         5vwKG53EZal8F7pxuXMn6cIbLbUyfFG1Y75FEklK2Cx45GgCVWuTC9KASPYVfrEX1g9Y
         BS91s6l1G44UHad3oHeLg6VC8zxJouU2cZZz+t1DoKgGjDNVrx09hjpGTeiwkk1kOplV
         4RVR+72d3kB6kcumi8C2sgd6naUJJj9nKNO5s0diBP8N+uNUY742o8pbmQRW2JzD0OWx
         XIc14GSXEVM7VzKL5jufmK4VfiQatY/GBEwhSo5qjdXeBAyRMCKaIZ+FPcTvYQh8ZKqk
         TJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787930697; x=1788535497;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9a+pZojUOO4HpL0ROFDlkkfxxX7L9GiDlhrWObpWAw=;
        b=WEsYGvuM1tMg4s9op3h3UMWcnQ3cv3vvem9w/FygswwMNlZmcdsWLcXy5QyUrS2d8L
         Twg9r3eU0tuakF8UR+gtsAs/Gv/9969supT+h7aQ7Yc/I77cLcWNbAe4a8VXifUieAlG
         c4n2Sn8IYywKW9NV8mvLw2XhnXwEO4xSQQFKu0oITSFUxDq2WCH5QcF9vUH3uAiIsd7G
         IeOHofOIpgL7B2LQEMoy5Tlr0hvmREwdJKiFPunvxTGcR2L32sFkAjniM90gAopl0zQw
         j8e6sQHhhO/o0fFsP8zFkXSSiZZS7QfpgV3jn3X78ZfYAmGFrUGHKq7gmhHcFtgyf01Q
         hUmA==
X-Gm-Message-State: AFuF++mDiU+KSP95TohR07dLm72UGCfl8dv9mGgsvywYQq1jXweXzAXL
	RgKBO9Nh+m0tlma6q56/KRMnuurH1wf/fwCftnV1EPAid0FiX33CWU52
X-Gm-Gg: AR+sD11taxqXzzDdwicKK/rnz3LSjU88cbH8DSZBterKC4oA2vFYnDhYwZiTljD/Rik
	14jeYFyY1q4QJ7oD2rbIywu3joIW7BYHzIpCURa9pQaf6HxvNHlQw1mBjva+PnZD3Zcnx0dlqTK
	U4A7sByp9GPvMrn1EHp/a/KAk2ACDu7bCNDDvH/OvaZJ3n/vs283nNCf4g16bOcwAb4vSDrcd7/
	L4EU6vIph1QvH38k6tAopHiPU443zTGZTtz5ov4LPpDcbC0uzg7kk0nJ5gHDn67iMcSkTMZgY4f
	HAgGT+zHYN1B/edAQQRukWR4VDlDvR8f4ZmjgIqkAhXsF8NkCu5YfM9WuFcDZk4UN9lTWd+xACb
	KuWGIlvdfl3k4+lEaAsJ1HyvmVlqNX9ctlX6QZGuhVIbRHSVf/bkR1BVl8RVMmLkdsCl2gbzKTJ
	0hDR4CbKhAL/7D0+Vro6ML0fg5UMfURAicBBH7HpfOCgZJfbHMUJDF/saT2+BknRYNfzZ9pDFdo
	QTaTcEICfa6H1p3utrk+/81igjWYm1YW3X88AfDFLymW8y38H6Vkn7cDIYDIdBLlnKu
X-Received: by 2002:a17:90a:f088:b0:398:9beb:a2bd with SMTP id 98e67ed59e1d1-3989beba8bdmr429233a91.31.1787930696923;
        Fri, 28 Aug 2026 08:24:56 -0700 (PDT)
Received: from [127.0.1.1] (ppp-124-121-113-94.revip2.asianet.co.th. [124.121.113.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm7412788eec.16.2026.08.28.08.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:24:56 -0700 (PDT)
From: Mikael Etienne <mikael1022bzh@gmail.com>
To: Mario.Limonciello@amd.com, vasant.hegde@amd.com, iommu@lists.linux.dev,
 linux-ide@vger.kernel.org, linux-block@vger.kernel.org
Cc:
 regressions@lists.linux.dev, joro@8bytes.org, suravee.suthikulpanit@amd.com
Subject: Re: [REGRESSION] Silent SATA read corruption with dma-iommu on AMD
 600-series AHCI (6.19 good, 7.0+ bad)
Date: Fri, 28 Aug 2026 22:24:51 +0700
Message-ID: <178793069172.1699234.13635367891277204598@gmail.com>
In-Reply-To: <fb875f14-3b47-4d43-ae3a-0d0b17e1c64a@amd.com>
References:
 <CAHEgv3TiJUvS=Hustyem0ts8jkbFVAdzBazmPhCbv2sNnTsZkg@mail.gmail.com>
 <c5c2b503-e273-4aa5-ad9f-f7afee02ab9e@amd.com>
 <178791494900.1152725.12728124457005560389@gmail.com>
 <fb875f14-3b47-4d43-ae3a-0d0b17e1c64a@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On 8/28/2026 6:22 PM, Limonciello, Mario wrote:
> BUT the issue internally does show the issue is specificially once the
> 32-bit IOVA space is exhausted.
>
> Unfortunately; the solution is currently a BIOS change in how the type
> bytes of the IOVA is handled.

Hi Mario,

Thanks -- the 32-bit IOVA exhaustion detail is the first thing that explains
the timing I see. My failure takes 3h25m of sustained reads to appear, and a
reboot clears it completely with the same kernel and the same on-disk data.
"Low IOVA space works, high IOVA space does not, and a reboot starts from an
empty low space again" fits that exactly.

The ASM1166 write-up you linked is also a very close match: a controller that
advertises CAP.S64A but cannot actually reach above 4 GB. My SATA controller is
the AMD 600-series chipset one (1022:43f6), which is Promontory/ASMedia silicon,
and it likewise advertises 64bit in its AHCI flags.

Firmware, since you mention a BIOS fix: I am already on the latest available for
this board.

  Gigabyte X870I AORUS PRO ICE
  BIOS FB1c, 2026-07-21, AMI, platform firmware revision 5.41
  AGESA!V9 ComboAm5PI 1.3.0.1c
  CPU microcode 0x0a70520a

So whatever BIOS-side change you have internally is either not in AGESA
1.3.0.1c, or not sufficient on this board.

On the bisection: before committing to two weeks, I would like to try making the
reproducer fast. If the trigger really is 32-bit IOVA exhaustion, then booting
with iommu.forcedac=1 alone should hand out high IOVAs immediately and fail in
minutes rather than after 3h25m. If that works, a v6.19..v7.0 bisection becomes
an evening rather than a fortnight, and you would also have a reproducer that is
practical to run in a lab.

I will try that tonight, with all services stopped, then the
amd_iommu=pgtbl_v2 iommu.forcedac=1 combination Vasant asked for. I will report
bytes re-read, wall time and workload rather than a verdict.

If you already know that forcedac alone will not behave that way, please tell me
and I will not waste the evening on it.

And to be straight about the rest: this is a production home server, so a
two-week bisection is a real cost for me. The reproducer is three lines of fio.
If you can run it on comparable hardware in your lab, that would very likely be
faster than me doing it here -- and I am happy to run any specific kernel or
debug patch you want in the meantime.

Thanks,
Mikael Etienne
