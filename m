Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB7B63D1
	for <regressions@lists.linux.dev>; Mon, 21 Nov 2022 15:47:31 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id k84so14062139ybk.3
        for <regressions@lists.linux.dev>; Mon, 21 Nov 2022 07:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lX4SOBDZLiUpWg9pkZno03V4C7f9ub9okjp/emDPZ5E=;
        b=plxUBELReUUHAMjKqZGq7NrMXoG6g+bgMnMomPSeCEe9NR6/w5tlNXzl1sR7MGUTUL
         ML0B5jLMeFPOKSnE7RTGTlPhVrnKXEbny2Oe6nFpASFq5sIm8muKVEUk2KvrOE3tMaHp
         OFsLNv8w2TjmeKpMJqThjQO2losarCoe9qsQFvub2T1dO/j5I6L5qnTauaCBR0GAUiWG
         a2DvU/4JTVqYtRPqX8wL/JK1GcxMHe8i7/25WcBIsxc1CDhanUHYuIoCqHPDX24ecxLX
         C6brYJlpjd4CRT5T1E9Uf/ad497t0h9+C8EPPlTSbROL8Lg80ilqEIqxFNTafSsJC0kk
         D1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lX4SOBDZLiUpWg9pkZno03V4C7f9ub9okjp/emDPZ5E=;
        b=g804eQ/kawrWm7iQh79AQQLCBbzNTBuhr+ihuZL+ji5Nv4JYVusXL6wnlNPJ41SllR
         OAn9REX1dTWpP4+N1Ez2O9kMGRG+phWbV6ma9E/2MKE6+cBqdwM8fWMmDgYfMPv0Vbbd
         3tc6ZRC4d4djVFhAHWAzXMfgyTaj00CoKFfcMH9KyOhZQH5BLZsubqHozjGthuCkYlIx
         BxZZjX9p7jgiPqIlXkDpOxbIv+W0KstW1nOMbTN7h5QV8VND+C3LUFsGvNbvya9/v/UL
         fvAcPh7k6X4ZZUEvEWflQgTGuCeo/+NxUA1oMFLmq0PjShbiduXjRiwMaxD08Gz3fUm2
         5jOQ==
X-Gm-Message-State: ANoB5pl8xMWlEv3/pd3Uz06MUR0d6XKG5lFkxiPPF79x8gQuNmKEP1Fn
	WhfhiKoabGwokRPF0BE7OVev1PC2sFUV2MEEmSUlsw==
X-Google-Smtp-Source: AA0mqf7maI6e3C/Uw3HIVqetlcmAXPqACFqV7KLGkeMVJp87hEs5USoBCXFyQhh//F/a20TiI8/RVccZQ+GyM9TeLAE=
X-Received: by 2002:a25:880e:0:b0:6e6:e31e:3dc5 with SMTP id
 c14-20020a25880e000000b006e6e31e3dc5mr7246672ybl.534.1669045649850; Mon, 21
 Nov 2022 07:47:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 21 Nov 2022 21:17:18 +0530
Message-ID: <CA+G9fYuYashEQsCfScoVbVqAxeXC4w6VnenO-5dHDH8OEfFBTQ@mail.gmail.com>
Subject: Re: [PATCH] arm64/mm: Drop redundant BUG_ON(!pgtable_alloc)
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

LKFT detected arm64 boot regression on today's Linux next-20221121 tag.
The Kernel boot log did not show anything on the serial console.

Anders bisected this problem and found the subject commit is the
first bad commit.

# first bad commit: [9ed2b4616d4e846ece2a04cb5007ce1d1bd9e3f3]
        arm64/mm: Drop redundant BUG_ON(!pgtable_alloc)

Later it was found this lore link which was already reported [1].

ref:
[1] https://lore.kernel.org/all/Y3pS5fdZ3MdLZ00t@dev-arch.thelio-3990X/


--
Linaro LKFT
https://lkft.linaro.org
