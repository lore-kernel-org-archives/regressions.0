Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9354C28DB54
	for <regressions@lists.linux.dev>; Wed, 15 Apr 2026 04:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776229146; cv=none; b=Ip1z6gfSiI4fckMcWlYtl9q6AA6xtdAkPSl+3e7c4EWcxhfgH6LWOe9qJ74s9/Qh7En74DG16UrcFWWzFADWo9vLg8oJTgxrUaXFUc0C+/FfEOdhMhsTGX9j3K86nkY4Eic4Gs7bTmAKClrcptuOE1RhR+mnn+za+2zoDUR+BmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776229146; c=relaxed/simple;
	bh=OKuFcqDYMspA/6Frbf0aNhN0feSRYipJ/IsqoS2gsHY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=LUvKtzdkGs3G6avYlBGFWVKxzHHzxRciB0O2YBP9XTnZEi6VuqzkMFpTFoSuxyJpnLaXl6GKzbANFSFBLuykOKCNCGDCHsOPhLGa6vgiIWDNJgT/N/nWo0PMsuPduji+7TN2vmX3kpEHWaIYjMHQJQappXruONSwCbV04Wr2GIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=SZwLEVHD; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="SZwLEVHD"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1274204434bso3837476c88.1
        for <regressions@lists.linux.dev>; Tue, 14 Apr 2026 21:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776229145; x=1776833945; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+1mUrMhFo1aXNQeTTEhkfKEQJDdHdN/BTvtr4Ub32c=;
        b=SZwLEVHD/IeddJ6oQg98y+f16GDa9zj0J8Gm5DwtMsYp5aJ2+htCl1CfJ+nKo1mPFD
         eEKqB7RNRbPmk3VgvN2G9mgA+FUhdRHyJkCuXc1H5U6PEOPyVsF3Ria7C6uz6AoySxZW
         SrxISsv9AnNKpVtAgcVrX5UfYYvR1Xh8GQi+SWFBeo4Z+5cgdSGZDtHxDl8u6OCmN+9l
         uV6w9HbeaDsRvS4DT9eoJ6TUgXgSDH8wq/U6Oo775GFG9GC4LTAkv7m5TnnkMMqdal2G
         +62pFD8FxUiUZpNJjRADlgBJonYErQoJKVBRejllr5fNaxXelR1t7pku1+EGwf8gIIrI
         jyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776229145; x=1776833945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+1mUrMhFo1aXNQeTTEhkfKEQJDdHdN/BTvtr4Ub32c=;
        b=Xy4xactbktrPpJEdN15PmURaN41XCZBaqL4QnNyJ/LyvzIqv7oDJGwMSbMOVSHuFyW
         lf9/NXAET1N9er/9dP6GOASq0Nfcw3ATW9umCco7m85GxDAdZJxdu7jupNE13RZMaUPM
         QxzoRRUv57qiqA39QHm2BTKjoP615aHfkv3pJFTzA1leRTf0J4uvuoCbynxdiPivr9w4
         Hhchy86OrTvmPanc3YK5kxB543EUog9nKpnLbAyjyYUxUoyLfLsmm2VMoVP/f+VfQsk8
         p/aQAAC+QhqZ96sblsSG6HNF0XfamPXDO7+DZucoWFirdUz61dCQHVnWFC45f4vRmeSA
         jroA==
X-Gm-Message-State: AOJu0YzIzZAFFmnugbvMtsJXD1ZE9eZNFavovbXiE2z+aD/OvU5yRG+O
	6VwQNkHG+ijDD6WZ5hQXiE8r506W46KoTESn3UxiLEKOOE8rGn1t80RYPxTihrt9BbA=
X-Gm-Gg: AeBDiesHJ5ZzubF1iWKDu1Urb++hRPoCv8DbWnRNWH0THq8rLRUnBWDwlIcQBIr/miy
	5ZKEcygSE0GP6pe/MwjibkKBFbZblgjxqfH2C/hiYinbUWzmEMlPJBJ0wdy/CqAjMngXUgvTLb6
	mSJFPqSDq1bDQ8Ow0IJx6DalFGz3tH4G1LvvcDJ6ErDNTaIocPmPGE9dKd/Y8jWsL1faVgY3h2/
	PkXFHY9gBWhLeG6yJGrimV+6r77W1031WXVq3jKCxQ3Jb87C0a8/t1kvylOJPqhFP0bli88LhOQ
	32i0uQJlVX5gRYnhUv8Cy5FkPCFPYmNt0+bzQobyq8GeIy+i9gph1jLZfwGzD8Az9Qti6mEgXg6
	9Mk8xSeCEsOfrtno4m5rLCAcH94E0NQ3D9fijCHmcgVz7RK9rlO4j+WznTEa6ae+OJbWWVrXCVO
	DX+wYfzeFU3h/xpZxGGDTgz1AoOfc=
X-Received: by 2002:a05:7022:1b0e:b0:12c:839:7462 with SMTP id a92af1059eb24-12c352f1489mr9803679c88.12.1776229144571;
        Tue, 14 Apr 2026 21:59:04 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6be880sm649900c88.15.2026.04.14.21.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 21:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) in
 testcases/mangle_pstate_invalid_daif_bits (Makefile:31) [logspe...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 15 Apr 2026 04:59:03 -0000
Message-ID: <177622914318.5902.4472800924030989383@8692ffc4d55e>





Hello,

New build issue found on mainline/master:

---
 in testcases/mangle_pstate_invalid_daif_bits (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:07c997a170119a3fe86cbec926c1519ccd2dd21d
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  e997ac58ad0b47141c62c79cde8356fe5633287a


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69def3149b5a968309e421d3


#kernelci issue maestro:07c997a170119a3fe86cbec926c1519ccd2dd21d

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
