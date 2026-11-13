Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573852;
	b=LsV1po0SZW0BSsTZ93xNPvXMhU9lvxC4qYMDXFPFwD+JfDe2Ih/f5HhB4b69qsAAkt/p
	 4saLFvFevBgc6zXBwTC5seU4AO5EFVG2lcAK5vG3naSiG+RFY7dEZYNMduLofBig8GMbd
	 3fGIR1b/tx7hcMQuFVQj/WQqxe1bQw/u/ExMZZEMlkiDJ+MWBtY/cJXwCoH/hloX79P/5
	 CrNiL6ZPnFLPPv6IxVr2RVE76TSMQwtgJMvK544eFnGiuJ17SILEae5i/8g2EKdHbZ2Rx
	 QXLK3GFCXjEN6JWfJcU+7aH44Kd35svqro79fRsVGda54rxYdRyVjvBdHT/4GGg4joA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pMOUnEce+C5mclnZmcyWz+KKwfqvAMI7phNLC7162fs=;
	b=Rpe3CEFmVkhSpvYDiteQXH+ZCYaLY/VIf6MmKRH0r1E4zCbUQltQF17ofPMSijzm8ACj
	 fchBxCTKFvgDozobNee6s9W867/4aVvQoeZRDd3fGVKrEUDz8IzQbS23tNeOgwPnSPMN7
	 eclgVmMQx7V5CAHKIj1KyUTQjPJ+qdvNrspewwIIy0GzcUS39j/pBv8Qz01JfQwvRHUkJ
	 Jvyw75Spv+D6toLfp+3Nvnpg3VnFu2DOgGfc65GY91CA58QxlI6B3lFgXXFDpkW00BABC
	 xQmfILmcQKkL646zdoVx87CADT2cf1DyK+LpetMKWnhovubVS05Sdp5FOcB7sW8wsvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PqLFEr+I;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B13E606A331
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 12:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B13E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PqLFEr+I
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4922523d1afso411741f8f.0
        for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 04:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794573851; x=1795178651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMOUnEce+C5mclnZmcyWz+KKwfqvAMI7phNLC7162fs=;
        b=PqLFEr+I6vfZBheNYid4hWb0hUSlH/H2Zkli0HMsVowEtgXqulGrL93xRrNPu2BoSo
         OVNX5Gt0//V+FxHaJTl/FbMLl9299SgMczxeNMoiwIebsSyWbm2BAGrg4DsTP7BoZEn5
         56Wk46so4V+aaPQMUGzAyMLnOgu+fJ/heuryp26lk6wbeaFJoOKwrE43sXVEXImNiDp+
         JpQM3gn5nugpVvkfBo5eGmXWo++N5PXv4oZ5wnOWp/1tvPWT8vPI7922TPSrJ1GyiktL
         f8Ex4Y+0OhqvQNEep/Dq5OHpAw2UPGDYR5wCP1soC56kSkxv62+louyPRMTYlMlIpx+V
         E1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573851; x=1795178651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMOUnEce+C5mclnZmcyWz+KKwfqvAMI7phNLC7162fs=;
        b=0L29ADCo+rFxDuUL5Qd4rscSxCg89wsLMR12KkDKRvp0Y6kAMNa3ETNBuSJSITVv9M
         XtOglRxKX8hMcswGBupp5PkEv9eK6+JVyrakvSMIfGuMQ+5IM6LDg1E0eQWGccItFPQF
         BBQORuI4enCaFhnefnEgyPa5nJCoZYNBnSJre1IqFOWwfPVEZoawzu2cE7Zm455h0w+I
         eze3imw8gp8+YqATINunmGBeqSphBiufLbKtBUB7wFF4co1/duoEV7xccTX4KM++cXWv
         SdJnX4+plJnXT23yWJKull8dWXUajiUNJ+z+g4sQUhO3X/qep8MTEA6a42BY65EEqQGA
         jfWg==
X-Forwarded-Encrypted: i=1; AL+hErEA3hAmbNRs48iwDULNjS2c5wZArHIdM/Yw0Z0GqMu4laUEpSfLg5IlpJL9J7GstDl4v9q3I7BfVOOcng==@lists.linux.dev
X-Gm-Message-State: APuU4Z+wyjI/msLKSxonwRzAhxAi0O73cfNSu+T4EPPcjWmGDCBEmdaP
	B6U075pccr+bULCEdlkEBX0qDOECIS/+bFzYQiLMFZN9ZGAb34JFBUDJ
X-Gm-Gg: AYBFou0fT/2nMjz86ejB5wvK9UFI05wBn2PL7kSLc0FWxZVTypRUuplR2ws//X/OGpo
	3/YQvyxLwQgC8xoOYsRGhmWnn4buNkaDTr2oo4rbDeMu6kmnZyxqA0x6aTBrjYEqf4xx/B9OBmR
	yuC3l4wft0VeIeTwTUpUy7I0QEODdnFja9IkIhthpXusSESSVvOCy/HcH42F9pELEuZVhfbGvpf
	0DxFOia6TivtYHM65L93jjOH77qpsSuvB2NJdftXbg7BzvkN0m8vmEfuE+o/ZAbgdNPXFOSMqAz
	/ahdfKiMEhM4Izrud+2tU3cH2MjO6bAqvPtniw8My++xSm5feem8+PGzUF2Z8B5cXuE7ulTz16x
	jNyLaK3MeKYemyC4/gHIJrdJ19t2sbc37eN4wAXdtXS37ii9s+TdoSFdiUj2uBYzbxVXLJ6BXIe
	CJYuNXJ1cmRQ7bXzYI4nMwqpMupZyoj2Jpmos3cpuWCaG5kEIenSmqWBfZSuKpnv0G0fx60EZJX
	jjy15u42e2E7Oik/0Woap7+bMqoia7odM3452s4PW4BLwLkIsjTmYBVxx5B/5yWroeNqmfWiCN6
	qteFM+K5EFbwNwGTqnAP6KfdqBkTREe7mnEivWPj8zL+sElkRAAUH1f9FXkJ3O03HO8uhh318SQ
	USSnVrwQ/vxleyrmRXXmi+IvFPg1yvdnYlkCT0DFlf0NKaItAUPgYIm+8qcjTUp7Vsm55MdU/wG
	UIzz4boRRxaVhQZO7ijhrameuGFt+5EjxOiGn3OsAstlCfVMGYYd2nNWMiXOcZrFCgQWK0z7cLK
	9ZHGBPuFIwgS2BFN1pTpO8GTdz5WN1r0PL1vCkC
X-Received: by 2002:a5d:5d07:0:b0:492:905a:8b22 with SMTP id ffacd0b85a97d-49c6fc9dc00mr5932250f8f.2.1794573850456;
        Fri, 13 Nov 2026 04:44:10 -0800 (PST)
Received: from px13.tail3a7e86.ts.net (91-201-160-62.ip4.as24916.net. [91.201.160.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e0dsm5037179f8f.15.2026.11.13.04.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:44:09 -0800 (PST)
From: Lee Mann <leepaulmann@gmail.com>
To: regressions@leemhuis.info,
	baojun.xu@ti.com,
	broonie@kernel.org
Cc: shenghao-ding@ti.com,
	niranjan.hy@ti.com,
	antoine@montane.tech,
	andrey.golovko@gmail.com,
	pierre-louis.bossart@linux.dev,
	matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v7] ASoC: tas2783-sdw: add firmware download status check
Date: Fri, 13 Nov 2026 12:43:58 +0000
Message-ID: <20261113124358.11823-1-leepaulmann@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4d940e83-a3cc-4b2c-8f1f-9a4ce67c1f89@leemhuis.info>
References: <4d940e83-a3cc-4b2c-8f1f-9a4ce67c1f89@leemhuis.info>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 11/13/26 13:07, Thorsten Leemhuis wrote:
> /me is not sure what "this patch" exactly means (the culprit?)

Yes, sorry: I meant the culprit's approach of leaving channel selection
to the DisCo table.

> But if not: Lee, does a revert of the culprit fix this?

Yes. Kernel 7.3.4 with only snd-soc-tas2783-sdw swapped for the
v7.4-rc1 tas2783-sdw.c with f42fbd560cd8 reverted (the revert applies
cleanly), stock snd-soc-sdca, no fallback:

  speaker-test -c2 -t wav: Front Left from the left speaker, Front
  Right from the right speaker.

The kernel log still shows "function type only supported as DisCo
constant" for both amps, so stereo there comes from the restored
split, not from the ACPI table.

To sum up on the PX13:

  v7.4-rc1 driver                          : right speaker silent
  v7.4-rc1 driver, f42fbd560cd8 reverted   : stereo
  v7.4-rc1 driver + PR #5904 SDCA fallback : stereo

> Or do you want to maybe open a separate bug in
> https://github.com/thesofproject/linux/ and see if that gets things
> rolling

Done: https://github.com/thesofproject/linux/issues/6037

Thanks,
Lee Mann
