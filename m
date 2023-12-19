Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FE11C296
	for <regressions@lists.linux.dev>; Tue, 19 Dec 2023 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ss5ymMez"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4b6c3a37ddeso490767e0c.0
        for <regressions@lists.linux.dev>; Tue, 19 Dec 2023 07:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702998175; x=1703602975; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ux8sE7fHthR2voG70KnB7oZ6Al+8xU+cq54AC46rn+E=;
        b=ss5ymMezHd5UPchi9X1Vbc+vMFlq5ESr/lSJDjWD1Jm58JKFDfEotFTLBhH7WXjnrP
         YZskzMNEfkDUlpOz/JflRsbdM+F06KyiP90Cirs+q3eIYlBIF1OOk7VY8NQXvqiKKobm
         aJYtLF3iNVCxGL502GP78TXH+ni+xF7kdWckvYb6GfC65x8saaQ/mkwtYv9cHMklTHA9
         wjFAFCf9iRfFG318K3IIk8FCcOwBQ8YDhpXNFiU7Lwbgwt9nK+YiiKrOTNaONQYqvQpt
         oKLzuqO4/eW/HGAY3l2MkBlmQpzfQ6nvahG316J74GygO/EA6YwTqPLLYwfJxCLIa5gA
         1x4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702998175; x=1703602975;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ux8sE7fHthR2voG70KnB7oZ6Al+8xU+cq54AC46rn+E=;
        b=k3t6AupQbTYIzG7ilMaa6zDHz9uhV5mCmykvNaYHog+tTatn5Z5/tLCYpHt9L4tjT3
         LGekVrx5akgTt6wJ1zz2EoKEgtSDXCl/AyWbnyr2D012Skl9KfEhCLlQklG4GczFrCAv
         HmfmuY/huUZzoRV5i8W24TfbZAXPjpUqnQbfSTnbGLLc41ivt99SjTucbTv5zTj8IkxA
         NKI4czbBVlI6O2BFQcrINPx9NfrgEZu2IPYL5Hft6Crm25zJRbLefh3lcS2CAbt4theo
         ISv6pFtL23LJnNsbOZqOktO3iEXSEzTa+J6FIw/cY+9EhPYWEojw6wVC9YCtKGnh8fck
         V15A==
X-Gm-Message-State: AOJu0Yy8roNaw9HlK7olS9hxI6S/YJfjx1UeGGz+UPk7ktLi1rMRAh+q
	HPl0UZ1OxzlkziEZ6krrhyK9qaiMstilosc8AsmmHA==
X-Google-Smtp-Source: AGHT+IG6e+HOmJxSwcUNT8DhH+LV9pJe4Lfz8mAYCBraGDKFr0Sdv68iV56I17MY7FbjZFs19wdqPnFaFyVyj8ww5z4=
X-Received: by 2002:ac5:ca0a:0:b0:4b6:b829:7d14 with SMTP id
 c10-20020ac5ca0a000000b004b6b8297d14mr1300298vkm.11.1702998174099; Tue, 19
 Dec 2023 07:02:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 19 Dec 2023 20:32:42 +0530
Message-ID: <CA+G9fYvq+wdDhTjR2YkULF-_-nQNPGzCeOON-08EbVyidj-J6w@mail.gmail.com>
Subject: arch/parisc/mm/init.c:534:29: error: invalid application of 'sizeof'
 to incomplete type 'struct shmid64_ds'
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-parisc <linux-parisc@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"

Following build failures noticed on parisc on Linux next-20231219 tag.

parisc:
  build:
    * gcc-11-defconfig - Failed
    * gcc-11-allnoconfig - Failed
    * gcc-11-tinyconfig - Failed

Build error:
arch/parisc/mm/init.c: In function 'mem_init':
arch/parisc/mm/init.c:534:29: error: invalid application of 'sizeof'
to incomplete type 'struct shmid64_ds'
  534 |         BUILD_BUG_ON(sizeof(struct shmid64_ds) != 104);
      |                             ^~~~~~

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Steps to reproduce:

 tuxmake --runtime podman --target-arch parisc --toolchain gcc-11
--kconfig defconfig



Links:
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231219/testrun/21768759/suite/build/test/gcc-11-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231219/testrun/21768759/suite/build/tests/



--
Linaro LKFT
https://lkft.linaro.org
