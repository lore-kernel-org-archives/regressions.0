Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D652511A
	for <regressions@lists.linux.dev>; Mon,  4 Dec 2023 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mejucqB+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cfb30ce241so27443925ad.0
        for <regressions@lists.linux.dev>; Mon, 04 Dec 2023 05:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701697898; x=1702302698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhsR47NQqcsB+hF3MEiVjLTWyDrKXr3SCjTnGdW0LC4=;
        b=mejucqB+LlbryKr/vsK8aRmSgKZRjk0N4KgtnZQnld9GppG4XIPe83+VHljTUQDujf
         yaY7SIR8HjU5WM6yjXiDV+s1Q8l9tE5cUvPStQEbP5kOTcTMcPPFjnQZ2v8hC2V35nhK
         wRM3PGzRLu8Hffn9RhsTuymuTLaRnMj6RcqJfzKVVtsTe8Z82hGVb8meAQmcJFq6IuGM
         Nd324WabmLAEZ7gUoMVn9DjWbL1/8mYksherNr6lhZqiJB010xFGtS6wpDIBpaFGZJGi
         ea+1hNY2RUNIUavakODgGj7S1YI7b8FfEYoZDgeGuUtxEC64WqkHo+5vH53hXvf9Tv/x
         HyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701697898; x=1702302698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhsR47NQqcsB+hF3MEiVjLTWyDrKXr3SCjTnGdW0LC4=;
        b=khYnDdyDWBZ9IqYAe58SjmDDYQK3oaBNiapeYcBvudJTb9iIW11ec6WbF/T78BoY4O
         Sk+x/Ligr71WNcie/LtFqLZQjopKVxt01bfgCmYzEkjpkW0Fgv2ao1/WTJ5h7HZJ9Iv3
         RvXI9JTQXt6ttrCVkWay35SBSOauco9/JICsxdt2/U51nhnTCG/sva6eDjrXt0UkJV5y
         LepepYRWAqemB82nRichF65dmdITe5bTVsaSzqwKRW4itqp2P40e1Vnd0L4IgZ/fDovq
         2d2tG+21uZ0qXEC4UTzDSw8Wmo7Vnqqp992HrUV7iVC+0n1hCtzTWcESJsy9Z5rOCiKf
         +KuA==
X-Gm-Message-State: AOJu0Yy7EyG8vuDMymhRRdzpMFjvm+pV9JJVc2kAA5oxlUFdswZUenNT
	YGrIqz39XEdLrAVB9yKF2T9VWQ==
X-Google-Smtp-Source: AGHT+IGpZRU6Qq//lUtmdB6JjrukeFfiGMamCDzG3vRZ0jBeM1IzZgY0HzZ4UZfMdZGkRxSqQbc5OQ==
X-Received: by 2002:a17:903:2350:b0:1d0:6ffe:a02 with SMTP id c16-20020a170903235000b001d06ffe0a02mr4864795plh.96.1701697898163;
        Mon, 04 Dec 2023 05:51:38 -0800 (PST)
Received: from localhost.localdomain ([124.123.164.183])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902f68600b001c72d5e16acsm8450176plg.57.2023.12.04.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:51:37 -0800 (PST)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: linux-cifs@vger.kernel.org,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	lkft-triage@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: amir73il@gmail.com,
	mszeredi@redhat.com,
	ebiggers@google.com,
	krisman@collabora.com,
	dhowells@redhat.com,
	sfrench@samba.org,
	hch@lst.de,
	pc@manguebit.com,
	nspmangalore@gmail.com,
	rohiths.msft@gmail.com,
	willy@infradead.org,
	jlayton@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: "copy_file_range03.c:52: TFAIL: diff_us = 0, copy_file_range might not update timestamp"
Date: Mon,  4 Dec 2023 19:21:27 +0530
Message-Id: <20231204135127.40002-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LTP syscalls copy_file_range01 and copy_file_range03 failed on all devices
running Linux next-20231204 kernel.

## Test Regressions (compared to next-20231201)
* qemu-arm64, ltp-syscalls
* e850-96, ltp-syscalls
* x15, ltp-syscalls
* x86, ltp-syscalls
  - copy_file_range01
  - copy_file_range03


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Test log:
-------  

tst_test.c:1119: TINFO: Mounting /dev/loop0 to 
       /scratch/ltp-XLc1JftiUn/LTP_copns9ldR/mnt_point fstyp=ext2 flags=0
copy_file_range.h:36: TINFO: Testing libc copy_file_range()
Test timeouted,sending SIGKILL!
[ ] EXT4-fs (loop0): unmounting filesystem c58dd839-66b3-4c79-81f7-9cc9a7ed0dfd.
tst_test.c:1628: TINFO: If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
tst_test.c:1630: TBROK: Test killed! (timeout?)

<trim>

tst_test.c:1690: TINFO: LTP version: 20230929
tst_test.c:1574: TINFO: Timeout per run is 0h 05m 00s
copy_file_range.h:36: TINFO: Testing libc copy_file_range()
copy_file_range03.c:52: TFAIL: diff_us = 0, copy_file_range might not update timestamp

Links:
 - https://lkft.validation.linaro.org/scheduler/job/7077286#L37034
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21474387/suite/ltp-syscalls/test/copy_file_range03/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21474387/suite/ltp-syscalls/test/copy_file_range03/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21474387/suite/ltp-syscalls/test/copy_file_range01/history/


--
Linaro LKFT
https://lkft.linaro.org
