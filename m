Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0828E184D
	for <regressions@lists.linux.dev>; Thu, 24 Feb 2022 09:28:11 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id g6so2538371ybe.12
        for <regressions@lists.linux.dev>; Thu, 24 Feb 2022 01:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ygp7HmSMQP3Q+rbTx5g2DkVDCEdl+SFVfMjp/BmaoiI=;
        b=cepL0hdCN9UbyCzkOyV9cQEdxhgUijKh9zmmcDO5ikU473yp2AMOZcJXilqLRa0sFX
         zfJ9F6q5gR/6iBDSs/MWKl5HIY9yjtZF5m5sa1Ox3N3Gu4/ncdRBYcD3fvzUBnuQqtrM
         nAUWwm6kL8VdrogYpBrNw18wLKWFmZd6DDEvOI6D4H+mHJGqcA8phVZheJzRPgN7lv64
         eRe0E1LIuKHztxG7hg2oe7Qf66pC89aNTF/Ig8zlbtlXZZhzOOy4WbazNK2qNpt4Zstb
         gznQQkwisI3iIEeReJZnQLwDvvvJDXee/MNMui+50vNhX2zNwhqzm+l5ZvFAoJxzA9Pw
         B3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ygp7HmSMQP3Q+rbTx5g2DkVDCEdl+SFVfMjp/BmaoiI=;
        b=7u6fGUaGzt/9GQstr0riQqrxNtGHUsDSku7NI6RU1UdAcRTnUmH5LOKze2IqelZ8tq
         RQOaX/3JsyebhFSfZLXI9pk1so0RVP0km1SHjaa9Q7S9bVxZwZPEiW78vx2O74HW0KbZ
         sa8ZhYG2EAgv8SZJsHgbLo9Wq6PKBsCF9DzpbfSyXHcgX9OR/5dOAukskOpXgArZQz94
         +vo4dVyNjHQ7oA/E2KIEhVBCvZfg4TZrVCSym5YVdAEe8Q9w7DI8oBDSIrASO17iDyk3
         36ZPEbqBW+nPOyBlgm3o21k9A/MOcsc2Qm2pO5CrEJrKBJ8WA8Mp073S+ANRwU5gkJiY
         yARQ==
X-Gm-Message-State: AOAM533xChe1pJJi/0G5EGgDYwJYtdnSnpPNYVidzAvJY+E7utzzC6zG
	VlYaE//v4MUkELWCFq39PnDKEzXGZ0XahsnJZPGtcQ==
X-Google-Smtp-Source: ABdhPJxscph16DkI7QPkYWvFXGKPAB18KesE5yybvpBkL5Qinq23VhWYa9sR4nWUBegylDrScVJnGI8fPsI6IwGs7nc=
X-Received: by 2002:a25:6993:0:b0:624:55af:336c with SMTP id
 e141-20020a256993000000b0062455af336cmr1603707ybc.412.1645694890926; Thu, 24
 Feb 2022 01:28:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 24 Feb 2022 14:57:59 +0530
Message-ID: <CA+G9fYs_8ww=Mi4o4XXjQxL2XJiTiAUbMd1WF08zL+FoiA7GRw@mail.gmail.com>
Subject: [next] LTP: readahead02.c:295: TFAIL: readahead failed to save any I/O
To: LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>, 
	linux-fsdevel@vger.kernel.org, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Kees Cook <keescook@chromium.org>, Alexey Dobriyan <adobriyan@gmail.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Muchun Song <songmuchun@bytedance.com>, 
	Peter Xu <peterx@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"

On Linux next 20220222 tag LTP syscalls test case readahead02 failed.
Please find detail test output on below link [1]

test failed log:
--------------------
readahead02.c:181: TPASS: offset is still at 0 as expected
readahead02.c:285: TINFO: read_testfile(0) took: 37567 usec
readahead02.c:286: TINFO: read_testfile(1) took: 37263 usec
readahead02.c:288: TINFO: read_testfile(0) read: 0 bytes
readahead02.c:290: TINFO: read_testfile(1) read: 0 bytes
readahead02.c:295: TFAIL: readahead failed to save any I/O

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org

[1] https://lkft.validation.linaro.org/scheduler/job/4607403#L16941
