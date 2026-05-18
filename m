Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CE61E376C
	for <regressions@lists.linux.dev>; Mon, 18 May 2026 19:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134347; cv=none; b=Bl6YrzVIiJ/XU9Wn9Ix/VF1Dk2Mz88TRA/Q1kXVhf9QArY5+xEgXPSnPL5fm4YptOabTdOE1+ubnGCDHV7aDW4eNJEE08Mb/+5lXdpihR8Nz0LOqvvHw6ZQ9HOdjKYPojbqpdbxE7CixhC0q5zPCJpmf759BfVARddQM4DNuDHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134347; c=relaxed/simple;
	bh=wcFmzL5/Pjd0ljg1fNotvik1uWid9z7/6uq+AzTMto8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=o3RRoEClLmAJZ/78zRYZzmkWaZ2fKwVrzxQuq8hXTZyZKURfCdfsKFEUI5UJNqy9StdX3mnsasqc0gjtnUi4h7LFmHwIT/0GEE5j3ICD3lSkIYGJFZkN72G1pctf4taHoCAElbOiiy6giNWenPc1vVLkcIbP/r9ZEfYDuWbZMYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=NOz2nj4a; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="NOz2nj4a"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso1722036eec.0
        for <regressions@lists.linux.dev>; Mon, 18 May 2026 12:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779134345; x=1779739145; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uYg5vEkVblvL8tlqyPPTP/ZLoRL6eBCHzseSUQ7sMs=;
        b=NOz2nj4abUlxlsUZ0pF6Sjw2srY2NKPxwWicTvlJfAk0tnAk1G8NGbxWP5Kh/maQmK
         lSFq+Kjj6E2NsEbl0tG3OqL8pJxzlwVL5eSrZ0pJwBbyK54lvImZfSaC/OF+hTWS1+YL
         NL2TrmvZdU4IARGYHLDHQWznjrsPfXv44LitC0Q6GeKCrD1KCnTCsuBqcwRIxfkCGNhx
         YeOVCrzzmK+CxhxQVwoXVK1rt7hx0V3j/b539Dcibp2dF/r32vCC3A7HYAUySSZq48S3
         P4jW4ZCzT41nmiZCA6IB5SIHS/goFvjSMq1192tcoIIv+QI5DpPZt2xfeDviFimV+1Wi
         4KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779134345; x=1779739145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8uYg5vEkVblvL8tlqyPPTP/ZLoRL6eBCHzseSUQ7sMs=;
        b=VXqVOmrrRcZpFK6Q9hGOkTF5Yow5Nd2iVrJLADs8svm73T0Y2JlpBdoi4KZAIwQAwn
         gS2r5cWkr6/kqiHLxBfQ70A74fpHgKn6cZOOZFSwE1MTqEtHZFRVBHbNlDXjEJyfHwyr
         dGUsp2MpHRdBTQaOBuk8/qBAhpURwr27WeLqeZOlMQySmPmQT68pSe7uBJyQKP+OoP7c
         PCXvFuCdyJKl7lp15/bh2s1sXdUOTQQbqK6kh+iXZWubEH6gEthriwQ6DjjfL3Sa783k
         cieETPNjKVQAH6fwDblMU/6sHCb8KpPCdEdh6Z2FwzmnpkGAdbN9igyzNDOrrBOKn5Og
         6GVQ==
X-Gm-Message-State: AOJu0YwNDh8Z94YY/dbc2gHsARq8rCdJMRUKyi1BUhDhjeZrWhNOXlAI
	ekoR+cICs6wv3FMSJ31VLuTAE4/oncEylAnPui2K/bNFBLLB9le+ghYdzmAnV3sHK0w=
X-Gm-Gg: Acq92OG6OnHSpH2wf2d0IMBjCMeA0EKNSoDwEEIvXbuW0xYx/Fw8/abUaWNk9KQD6bs
	JtBc+J/cfx59h0APb0CU01wYKggh7Ik8OvPixfsFHTh0IQAKkC0ElI0aJREA9vJWiH8ueujYlt0
	5Wcv5OMYF7AhXoB9/FJTj2bkKpoDutAo0Pcy1HQpYgAm44dKg6Oo1mrW0w3zh1jLN2dQcK/CV70
	F1/BpBkR45ngLd2UB6cEnR9yP4ADDwyV3vJtxqO7DY6ZQWRc1bhr4xr7bEWeCZZwjBcKxQI8cuZ
	QaRCE3ZqoY29zHKkUljNw0lJLg8jgko6SaxXnIqVef0p/3/hvyB6pJEicOz5XKklZojYh3e7aqS
	W5ljECpxevk2rcxjbgUtYj9nZHdjFuyooAuPdGb5YrirpSJkHtoQ9c4n3SnThm+uAi/WPYokUa0
	p5NKPpi3j4sf7hYLmF
X-Received: by 2002:a05:7300:f193:b0:2df:7882:1cf3 with SMTP id 5a478bee46e88-3025eaafc91mr9454487eec.2.1779134345075;
        Mon, 18 May 2026 12:59:05 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc458sm17680415eec.18.2026.05.18.12.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) variable 'old_size' is
 uninitialized
 when used here [-Werror,-Wuni...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 18 May 2026 19:59:04 -0000
Message-ID: <177913434403.2484.8283537970935500940@330cfa3079ca>





Hello,

New build issue found on mainline/master:

---
 variable 'old_size' is uninitialized when used here [-Werror,-Wuninitialized] in fs/smb/client/cifsfs.o (fs/smb/client/cifsfs.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:8fef554699226f88449edfc56be31812d3edd327
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  4bf5d3da79c48e1df4bab82c9680c53adeff7820


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/fs/smb/client/cifsfs.c:1390:29: error: variable 'old_size' is uninitialized when used here [-Werror,-Wuninitialized]
 1390 |                 if (rc == 0 && new_size > old_size) {
      |                                           ^~~~~~~~
/tmp/kci/linux/fs/smb/client/cifsfs.c:1307:37: note: initialize the variable 'old_size' to silence this warning
 1307 |         unsigned long long i_size, old_size, new_size, zero_point;
      |                                            ^
      |                                             = 0
/tmp/kci/linux/fs/smb/client/cifsfs.c:1375:13: error: variable 'zero_point' is uninitialized when used here [-Werror,-Wuninitialized]
 1375 |         if (fend > zero_point)
      |                    ^~~~~~~~~~
/tmp/kci/linux/fs/smb/client/cifsfs.c:1307:59: note: initialize the variable 'zero_point' to silence this warning
 1307 |         unsigned long long i_size, old_size, new_size, zero_point;
      |                                                                  ^
      |                                                                   = 0
2 errors generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a0b542b744d1c1da0198902


#kernelci issue maestro:8fef554699226f88449edfc56be31812d3edd327

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
