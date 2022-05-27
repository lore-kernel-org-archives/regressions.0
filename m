Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5356468E
	for <regressions@lists.linux.dev>; Fri, 27 May 2022 02:56:36 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id i11so5815776ybq.9
        for <regressions@lists.linux.dev>; Thu, 26 May 2022 19:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=JiJSTbLByeBUbNjihqq4ucy2aU+Ryl5bPLbQLP/9oss=;
        b=Ozb63YSSQHn8iwOg65YeWkay62ruIsX1IEUZM8RRaeZYTflINNHYytQTiqfgbZ61mu
         5mws/emmuO8H4TIhbNyq7HBsb0ZcExk9JtYfcWdaUKyjqpUt5zZ2H/eH7WPCvqznRTFU
         vn7z21rNg+0FKzGwGC9M0KcNwx40GaOIjq45cGhlequzhpnACcMJ/+Xb2XWymOXsJSjK
         FHBURfxDYZRZMuQY1HY768u1aNFpEir4fmRDiCOJ3PWbyieKxv2ohaA375ldJ5/MrzP+
         WSKiAAV7xCfNim5mKz3ZAqarDnkz+HbFjS9MCp5Ne18S74uqYffqKc5zK4Fe93zkeNEC
         ayLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=JiJSTbLByeBUbNjihqq4ucy2aU+Ryl5bPLbQLP/9oss=;
        b=YUy5IC6LWcngJvFgNcXFwfMOPCpJZjBIF37oVbLTZ1xlKs1h3Ho6RG++KnDDW3OgKD
         y7mpM3hsXV353YZ6aTzt8u2ZfoZ0O/j+M/+hN+EgrxsgfFcUTYc8gdecFHMcsdkBzV3F
         iSI376hTr3/zFDUeVwLSJqjlxLa3I62VYIrV8xR18aaJwOfjhGxX6LRJ3oycAxYrEWVa
         uNnUpY2IomOz4qzskbjGkuMyLENtzh+tG68TUXLZ24uyQ4B3OPEv4+y8TH+A5PAL5NvP
         EKVR1xDzkL9A9rdGIbe/MWZjvdKwf+LR/6Iy1Oh1xpFTliCPbUH8igq2coREthGRlcdC
         S7DA==
X-Gm-Message-State: AOAM533Vmeek4vxbTU3sQyBZpLRPV05fkDM0QYTnWF1O1KU5yDef/6vQ
	TYcBhV1i0UryNz6abYYUiAZvCPNQxZz9znSirFXOlicmmg234w==
X-Google-Smtp-Source: ABdhPJyGNTNv40JneTza56EAdqP+zzrItZRZlcDCfYTGf+w+A+P3IpJdqxt7uCEizAutTcCZGWFNaFobAekuwi5gQ/s=
X-Received: by 2002:a25:814a:0:b0:64f:f06c:cf6d with SMTP id
 j10-20020a25814a000000b0064ff06ccf6dmr19551467ybm.88.1653620195396; Thu, 26
 May 2022 19:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 27 May 2022 08:26:24 +0530
Message-ID: <CA+G9fYtDBZaBGkEp5tRMM5C1xHEKeyyNK1S4WoKvrOoFxGm4KQ@mail.gmail.com>
Subject: Re: mm: change huge_ptep_clear_flush() to return the original pte
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Matthew Wilcox <willy@infradead.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

Following build failures noticed on arm64 on Linux mainline tree.

Which was detected and discussed at this email thread.
https://lore.kernel.org/all/20220512193855.4f6ce32f@canb.auug.org.au/T/

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build errors:
arch/arm64/mm/hugetlbpage.c: In function 'huge_ptep_clear_flush':
arch/arm64/mm/hugetlbpage.c:515:16: error: implicit declaration of
function 'get_clear_flush'; did you mean 'ptep_clear_flush'?
[-Werror=implicit-function-declaration]
  515 |         return get_clear_flush(vma->vm_mm, addr, ptep, pgsize, ncontig);
      |                ^~~~~~~~~~~~~~~
      |                ptep_clear_flush
arch/arm64/mm/hugetlbpage.c:515:16: error: incompatible types when
returning type 'int' but 'pte_t' was expected
  515 |         return get_clear_flush(vma->vm_mm, addr, ptep, pgsize, ncontig);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/arm64/mm/hugetlbpage.c:516:1: error: control reaches end of
non-void function [-Werror=return-type]
  516 | }
      | ^
cc1: some warnings being treated as errors

metadata:
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline
    git_describe: v5.18-9901-g7f50d4dfe816
    git_sha: 7f50d4dfe816dd916a7cbf39039674825c2b388b
    git_short_log: 7f50d4dfe816 (\Merge tag 'for-linus' of
https://github.com/openrisc/linux\)
    target_arch: arm64
    toolchain: gcc-11


--
Linaro LKFT
https://lkft.linaro.org
