Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4679355F5F
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430748; cv=none; b=hSPiOO5ep7pIBxMojOXBF1uJy1NKO50TDV3h5G5OSPA/5Etbv5fc2ej3087s2RQ2u5ESiX8t990eA6UAM5u2fB/f2gScmG5v9xTr87FyH1fuB8Jq3/klkSFd9w+UhyYWkDysRL3IiTN6eFKeLRawogIjsMs0u/9sO0XN9KiXpcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430748; c=relaxed/simple;
	bh=ooF4eUiBpz+BIHrJMRbD+9PANmm/8TOJQiTizeHh2rg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=oPzvYrXRo18ilJGkFwMTSwgth5hOx+7KzYzU2iDp16d/TitjVWvuSzQVQKaAv05z8CmqPbPxLWhUIEIb1L8HigFuZdjQomohQ662KXWFzYuA2WDR5uLtTJWyJnf5dcFOiGaxyGp/aMFuAYNhFyRR5m4s7DBaQVGF/nE5XiWd2KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=UmK1Cp52; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="UmK1Cp52"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84eb992a881so95319b3a.2
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1785430745; x=1786035545; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7iLJuFUNcjxlK3KijjNsWXvDWo9pbqyC8PngAuIGUPQ=;
        b=UmK1Cp52OzwW+LLyz8GHxtrKjzbnekbnJzT2w9Sg5rvc1vI5+pIdb+ihQAyopvo1FL
         s/UPqYYzuTj0WyRtCeZJkGHAe4X7nz3Dswp1k4Ddu0Qvxli9yCqVUZwLmRVlkClr2tH4
         DFlDAhI6QsFvJyPa1fazdWoA8QgccIsSbWqbLZTCCOETCyO0P7kGfmi9vv6ZuyjDO6zO
         C5L9r5dtjKnO241oR1KwKOGVk6CMSDpeLcGRrDxS3uHa1XGkYJqWN8+q8BnR2KRvvqw7
         KkRsqnp9C+N449RXZqoI/wkQoq6nbViBKaBW4uby/JZDtVESmDnNmQ1Tm5X476HO5suv
         KQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430745; x=1786035545;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iLJuFUNcjxlK3KijjNsWXvDWo9pbqyC8PngAuIGUPQ=;
        b=Kw5x3zWdxWYqIfIJGdoAOyNrKRLYI+w2Lv5dbbHXUhJF8bxtAm9ynUeSW+qwIh9AyD
         ftPAox2ysQmMqwb9eJnZCj0W4IDPfKSBgWIJbkXrNEXefzrG8/cz49kQ9Q1oFPsXwy7R
         hDjzfpcZRiGkjX+/o+Gtt2W9iMTs68wAqE1tarqWfprdXrYymMy9Gz8N3DAO0K8TfTM2
         4vRrGpVOR+snVFuIWXwS9jtC/aZAiqpPw5wMwEfA/OXUoFPFzT1FQNH5NxVvNTsrhj+K
         cQpqt0Jp0dV0J73BzsEoz7NNFLZVUKJNmUxws5tFSVDeH/WsemdTNzZrg5CAm8q1wA1e
         ceFw==
X-Gm-Message-State: AOJu0YzxF06OLwEnOHT62IFFDHCYADeAsJ58djR8msCga/69Q/mwIk+N
	3Hsh7cleBs2w/HE9z/cu8ePmzIYLmuX82Svs0ui5cAuUoSEw20bGsPpFHNcoKB5d9u4=
X-Gm-Gg: AR+sD11WJ7T9cKTCKRj8ey113LgrV5AC1xP+UM8gdfsX4iBoGzp0EcA7XYe52n4LySD
	1d4jltcK9Goq1zRZHFHnopC6i5Wq+xhPO9bXKRrmLhIYySnGAZ4XBwopdsvnIqUr36goLcfCq2y
	d6IBkoS7b25NDbXUlkvZm+nesg6mJueDvc/eDsSMUe6R9MV3gORdPiIXPqWk+coaS5KBE/nth7+
	JzxoObgUdH/NYoeSW5hcIEPK4D4Kqu0o3WhoY2nebEzZQHV4mJixGJeZr8JmgshxZS2qZ1OnsW1
	tECz1cJrB6vH3i80As2FIxxlYuftcKGIqTo8my9HTTJNi/vIjZXTtzFbBYOhZ8aChR0Zs1sRVAs
	94Ht3bmFxieGgbYSz3xhq7ji3q/BaSTjfAMQcoJTu2KJgK1gGT4EgGzR8C3UZJzX7ZoXMEp66UY
	nuVaeG9o6YSb9XKlWNHiVWHFLEb/R+v1EGE+9FgrWwj/WwA6sWBBc4dQ==
X-Received: by 2002:a05:6a21:a48:b0:3c3:83e8:c209 with SMTP id adf61e73a8af0-3c900786987mr3222269637.71.1785430745072;
        Thu, 30 Jul 2026 09:59:05 -0700 (PDT)
Received: from 92650adf53de ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b15f77sm24848611eec.4.2026.07.30.09.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) use of undeclared identifier
 'check_vector_unaligned_access'; did ...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 30 Jul 2026 16:59:04 -0000
Message-ID: <178543074351.4076.15027730787524065993@kernelci.org>

New build issue found on next/master:

---
 use of undeclared identifier 'check_vector_unaligned_access'; did you mean 'check_unaligned_access'? in arch/riscv/kernel/unaligned_access_speed.o (arch/riscv/kernel/unaligned_access_speed.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/arch/riscv/kernel/unaligned_access_speed.c:380:24: error: use of undeclared identifier 'check_vector_unaligned_access'; did you mean 'check_unaligned_access'?
  380 |                 schedule_on_each_cpu(check_vector_unaligned_access);
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                      check_unaligned_access
/tmp/kci/linux/arch/riscv/kernel/unaligned_access_speed.c:112:12: note: 'check_unaligned_access' declared here
  112 | static int check_unaligned_access(struct page *page)
      |            ^
/tmp/kci/linux/arch/riscv/kernel/unaligned_access_speed.c:380:24: error: incompatible function pointer types passing 'int (struct page *)' to parameter of type 'work_func_t' (aka 'void (*)(struct work_struct *)') [-Wincompatible-function-pointer-types]
  380 |                 schedule_on_each_cpu(check_vector_unaligned_access);
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/kci/linux/include/linux/workqueue.h:636:45: note: passing argument to parameter 'func' here
  636 | extern int schedule_on_each_cpu(work_func_t func);
      |                                             ^
2 errors generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178543074351.4076.15027730787524065993@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:93d4e1ca2f17ba7ce0541f3202fa21a0043a7f2c
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  95d6a9ccef99117115e41e9adb271243bd5e985b
- tags: next-20260730

# Builds where the incident occurred:

## defconfig+allnoconfig on (riscv):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a6b7183798ea6c1ef929eaa

#regzbot introduced: 78bc8af4affb9a732504eb22eeac7d1e50883853..95d6a9ccef99117115e41e9adb271243bd5e985b
#regzbot link: https://d.kernelci.org/i/maestro:93d4e1ca2f17ba7ce0541f3202fa21a0043a7f2c

#kernelci issue maestro:93d4e1ca2f17ba7ce0541f3202fa21a0043a7f2c

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
