Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4A3597A
	for <regressions@lists.linux.dev>; Mon,  7 Apr 2025 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026369; cv=none; b=i6ERIOE8NnmnNN5pNBaQ8MYdfxup7a8pPKOx1Y1qrNPFYHb8sPoOPgvC8rCr2F9bw0d2N88Hp0Av9z7Xfi4eJe4UQP16cOdxodppWGIyFx0cRPzSF40iGk+DpIpu4KCeUP8RVjeMqwd14nzm6+S55Oot6P11CLluCZPu3fzMUyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026369; c=relaxed/simple;
	bh=A8kTu4vOxFAwnxbMPk7okErIzXN4OhpFsl+LBPki/7k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mSISLIKUhTGf8JCDzm9R3utJdf3GO0jCDAOdX7kv2mQlnz0KvJT/jlAVV+6FsUrd/Iu8ozHabHBwcEn9O47S9Q98v2/KBuje8d3ORHHt3mswWQD+DNR/qEAh0JaoDPPxjrWoN/5+iDkkqykQ0ZKlbTyEwG0oapAMlJ0EWWVP+6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zo02hwxe; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zo02hwxe"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86b9d1f729eso1900113241.3
        for <regressions@lists.linux.dev>; Mon, 07 Apr 2025 04:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744026366; x=1744631166; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l179qXw5nBePyI4JZkgntWVpX80YAW06xOczRVR02ZM=;
        b=Zo02hwxeo9cIXP0SCWqnRLF9zh+egH1+cNL7zknUN6SSv72zSDV6xn0/YdipS6GS35
         3FrcZtjQjDDH8gELxiBy481q7NAJt5rQ3YzUUr+opnhYgHg6EoSigJE0CHptIMu5tIUf
         GS4Iqx8u1fwlCzN0cPVxREcm+MuX7BXmJpvsm/WQMWgGyMSVzJDRn7unLwAIs93NktCi
         SMHgiv295gNbn9tfVnF/hixovu636UNaD8ZV5TVwX3Y9hqalPrMY78jsvRfIOOW0s/BW
         YZnUCJOr+naycY7z22f5zH3jAiGAqBJFuX5ySZgwhju31a7oLIefks5hwqfIAKCKkJPp
         P3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744026366; x=1744631166;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l179qXw5nBePyI4JZkgntWVpX80YAW06xOczRVR02ZM=;
        b=IWgI0WNksF42mcBVmf0deK2TLVpWm/vSOdo+LMtWa0NCfKrTU3JK/2/Xkqvn12dBEX
         fQqI93zFRqLHsUX9qnOm5cGuM2l/1XyrAmIIdCs6CzgOAe3DNdhlqjW58CKFjemVTu/h
         ql+YM4XoiXyYmqvMsgM1PpCUaDxQnZeZiPU6CsYBX0X2NgLoc6OCXykk6DzQZwoBKu/6
         5FAjppejBRcowy3UHAvnoBS+4ooT9nu7rTGyiE8iATnLsIR2zoNAJ7Zo44MwWLk2ETne
         zLW7ouUwhdjW4+JwKaLR1DNU8fISvDbPDpD+DnFppQs7vf+0xfs/4sKY48pUYC2g6mbX
         WPCw==
X-Forwarded-Encrypted: i=1; AJvYcCWKDpPxknazZfVLE+PdLSYRlGEny+I5aeQzt1mihufx4OxhLC0L8g2o4S3O1rHHzUWAeDnAkdFD7cTf/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyS0bhjRYTjX53uNvZuSwlPWg9xsmcsML4anIJSaiUc1XWddGGy
	EjYgDekE52QSZZsVb6GsNLDiqJYqkYtj+6cu9dfjjbswZAR686Xyh+aQGKHcIRbwyuy5GUCYPH0
	K5zauS3iJTZeRbAnL7XHNl5thHfOMRjsZQuqOGg==
X-Gm-Gg: ASbGncuBfIbtNLWOzoWrCZ//EfDvfub8AelqvDo240uDiBqSWk53IFVR12jJ4lpsvIs
	jaD3OuS3hRfqfNYklRHbOkDwVT3AI4Sp2+HEp9iTpaqMzuUjw5CmOxDqq91AA6uXHAFMTMB0y1r
	ra6cDSeXtnaIuGM/QU/RwuDDe7PGZm4LEUbOJbwCwjRSLt8jVC6TAy94jQRaw=
X-Google-Smtp-Source: AGHT+IE9MxO7qQqlLmViUipY97IXRe0HOeQE88hqfb3Q8OgiFR34X0CHQfKfsgfdHN0p4DcAQoZhNv1HOhhMCdAhmoM=
X-Received: by 2002:a05:6102:292b:b0:4bb:e8c5:b149 with SMTP id
 ada2fe7eead31-4c85539e126mr8042397137.7.1744026366667; Mon, 07 Apr 2025
 04:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 7 Apr 2025 17:15:55 +0530
X-Gm-Features: ATxdqUHUzOVzZWX9xHaaGdI7CQeUYcGWMEQ1NQQGH41E_gk9k9xrAq8CaQ9neOQ
Message-ID: <CA+G9fYt4VVa3kUDR+ze05xM+fRmMBVfbBTsypUq5oOpAfuzjfg@mail.gmail.com>
Subject: next-20250407: qemu_x86_64 clang-20, clang-nightly no console log but
 gcc-13 boot pass
To: open list <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on qemu-x86_64 with clang-20 and clang-nightly on the
Linux next-20250407 and no console output.

The gcc-13 builds boot pass on qemu-x86_64.

First seen on the next-20250407.
Bad: next-20250407
Good:next-20250404

* qemu-x86_64, boot
 - boot/clang-20-lkftconfig
 - boot/clang-20-lkftconfig-compat
 - boot/clang-nightly-lkftconfig

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Boot regression: qemu_x86_64 clang-20, clang-nightly no console log
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log
<no console output>

Clang-20 versions:
  "name": "clang",
  "version": "20.1.2",
  "version_full": "Debian clang version 20.1.2
(++20250330123306+5ba194972878-1~exp1~20250330003423.94)"

Clang-nightly versions:
  "name": "clang",
  "version": "21.0.0",
  "version_full": "Debian clang version 21.0.0
(++20250402105505+c57b9c233a87-1~exp1~20250402225526.1363)"

qemu-system-x86:
   installed at version: 9.2.2+ds-1+b2

## Source
* Kernel version: 6.15.0-rc1-next-20250407
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
* Git describe: 6.15.0-rc1-next-20250407
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/

## Test
* Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27930289/suite/boot/test/clang-20-lkftconfig/log
* Test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27930289/suite/boot/test/clang-20-lkftconfig/details/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27930289/suite/boot/test/clang-20-lkftconfig/history/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27930138/suite/boot/test/clang-nightly-lkftconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vNpFdnHoEolEu77VmTYD8bmuBd/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2vNpFdnHoEolEu77VmTYD8bmuBd/config

--
Linaro LKFT
https://lkft.linaro.org
