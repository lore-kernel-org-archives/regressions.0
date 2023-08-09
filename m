Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91F61FDA
	for <regressions@lists.linux.dev>; Wed,  9 Aug 2023 08:16:38 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5844bb9923eso75413837b3.0
        for <regressions@lists.linux.dev>; Wed, 09 Aug 2023 01:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691568997; x=1692173797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5IEuzWykTMtItBBOAFGOiv2XbuELxF8lm+BVPreJJuo=;
        b=q97l8KGdYR6vSPeBPn5HJ6Iy8BCXsLr6xdF/EBnHsEZs587lM7np7eptBi/4MP+arH
         dlL0+wk8KZutec0aS8NZtcHyslmnniF9L9hkAV533WLVuAx5Nagv78KzaTlcdBeBWEmK
         vPAmfcJSizIpzA8mzol/5pZiJXMLr0k+RUwSddXcdtX0ozFnC3e24YsEbf6TVWuUWhc0
         9xojO8cV1bR3zOK44Tjo50S7kV9Xe1AHAgFSFomGZOarl04kXqZMNSeeOd0TxTkN0dYq
         N8PcyyQYn0DVdrYkbRYw85AbQkKNWYfjc+yhXg9QiBXeEBxA1yej+mAdVHpUxRPPi5A8
         QJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691568997; x=1692173797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IEuzWykTMtItBBOAFGOiv2XbuELxF8lm+BVPreJJuo=;
        b=lCcQiwN6UnW0lRnG9xAgXItdL8E3aUzBm+oQ1LsXj4QL6Mxp5KAZW/cBXajqHnphRe
         nPgbOJVWmNXaeK5ddR+y8+OpYuKbgyx0MyWckCN0knu10TA1QuQ5PT8RoEXUSws3+Lw1
         SUf52vqTL35njQfq4RfyrxjrEo6Hjrdbf81NJTZWXOWGbDFNjYZ4VRuhnjnj5/DKyMdz
         1eJXMSTqorDCEIZl7mphtfkIwjMftZ7SyqDQYlgmj4lmYBu8PwoZfk1UB1+44yPkf1yc
         N5R5fV5VBorvOfTvc4kens3I/Q264WslkPOX74iTSDmLJw2rUPG9kDEC7/KlP9LRs4vI
         QWnw==
X-Gm-Message-State: AOJu0YzIW5G15Ha65FCzYsNPamcGGET3ujVn9/all09juQFtY8Zt/k8L
	e2awTz6NKqoz5aPIlQS9npTVhvwYBcbdwn7wbt4=
X-Google-Smtp-Source: AGHT+IHS0MXJBfpz/y6yTU3fPASv7s5C/fpHPIcAx3s3X69HAorv6O8k4CBnsZhYTv6+C1NjXVpQpvXRTloJJZLEKjc=
X-Received: by 2002:a81:82c3:0:b0:586:b686:8234 with SMTP id
 s186-20020a8182c3000000b00586b6868234mr3054576ywf.8.1691568997495; Wed, 09
 Aug 2023 01:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <97224321-c839-c0a7-52dd-3fb6e52fc15e@gmail.com>
In-Reply-To: <97224321-c839-c0a7-52dd-3fb6e52fc15e@gmail.com>
From: TatriX <tatrics@gmail.com>
Date: Wed, 9 Aug 2023 10:16:26 +0200
Message-ID: <CAG7LdX7DwNs4AenJgAkdUMa_09s_25jUE0O=4=0BR+Y9KU93GA@mail.gmail.com>
Subject: Re: Bluetooth LE scan doesn't show device name
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	Linux Bluetooth <linux-bluetooth@vger.kernel.org>, 
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> TatriX: Can you also attach dmesg output to your Bugzilla report?

Shall I include full dmesg output for both kernels?
I have a laptop where I keep 5.9.12 and a desktop machine, where I use
latest stable from the Arch repo.

When it comes to compilation issues, I'm experiencing the same
symptoms as described here:
https://unix.stackexchange.com/questions/709671/linux-kernel-5-15-54-compilation-errors-with-gcc-12-1
I'll have to investigate how to downgrade gcc before I can do the bisection.
