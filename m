Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BC329D29A
	for <regressions@lists.linux.dev>; Mon, 12 Jan 2026 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213640; cv=none; b=JYL9y7qgHcNvUyqgEkMHUh0wZetKvbfXcE+66f8xwQ6mjqVw6it8SjiHw258OF/BKmHiHwiHvClfAzsHJGBz8jkzQsvOuogp0o8Zgqe2pLKw3x+Mb/xS7fuN4/va95iSmwDcoRmbZHuYDmtLxLgqGXX5VlNsJuHhdbLmMNfQWE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213640; c=relaxed/simple;
	bh=/OcnzYIs+nvQRD5T/arHhLd77GZB9o83jwScrQb6p9I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YoWY+ard5u2wVj/g8miUUNOJF+af2VRkeZKnrlsdRnMnKHS4kAgGNSn07Io/++d4JLQar+FjFLL+/FtaYZVvW4MaiSP0JYK/dBT4Ci5YCJu603F8bPlvrd/GvPu7i8Phu9H9FJV4uzc3jvRkPG06AoRHOXrkMM4zUNFc68OqhEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kL2mPT3F; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kL2mPT3F"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8701175a88so96615166b.1
        for <regressions@lists.linux.dev>; Mon, 12 Jan 2026 02:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768213637; x=1768818437; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/OcnzYIs+nvQRD5T/arHhLd77GZB9o83jwScrQb6p9I=;
        b=kL2mPT3FzmIGQjl2j9rL7hYJErtz4vDFqr9SMhj3qQlY9uESwjiI0ZlMkYpdNVUUb2
         P+ZSD7XwAiZ2dkBjdHeYblMe8lL6UupeEWvUOkOVW7u37SmbePviCZnpOU8Qq1otgJFA
         vegoWGVtZT97NLlDIoyfmA9nO4LEvGdZ5iM7Uhjy1onFGeqXc/A5wvfwgX+SxtXWM+rJ
         UJEoKSpyCEgwFL1b/D4l8Ym2kEZg8VTCIQwSk3xEAnMZpD+DaXaC8NFFqdrWTv0k5m+6
         juqI3KIQX8GATl31UAhhkgBcPdalG5roUNKu2vmax6/xWyIY13LGi+BW9U+CkFNrrKav
         08SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213637; x=1768818437;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/OcnzYIs+nvQRD5T/arHhLd77GZB9o83jwScrQb6p9I=;
        b=KxVG2IpJ0H+pCBhSoLIQSxjtPq+I6tAR/mXMOFSb7vxBCfozbPlnRh9vFM/oNQY3Vp
         5CdtZFCiXidCKD61r6KE1KnBIGiVt2CqGv9YoaMYk7SbkncOL6wvmQB5+2GvLpmRlUED
         TTarE2Cx/PrWF1tsahcdMe78knG4iUtFyO+zjO2ErpCCBKcThZ1P3pnaEK1yzdqh6hTT
         EXKh99GmBdevROQnYSal0E/tSL4c1+nl9oJaqOrREDb21grnczL8iVGf7XO4oUy+hkUW
         BRr+TazEhJpNC9li6oM5OYLLfW00CHG1y8762pwWTCYUAvyzinrCQ6n4+lsW2fzI27xJ
         7sXw==
X-Forwarded-Encrypted: i=1; AJvYcCXjOR0FUbsUjVWI8C8Hpt7yG6ZjrccyVkVeDji6WSY1k/tl6+7UUZFV/e8tBlNKnG20HmVADbH/JJDWjw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYJXMbQOoJ5KkWO3nHoI6U5OIf8h8tN8VqMcn7YqOg9BXibjQ+
	ZsYMWrwk+2Lxl2Asej14hoS2ZRfG9Izr00ivb45FkuTDGXx59XkmNnu7K4IR7vXkH0RZ5n41dlk
	SCUXjCEAXvoGwhg==
X-Google-Smtp-Source: AGHT+IHZcTUd9JtBkbA4Ff21KbsCNwcOB4RCa/TipWmxjc2/LKdAT08tD9PvaWOaoTJ16cAK8lSFKQIasyVrww==
X-Received: from ejcre13.prod.google.com ([2002:a17:907:a2cd:b0:b87:1820:251d])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6d25:b0:b87:1839:2601 with SMTP id a640c23a62f3a-b87183929d6mr333880666b.40.1768213636875;
 Mon, 12 Jan 2026 02:27:16 -0800 (PST)
Date: Mon, 12 Jan 2026 10:27:15 +0000
In-Reply-To: <20251022062948.162852-1-reddybalavignesh9979@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com>
 <20251022062948.162852-1-reddybalavignesh9979@gmail.com>
X-Mailer: aerc 0.21.0
Message-ID: <DFMJF68KIIHN.3Y2YF3EXRJ53@google.com>
Subject: Re: [PATCH] selftests/x86: Add selftests include path for kselftest.h
 after centralization
From: Brendan Jackman <jackmanb@google.com>
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, <naresh.kamboju@linaro.org>, 
	<broonie@kernel.org>, <bp@alien8.de>, <shuah@kernel.org>
Cc: <anders.roxell@linaro.org>, <arnd@arndb.de>, 
	<benjamin.copeland@linaro.org>, <bp@alien8.de>, <dan.carpenter@linaro.org>, 
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, 
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, 
	<lkft-triage@lists.linaro.org>, <mingo@redhat.com>, 
	<regressions@lists.linux.dev>, <richard.weiyang@gmail.com>, 
	<shuah@kernel.org>, <surenb@google.com>, <tglx@linutronix.de>, 
	<x86@kernel.org>, <linux-kernel-mentees@lists.linux.dev>, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed Oct 22, 2025 at 6:29 AM UTC, Bala-Vignesh-Reddy wrote:
> The previous change centralizing kselftest.h include path in lib.mk
> caused x86 selftests to fail, as x86 Makefile overwrites CFLAGS using
> ":=", dropping the include path added in lib.mk. Therefore, helpers.h
> could not find kselftest.h during compilation.
>
> Fix this by adding the tools/testing/sefltest to CFLAGS in x86 Makefile.
>
> Fixes: 4d89827dfb27 ("selftests: complete kselftest include centralization")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/lkml/CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com/T/#m83fd330231287fc9d6c921155bee16c591db7360
>
> Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>

Thanks, this fixes the issue I reported here:

https://lore.kernel.org/lkml/DFHI984SEFV3.2JL88CLHNT2SO@google.com/

Tested-by: Brendan Jackman <jackmanb@google.com>

Shuah, does this go via the kselftests tree? If not, Boris can you take
it via x86?
