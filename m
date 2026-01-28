Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF186352C20
	for <regressions@lists.linux.dev>; Wed, 28 Jan 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605149; cv=none; b=MWU7OCK0UqDICpWjkfyqkjWb1uw87Jv4nAhTJvLJ3BO4b9tmsxMsS6sCeidgTANs5x1xF1wKlgULcN/R4FlYvlOEDOT6rYMon9zCeB8rVOMbur9tGHC9Pmyua7hag6BfOdNVjL0l1DA8m7S7DnrpxRYLDC6YG1jKTlm+e8EAPFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605149; c=relaxed/simple;
	bh=UlfO564AJzfBgWIhPixEpTnDJDJdI+parV/CzPYapSI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=rZvBzu/wIy910iw3onZcxjO5olERSK1puXMKN76pIrGWE3kCy9M8LStz6ulmloAGT9nS+ajseSMJfyGoHK7oDru3ZbmTbJaQSu/bbpcsnp2VG3bYz27IiXBziXXQra3GSDJoXwjBX5T+XQnEGrfeDSIBtzyaBq3Q2h8PGeCcqz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dfm6ygWM; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dfm6ygWM"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2b6b0500e06so9291281eec.1
        for <regressions@lists.linux.dev>; Wed, 28 Jan 2026 04:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769605144; x=1770209944; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KkJh3RLDDj6h93IXIjyNerYTMuZsf1CSiGRf5IbgaQ=;
        b=dfm6ygWMlbtuQ5TyxvSKCzL2fJBtNEyAIi9sSKvzSHQzxPcbIQzctxmMLnLG5xI69u
         tvgr2AoCnog8tnIJnTrNiRFzKAA/NFyd95II4Cc6+BAjX9oZB64OaFO2+kF+4uKB8UCm
         qPnjzKrvsDEq0N+FAKguLfrALsQq3/gkRjoKr/4JoQ7nDfb/dE9HWbTU4KiBLYNTQ9jM
         FSQBWkGc9WvyzvUSx8aD1gnCK+qDZyRcv52V3lOJB7c6N800WgcotNgygUShpmR2um+q
         uCZOqlshyHKZTOqrSsoxVSnpV8j+eGzgF9Y1xQfRk+JT4V1pgV9UMcD0ecE6usZ1Ym0V
         +kFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605144; x=1770209944;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+KkJh3RLDDj6h93IXIjyNerYTMuZsf1CSiGRf5IbgaQ=;
        b=Tz8pS38bkCIZmemD5eeRDihI/5EHh5f4oNrG9ZBtpddUxLW+H9S6z4viLsiPB6fEeV
         RgioCK8jlR1w3jrSs2HGp597dvNcVZjl85U0i7y/XzsVEMD9gp/32Hn8F3nHaWupZ8Bi
         YfjM5iNrKpcgsd+VTAIkRqIZ7xTEbGhP5ho+8PS/TJeuiPg2/pAy2SxF5Ldup6SutOIP
         ElhE1R4PKZGF2jMVzz+HLFOA9WzTfHI4XfWp9xBgZQY2ALBUCQb+oSHbKz4ZA98XhCjd
         gsvyfZ8NmdwZSMLC/9gDRtvaf1zdL4FZASulVHSrosGfzFZ16ji7WeNz37dvZkl+uj/M
         bqwg==
X-Gm-Message-State: AOJu0YyLpwmF/9RfKHfkHIkOQ0/Y1IY6tZYaNPHulaEfriFcgV1cIcnm
	YghcDeZd8N9D5WMq0SgYxdwEwTxz5TEO4JKExrX2EzQXW/946CNT98LevfTdY1ouy7Y=
X-Gm-Gg: AZuq6aIBAV6A78ZfPaTLNPTdWVfZdmPnZgmiE9g35wb446w60SawZJgv+U+8Kf7GGUu
	hSpFXMPLSLjHnHB+JMqc2uvZ9rJJ8KwccoP3p41blBL88NjKDO+QkLcoyOO1ma2OyQ+KI3Y61xy
	jbGcJyh+0csTviFrtBUBGm0JUaDq4GLeaslWYbIpflaMhizVE9htKSAXOyQdZ6OPmiIxoY5GsDf
	lT3UUtawvWck1ukCzAzJDMwGIy6Vjm1FoPk/Bq308JTTroxmUdO3ymkmWQgVCz0XbIlgNFBAxtE
	WFLqA65fAFKLR3f/N5EAKLmMvcnLYvuiAvhLIvFDPCdhNRASsPpAHHJdqC/qvBObQITKRXdCmn5
	ztoMYuxiN804dpUKFQ5ZdBDC+HvoYpKMXjOV4lAw3uA5ia/oGov0lx6s0OsDe9/yOzAIveN1PJF
	4mATR9
X-Received: by 2002:a05:7301:1698:b0:2b7:1744:726f with SMTP id 5a478bee46e88-2b78d8a6127mr3104705eec.2.1769605144086;
        Wed, 28 Jan 2026 04:59:04 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef3b3sm2450516eec.12.2026.01.28.04.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/pending-fixes: (build) ./include/linux/cma.h:63:13:
 error:
 unused function 'cma_skip_dt_d...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 28 Jan 2026 12:59:03 -0000
Message-ID: <176960514308.3654.5873473738719715010@22d5995788c3>





Hello,

New build issue found on next/pending-fixes:

---
 ./include/linux/cma.h:63:13: error: unused function 'cma_skip_dt_default_reserved_mem' [-Werror,-Wunused-function] in mm/mm_init.o (mm/mm_init.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:0a972087c7b2bf11675332fb10ac48c0afa797a4
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  0fd19300e770b50ad9fc43026f5e148e185ddae1


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
In file included from mm/mm_init.c:29:
./include/linux/cma.h:63:13: error: unused function 'cma_skip_dt_default_reserved_mem' [-Werror,-Wunused-function]
   63 | static bool cma_skip_dt_default_reserved_mem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-x86-6979faff1908a6300d9b70b2/.config
- dashboard: https://d.kernelci.org/build/maestro:6979faff1908a6300d9b70b2


#kernelci issue maestro:0a972087c7b2bf11675332fb10ac48c0afa797a4

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
