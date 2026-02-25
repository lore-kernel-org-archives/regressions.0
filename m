Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906BB23185E
	for <regressions@lists.linux.dev>; Wed, 25 Feb 2026 01:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771984477; cv=none; b=d8qIlKizzQZcYycwRy3LS+kJ7u21vd5Rfl/KdyrhIck4rBrmEpfAGf0mHTMx4Z+gKW2U9Zx6cLVVPdOG096aLxb2cFqXPuiqqTT4cBilY+OvEadi8FR85/5k6uCcOckQD6lNnuOyymCPsOvlPePwenr9yTO4Tp/vdLhsvyVe/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771984477; c=relaxed/simple;
	bh=ihtOuFM/oDpxEJGfWP99kJT5Jq3CPwU50VjfHrHQ4eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CZ5ia/LvXF/AhWemspYpAB/O+43/6tG4Ot6nq1Yqm+ElheJBzQiFjLxdFxgOxUMzzmBdZgzZZNYY/ZgC+ICBFIubWh0lLtd2csHc4xRWfLP9nQySaVfLtnWltgK61f6qiJVSyK94+y3rfQjsUCxlAu9u7ZHVKlHN9wnL7XxiUVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmpTYzUy; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmpTYzUy"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e6b736b84so5670489e87.1
        for <regressions@lists.linux.dev>; Tue, 24 Feb 2026 17:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771984475; x=1772589275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9fk4HjE9WzW3ynLGF+SH7gNYcU4+9bXvKwvDoOble0=;
        b=gmpTYzUyyTBsbSr67Bc5FdqgbudCMikZxXM6tGrqzttUrIUZZmIExqfehp+RqGCMwR
         IiBWMgf/pBHCVREX7qBhWT3GdF6Yki3LekTKy0Qnc0dpes1cWt3Jlh8ailq2FPPmfJX6
         +v3MYRJgdmkDvwnhIzKxtTcRZXVpmWoVkrfOPb9Glw2c/6dD6VaIXO4nrIeDTbtOseKr
         FIfdmjC+bNS1JyAm3FgDora/au+ASItaG+gDRB4Ofpp1BKstl68PP0HZkPe8+xVykUmI
         h0foaYUpjmXW9CJ2u1V8oltzR7seV37sDbWrV7D47IOJs2fu4y53ScCQgN+Cmdu2y7DO
         tOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771984475; x=1772589275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y9fk4HjE9WzW3ynLGF+SH7gNYcU4+9bXvKwvDoOble0=;
        b=bDQKholiUwBssYtq4YoKYg07K5/vzEDzalbKGopgQOJbgx9h98Ff0gXPwzMWNE+zuF
         oYnPTVEGMEUzye0hsaOVTEfGYDafQnVJfO4UPeItpUz4LqPwuxilBTAmHY6/r8Zl0pYd
         wHk7VpCG/0c1r1gMlSeAFRemraSuWbfWRIA3ac22b5PFc/njZ0rrJO7KaL7JG8+vmLRd
         WC4oZXQWCSp837T3gFRaOaUzWWLsnKehUWVSKZgJHc0zEc02fKUaAm3NTS18xTtuZJ0J
         Xu9ozrEFqpdFn9lqGzhQBJ+ao4DeC8VqdNsMD8R6A4mxDIIjMmurPR4Vt1QGyNlSaYdb
         OB6w==
X-Forwarded-Encrypted: i=1; AJvYcCVgdUpLx7PwLT1T3eNPnH5Ci5hlT0BtAsXMbNVpyAg67VaO9+/2uYTK4qJzkWeSE2Zv5mMFdYmszIYSVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNVajXLNJS/W5dww0137q6kppaq6HW99+T99AV5gO5zTl0gWZw
	TxMMF6wy/z7viD25Xz1sHhxScZr4nt3LWXebp3bJnDRFwTPdDPJcqsrD
X-Gm-Gg: ATEYQzxcH5k3lutuLVv0O40Xq3ini6f7UyUIYP8A8odq8rY6NGBWX+JwwAsP9bGT9wR
	Iv9O6vWAXajrulLbV8hnY+O7sPiE/Bd9e2KcqUbvCu+2Zxr9CKoLrA8ZETfgcNS0/+i91s11Ghb
	Lsz/c/cCUwKr9OYxzmptevMQWPsR9HtAabTaclw4Uw1Dj4tTqjRIABJC8Z1JkMlgBhWKNi3VLBR
	1lkPYdtoLUMMjz58C6tDXcfwJFDMshpzO/I2tOLyFfjG44byZyc598lqRG4Yoto0rTM9UIS02t4
	FUknfX+2umFhXq+fkN959E679XPLr9mbhvsGV3YQDFB57YsiflQVCKssClM3/Wkd8/LuKBiwjP/
	LWbs3iXH+qixWHmdoY80jtcHBFjs47DafIKGMrt/fe/K7ENXBEdGOmg1fKN9pnLA3Qn3KLb1sDx
	jhKWPizB0pnYY3s/JoHeEGU50x7hc08QEMdcfMld8CoXdD
X-Received: by 2002:a05:6512:3e02:b0:59c:b819:1c13 with SMTP id 2adb3069b0e04-5a1026e0328mr162412e87.26.1771984474519;
        Tue, 24 Feb 2026 17:54:34 -0800 (PST)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb3ea71sm2569037e87.60.2026.02.24.17.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 17:54:33 -0800 (PST)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: chris.bainbridge@gmail.com,
	harry.yoo@oracle.com
Cc: vbabka@suse.cz,
	surenb@google.com,
	dsterba@suse.cz,
	hao.li@linux.dev,
	leitao@debian.org,
	Liam.Howlett@oracle.com,
	zhao1.liu@intel.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-btrfs@vger.kernel.org,
	regressions@lists.linux.dev,
	mikhail.v.gavrilov@gmail.com
Subject: Re: [REGRESSION] kswapd0: page allocation failure (bisected to "slab: add sheaves to most caches")
Date: Wed, 25 Feb 2026 06:53:59 +0500
Message-ID: <20260225015359.1495283-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aZw2LyOjxMc-c3dl@debian.local>
References: <aZw2LyOjxMc-c3dl@debian.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I can confirm this issue on my system:

  Hardware: ASUS ROG STRIX B650E-I (AMD Ryzen), 64GB RAM
  Storage: btrfs with zram swap
  Kernel: 7.0.0-rc1 (commit 6de23f81a5e0+)

I was seeing the same kswapd0 page allocation failures periodically
under memory pressure with the identical call trace through
alloc_from_pcs -> __pcs_replace_empty_main -> refill_objects ->
allocate_slab.

Chris's btrfs __GFP_NOWARN patch suppresses the btrfs-originated
warnings, but after ~10 hours I hit the same sheaf refill failure
from a different caller -- amdgpu via kmalloc:

  chrome: page allocation failure: order:0,
  mode:0xc0cc0(GFP_KERNEL|__GFP_COMP|__GFP_NOMEMALLOC)

  allocate_slab
  refill_objects
  __pcs_replace_empty_main
  __kmalloc_cache_noprof
  drm_suballoc_new
  amdgpu_sa_bo_new

This confirms the fix needs to be on the slab side as Harry
suggested -- adding __GFP_NOWARN to sheaf refill when there's
a fallback path -- rather than patching individual callers.

Happy to test any slab-side fix.

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
