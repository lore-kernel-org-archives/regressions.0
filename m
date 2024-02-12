Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919C64596F
	for <regressions@lists.linux.dev>; Mon, 12 Feb 2024 17:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707760512; cv=none; b=pERcdNpqIQybUhbTM2XWTXqq41ndTfC+nkgIUAwjm3IGhmFb9zP0+P49ORjLEfggPy6YBAusmlX7fp7kd9X7LMsmMqNSt+5bT57IEQSs9Atp8R5C++9s0UqES/KgbA4Fbw4DEtOw7b+/g001vt4O3S8uAwjwoNkWOdlm6IFDzcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707760512; c=relaxed/simple;
	bh=Og8NnqP02pab6hxhGswPot4+uZWlv3wF0Kx/7BPs+og=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fTIhNK4C6Vo8V6nRWdZQvAFkxE0jRObcLAytY1LlfEE6Gz9s/kAeAyGnlkdNaG4dGVbZh2R8V7YxN/li8ZHHIb+wbp5vAuYY+f+NUTsDh2P3kSu4BK2/cO4V3L5xxBQF55Fh/MTbJ0iruX+SeFozSvYWE2z2eVHwYH2UBu0tgqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YK8b+J6Q; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YK8b+J6Q"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7cedcea89a0so37974241.1
        for <regressions@lists.linux.dev>; Mon, 12 Feb 2024 09:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707760509; x=1708365309; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3t18idpy1yL8hjQMjo5EA0cSeouRX8+0f9MTy1s1S9E=;
        b=YK8b+J6QOVIyq67it64VvXbMPi4UTRpwDoqhT8F1iDHaHItdxW5GQQZKc/KWvA8Q98
         +/f2Tq/7+2gerFnVV9GzoS7sOWCj7/erWYGFeKW+cTxW3pBkkD/UhFnt318Lm7ukdMR1
         Up2FJKPKChrki+Z1gnVwgz3+Fm7lGjhsTdxi9Upa4bWbnLHaV0bx4GTsG2jeNlcHgyFy
         ADE/2KBtSzuUlXfDfsWFliTujXpvKwS5F/8QUFxfkpmkbQ1hUUspb9u0Nrg8ubK/b1W9
         EUv4572Cqz3aK1Dhewo0i/eczIOiGzPiBKJwZn19x1Bdr8xdl6c5FjlsPFCstI7I3cjh
         Sebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707760509; x=1708365309;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3t18idpy1yL8hjQMjo5EA0cSeouRX8+0f9MTy1s1S9E=;
        b=PMk0uEA8QLMb6ftO26IK5Pf3blBJUzNaDJt3JlyXmldsjSqQAU2fi9s7qXkr+umlUY
         em2tIpcBM7JcHH2rZ+YvADcf37ZcY/1B9cVJjaG8gNnXp3RW7pehmNXdqgOEehsw0+4W
         Z6XqLV9SXXDenhfX9KQsj66CujwhS7q17nLCrgrmhZO39xCybusbG53p5PBs26M0nTIk
         NfhYGDuv7WTug7CGEKunGi/X10XiBZfZJj8VB9bbpokHJ2hpKWMqmfUTpE3/2Oc+ck7B
         zz1lMC5Bq7PfloloRiWTCA0iQm+R1O5Sagc0BS2JTjUJbQfRXOlPCbsGD2hRywtObG66
         kc0g==
X-Forwarded-Encrypted: i=1; AJvYcCXcBy/eEm6IgyAOzdtSujBNfzX5tNY32czX3uViFGdrrVy5mX4OWe0oMNQCxl6+j03pTV+8Rhi/pt+5AHjVeOMkKiLBXr9kL/RVif8=
X-Gm-Message-State: AOJu0YyfEQOzcJEdXfpZGuo3HXyLfzfViT1MwoPn2+bkcKWlBmF6P5w7
	AnIp9cZuqqOYTIhIUmGZAgTbNOeAWqhbcyeVlzRlobyLJgsvc/5fxtSyU2DaJJ8e9KKYYRETmBc
	YMr3qcNCuKbJw3NsVyHMtCeRjou0vOSaej2Y0Ww==
X-Google-Smtp-Source: AGHT+IE+fTlUlm6S5i/bXd/mDL8so/lGTPpD+/HFFykbPEgOk5IuqJAenCRnR7NuEVF9ZDb1qbAIbtcT+Jirb2/ibvk=
X-Received: by 2002:a1f:e0c3:0:b0:4c0:51da:bb6d with SMTP id
 x186-20020a1fe0c3000000b004c051dabb6dmr3908276vkg.8.1707760509453; Mon, 12
 Feb 2024 09:55:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 12 Feb 2024 23:24:58 +0530
Message-ID: <CA+G9fYsY7Uz_CnyqgyhAr6QsS9dJzC-9wMoDwq0=9=Rzmz5S5Q@mail.gmail.com>
Subject: next: fs/quota/quota_tree.c:674:8: error: variable 'blk' is
 uninitialized when used here [-Werror,-Wuninitialized]
To: linux-fsdevel@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Jan Kara <jack@suse.cz>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

I encountered the following build warnings/errors while compiling the x86_64
kernel on Linux next-20240212 tag with clang toolchain.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

fs/quota/quota_tree.c:674:8: error: variable 'blk' is uninitialized
when used here [-Werror,-Wuninitialized]
  674 |               blk);
      |                             ^~~
include/linux/quotaops .h:34:41: note: expanded from macro 'quota_error'
   34 |         __quota_error((sb), __func__, fmt , ## args)
      |                                                ^~~~
fs/quota/quota_tree.c:666:10: note: initialize the variable 'blk' to
silence this warning
  666 |         uint blk;
      |                 ^
      |                  = 0
1 error generated.

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2cFjnmDh1oofs8YfpPEBSMDvU9R/

As per the other reports, this has been fixed in Jan's tree.
https://lore.kernel.org/all/20240212131615.6jvnwweivkydv3j7@quack3/

--
Linaro LKFT
https://lkft.linaro.org
