Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E4E156F35
	for <regressions@lists.linux.dev>; Tue,  7 May 2024 11:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715082208; cv=none; b=q56RGj6060s9G+jKSidKaktB1nje6X0UnLxudB036BO8kEZCtwYIcS/LSLoBaXJ2kuSUt8kjgyysWowPJyiecn6WcitS+cWHTMrcUuwBt+NqC5Sbmupde605ONPbTtGd9VqQvdYfo829Q1iOp/iOOM11+ZZhI7Y2eMLGh5S0D24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715082208; c=relaxed/simple;
	bh=YZX31/xdWUMw6K7qdZmLpVzOCZHdmp8lTi6MLLjYx9Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=SgPMKJ8wh6aXs059AfynR0FqE7DFGkYX94ZY85W0Nz+yDIdqeqZzirU0MICJr0J3TPGtcyuWkHzQcpzqgBYjYCVbNQjs3O+pYdsQTgzrkh8uBOUKlACUvKTrSjs6VDob2W3d1sDVpGQJJiHJEpOt731iEBgy4WkW/0amwKhS2q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XPWUObtS; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XPWUObtS"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-47ef5b9956eso2406004137.0
        for <regressions@lists.linux.dev>; Tue, 07 May 2024 04:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715082205; x=1715687005; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jezw8zTsKRwlkPt3DmIU972qZVlDPnjvDD93eRca2nI=;
        b=XPWUObtS+ohyMt6SGIOVek89luA0/5rCqGDgQzdH9jqvS8kqQDh6yY3BEYSW0Rxqcf
         GkC4Hno2KFtrlHIfWobVzmF+ozS/OKNEoyib1fosYdDAFGiyJHKYW0NJIYas6MJU6xnd
         btwJzxpPoCWTRddRdx/knnaQ3rgIfEcipIW9gyvwNTPAso0JNZaiu2i4+t6FsLSV9O8J
         TqOOcF4VtYH8iHxn9bxuS5Vij4z+hXssmji+Yaj2Cp/L8k9jym+VowDi8rii6kIt1TVC
         v55CG8tgTVpRNGmFXwEQjtqbvpjoJLQ5nZNqGA4GNb+7BuAQattUPuyeZ7tHwEKy/yAM
         wdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082205; x=1715687005;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jezw8zTsKRwlkPt3DmIU972qZVlDPnjvDD93eRca2nI=;
        b=jV2Q/32DVv7+UxU2KisTg+8kJguc6hNet/t1nDAASoCXth12n5Ehg1mKg9HQaA3e24
         ti21mcGKuSL4VIxU29YcBaTOv8Bxdn5wYclwY/vPqF6moy4BR25ESNkBTBnshD9KAQjO
         sFWZYGA0oVBJTmPYckVjYp4TMietWfQNKYbXRSnwSAgwBluiso37/E2GdjpIEmNeEFCD
         n0kzfzAD8dRWe46MudUnXw51aFg5bFkx1HQyNc0603CoO/JBGbrragDeN1vgP8cbn/Bn
         +M6AoVDQFI+30TU1SLHSdYGIKn0cO8CJ6VBec8wjKYAxW2jGkTO1Ls+b5/071Pre2Qt7
         tXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyjpLTTplOoV2I3D3bZKr1Q8UUBqIMgQFimfjr5KHXIeVPBbEYiwGD8KTCLGiZX3pYQnAsCMZ9B7JmJYCeV4esaiNXtkdFGjSpt1c=
X-Gm-Message-State: AOJu0YyqWNmSS9Y0qgUHVVBpLEtUM+2qAYYhQNwlYCT+OWd2PGwBp9RK
	YxvoMQ1sAFUo3ExyRAWN47/OaCRO8ytuPij3GvO7aYOnVqYmriEuiL4gnXYJKWZyEaglzz/b9ZS
	uutuUF/djPLgTTdZY9IXyNiPcoYtR+yVwojTB0A==
X-Google-Smtp-Source: AGHT+IEtGQE+pyFkMzL/qa3sUhz3FvaWcp/TP4GRf97r8j8Uo+tD/7DXDc4rKnywy5BIBSVabAYnwOeZ79pm59KoxNs=
X-Received: by 2002:a05:6102:26c6:b0:47c:296c:5fe3 with SMTP id
 m6-20020a05610226c600b0047c296c5fe3mr2188630vss.9.1715082204799; Tue, 07 May
 2024 04:43:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 7 May 2024 17:13:13 +0530
Message-ID: <CA+G9fYs1ZN2K=UHOjrwRR2JNE-M0nf9iW_Q-YPzVgmW+9daU4Q@mail.gmail.com>
Subject: arm64: defconfig: gcc-8: failed: AttributeError: module 'argparse'
 has no attribute 'BooleanOptionalAction'
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The arm and arm64 with gcc-8 builds failed on Linux next-20240507 tag
with gcc-8 due to following warnings / errors.

arm64 and arm:
  defconfig - gcc-8 - failed

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-display.dtsi:113.6-121.3:
Warning (graph_port): /fragment@4/__overlay__: graph port node name
should be 'port'
Traceback (most recent call last):
  File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in <module>
    main()
  File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in main
    parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
AttributeError: module 'argparse' has no attribute 'BooleanOptionalAction'

metadata:
-----
  git_describe: next-20240507
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 93a39e4766083050ca0ecd6a3548093a3b9eb60c
  git_short_log: 93a39e476608 ("Add linux-next specific files for 20240507")


Links:
---
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240507/testrun/23817782/suite/build/tests/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240507/testrun/23818260/suite/build/test/gcc-8-defconfig/details/

--
Linaro LKFT
https://lkft.linaro.org
