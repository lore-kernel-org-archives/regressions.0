Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61F3135A53
	for <regressions@lists.linux.dev>; Tue, 19 Nov 2024 04:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731991641; cv=none; b=YggIdeR+ms1gadbEAR/N+v+u8klVJdX3qWSHuLTjAKjA8QuKMA6SppMN2aDqEMB0Gig4x94smoNj9CQSThxJzWPA/lNiZqQUq6LhUSbD+PJmZ9nedYhnTHVr6RO/IqJLw0498ZPF6y3iJVpb7lkK1zmdt/Iy7YxLK8/Jtzt8Z7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731991641; c=relaxed/simple;
	bh=Q/uyyfZvTppkNfK9noyT1ACTXFKS1tYlwTrqqRJ0RsY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NSYGAppUPR0I4d4a5zcz28OCmxXJ605OyGBS7boJDUuoll4gAFwZhAWn+1fSIMEmb4Iy42gvrJgGtRCzJ8suAJts21VteYM2JfyaH3rQa0xO29q6ucE7zJCs5w0NXiZPfI+DRQUbK+L4QG2GEUJMUu1ltz3yTYrYQsZRffi9bBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZUwPY8a; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZUwPY8a"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-50d4a6ef70aso1271431e0c.3
        for <regressions@lists.linux.dev>; Mon, 18 Nov 2024 20:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731991638; x=1732596438; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mPqe+KWyPScVsgOCo4oxtDNj7oJCSQ2kVcWX01f8TQI=;
        b=kZUwPY8aW+sIcDaNM5wJoFlo9PRX1A+sZERJuYBfnQJzGpAnneZg3CoXQNZh9DkP5g
         cjHmemD+rZfssCkTBi4foOUuRXcjkwMSABJw4fucCrEo4gByjcAuIqGm2ITkCRKMjmyj
         5/ZkmnEr8swYkf/cdbvU8eS81zN5chbWIYHLdVrpLeLJao8lAVzLnYv72yz3omVaPN5w
         NAGKL1BQflT8CqnD4+MKHx3CofilNRYqK2vp3AR+0e8eTph6+zeWmidWFIGbO0KBhEd7
         Af9Z/mVtdCJ0h6Vu98apyyS4exd0YHwy1L31XolwWlQ8+cmL+TQo4ymj53SlUElJDwbG
         tIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731991638; x=1732596438;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mPqe+KWyPScVsgOCo4oxtDNj7oJCSQ2kVcWX01f8TQI=;
        b=XyZxVi6aNrwFtNU4/ptxklMcG0W2JtUVL/YPPDeaYjwSKuNjpAjxUSyyvB/AoZ6Euf
         XPz8lhN/oi81RPCPGEzWdjIRuVVpMWMRXd6zvnBRaUX6ovgsyBzXkC327ZKm9Y4NUwBu
         Bls5fKiQ36TcUgCZBMXXvZKPHffInqAJVTpVBjEolxex4RjqBZo0iIAUkLGt00Wki78a
         f7XkEMHczXHcPhdXat1zWrG+xN5dxcqbFGpcI4pt0SKIN2PzRk0IXV4wJwstyz0JEozk
         bqEkwTTpnkUOiYsIcOFfvfvaOPC1o1/2ebBLOpc7c9TeV7RXkZPKd0u1JFgPoEsdJ8TZ
         jxOg==
X-Forwarded-Encrypted: i=1; AJvYcCVUXCZ0E1H4iNO4iuSxoxeJVugI6po4fKYHOfTuXrADuLGdjnl86EW2HEEIzBLPSoYAZdKoOl0CSw9+zg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy14t4S6rXMOhLaJFFntVxX9GkJ1/08vi5TuGHPfTf6J6n3fQyK
	Wz9N0HzzCnOuu+i0dW2lBcWMFdtmCkGZ18ddlk4OZAImqtjMk7s2BwXnSWc/1W8ZIXXlvUA2Dbh
	tDotDfkdrofeX6veaIuIXFsXMvkWTPFWh/0uX9w==
X-Google-Smtp-Source: AGHT+IGOA7V18nmrZN893zZO79R7F6VuICVIukkpYSjvoyaNP8NEtMqd1I7vjaEq/dCjZaYX+KlmiqJ9X3+ZCLGH27o=
X-Received: by 2002:a05:6122:3d0d:b0:50d:918d:4da1 with SMTP id
 71dfb90a1353d-51477ee3893mr14556462e0c.3.1731991638505; Mon, 18 Nov 2024
 20:47:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 19 Nov 2024 10:17:07 +0530
Message-ID: <CA+G9fYvLE55OjpQ4xs_w15+xBYi1BPJf2xTTFORA1zWAvqw91g@mail.gmail.com>
Subject: include/linux/mm.h:4224:20: error: redefinition of 'pgalloc_tag_split'
To: linux-mm <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Sasha Levin <sashal@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

The arm64, armv7, riscv and x86 builds failed on the Sasha Linus-next tree.
Please find more details below

Build failed
arm64:
  * build/clang-19-lkftconfig
  * build/gcc-13-lkftconfig
  * build/gcc-13-lkftconfig-kunit
  * build/gcc-13-tinyconfig

arm:
  * build/clang-19-lkftconfig
  * build/gcc-13-lkftconfig

riscv:
  * build/clang-19-lkftconfig
  * build/gcc-13-lkftconfig

x86:
  * build/clang-19-lkftconfig
  * build/gcc-13-lkftconfig

First seen on commit sha id a5b57900c6611b0a44e95b4ed011108435b43898.
Good: 6f9dfbd5bd86f54c62ebd3a7b41fb37ac4520762
Bad:  a5b57900c6611b0a44e95b4ed011108435b43898

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
-----
include/linux/mm.h:4224:20: error: redefinition of 'pgalloc_tag_split'
 4224 | static inline void pgalloc_tag_split(struct folio *folio, int
old_order, int new_order)
      |                    ^~~~~~~~~~~~~~~~~
In file included from include/linux/mm.h:8:
include/linux/pgalloc_tag.h:247:20: note: previous definition of
'pgalloc_tag_split' with type 'void(struct folio *, int,  int)'
  247 | static inline void pgalloc_tag_split(struct folio *folio, int
old_order, int new_order) {}
      |                    ^~~~~~~~~~~~~~~~~
include/linux/mm.h:4228:20: error: redefinition of 'pgalloc_tag_copy'
 4228 | static inline void pgalloc_tag_copy(struct folio *new, struct
folio *old)
      |                    ^~~~~~~~~~~~~~~~
include/linux/pgalloc_tag.h:248:20: note: previous definition of
'pgalloc_tag_copy' with type 'void(struct folio *, struct folio *)'
  248 | static inline void pgalloc_tag_copy(struct folio *new, struct
folio *old) {}
      |                    ^~~~~~~~~~~~~~~~
make[3]: *** [scripts/Makefile.build:102:
arch/arm64/kernel/asm-offsets.s] Error 1

Boot log:
---------
- https://qa-reports.linaro.org/lkft/sashal-linus-next/build/v6.11-17648-ga5b57900c661/testrun/25904050/suite/build/test/gcc-13-lkftconfig-libgpiod/log
- https://qa-reports.linaro.org/lkft/sashal-linus-next/build/v6.11-17648-ga5b57900c661/testrun/25904050/suite/build/test/gcc-13-lkftconfig-libgpiod/details/
- https://qa-reports.linaro.org/lkft/sashal-linus-next/build/v6.11-17648-ga5b57900c661/testrun/25903704/suite/build/test/gcc-13-lkftconfig/history/

Build image:
-----------
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2p3Kl6GpLiKKJQQYlKrOay5O3XI/

Steps to reproduce:
------------
- tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2p3Kl6GpLiKKJQQYlKrOay5O3XI/config

metadata:
----
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git
git sha: a5b57900c6611b0a44e95b4ed011108435b43898
kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2p3Kl6GpLiKKJQQYlKrOay5O3XI/config
build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2p3Kl6GpLiKKJQQYlKrOay5O3XI/
toolchain: gcc-13 and clang-19
config: gcc-13-lkftconfig
arch: arm64, arm, riscv and x86

--
Linaro LKFT
https://lkft.linaro.org
