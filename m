Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E911D511
	for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 12:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p6uEUGJV"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-45d94e7759eso1588139137.1
        for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 04:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701174362; x=1701779162; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zWjEZ/SUQrSUmyqfWuq2eTx6HkHasTKwK0H9S4JJ4Io=;
        b=p6uEUGJVAFwaGuX4MAHMmPy9ib5dPYGwuUM6GAgBPmDAmkcWQpcZ58h2KUhgvXEWqC
         JmCFiYBD2C2nxONcoEYozbZG20IFFmpup2oFm9iBxhj1blKjKn1VE5KAMgxGhJdtSq36
         S/oQVVIFZYr3qG1WblheJuZpUYe7F472uR0fyI3um/X2wx4cjQqG/5lkiMDbxA7sRF0i
         YMFPHt2DjgIOdb2pgXVeFDYxh3Pkr1ZdHQQHZsPzRR0CEwPuPq5y43/SSs40Bxag30cl
         q4PBCzOZr1JqbGIDQTVEjNsqbMh0c8nzQB09k1VmgB0r54MiBf65XS1PfSE5ycYzdRss
         i+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701174362; x=1701779162;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWjEZ/SUQrSUmyqfWuq2eTx6HkHasTKwK0H9S4JJ4Io=;
        b=oFxISm8WVdeOjTux4hxX4Glr61AMi33h5yixIBT9cQ2bzFwlVCp4qnhoabOKgup0SK
         zmP2GLynEaN59aZsp+o/SlQniOFSzASltqwqsTTAOqpAaL1xdJqEri284Yq5x8Fl1AFl
         GdwTKMtPEk6I+GEWYIdm6T8QwWGi+1V/poEzfpQ753eSYYtdjCsRv18QOLrKRIvMrzmL
         PmPP0i3N5cvijUY5yR/8jrbP8ltHvroaWTW14IsHXAKxigfscZX26N0CLiHVl0yVstUt
         tOuzDV3d/2LIRJ6kmBStEFACHpLpzEuXrPRv9gSF34n1E//5olpfGyEznQi7A/hvENSx
         4FzQ==
X-Gm-Message-State: AOJu0YyoeAn48j1zfRHzXJCn1kAOK9blh1F+huSBvGPh7J0F3LJliS0/
	pIJVj1fRqyGcIzGIcs+c22IT1ZQ7H3lRRyjPltQv8Q==
X-Google-Smtp-Source: AGHT+IExkbIGK+yxz9Y8kDkIjRByaumTYqTMVx/OaGjw1A52Cq9j2XTHa5tlKE7tPXxeoL5sSv1H+Ge/FeZLf+VtD3c=
X-Received: by 2002:a67:efcf:0:b0:462:a31c:78c3 with SMTP id
 s15-20020a67efcf000000b00462a31c78c3mr13888950vsp.20.1701174362355; Tue, 28
 Nov 2023 04:26:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 28 Nov 2023 17:55:51 +0530
Message-ID: <CA+G9fYvbCBUCkt-NdJ7HCETCFrzMWGnjnRBjCsw39Z_aUOaTDQ@mail.gmail.com>
Subject: btrfs: super.c:416:25: error: 'ret' undeclared (first use in this
 function); did you mean 'net'?
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, linux-btrfs@vger.kernel.org, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Chris Mason <clm@fb.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Following x86 and i386 build regressions noticed on Linux next-20231128 tag.

Build log:
-----------
fs/btrfs/super.c: In function 'btrfs_parse_param':
fs/btrfs/super.c:416:25: error: 'ret' undeclared (first use in this
function); did you mean 'net'?
  416 |                         ret = -EINVAL;
      |                         ^~~
      |                         net
fs/btrfs/super.c:416:25: note: each undeclared identifier is reported
only once for each function it appears in
fs/btrfs/super.c:417:25: error: label 'out' used but not defined
  417 |                         goto out;
      |                         ^~~~
make[5]: *** [scripts/Makefile.build:243: fs/btrfs/super.o] Error 1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231128/testrun/21349057/suite/build/test/gcc-13-lkftconfig-kselftest/log

 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231128/testrun/21349057/suite/build/test/gcc-13-lkftconfig-kselftest/details/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Ymoxor9n54ID51BFjRBS06YQ3U/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2Ymoxor9n54ID51BFjRBS06YQ3U/config

--
Linaro LKFT
https://lkft.linaro.org
