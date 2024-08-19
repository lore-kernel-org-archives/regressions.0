Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A41B1607AC
	for <regressions@lists.linux.dev>; Mon, 19 Aug 2024 10:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724062561; cv=none; b=howXl+m2bfHVE8MqXpi0RK5PQRV6Qv6TVi8/ON6dW2pkpE+uGo1Gi8hemcHSlfgx6vhz70q7mKTTPAr08EcGfcpBLQiXj8gE1zD1D+2C80BZSsWOqBu16bjZkcjl98+ln8B5Iq2goLwSvIPByWz4DAbU8vAVBQg7TsPsgr3I4XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724062561; c=relaxed/simple;
	bh=nANsEqLIgPJNcu9quUSP7ATZv8Jx4VYpsDGTH5gD1oQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kmtEii13r3QU+HDnan3aBaG2ng/cwc23zSODy05/RbMVPbsWfQ6mYQxr48SZrF1DTgmaDqzqe4gYyRx8rQE3nS7rUb5YS1Ucj/R+b5e4X+ixVxKSdoP8/zoBrKGcXthk8H94AuslgihGUK7PmI4wWnrAwkWarc05huwZszPQqCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9GOi7fm; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9GOi7fm"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4f6bd3a7bbdso1600482e0c.3
        for <regressions@lists.linux.dev>; Mon, 19 Aug 2024 03:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724062559; x=1724667359; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sa2lODxveZ7v5yXJROcCSh4jkb7CfMK4iLTqO/U2EWI=;
        b=S9GOi7fmKpCayGPaR/9rB4w47inUsEPV5+iiiOJrPhLs0QrWReN3hkp/AmihPCELmk
         8vZSmgRpfe+XFVZc2W8Fwu9vbNFL0WjtedPBbyBxqmp9PJx6SY12SBPMQk5nggWvkY4V
         9GR/RVGbW05R4qmXxfocMUSA6vx4XWg+cqT2yXdPXGjsSR/DmeHaXYna5rk8oFeIUGo5
         QQj+yRE74+3sUVezLvFqTfe6fByDVHyF5x5hxs0Es/9ZEIBqCl4W6uL0KPOMa2dkBm2a
         MNQfjKGagBFQdIGycWqmWNnkatllnAKcY484ef7gS9aiFR+16CuDoMlC9BwKn7edt3I2
         DOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724062559; x=1724667359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sa2lODxveZ7v5yXJROcCSh4jkb7CfMK4iLTqO/U2EWI=;
        b=Y0gpvp9GGPrOOpjwHVSpRvwEqFU3Ciws/SHGyzi1kJ/azxlhvwB9e1ompIgJ3CIuMr
         4P5WhnOrke7AhEy8kJl/AlDX94oCpz7sJVts3JviiIXv4/NfME2XPjo9DPNBp0Xg8dRu
         IFY/jrLKcj4O10RUC7v3lDZ7DNCHMWQeWvVWikQo8BVawiYCtt+VXYbpCJduPZ1khDKv
         BhXvh066nai6l8lJV/w43anrdXihkGNpYC0i+l1Re710rS/uEYYnYCKmwH+nZdKPVI4J
         DV20AY6JmeRjq9OwFMWw3dGK8UFUuQCTioPZ1p8zspIvjetuFon9ZD9MV3JOiqnvBRLx
         5QqA==
X-Forwarded-Encrypted: i=1; AJvYcCV8byFS7GPsK8kTMHZmcnWgm15bmMFa8BRBJEYMrWPcb9/wNvJ3d9HEeaoKtK9rrxF33iDwAu9pYa2gTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzBaAvmzaiSiB8K6UXLRlRLFROdpMDDB3gb3nDP30KmxN8aOz9
	OK81BFj7TDo6StMLitxIEhYb6ANShZqB9z7R+C/KqCsOYJncSkiYKsAzDIlmV2aex3mEJOSG7XZ
	+a+l+UbH2RIEovUk1mHpFHRWXoECJK5ZDJ8TCBQojuAqQZ/whTe8=
X-Google-Smtp-Source: AGHT+IFCsPmzV94E1oL22YZOQLjNqffxEp+5JZ7SruX5LPi1CMN5a9dPiP22C8nBnuWQWfjya0hWY6fDFAAH9KV7IAE=
X-Received: by 2002:a05:6122:1797:b0:4f5:1787:18aa with SMTP id
 71dfb90a1353d-4fc6c221f99mr11922575e0c.0.1724062559333; Mon, 19 Aug 2024
 03:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuFDon59=Nw6WCdgp0FanZ1oE3dCkoq71EK0Bxe6Jhe_g@mail.gmail.com>
In-Reply-To: <CA+G9fYuFDon59=Nw6WCdgp0FanZ1oE3dCkoq71EK0Bxe6Jhe_g@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 19 Aug 2024 15:45:47 +0530
Message-ID: <CA+G9fYtd1Hw9YLpceUAwwC+UytVQVXOET4gmGT9jiCgHa+WexQ@mail.gmail.com>
Subject: Re: gcc-8: mm/swapfile.c:863:40: error: array subscript 1 is above
 array bounds of 'struct list_head[1]' [-Werror=array-bounds]
To: Chris Li <chrisl@kernel.org>, linux-mm <linux-mm@kvack.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Kairui Song <kasong@tencent.com>, Barry Song <21cnbao@gmail.com>, 
	"Huang, Ying" <ying.huang@intel.com>, Hugh Dickins <hughd@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Aug 2024 at 13:58, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The x86 builds failed with gcc-8 due to following build warnings / errors on
> Linux next-20240802 to next-20240819.
>
> x86_64 defconfig gcc-8 build failed
> x86_64 defconfig gcc-13 build pass
>
> First seen on the next-20240802 tag.
>
>   GOOD: next-20240730
>   BAD:  next-20240802

Anders bisected this and found the first bad commit id as,
aded4352f648 ("mm: swap: separate SSD allocation from
scan_swap_map_slots()") first faulty one

- Naresh
